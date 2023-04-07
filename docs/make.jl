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
    repo = "github.com/Periareion/ReadForge.jl.git", # Replace 'username' with your GitHub username
    target = "build",
    branch = "gh-pages",
    devbranch = "dev", # The branch that you want to build the documentation from
    push_preview = true,
)