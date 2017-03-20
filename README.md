This program detects whether a sound sample is speech or music.

- loader.m is the main file. It loads all the videos from a folder and determines what % of it is speech or music
- ref.m is short for Referee. It weighs the scores from each detection tool. It is weighed based on % accuracy.
- 4 detection tools
- - specDetect.m bases it off of spectral flux
- - zeroCross.m judges based on the frequency the signal crosses 0
- - rootms.m is the root mean squared
- - pauseDetect.m counts the amount of time a pause is detected
- - spectralCentroid.m was created but not used



# Music-or-Speech
