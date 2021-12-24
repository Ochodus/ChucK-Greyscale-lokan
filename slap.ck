SawOsc osc;
ADSR env;
NRev rev;
LPF filter;

21512::samp => dur beat;
21512::samp / 2 => dur half;
21512::samp / 4 => dur quater;

48 => int offset;

osc => env => rev => filter => dac;
(quater/16, quater/3, 0.1, quater/16) => env.set;
0.1 => rev.mix;
3500 => filter.freq;
0.4 => filter.Q;
0.6 => osc.gain;

fun void playSlap(int key, float length) {
    Std.mtof(key + offset) => osc.freq;
    1 => env.keyOn;
    0.25 => osc.gain;
    length * quater => now;
    0.0 => osc.gain;
}


for (0 => int i; i < 4; i++) {
    quater => now;

    playSlap(-1, 1);
    playSlap(13, 1);
    playSlap(15, 1);

    half => now;

    playSlap(27, 2);

    quater => now;

    playSlap(13, 1);
    playSlap(15, 1);

    quater => now;

    playSlap(1, 1);

    quater => now;

    playSlap(30, 1);
    playSlap(27, 1);

    quater => now;

    playSlap(1, 1);
    playSlap(13, 1);
    playSlap(15, 1);

    half => now;

    playSlap(20, 2);

    quater => now;

    playSlap(25, 1);

    quater => now;

    playSlap(20, 1);

    half => now;

    playSlap(20, 1);
    playSlap(22, 1);

    half => now;

    playSlap(13, 1);
    playSlap(15, 1);

    quater => now;

    playSlap(25, 1);

    quater => now;

    playSlap(27, 1);

    half => now;

    playSlap(13, 1);
    playSlap(15, 1);

    half => now;

    playSlap(30, 2);

    quater => now;

    playSlap(8, 1);
    playSlap(13, 1);

    half => now;

    playSlap(15, 1);

    half => now;
    quater => now;
    playSlap(32, 0.5);
    playSlap(34, 0.5);
    playSlap(32, 1);
    quater => now;
    quater => now;

    playSlap(30, 1);
    playSlap(25, 1);
    playSlap(10, 1);
}

for (0 => int i; i < 3; i++) {
    quater => now;

    playSlap(-1, 1);
    playSlap(13, 1);
    playSlap(15, 1);

    half => now;

    playSlap(20, 1);
    playSlap(22, 1);

    quater => now;

    playSlap(13, 1);
    playSlap(15, 1);

    quater => now;

    playSlap(1, 1);

    half => now;

    playSlap(1, 1);


    quater => now;

    playSlap(1, 1);
    playSlap(13, 1);
    playSlap(15, 1);

    quater => now;

    playSlap(27, 1);

    quater => now;

    playSlap(20, 1);

    half => now;

    playSlap(25, 1);
    playSlap(27, 1);

    half => now;

    playSlap(20, 1);
    playSlap(15, 1);


    half => now;

    playSlap(20, 1);
    playSlap(22, 1);

    quater => now;

    playSlap(-4, 1);

    quater => now;

    playSlap(20, 1);

    quater => now;

    playSlap(13, 1);
    playSlap(15, 1);
    playSlap(9, 1);

    quater => now;
    
    playSlap(20, 2);
    playSlap(13, 1);


    quater => now;

    playSlap(-4, 1);
    playSlap(13, 1);
    playSlap(15, 1);

    quater => now;

    playSlap(20, 1);
    playSlap(22, 1);
    playSlap(15, 1);

    quater => now;

    playSlap(18, 1);

    quater => now;

    playSlap(15, 1);

    quater => now;

    playSlap(13, 1);
    playSlap(15, 1);
    playSlap(8, 1);
}

quater => now;

playSlap(-1, 1);
playSlap(13, 1);
playSlap(15, 1);

half => now;

playSlap(20, 1);
playSlap(22, 1);

quater => now;

playSlap(13, 1);
playSlap(15, 1);

quater => now;

playSlap(1, 1);

half => now;

playSlap(1, 1);

quater => now;

playSlap(1, 1);
playSlap(13, 1);
playSlap(15, 1);

quater => now;

playSlap(27, 1);

quater => now;

playSlap(20, 1);

half => now;

playSlap(25, 1);
playSlap(27, 1);

half => now;

playSlap(20, 1);
playSlap(15, 1);
