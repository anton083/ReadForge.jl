
using ReadForge
using Test

using BioSequences
using Random

@testset "ReadForge.jl" begin

    @testset "randutils.jl" begin
        @test 0.15 < gc_content(random_dna(1000, 0.25)) < 0.35
    end
    
    @testset "genome.jl" begin
        genome_length = 40
        genome = Genome(random_dna(genome_length))
        @test length(genome) == genome_length
    end

    @testset "fragment.jl" begin
        genome = Genome(random_dna(40))
        fragmenter = Fragmenter(8)

        fragment_ranges = genome_fragment_ranges(genome, fragmenter)
        
        fragment_length = 20
        fragment = Fragment(genome, 1:fragment_length)
        @test length(fragment) == fragment_length
        @test length(view(fragment)) == fragment_length
        @test length(view(fragment, 1:min(5, fragment_length))) <= 5 

        @test length(fragment_ranges) == 5
        @test sum(length.(Fragments(genome, fragment_ranges))) == genome.length
        @test length(Fragments(genome, fragment_ranges, 3)) == 3
    end
    
    @testset "read.jl" begin
        genome = Genome(random_dna(50))
        read_length = 12
        sequencer = Sequencer{Paired}(read_length, 0.2)
        fragment = Fragment(genome, 1:20)
        read_pair = read_fragment(fragment, sequencer)
        @test length(read_pair.forward_read) == length(read_pair.backward_read) == read_length
    end

end