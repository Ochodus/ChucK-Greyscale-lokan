SinOsc osc[2];
ADSR env[2];
NRev rev[2];
LPF filter[2];

21512::samp => dur beat;
21512::samp / 2 => dur half;
21512::samp / 4 => dur quater;

60 => int offset;

for (0 => int i; i < osc.cap(); i++) {
    osc[i] => env[i] => rev[i] => filter[i] => dac;
    (quater/8, quater * 1.1, 0.02, quater * 1.5) => env[i].set;
    0.2 => rev[i].mix;
    2000 => filter[i].freq;
    1.5 => filter[i].Q;
    0.3 / osc.cap() => osc[i].gain;
}

fun void playOctave(int key, int length) {
    0.3 / osc.cap() => osc[0].gain;
    0.3 / osc.cap() => osc[1].gain;
    Std.mtof(key + offset) => osc[0].freq;
    Std.mtof(key + offset + 12) => osc[1].freq;
    1 => env[0].keyOn;
    1 => env[1].keyOn;
    length * quater => now;
    0 => osc[0].gain;
    0 => osc[1].gain;
}

playOctave(15, 14);
playOctave(8, 14);
playOctave(6, 2);
playOctave(13, 2);
playOctave(18, 6);
playOctave(17, 6);
playOctave(13, 2);
playOctave(10, 18);

playOctave(15, 14);
playOctave(8, 13);
playOctave(6, 3);
playOctave(13, 2);
playOctave(18, 6);
playOctave(17, 6);
playOctave(13, 2);
playOctave(22, 8);
playOctave(20, 6);
playOctave(17, 4);

playOctave(15, 14);
playOctave(8, 14);
playOctave(6, 2);
playOctave(13, 2);
playOctave(18, 6);
playOctave(17, 6);
playOctave(13, 2);
playOctave(10, 18);

playOctave(15, 14);
playOctave(8, 13);
playOctave(6, 3);
playOctave(13, 2);
playOctave(18, 6);
playOctave(17, 6);
playOctave(13, 2);
playOctave(22, 14);

beat => now;
beat * 26 => now;

playOctave(5, 3);
playOctave(6, 3);
playOctave(8, 2);
playOctave(10, 3);
playOctave(8, 3);
playOctave(13, 8);

half => now;
beat * 24 => now;

playOctave(18, 6);
playOctave(17, 6);
playOctave(13, 4);
playOctave(22, 6);
playOctave(20, 5);