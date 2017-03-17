function p = pauseDetect(sample)
    
   %set up thresholds
    iThresh = rms(sample) * 0.95;
    pauseThresh = 2.99;
    count = 0;
    pause = false;
    duration = 0;
    durationThresh = 7000;
    
    
    for i = 1:length(sample)
        if pause == false
            %if below the threshold then we can start timing the pause
            if abs(sample(i)) < iThresh
                pause = true;
                duration = 0;
            end
            %keeps counting until above threshold again
        else if abs(sample(i)) > iThresh
                %if the pause was longer than the threshold we count it as
                %a pause.
                if duration > durationThresh;
                    count = count + 1;
                end
                pause = false;
            else
                duration = duration + 1;
            end
        end
    end
    %disp(count);
    p = 0;
    %depending on how many pauses we decided on, if it exceeded it, its a
    %pause
    if count > pauseThresh
        p = 1;
    end