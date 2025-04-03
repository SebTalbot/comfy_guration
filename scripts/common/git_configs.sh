#!/bin/bash
# lisibility
git config --global column.ui never
git config --global core.pager cat

git config --global diff.algorithm histogram
git config --global diff.colorMoved plain
git config --global diff.mnemonicPrefix true
git config --global diff.renames true

git config --global commit.verbose true

# sorting
git config --global branch.sort -committerdate
git config --global tag.sort version:refname

# behavior
git config --global init.defaultBranch main

git config --global push.autoSetupRemote true

git config --global fetch.prune true
git config --global fetch.pruneTags true
git config --global fetch.all true

git config --global pull.rebase true
git config --global rebase.autoStash true
git config --global rebase.updateRefs true

git config --global rerere.enabled true
git config --global rerere.autoupdate true

git config --global merge.conflictstyle zdiff3
