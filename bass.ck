SawOsc osc;
ADSR env;
NRev rev;
LPF filter;

21512::samp => dur beat;
21512::samp / 2 => dur half;
21512::samp / 4 => dur quater;

60 => int offset;

osc => env => rev => filter => dac;
(quater/8, quater, 0.8, quater/4) => env.set;
0.2 => rev.mix;
4000 => filter.freq;
0.3 => filter.Q;
0.07 => osc.gain;

fun void playBass(int key, float length) {
    Std.mtof(key + offset) => osc.freq;
    1 => env.keyOn;
    0.07 => osc.gain;
    length * quater => now;
    0.0 => osc.gain;
}

fun void slidingTwo(int key1, int key2) {
    Std.mtof(key1 + offset) => osc.freq;
    Std.mtof(key1 + offset) => float key1freq;
    Std.mtof(key2 + offset) => float key2freq; 
    0.07 => osc.gain;
    for (key1freq => float i; i > key2freq;) {
        i => osc.freq;
        i - ((key1freq - key2freq) / 168.0625) => i;
        128::samp => now;
    }
    0.0 => osc.gain;
}

playBass(-13, 24);
playBass(-11, 8);
playBass(-16, 28);

0.5 => filter.Q;
0.3 => osc.gain;
slidingTwo(-9, -21);

for (0 => int i; i < 4; i++) {
    playBass(-13, 2);

    beat => now;

    playBass(-13, 1);

    quater => now;
    half => now;

    playBass(-13, 2);

    half => now;

    playBass(-11, 2);

    quater => now;
    half => now;

    playBass(-11, 1);

    half => now;

    playBass(-11, 2);

    half => now;

    playBass(-11, 1);

    quater => now;

    playBass(-11, 4);
    playBass(-9, 2);

    quater => now;

    playBass(-9, 1);

    half => now;

    playBass(-9, 0.5);

    quater / 2 => now;

    playBass(-9, 2);

    half => now;

    playBass(-9, 0.5);

    quater / 2 => now;

    half => now;

    playBass(-9, 2);

    quater => now;
    half => now;

    playBass(-16, 1);

    half => now;

    playBass(-16, 6);

    half => now;

    playBass(-16, 1);

    quater => now;
}

for (0 => int i; i < 3; i++) {
    playBass(-13, 2);

    beat => now;

    playBass(-13, 1);

    quater => now;
    half => now;

    playBass(-13, 2);

    half => now;

    playBass(-11, 2);

    quater => now;
    half => now;

    playBass(-11, 1);

    half => now;

    playBass(-11, 2);

    beat => now;

    playBass(-11, 2);

    half => now;

    playBass(-16, 2);

    beat * 2 => now;

    playBass(-16, 2);

    quater => now;
    half => now;

    playBass(-16, 0.5);
    quater / 2 => now;

    playBass(-16, 2);

    beat => now;

    playBass(-16, 2);

    quater * 3 => now;

    playBass(-11, 0.5);

    quater / 2 => now;

    playBass(-11, 4);
}

playBass(-13, 2);

beat => now;

playBass(-13, 1);

quater => now;
half => now;

playBass(-13, 2);

half => now;

playBass(-11, 2);

quater => now;
half => now;

playBass(-11, 1);

half => now;

playBass(-11, 2);

beat => now;

playBass(-11, 2);

half => now;

0.3 => filter.Q;
0.07 => osc.gain;

playBass(-13, 6);
playBass(-11, 6);
playBass(-11, 4);
playBass(-16, 12);

beat => now;

playBass(-13, 24);
playBass(-11, 8);
playBass(-16, 32);

playBass(-13, 24);
playBass(-11, 8);
playBass(-16, 32);

playBass(-13, 24);
playBass(-11, 8);
playBass(-16, 32);

playBass(-13, 24);
playBass(-11, 8);
playBass(-16, 28);

0.5 => filter.Q;
0.3 => osc.gain;
slidingTwo(-9, -21);

for (0 => int i; i < 3; i++) {
    playBass(-13, 2);

    beat => now;

    playBass(-13, 1);

    quater => now;
    half => now;

    playBass(-13, 2);

    half => now;

    playBass(-11, 2);

    quater => now;
    half => now;

    playBass(-11, 1);

    half => now;

    playBass(-11, 2);

    half => now;

    playBass(-11, 1);

    quater => now;

    playBass(-11, 4);
    playBass(-9, 2);

    quater => now;

    playBass(-9, 1);

    half => now;

    playBass(-9, 0.5);

    quater / 2 => now;

    playBass(-9, 2);

    half => now;

    playBass(-9, 0.5);

    quater / 2 => now;

    half => now;

    playBass(-9, 2);

    quater => now;
    half => now;

    playBass(-16, 1);

    half => now;

    playBass(-16, 6);

    half => now;

    playBass(-16, 1);

    quater => now;
}

playBass(-13, 2);

beat => now;

playBass(-13, 1);

quater => now;
half => now;

playBass(-13, 2);

half => now;

playBass(-11, 2);

quater => now;
half => now;

playBass(-11, 1);

half => now;

playBass(-11, 2);

half => now;

playBass(-11, 1);

quater => now;

playBass(-11, 4);

0.3 => filter.Q;
0.07 => osc.gain;

playBass(-9, 6);
playBass(-11, 10);
playBass(-12, 6);
playBass(-13, 10);

playBass(-16, 22);
playBass(-14, 8);
playBass(-9, 34);

playBass(-16, 22);
playBass(-14, 10);
playBass(-9, 26);
playBass(-11, 6);

0.5 => filter.Q;
0.3 => osc.gain;

playBass(-16, 22);
playBass(-14, 8);
playBass(-9, 30);
playBass(-11, 4);

playBass(-16, 22);
playBass(-14, 10);
playBass(-13, 32);

beat * 4 => now;

for (0 => int i; i < 4; i++) {
    playBass(-13, 3);

    beat => now;

    playBass(-13, 1);

    half => now;

    playBass(-13, 3);

    quater => now;

    playBass(-11, 2);


    half => now;

    playBass(-11, 0.6);

    quater * 0.4 => now;

    playBass(-11, 1);

    half => now;

    playBass(-11, 2);

    half * 1.5 => now;

    playBass(1, 1);

    half => now;

    playBass(-11, 2);


    playBass(-16, 4);

    half => now;

    playBass(-16, 1);

    beat => now;

    playBass(-16, 1);

    half => now;

    playBass(-16, 2);
    playBass(-16, 4);

    half => now;

    playBass(-4, 1);
    playBass(-16, 1);

    half => now;

    playBass(-4, 1);
    playBass(-2, 0.6);

    quater * 0.4 => now;

    playBass(-16, 4);
}