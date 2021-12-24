SawOsc osc[5];
SqrOsc osc2[5];
ADSR env[5];
ADSR env2[5];
NRev rev[5];
NRev rev2[5];
LPF filter[5];
LPF filter2[5];

21512::samp => dur beat;
21512::samp / 2 => dur half;
21512::samp / 4 => dur quater;

60 => int offset;

for (0 => int i; i < osc.cap(); i++) {
    osc[i] => env[i] => rev[i] => filter[i] => dac;
    osc2[i] => env2[i] => rev2[i] => filter2[i] => dac;
    (quater/4, quater/2, 0.5, quater) => env[i].set;
    (quater/8, quater/4, 0.5, quater/2) => env2[i].set;
    0.2 => rev[i].mix;
    0.1 => rev2[i].mix;
    5000 => filter[i].freq;
    2000 => filter2[i].freq;
    1 => filter[i].Q;
    0.5 => filter2[i].Q;
    0.5 / osc.cap() => osc[i].gain;
    0.5 / osc2.cap() => osc2[i].gain;
}

[-6, -1, 1, 3, -6] @=> int chord1[];
[-4, 1, 3, 5, -4] @=> int chord2[];
[-4, -2, 1, 3, 6] @=> int chord3[];
[-6, -1, 1, 3, 6] @=> int chord4[];
[-4, 1, 3, 5, 8] @=> int chord5[];
[-2, 1, 5, 6, 10] @=> int chord6[];

[-6, -1, 1, 3, -6] @=> int chord7[];
[-4, 1, 3, 5, -4] @=> int chord8[];
[1, 3, 6, 8, 10] @=> int chord9[];
[-9, -6, -2, 1, 3] @=> int chord10[];
[-2, 1, 3, 6, -2] @=> int chord11[];
[-4, 0, 1, 3, 8] @=> int chord12[];

[-2, 1, 5, 6, -2] @=> int chord13[];
[-4, 1, 3, 5, -4] @=> int chord14[];
[-4, 1, 5, -4, 1] @=> int chord15[];
[-4, -2, 0, 3, -4] @=> int chord16[];

[-4, -1, 1, 3, -4] @=> int chord17[];
[-2, 1, 5, 8, -2] @=> int chord18[];
[-9, -2, 1, 6, 10] @=> int chord19[];
[-4, -1, 3, 6, -4] @=> int chord20[];
[-2, 1, 5, 8, 13] @=> int chord21[];
[-9, 3, 6, 10, 15] @=> int chord22[];
[-9, 1, 6, 10, -9] @=> int chord23[];
[-2, 3, 7, 13, -2] @=> int chord24[];

[-4, -1, 3, 6, 10] @=> int chord25[];
[-2, 1, 5, 8, -2] @=> int chord26[];
[-9, 1, 6, 10, -9] @=> int chord27[];
[-11, 1, 3, 5, 8] @=> int chord28[];
[-4, 1, 3, 6, -4] @=> int chord29[];
[-2, 1, 5, 8, -2] @=> int chord30[];
[-9, 3, 6, 10, -9] @=> int chord31[];

[-6, -1, 1, 3, -6] @=> int chord32[];
[-6, -1, 3, 5, -6] @=> int chord33[];
[-4, 1, 5, -4, 1] @=> int chord34[];
[-4, 1, 3, 5, -4] @=> int chord35[];
[-4, -2, 1, 3, 6] @=> int chord36[];

fun void playChord(int chord[], int length) {
    for(0 => int i; i < chord.cap(); i++) {
        0.5 / osc.cap() => osc[i].gain;
        0.5 / osc2.cap() => osc2[i].gain;
        Std.mtof(chord[i] + offset) => osc[i].freq;
        Std.mtof(chord[i] + offset) => osc2[i].freq;
        1 => env[i].keyOn;
        1 => env2[i].keyOn;
    }

    spork ~ decreaseFilter();
    length * quater => now;

    for(0 => int i; i < chord.cap(); i++) {
        0 => osc[i].gain;
        0 => osc2[i].gain;
    }
}

fun void decreaseFilter() {
    for(0.3 => float i; i > 0.02;) {
        for(0 => int j; j < env2.cap(); j++) {
            (quater/4, quater/2, i, quater) => env2[j].set;
            0.05 + i/4 => osc2[j].gain;
        }
        i - 0.01 => i;
        beat / 50 => now;
    }
}

fun void WaveFilter() {
    while(true) {
        for(250 => int i; i < 2500; i++) {
            for (0 => int j; j < filter.cap(); j++) {
                i => filter[j].freq;
            }
            beat / (2250 * 2) => now;
        }
        for(2500 => int i; i > 250; i--) {
            for (0 => int j; j < filter.cap(); j++) {
                i => filter[j].freq;
            }
            beat / (2250 * 2) => now;
        }
    }
}

spork ~ WaveFilter();

for (0 => int i; i < 2; i++) {
    playChord(chord1, 24);
    playChord(chord2, 8);
    playChord(chord3, 32);
    playChord(chord4, 24);
    playChord(chord5, 8);
    playChord(chord6, 28);

    beat => now;
}

for (0 => int i; i < 4; i++) {
    playChord(chord7, 2);

    beat => now;

    playChord(chord7, 1);

    quater => now;
    beat => now;
    half => now;

    playChord(chord8, 2);

    beat => now;
    half => now;

    playChord(chord9, 2);

    beat => now;

    playChord(chord9, 4);
    playChord(chord10, 2);

    beat => now;
    quater => now;

    playChord(chord10, 1);

    beat => now;
    half => now;

    playChord(chord10, 2);

    half => now;
    quater => now;

    playChord(chord11, 1);

    half => now;

    playChord(chord12, 6);

    beat => now;
}

beat * 64 => now;

for (0 => int i; i < 2; i++) {
    playChord(chord1, 24);
    playChord(chord2, 8);
    playChord(chord3, 32);
    playChord(chord4, 24);
    playChord(chord5, 8);
    playChord(chord6, 28);

    beat => now;
}

for (0 => int i; i < 3; i++) {
    playChord(chord7, 2);

    beat => now;

    playChord(chord7, 1);

    quater => now;
    beat => now;
    half => now;

    playChord(chord8, 2);

    beat => now;
    half => now;

    playChord(chord9, 2);

    beat => now;

    playChord(chord9, 4);
    playChord(chord10, 2);

    beat => now;
    quater => now;

    playChord(chord10, 1);

    beat => now;
    half => now;

    playChord(chord10, 2);

    half => now;
    quater => now;

    playChord(chord11, 1);

    half => now;

    playChord(chord12, 6);

    beat => now;
}

playChord(chord7, 2);

beat => now;

playChord(chord7, 1);

quater => now;
beat => now;
half => now;

playChord(chord8, 2);

beat => now;
half => now;

playChord(chord9, 2);

beat => now;

playChord(chord9, 4);

playChord(chord13, 6);
playChord(chord14, 10);
playChord(chord15, 6);
playChord(chord16, 10);

playChord(chord17, 22);
playChord(chord18, 8);
playChord(chord19, 34);

playChord(chord20, 22);
playChord(chord21, 10);
playChord(chord22, 14);
playChord(chord23, 12);
playChord(chord24, 6);

playChord(chord25, 22);
playChord(chord26, 8);
playChord(chord27, 30);
playChord(chord28, 4);

playChord(chord29, 22);
playChord(chord30, 10);
playChord(chord31, 32);

beat * 4 => now;

for (0 => int i; i < 4; i++) {
    playChord(chord32, 14);
    playChord(chord33, 2);

    half => now;

    playChord(chord34, 4);
    playChord(chord35, 10);
    playChord(chord36, 12);

    half => now;

    playChord(chord36, 2);

    half => now;

    playChord(chord36, 4);
    playChord(chord36, 10);
}