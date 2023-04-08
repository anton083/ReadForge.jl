
export
    Genome

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
function Genome(sequence::LongDNA{4})
    Genome(sequence, reverse_complement(sequence), length(sequence), BioSequences.gc_content(sequence))
end

@inline Base.view(genome::Genome, range::UnitRange{Int}) = view(genome.sequence, range)
@inline Base.length(genome::Genome) = length(genome.sequence)
@inline Base.iterate(genome::Genome) = iterate(genome.sequence)