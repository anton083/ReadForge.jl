using Documenter
using ReadForge

makedocs(
    sitename="ReadForge.jl Documentation",
    modules=[ReadForge],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(
    repo="github.com/Periareion/ReadForge.jl.git",
    push_preview=true,
    devbranch="dev",
    devurl="dev/",
    target="build",
    branch="gh-pages",
)