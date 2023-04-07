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
    julia = "1.8",
    ssh = raw"GITHUB_TOKEN", # Use "DOCUMENTER_KEY" if you have set up an SSH deploy key
    push_preview = true,
    make = x->nothing,
)