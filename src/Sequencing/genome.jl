
struct Genome
    sequence::LongDNA{4}
    length::Int
    GC_content::Float64
end

function Genome(sequence::LongDNA{4})
    Genome(sequence, length(sequence), BioSequences.gc_content(sequence))
end

@inline Base.view(genome::Genome, range::UnitRange(<:Integer)) = view(genome.sequence, range)
@inline Base.length(genome::Genome) = length(genome.sequence)
@inline Base.iterate(genome::Genome) = iterate(genome.sequence)