function x = get_audio(fs, bits, channels, listen, rec_length)
    % initialize
    recording = audiorecorder(fs, bits, channels);

    % wait
    disp('Press any key and to record audio'); pause;
    record(recording); pause(rec_length); stop(recording); 

    % write
    audio = getaudiodata( recording, 'single' );

    if listen
        play(recording); % listen to sound
        pause(rec_length);
        sound(audio,fs); % listen to record
    end

    % pass forward & cleanup
    x = audio; 
    clear audio;
end