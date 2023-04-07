using Documenter
using ReadForge

makedocs(
    sitename = "ReadForge.jl",
    modules = [ReadForge],
    format = Documenter.HTML(),
    pages = [
        "Home" => "index.md"
    ],
    repo="https://github.com/Periareion/ReadForge.jl.git"
)

deploydocs(
    repo = "github.com/Periareion/ReadForge.jl.git",
    target = "build",
    branch = "gh-pages",
    devbranch = "dev", # The branch that the documentation is built from
    push_preview = true,
    make = x->nothing,
)