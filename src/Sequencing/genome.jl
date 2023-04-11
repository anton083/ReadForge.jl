
using BioSequences

struct Genome
    sequence::LongDNA{4}
    revcomp::LongDNA{4}
    length::Int
    GC_content::Float64
end

"""
    Genome(sequence::LongDNA{4})

Create a genome from a sequence. The genome struct stores the reverse complement sequence, length, and GC-content. 
"""
function Genome(sequence::LongDNA{4})::Genome
    Genome(sequence, reverse_complement(sequence), length(sequence), BioSequences.gc_content(sequence))
end

@inline function Base.view(genome::Genome, range::UnitRange{Int})::LongDNAView{4}
    view(genome.sequence, range)
end

@inline function Base.length(genome::Genome)::Int
    length(genome.sequence)
end