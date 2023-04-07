module Sequencing

    using BioSequences, FASTX, Random
    using StatsBase

    LongDNAView{BITS} = LongSubSeq{DNAAlphabet{BITS}}

    include("genome.jl")
    include("fragments.jl")
    include("reads.jl")

    export
        Fragmenter,
        get_fragment_indices

end