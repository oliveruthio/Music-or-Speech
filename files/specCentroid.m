function centroid = specCentroid(a, fs)


    c = abs(fft(a));


    centroid = 0; x = 0;
    for i = 1:length(a)
        centroid = centroid + i*(c(i));
     x = x + c(i);
    end

    centroid = centroid * fs/length(a);
    centroid = centroid / x;
end