#!/bin/bash
set -e

# Config
MY_ROOT="a3ue_pcf/addons"
UPSTREAM_ROOT="A3A/addons"

# Define the tags/branches to compare
REF_OLD="v12.0.0-rc"
REF_NEW="v12.0.1-rc"

# Exact relative file paths starting from the project root to ignore completely
IGNORE_LIST=(
    "a3ue_pcf/addons/core/cfgFunctions.hpp"
    "a3ue_pcf/addons/core/Params.hpp"
    "a3ue_pcf/addons/core/Stringtable.xml"
    "a3ue_pcf/addons/scrt/CfgFunctions.hpp"
    # Add any other extender-exclusive files using their exact path
)

echo "Fetching updates from upstream..."
git fetch upstream

resolve_ref() {
    local rev=$1
    if git rev-parse --verify "refs/tags/$rev" >/dev/null 2>&1; then echo "tags/$rev";
    elif git rev-parse --verify "upstream/$rev" >/dev/null 2>&1; then echo "upstream/$rev";
    else echo "$rev"; fi
}

REAL_OLD=$(resolve_ref "$REF_OLD")
REAL_NEW=$(resolve_ref "$REF_NEW")

echo "Comparing local files against upstream $REAL_OLD -> $REAL_NEW"
echo "----------------------------------------------------------------------------------"
printf "%-50s | %s\n" "File Path" "Changes"
echo "----------------------------------------------------------------------------------"

find "$MY_ROOT" -type f | while read -r my_file; do
    
    rel_path=${my_file#"$MY_ROOT/"}

    # 1. Exact path equality check (No regex, no wildcard matching)
    is_ignored=false
    for ignored_file in "${IGNORE_LIST[@]}"; do
        if [ "$my_file" = "$ignored_file" ]; then
            is_ignored=true
            break
        fi
    done

    if [ "$is_ignored" = true ]; then
        printf "%-50s | %s\n" "$rel_path" "Skipped (Ignored)"
        continue
    fi

    upstream_file="$UPSTREAM_ROOT/$rel_path"

    # 2. Check if the corresponding file exists in upstream target reference
    if git rev-parse --verify "$REAL_NEW:$upstream_file" >/dev/null 2>&1; then
        
        raw_stat=$(git diff --shortstat "$REAL_OLD" "$REAL_NEW" -- "$upstream_file" | xargs)
        
        if [ -n "$raw_stat" ]; then
            clean_stat=$(echo "$raw_stat" | sed 's/^[0-9]* file[^,]*, //')
            
            # Overwrite local file with upstream target contents
            mkdir -p "$(dirname "$my_file")"
            git show "$REAL_NEW:$upstream_file" > "$my_file"

            printf "%-50s | %s\n" "$rel_path" "$clean_stat"
        else
            printf "%-50s | %s\n" "$rel_path" "No changes"
        fi
    else
        printf "%-50s | %s\n" "$rel_path" "Not in upstream"
    fi
done

echo "----------------------------------------------------------------------------------"
echo "✅ Done. Review unstaged changes in VS Code."
read -p "Press any key to close this window..."