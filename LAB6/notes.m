function [output_sound] = notes(note,Amplitude)
duration = 0.5;

fs = 44100;
frequencies = [700,646,473,450,430,380,1200,1100,1200];
% frequencies(chord), fs:duration of the sound
output_sound = Amplitude * sin(2*pi*frequencies(note)*(0:1/fs:duration)); 

end

