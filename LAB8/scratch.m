%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Design the filter
[filter1.numerator,filter1.denominator] = butter( 4, 0.2 );

filter1.poles = roots( filter1.denominator );
filter1.zeros = roots( filter1.numerator );
%Export MicroModeler Design to Matlab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Export of coefficients, poles and zeros produced by MicroModeler DSP
% The numerator and denominator of the filter      
filter1.gain = 0.004824343357716227;
filter1.numerator 	= [1, 4, 6, 4, 1] * filter1.gain;
filter1.denominator = [1, -2.369513, 2.313988, -1.054665, 0.187379];

% The zeros and poles of the filter      
filter1.zeros = transpose( [-1 + 0i, -1 + 0i, -1 + 0i, -1 + 0i] );
filter1.poles = transpose( [0.660457 + 0.443323i, 0.660457 - 0.443323i, 0.5243 + 0.145774i, 0.5243 - 0.145774i] );

%Select code to analyze filter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Filter analysis code
% Calculate the frequencies of interest      
filter1.frequencies = linspace( 0, 1, 512 );

% Calculate the complex frequency response      
filter1.cmplx = freqz( filter1.numerator, filter1.denominator, filter1.frequencies * pi );

% Calculate the magnitude of the frequency response
filter1.magnitude = abs( filter1.cmplx );

% Calculate the phase response      
filter1.phase = Arg( filter1.cmplx );
% filter1.phase = unwrap( arg( filter1.cmplx ) );

% Calculate the group delay      
filter1.delay = grpdelay( filter1.numerator, filter1.denominator, filter1.frequencies );

% Calculate the impulse response      
filter1.impulse = filter( filter1.numerator, filter1.denominator, [1, zeros(1,127)] );

% Calculate the step response      
filter1.step = filter( filter1.numerator, filter1.denominator, ones(1,128) );


Select code to produce Graphs from analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Generate graphs
% The frequency vs magnitude graph
subplot( 3, 2, 1 );
plot( filter1.frequencies, 	filter1.magnitude );
xlabel("Normalized Frequency");
ylabel("Magnitude");
title( "Magnitude" );
      
% The frequency vs phase graph
subplot( 3, 2, 3 );
plot( filter1.frequencies, 	unwrap( filter1.phase ) );
xlabel("Normalized Frequency");
ylabel("Phase");
title( "Phase" );

% The frequency vs group delay graph
subplot( 3, 2, 5 );
plot( filter1.frequencies, 	filter1.delay );
title( "Group Delay (samples)" );
xlabel("Normalized Frequency");
ylabel("Group Delay");
      
% The impulse response vs time graph
subplot( 3, 2, 2 );
stem( filter1.impulse );
title( "Impulse Response" );
xlabel("Time (Samples)");
ylabel("Impulse Response");
      
subplot( 3, 2, 4 );
stem( filter1.step );     
title( "Step Response" );
xlabel("Time (Samples)");
ylabel("Step Response");

% z-plane plot (poles and zeros)
subplot( 3, 2, 6 );
zplane( filter1.zeros, filter1.poles );
title( "Poles and Zeros" );

% z-plane plot (Coefficients)
% zplane( filter1.numerator, filter1.denominator );

