#!/bin/bash
set -e

# Config
MY_ROOT="a3ue_pcf/addons"
UPSTREAM_ROOT="A3A/addons"

# These can now be Tag names (v11.8.7) OR Branch names (main, dev)
REF_OLD="v11.8.7"
REF_NEW="v11.8.8"

# 1. Fetch everything from upstream to ensure local metadata is current
echo "Fetching updates from upstream..."
git fetch upstream

# 2. Helper function to resolve the best "path" for the reference
resolve_ref() {
    local rev=$1
    # Check if it's a tag first, then a remote branch, then a local branch
    if git rev-parse --verify "refs/tags/$rev" >/dev/null 2>&1; then
        echo "refs/tags/$rev"
    elif git rev-parse --verify "upstream/$rev" >/dev/null 2>&1; then
        echo "upstream/$rev"
    else
        echo "$rev"
    fi
}

REAL_OLD=$(resolve_ref "$REF_OLD")
REAL_NEW=$(resolve_ref "$REF_NEW")

echo "Syncing changes from $REAL_OLD to $REAL_NEW"

# 3. Find changed files using the resolved references
changed_files=$(git diff --name-only "$REAL_OLD" "$REAL_NEW" -- "$UPSTREAM_ROOT")

for upstream_file in $changed_files; do
    # Compute relative path
    rel_path=${upstream_file#"$UPSTREAM_ROOT/"}
    my_file="$MY_ROOT/$rel_path"

    # Only update if the file exists in your repo
    if [ -f "$my_file" ]; then
        echo "Updating $my_file ..."

        # Create directory if needed
        mkdir -p "$(dirname "$my_file")"

        # Copy contents from upstream version
        git show "upstream/$BRANCH_NEW:$upstream_file" > "$my_file"

        git add "$my_file"
    fi
done

echo "✅ Done. Review and commit your changes."