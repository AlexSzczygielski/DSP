function [output_sound] = notes(note,duration)

fs = 44100;
frequencies = [440, 246.94, 277.18, 293.66, 329.63, 220, 196.00,0];
% frequencies(chord), fs:duration of the sound
output_sound = sin(2*pi*frequencies(note)*(0:1/fs:duration)); 

end

