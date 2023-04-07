using Documenter, ReadForge

makedocs(sitename="ReadForge.jl",
         modules=[ReadForge],
         format=Documenter.HTML(),
         pages=[
             "Home" => "index.md"
         ],
         repo="https://github.com/Periareion/ReadForge.jl.git"
)