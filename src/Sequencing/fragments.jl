
struct Fragmenter
    mean_size::Int
end


function genome_fragment_ranges(
    genome::Genome,
    fragmenter::Fragmenter,
)::Vector{UnitRange{Int}}

    fragment_count = ceil(Int, genome.length / fragmenter.mean_size)

    sorted_indices = sort!(sample(1:(genome.length-1), fragment_count-1, replace=false))
    push!(sorted_indices, sequence_length)

    fragment_ranges = [1:sorted_indices[1]]
    for i in 1:length(sorted_indices) - 1
        fragment_range = sorted_indices[i]+1:sorted_indices[i+1]
        push!(fragment_ranges, fragment_range)
    end

    fragment_ranges
end


struct Fragment
    genome::Genome
    range::UnitRange{Int}
end

# Constructors

function Fragment(
    genome::Genome,
    fragment_range::UnitRange{Int},
)::Fragment
    Fragment(genome, fragment_range)
end

function Fragments(
    genome::Genome,
    fragment_ranges::Vector{UnitRange{Int}},
)::Vector{Fragment}
    [Fragment(genome, fr) for fr in fragment_ranges]
end

function Fragments(
    genome::Genome,
    fragment_ranges::Vector{UnitRange{Int}},
    N::Int,
)::Vector{Fragment}
    N > length(fragment_ranges) && throw(ArgumentError("Not enough fragment ranges"))
    Fragments(genome, sample(fragment_ranges, N, replace=false))
end

@inline length(fragment::Fragment) = length(fragment.range)
@inline sequence(fragment::Fragment) = fragment.genome[fragment.range]
@inline view(fragment::Fragment) = view(fragment.genome, fragment.range)
@inline view(fragment::Fragment, subrange::UnitRange{Int}) = view(genome, fragment.range[subrange])

# foo bar