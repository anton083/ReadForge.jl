
struct FragmentReader
    fragment::Fragment
    read_length::Int
end

struct Substitution
    position::UInt64
    base::DNA
end

abstract type Direction end
struct Forward <: Direction end
struct Backward <: Direction end

abstract type Read end

struct SingleRead <: Read
    genome::Genome
    genome_range::UnitRange{Int}
    substitutions::Vector{Substitution}
end

struct PairedRead{D <: Direction} <: Read
    genome_range::UnitRange{Int}
    substitutions::Vector{Substitution}
end

struct PairedReads
    forward_read::PairedRead{Forward}
    backward_read::PairedRead{Backward}
end


function paired_read(
    fragment::Fragment,
    read_length::Integer,
)
end