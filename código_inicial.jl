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

k=1 #modulo do vetor de onda (ou número de onda) 
Γ₀

x=15
y=20
z=10
###################################variáveis do comprimento, largura e altura da nuvem
N=500 #número de átomos na nuvem
ρ=N/(x*y*z)#eq da densidade
r=zeros(N,3) #matriz da posição dos átomos: (x,y,z) de cada N átomos - matriz com N linhas e 3 colunas: x,y,z
X_atoms=rand(N)*x .-x/2 #gerando N valores aleatórios no intervalo [-x/2,x/2] ------ (. = reduzindo todo mundo ao mesmo comando)
Y_atoms=rand(N)*y .-y/2 #gerando N valores aleatórios no intervalo [-y/2,y/2] ------ (. = reduzindo todo mundo ao mesmo comando)
Z_atoms=rand(N)*z .-z/2 #gerando N valores aleatórios no intervalo [-z/2,z/2] ------ (. = reduzindo todo mundo ao mesmo comando)


#preenchendo da matriz da posição dos atomos (x,y,z)
r[:,1]=X_atoms #preenchendo todas as linhas da coluna 1 da matriz r da posição dos atomos em x
r[:,2]=Y_atoms #preenchendo todas as linhas da coluna 1 da matriz r da posição dos atomos em y
r[:,3]=Z_atoms #preenchendo todas as linhas da coluna 1 da matriz r da posição dos atomos em z


#plot
tamanho=1000 #tamanho da figura
Limite=12 #limite da

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

 #=teste distância correta entre atomos
while true 
    X_atoms_1=rand()*x  
    Y_atoms_1=rand()*y  
    Z_atoms_1=rand()*z  
    A= (X_atoms_1,Y_atoms_1,Z_atoms_1)

    X_atoms_2=rand()*x  
    Y_atoms_2=rand()*y  
    Z_atoms_2=rand()*z  
    B= (X_atoms_2,Y_atoms_2,Z_atoms_2)

    m=zeros(2,3)
    distância_entre_os_pontos= √((X_atoms_1-X_atoms_2)^2 + (Y_atoms_1-Y_atoms_2)^2 +(Z_atoms_1-Z_atoms_2)^2)
    a=0     
    while true
    
        if distância_entre_os_pontos >= 1/(10√(ρ)) , a<=N
            m[1,1] = X_atoms_1
            m[1,2] = Y_atoms_1
            m[1,3] = Z_atoms_1
            m[2,1] = X_atoms_2
            m[2,2] = Y_atoms_2
            m[2,3] = Z_atoms_2
            a=a+1
        else 
            if a>N
                break

                


        






#=
a=0

for i in 1:10
    a=a+i
end
a

a=0
while true
    a+=1
    if a==3
        break
    end
end
a
=#
