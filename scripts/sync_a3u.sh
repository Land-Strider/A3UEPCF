#!/bin/bash
set -e

# Config
MY_ROOT="a3ue_pcf/addons"        # your repo path
UPSTREAM_ROOT="A3A/addons"       # upstream path
BRANCH_OLD="stable"
BRANCH_NEW="11_8_pt"

# Fetch latest from upstream
git fetch upstream

# Find changed files between branches
changed_files=$(git diff --name-only upstream/$BRANCH_OLD upstream/$BRANCH_NEW -- "$UPSTREAM_ROOT")

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
