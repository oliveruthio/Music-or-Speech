clear;
total = 0; music = 0; speech = 0;



directory_name = 'audio/music';
files = dir(directory_name);

fileIndex = find(~[files.isdir]);
for i = 1:length(fileIndex)
    %loads individual file
    fileName = files(fileIndex(i)).name;
    file = strcat(directory_name,'/',fileName);
    [sample, fs] = audioread(file);
  
 
    % x is used to store all the values into y 
    %this way I could have a graph of all music samples on top of 
    %all speech samples to see a pattern / difference
    [result, x] = ref(sample, fs); 
    %y(i) = x;
   
 
    if(result < 0)
       music = music + 1; 
    end
    total = total + 1;
end

disp(music/total * 100);
total1 = 0;


directory_name = 'audio/speech';
files = dir(directory_name);
fileIndex = find(~[files.isdir]);
%loads all file in speech
for k = 1:length(fileIndex)
    %loads individual file
    fileName = files(fileIndex(k)).name;
    file = strcat(directory_name,'/',fileName);
    [sample, fs] = audioread(file);
    
   %same reasoning as music for x
    [result, x] = ref(sample, fs);
    %y2(k) = x;
    
    
   if( result > 0)
       speech = speech + 1;
   end
   
   total1 = total1 + 1;
end

    disp(speech/total1 * 100);

    disp('grand total');
    disp((speech+music)/(total1+total) * 100);

    %the x axis for the graph
%x = (1:40);