using LinearAlgebra: sqrt
using Distances
using LinearAlgebra
using LaTeXStrings
using Random
using Statistics
using Plots
using SpecialFunctions
using QuadGK
using PlotThemes
using StatsBase
using LsqFit
using Optim
using ProgressMeter
using FileIO
using JLD2
using Dates

k=1 #modulo do vetor de onda (ou número de onda) --->>> normalizando o espaço  
Γ₀=1 #tempo de vida do átomo (qnto tempo o atomo demora pra decair naturalmente) ----->>>> normalizando o tempo

x=150
y=200
z=100
###################################variáveis do comprimento, largura e altura da nuvem
N=1000 #número de átomos na nuvem
ρ=N/(x*y*z)#eq da densidade

#preenchendo da matriz da posição dos atomos (x,y,z)
r[:,1]=X_atoms #preenchendo todas as linhas da coluna 1 da matriz r da posição dos atomos em x
r[:,2]=Y_atoms #preenchendo todas as linhas da coluna 1 da matriz r da posição dos atomos em y
r[:,3]=Z_atoms #preenchendo todas as linhas da coluna 1 da matriz r da posição dos atomos em z


#plot
tamanho=1000 #tamanho da figura
Limite=120 #limite da figura

gr()
theme(:vibrant)

#função que plota um conjunto de pontos no espaço 3d (x,y,z), 2d(x,y) e 1d(x)
scatter(
r[:,1], #posição x dos atomos
r[:,2], #posição y dos atomos
r[:,3], #posição z dos atomos
size = (tamanho, tamanho),#tamanho da figura (quadrado)
left_margin = 10Plots.mm,
right_margin = 12Plots.mm,
top_margin = 5Plots.mm,
bottom_margin = 5Plots.mm,
c = :green, #cor
framestyle = :box,
gridalpha = 0.3,
xlims = (-(1.2)*Limite,(1.2)*Limite),
ylims = (-(1.2)*Limite,(1.2)*Limite),
zlims = (-(1.2)*Limite,(1.2)*Limite),
ms = 7,
#label = L"\textrm{Atomos}",
#title = L"\textrm{Distribuição espacial dos Atomos}",
legendfontsize = 20,
labelfontsize = 25,
titlefontsize = 30,
tickfontsize = 15, 
background_color_legend = :white,
background_color_subplot = :white,
foreground_color_legend = :black
)
savefig("fig1__N={$N}__Densidade={$ρ}__K={$k}.png")

include("gerandonuvem.jl")
#matriz dos posição dos atomos
r=encontrandopontos(N,x,y,z,ρ)

#gerando a matriz da distância entre os átomos
R_jk = Distances.pairwise(Euclidean(), r, r, dims = 1)  
#=
#mudando o valor da diagonal ponto a ponto         
R_jk[LinearAlgebra.diagind(R_jk)]= #range(1,500,length=500) ou .=valor

minimum(R_jk) #calculo do mínimo
=#


        
