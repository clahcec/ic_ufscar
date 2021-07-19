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

k=1

x=15
y=20
z=10
###################################variáveis do comprimento, largura e altura da nuvem
N=500 #número de átomos na nuvem
ρ =N/(x*y*z)#eq da densidade
r=zeros(N,3) #matriz da posição dos átomos: (x,y,z) de cada N átomos - matriz com N linhas e 3 colunas: x,y,z
X_atoms=rand(N)*x .-x/2
Y_atoms=rand(N)*y .-y/2
Z_atoms=rand(N)*z .-z/2

r[:,1]=X_atoms
r[:,2]=Y_atoms
r[:,3]=Z_atoms

tamanho=1000
Limite=15

gr()
theme(:vibrant)


scatter(r[:,1],r[:,2],r[:,3],
size = (tamanho, tamanho),
left_margin = 10Plots.mm,
right_margin = 12Plots.mm,
top_margin = 5Plots.mm,
bottom_margin = 5Plots.mm,
c = :green,
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
