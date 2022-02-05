
function divs = noteparse(data)
len = length(data)


%let's find a threshold value so we know when a note starts/stops
threshup = .2 * max(data);  % 20% of the maximum value
threshdown = .04 * max(data);

quiet=1;  % a flag so we know if we're noisy or quiet right now
j=1;

for i=51:len-50
    k=i-50:i+50;
   if quiet == 1  % we're trying find the begining of a note
      if (max(abs(data(k))) > threshup)
         quiet = 0;  % we found it
         divs(j) = i;  %record this division point
         j=j+1;
      end
	else
      if (max(abs(data(k))) < threshdown)
         quiet = 1;  %note's over
         divs(j) = i;
         j=j+1;
      end
   end
end