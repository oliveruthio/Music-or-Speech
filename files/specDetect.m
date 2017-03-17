function [ sfp] = specDetect(sample)
    %set up blocks
    blockLength = 1024;
    numBlocks = floor(length(sample)/blockLength);   
    overlap = blockLength/2;  
    hopLength = blockLength;  
    blockB = 1; %start
    blockE = blockLength; %end
    
    %takes foureier transform
    sample = abs(fft(sample));
    
    % Creates array of blocks for spectralFlux
    arrayBlox = zeros(blockLength, numBlocks);
    for i = 1:numBlocks
        for j = 1:blockLength
            arrayBlox(j,i) = sample(j+blockLength*(i-1),1);
        end
    end
    
    %array of spectralFlux
    sf = spectralFlux(arrayBlox);
    
    %averages them out
    sfp = mean(sf);
    


    
end