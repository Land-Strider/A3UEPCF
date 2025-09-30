# Sync Addons Script

This script helps update your extender repository with upstream changes from the main mod repository, while allowing you to selectively review and apply changes using Git’s diff tools.

---

## Usage

### 1. Switch to your updatecompat branch
```bash
git pull origin updatecompat
git switch updatecompat
```
### 3. Add upstream repo as a new remote and fetch the latest changes from upstream
```bash
git remote add upstream https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate.git
git fetch upstream
```

### 4. Run the sync script
```bash
sh ./scripts/sync_a3u.sh
```
### 5. Configure VSCode as your Git difftool:
```bash
git config --global diff.tool vscode
git config --global difftool.vscode.cmd "code --wait --diff \$LOCAL \$REMOTE"
```

### 6. Use the difftool to review changes
```bash
git difftool origin/updatecompat
```