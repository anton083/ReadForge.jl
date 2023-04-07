push!(LOAD_PATH, "../src/")

using ReadForge
using Documenter

makedocs(
    sitename = "ReadForge.jl",
    modules = [ReadForge],
    format = Documenter.HTML(),
    pages = [
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo = "github.com/Periareion/ReadForge.jl.git",
    branch = "gh-pages",
    devbranch = "dev",
)