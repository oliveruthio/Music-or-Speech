function m = rootms(sample)
    %set up blocks
    blockLength = 2048;
    numBlocks = floor(length(sample)/blockLength);
    overlap = blockLength/2;
    hopLength = blockLength - overlap;
    blockB = 1; %start
    blockE = blockLength; %end
    
    %Checks if low or high freq
    low = 0;
    high = 0;
    
    m = 0;
    arrayBlocks = zeros(1,numBlocks); 
    
    %takes the RMS of each block then stores it into an array
    for i = 1:numBlocks
        dBlock = sample(blockB:blockE);
    
        for j = 1:blockLength
            m = m + (dBlock(j) * dBlock(j));
        end
        m = m/blockLength;
        m = sqrt(m);
        
        arrayBlocks(i) = m;
        
        m = 0;
        
        blockB = blockB + hopLength;
        blockE = blockE + hopLength;
    end
    
    %takes a chunk of the array of RMS
    %Averages those values out then divides it by half.
    % Checks each RMS of that chunk. if it is less than half the average
    % then we increment low counter. increment high counter otherwise
    arrayBlocks2 = {{}}; 
    for i = 1:ceil(length(arrayBlocks)/blockLength)
        blockB = (i-1)*hopLength + 1;
        blockE = min(length(arrayBlocks), blockB + blockLength -1);
        arrayBlocks2{i} = (sum(arrayBlocks(blockB:blockE).^2)/blockLength)^0.5;
        for j = blockB:blockE
            if(arrayBlocks(j) < 0.5*arrayBlocks2{i});
                low = low+1;
            else 
                high = high+1;
            end
        end
    
    end
    m=0;
    %if a fourth or less of the sample is less than half the sample we can
    %assume it is a speech samples because of pauses.
    if(low/high < 0.25)
        m = 1;
 
    end
end
