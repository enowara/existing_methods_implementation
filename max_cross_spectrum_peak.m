function max_cross_spectrum_peak(Sj, N, Fps1)

MaxPeak = []; % should be N x N matrix
% for n = 1:N-1
for i = 1:N;
    MaxPeak1 = [];

    for j = i:N; % figure out how to select different regions
%     if i == j
%         continue
%     else 
        
    % generate C(N,2) combinations
    s_i = Sj(:,i);
    s_j = Sj(:,j);
    
    % normalize the signals: subtract the mean and divide by std
    s_i = (s_i - mean(s_i)) / std(s_i);
    s_j = (s_j - mean(s_j)) / std(s_j);
    
    MaxSpectrum = fft(s_i).*conj(fft(s_j));
    [~, argmax_f] = max(MaxSpectrum); % translate to Hz
    L = length(MaxSpectrum);
    freq1 = (0:(L/2))*Fps1/L;
    
    max_freq = freq1(argmax_f);
    MaxPeak1 = [MaxPeak1 max_freq];
    end
    MaxPeak = [MaxPeak; MaxPeak1];
end

end