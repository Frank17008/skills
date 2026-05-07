#!/bin/bash
# 同步软链接到实际文件并提交

SCRIPT_DIR="$(dirname "$0")"
cd "$SCRIPT_DIR/.."

# 需要展开的软链接目录
SYMLINKS=(
  "image-annotation-usage"
  "pcloud-components-usage"
  "pcloud-utils-usage"
  "react-jsmind-usage"
)

# 展开软链接
for dir in "${SYMLINKS[@]}"; do
  if [[ -L "$dir" ]]; then
    target=$(readlink -f "$dir")
    rm -rf "$dir"
    cp -r "$target" "$dir"
    echo "Expanded: $dir"
  fi
done

# Git 操作
git add -A

if [[ -z "$(git status --porcelain)" ]]; then
  echo "No changes to commit"
  exit 0
fi

# 读取提交信息
echo -n "Commit message: "
read -r msg

if [[ -n "$msg" ]]; then
  git commit -m "$msg"
  git push
  echo "Pushed! Restoring symlinks..."

  # 提交成功后恢复软链接
  for dir in "${SYMLINKS[@]}"; do
    if [[ -d "$dir" ]] && [[ ! -L "$dir" ]]; then
      target=$(readlink -f "$dir")
      rm -rf "$dir"
      ln -s "$target" "$dir"
      echo "Restored: $dir"
    fi
  done

  echo "Done!"
else
  echo "Aborted: no commit message"
  git restore --staged .
fi