function [ result, x] = ref(sample, fs)
    result = 0;
    
    x=0;
%     %%
%      centroid = specCentroid(sample, fs);
%      
%      if(centroid > 1.1021*10^4)
%          result = result + 87.5;
%      else
%          result = result - 45;
%      end
%      x = centroid;
    %%
    
     spf = specDetect(sample);
     if( spf < 2.4) %1.33
         result = result + 62.5; %57.5 
     else
         result = result - 62.5; %57.5 
     end
     
    %%
    %array of words
    zz = zeroCross(sample);
    if (zz >= 200) %180 .10
        result = result + 60; %1
    
    else
        result = result - 60;    %1 
    end
    
    
    
    %%
     m = rootms(sample);
     
     if( m) % mx > 12
         result = result + 67.5; 
     else
         result = result - 67.5;
       
     end
     
    %%
    
    p = pauseDetect(sample);
    if(p)
       result = result + 82.5; %3 
    else
        result = result - 82.5; %2
    end
    

end
