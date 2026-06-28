#!/bin/bash
set -e

# Config
MY_ROOT="a3ue_pcf/addons"
UPSTREAM_ROOT="A3A/addons"

# Define the tags/branches
REF_OLD="v11.9.8"
REF_NEW="v11.9.12"

echo "Fetching updates from upstream..."
git fetch upstream

# Helper to get standard ref names
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

# Iterate over all files in your local directory
find "$MY_ROOT" -type f | while read -r my_file; do
    
    # Extract the relative path to map it to the upstream structure
    rel_path=${my_file#"$MY_ROOT/"}
    upstream_file="$UPSTREAM_ROOT/$rel_path"

    # Check if the corresponding file exists in the upstream repo at NEW tag
    if git rev-parse --verify "$REAL_NEW:$upstream_file" >/dev/null 2>&1; then
        
        # Get diff stats between tags
        raw_stat=$(git diff --shortstat "$REAL_OLD" "$REAL_NEW" -- "$upstream_file" | xargs)
        
        if [ -n "$raw_stat" ]; then
            # Clean the output to remove "1 file changed," prefix
            clean_stat=$(echo "$raw_stat" | sed 's/^[0-9]* file[^,]*, //')
            
            # Apply update
            mkdir -p "$(dirname "$my_file")"
            git show "$REAL_NEW:$upstream_file" > "$my_file"
            git add "$my_file" 2>/dev/null
            
            printf "%-50s | %s\n" "$rel_path" "$clean_stat"
        else
            printf "%-50s | %s\n" "$rel_path" "No changes"
        fi
    else
        # File exists locally but not in upstream
        printf "%-50s | %s\n" "$rel_path" "Not in upstream"
    fi
done

echo "----------------------------------------------------------------------------------"
echo "✅ Done. Review and commit your changes."
read -p "Press any key to close this window..."