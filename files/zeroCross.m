function zz = zeroCross(sample)

    %block setup
    blockLength = 2048;
    numBlocks = floor(length(sample)/blockLength);
    overlap = blockLength/2;
    hopLength = blockLength;
    blockB = 1; %start
    blockE = blockLength; %end
    
    %initiate counters
    zz = 0;
    arrayBlocks = {{}}; ABCount = 1;
    
    %if cross 0 add one to count
    for i = 1:numBlocks
        
       dBlock = sample(blockB:blockE);  
       for  j = 1:(length(dBlock)-1)
           ju = j+1;
           %%if cross 0 add one to count. this is per block
           if(dBlock(j) > 0)
               if(dBlock(ju) < 0)
                   zz = zz + 1;
               end
           end
           if(dBlock(j) < 0)
               if(dBlock(ju) > 0)
                   zz = zz+1;
               end
           end
    
       end
       %stores the amount it crosses in one block to its own index
       arrayBlocks{ABCount} = zz;
       ABCount = ABCount + 1;
       zz = 0;
       
       blockB = blockB + hopLength;
       blockE = blockE + hopLength;
    end
    
    %averages those indexes
    for i = 1:(ABCount-1)
        zz = zz + arrayBlocks{i};
    end
    zz = zz/numBlocks;
   
end
