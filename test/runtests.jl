
using ReadForge
using Test

using BioSequences

@testset "ReadForge.jl" begin

end

@testset "Sequencing.jl" begin
    genome = dna"ACGT"^10
    fragmenter = Sequencing.Fragmenter(4)
    [println(Sequencing.get_fragment_indices(genome, fragmenter)) for i in 1:5]
    @test length(Sequencing.get_fragment_indices(genome, fragmenter)) == 10
end