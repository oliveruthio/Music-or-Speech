function SF = spectralFlux(x)

    delta = diff([x(:,1), x],3,2);
    SF = sqrt(sum(delta.^2))/size(x,1);
    
end

