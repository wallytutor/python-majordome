# Run from the parent repository no matter what the script is called from.
Set-Location "$PSScriptRoot/.."

$names = @(
    "calphad",
    "constants",
    "equations",
    "foam",
    "numerical",
    "utilities"
)

foreach ($name in $names) {
    $remote = "majordome-$name"
    $prefix = "crates/$remote"

    git subtree push --prefix=$prefix $remote main
}