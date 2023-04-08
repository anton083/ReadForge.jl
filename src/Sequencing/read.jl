
export
    Single,
    Paired,
    Sequencer,
    read_fragment

# TODO: function for substitution vector with args length and substitution rate

abstract type Direction end
struct Forward <: Direction end
struct Backward <: Direction end

const SUBSTITUTIONS = Dict{DNA, Tuple{DNA, DNA, DNA}}(
    DNA_A => (DNA_C, DNA_G, DNA_T),
    DNA_C => (DNA_A, DNA_G, DNA_T),
    DNA_G => (DNA_A, DNA_C, DNA_T),
    DNA_T => (DNA_A, DNA_C, DNA_G),
    DNA_N => (DNA_A, DNA_C, DNA_G),
)

struct Substitution
    position::Int
    base::DNA
end


abstract type ReadMode end
struct Single <: ReadMode end
struct Paired <: ReadMode end

struct Sequencer{M <: ReadMode}
    read_length::Int
    substitution_rate::Float64
end


struct Read{D <: Direction}
    fragment::Fragment
    view::LongDNAView{4}
    substitutions::Vector{Substitution}
end

struct ReadPair
    forward_read::Read{Forward}
    backward_read::Read{Backward}
end

@inline Base.length(read::Read) = length(read.view)


function read_fragment(
    fragment::Fragment,
    sequencer::Sequencer{Paired},
)::ReadPair
    read_length = min(sequencer.read_length, length(fragment))
    
    seq_1 = view(fragment.genome.sequence, fragment.range)
    seq_2 = view(fragment.genome.revcomp, fragment.range_rc)

    subs_1::Vector{Substitution} = []
    subs_2::Vector{Substitution} = []
    
    i = 0
    while i < read_length
        i += 1
        rand() < sequencer.substitution_rate && push!(subs_1, Substitution(i, rand(SUBSTITUTIONS[seq_1[i]])))
        rand() < sequencer.substitution_rate && push!(subs_2, Substitution(i, rand(SUBSTITUTIONS[seq_2[i]])))
    end
    
    ReadPair(
        Read{Forward}(fragment, seq_1[1:read_length], subs_1),
        Read{Backward}(fragment, seq_2[1:read_length], subs_2),
    )
end