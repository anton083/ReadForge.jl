
export
    Fragmenter,
    genome_fragment_ranges,
    Fragment,
    Fragments


struct Fragmenter
    mean_size::Int
end


function genome_fragment_ranges(
    genome::Genome,
    fragmenter::Fragmenter,
)::Vector{UnitRange{Int}}

    fragment_count = ceil(Int, genome.length / fragmenter.mean_size)

    sorted_indices = sort!(sample(1:(genome.length-1), fragment_count-1, replace=false))
    push!(sorted_indices, genome.length)

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
    range_rc::UnitRange{Int}
end

# Constructors

function Fragment(
    genome::Genome,
    fragment_range::UnitRange{Int},
)::Fragment
    Fragment(genome, fragment_range, reverse_range(fragment_range, genome.length))
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

@inline function Base.length(fragment::Fragment)::Int
    length(fragment.range)
end

@inline function Base.view(fragment::Fragment)::LongDNAView{4}
    view(fragment.genome, fragment.range)
end

@inline function Base.view(fragment::Fragment, subrange::UnitRange{Int})::LongDNAView{4}
    view(fragment.genome, fragment.range[subrange])
end