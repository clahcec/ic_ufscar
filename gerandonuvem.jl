




function encontrandopontos(N,x,y,z,ρ) #definição da função que gera a matriz da posição dos átomos válidos na nuvem

    matriz_pontos_validos=zeros(N,3)
    raio_de_exclusao=1/(10*sqrt(ρ))
    atomos_validos=0

    while true
        #criando uma nova posição aleatória
        X_atoms_2=rand()*x  -x/2
        Y_atoms_2=rand()*y  -y/2
        Z_atoms_2=rand()*z  -z/2
        B=[X_atoms_2,Y_atoms_2,Z_atoms_2]
    
        #calculo das distâncias entre os pontos válidos e a nova posição aleatória
        distâncias_entre_os_pontos=criando_matriz_das_distancias(matriz_pontos_validos[1:atomos_validos,:],B)
        
        #validação das posições aleatórias
        if all(distâncias_entre_os_pontos .≥ raio_de_exclusao) 
            atomos_validos+=1
            matriz_pontos_validos[atomos_validos,:]=B
        end
        
        if atomos_validos == N
            break
        end
    end
    
    return matriz_pontos_validos
end

function criando_matriz_das_distancias(A::Array, b::Array)

    n_rows = size(A, 1) #NÚMERO DE ATOMOS                                                                                                                # Aqui temos a contagem dos N atomos novamente
    distanceAb = zeros(n_rows) #MATRIZ DAS DISTÂNCIAS RELATIVAS                                                                                                         # Define uma matriz que vai guardar a distancia entre os atomos
    @inbounds for i = 1:n_rows                                     
        distanceAb[i] = Distances.evaluate(Euclidean(), A[i, :], b) #preenchendo a matriz das distâncias relativas
    end
    return distanceAb
end
