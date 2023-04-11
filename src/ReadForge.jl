module ReadForge

    export

        ### Sequencing ###

        # utils.jl        
        reverse_range,

        # genome.jl
        Genome,

        # fragment.jl
        Fragmenter,
        Fragment,
        Fragments,
        genome_fragment_ranges,

        # read.jl
        Single,
        Paired,
        Sequencer,
        read_fragment

    using BioSequences, FASTX, Random

    include("randutils.jl")
    include("Sequencing/Sequencing.jl")

end
