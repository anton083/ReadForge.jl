module ReadForge

    export
        Sequencing

    using BioSequences, FASTX, Random

    include("randutils.jl")
    include("Sequencing/Sequencing.jl")

end
