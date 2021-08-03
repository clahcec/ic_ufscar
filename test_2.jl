function encontrandoponto(A,x,y,z,ρ)

    pontovalido=zeros(3)
    raiodeexclusao=1/(10*sqrt(ρ))
    while true
        X_atoms_2=rand()*x  
        Y_atoms_2=rand()*y  
        Z_atoms_2=rand()*z  
        B=[X_atoms_2,Y_atoms_2,Z_atoms_2]
    
        #distância_entre_os_pontos= √((X_atoms_1-X_atoms_2)^2 + (Y_atoms_1-Y_atoms_2)^2 +(Z_atoms_1-Z_atoms_2)^2)
        distância_entre_os_pontos= norm(A.-B) 
    
    
        if distância_entre_os_pontos >= raiodeexclusao  
            
            pontovalido=B
            break
        end
        
    end
    
    return pontovalido
end