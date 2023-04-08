
using ReadForge
using Test

using BioSequences
using Random

@testset "ReadForge.jl" begin

end

@testset "Sequencing.jl" begin
    @testset "Fragment ranges" begin
        genome = Genome(dna"ACGT"^10)
        fragmenter = Fragmenter(4)
        @test length(genome_fragment_ranges(genome, fragmenter)) == 10
    end
    
    @testset "Paired-end reading" begin
        Random.seed!(42)
        fragment_reader = FragmentReader(true, 8, 0.2)
        genome = Genome(dna"GACCAGCAGGTGTCATCGTATACTATCGACGATCACGCAGCGATTGCTACTC")
        fragment = Fragment(genome, 1:20)
        read_pair = paired_reads(fragment, fragment_reader)
    end
end