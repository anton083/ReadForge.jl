
using BioSequences, FASTX, Random
using StatsBase

LongDNAView{BITS} = LongSubSeq{DNAAlphabet{BITS}}

include("utils.jl")
include("genome.jl")
include("fragment.jl")
include("read.jl")
