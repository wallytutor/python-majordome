# Majordome Crates

## Adding a new component

From the repository root, run the following:

```bash
$name = "constants"

$remote = "majordome-$name"
$repo   = "https://github.com/wallytutor/$remote.git"
$prefix = "crates/$remote"

git remote add $remote $repo
git subtree add --prefix=$prefix $remote main --squash
```

## Syncing remotes

- Push to remote:

```bash
$name = "foam"
$prefix = "crates/$name"

# Commit changes normally as for any other change
git add $prefix
git commit -m "Updated package"

# Push only the commits from $prefix towards main repository:
git subtree push --prefix=$prefix $remote main --squash
```

- Pull from remote (atypical usage, generally work in this repository and push to remotes instead).

```bash
$name = "foam"

$remote = "majordome-$name"
$prefix = "crates/$remote"

git subtree pull `
    --prefix=$prefix `
    $remote main `
    --squash `
    -m "chore: sync $name remote"
```