close all;

[p, fs] = audioread('noisy.wav');
n = 1/fs;
t=[n:n:length(p)*n];
longer = length(p); 
window = .02*fs;
hoplength = round(window*.5);
hwindow = hamming(window,'periodic');
leftSound = p(:,1);
[leftspec, f, time] = spectrogram(leftSound,hwindow,hoplength,window,fs); %spectrogram only need G and time though
specvalues = length(leftspec);
specwindows = length(leftspec(:,1));
amount = specvalues*specwindows;
newleftspec = zeros(amount,1);
x = 1;
for i =1: specwindows
for j = 1:specvalues
    current  = leftspec(i,j);
  newleftspec(x) = current;
  x = x+1;
end
end
[rightspec, f, time] = spectrogram(rightSound,hwindow,hoplength,window,fs); %spectrogram only need G and time though
specvalues = length(rightspec);
specwindows = length(rightspec(:,1));
amount = specvalues*specwindows;
newrightspec = zeros(amount,1);
x = 1;
for i =1: specwindows
for j = 1:specvalues
    current  = rightspec(i,j);
  newrightspec(x) = current;
  x = x+1;
end
end

leftback = ifft(newleftspec);
imagleft = imag(leftback);
realleft = real(leftback);
finalleft = realleft+sqrt(imagleft.^2);
rightback = ifft(newrightspec);
imagright = imag(rightback);
realright = real(rightback);
finalright = realright+sqrt(imagright.^2);

rightlength = length(finalright);
leftlength  = length(finalleft);
backSound = zeros(leftlength,2);
backSound(:,1) = finalleft(:);
backSound(:,2) = finalright(:);



beforeleft = leftSound;
beforeright = rightSound;
right1 = length(beforeleft);
beforeSound = zeros(right1,2);
beforeSound(:,1) = beforeleft;
beforeSound(:,2) = beforeright;


convSound = zeros(sizeconv,2);
convSound(:,1) = convleft;
convSound(:,2) = convright;

