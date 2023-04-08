
using ReadForge
using Test

using BioSequences
using Random

@testset "ReadForge.jl" begin

end

@testset "Sequencing.jl" begin
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
        paired_reader = FragmentReader{Paired}(8, 0.2)
        fragment = Fragment(genome, 1:20)
        read_pair = read_fragment(fragment, paired_reader)
    end
end
