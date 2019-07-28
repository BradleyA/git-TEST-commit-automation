
# Memo:
Add something about creating a symbolic link from ../.git/hooks to this hooks directory that are managed in this repository using markit.

cd hooks
ln -s ../../hooks/post-commit ../.git/hooks/post-commit
ln -s ../../hooks/pre-commit ../.git/hooks/pre-commit



