SinOsc osc[5];
SawOsc osc2[5];
ADSR env[5];
ADSR env2[5];
NRev rev[5];
NRev rev2[5];
LPF filter[5];
LPF filter2[5];

21512::samp => dur beat;
21512::samp / 4 => dur quater;

60 => int offset;

for (0 => int i; i < osc.cap(); i++) {
    osc[i] => env[i] => rev[i] => filter[i] => dac;
    osc2[i] => env2[i] => rev2[i] => filter2[i] => dac;
    (quater/4, quater, 0.9, quater/8) => env[i].set;
    (quater/4, quater, 0.9, quater/8) => env2[i].set;
    0.3 => rev[i].mix;
    0.15 => rev2[i].mix;
    5000 => filter[i].freq;
    3000 => filter2[i].freq;
    0.5 => filter[i].Q;
    1 => filter2[i].Q;
    0.15 / osc.cap() => osc[i].gain;
    0.15 / osc2.cap() => osc2[i].gain;
}

[-6, -4, 1, -6, -4] @=> int chord1[];
[-13, -1, 1, 3, -13] @=> int chord2[];
[-11, -4, 1, 5, -13] @=> int chord3[];
[-16, -4, 1, 6, -13] @=> int chord4[];

[-13, -1, 1, 3, 10] @=> int chord5[];
[-11, -4, 1, 5, 8] @=> int chord6[];
[-16, -4, 1, 3, 13] @=> int chord7[];

fun void playChord(int chord[], int length) {
    for(0 => int i; i < chord.cap(); i++) {
        0.15 / osc.cap() => osc[i].gain;
        0.15 / osc2.cap() => osc2[i].gain;
        Std.mtof(chord[i] + offset) => osc[i].freq;
        Std.mtof(chord[i] + offset) => osc2[i].freq;
        1 => env[i].keyOn;
        1 => env2[i].keyOn;
    }

    length * beat => now;

    for(0 => int i; i < chord.cap(); i++) {
        0 => osc[i].gain;
        0 => osc2[i].gain;
    }
}

fun void increaseGain() {
    0.0000 => float gain1;
    0.0000 => float gain2;
    for (0 => int i; i < 96; i++) {
        gain1 + 0.0003 => gain1;
        gain2 + 0.00010 => gain2;
        for (0 => int j; j < osc.cap(); j++) {
            gain1 => osc[j].gain;
            gain2 => osc2[j].gain;
        }
        (64 * beat) / (96 * 2) => now;
    }
}

spork ~ increaseGain();

playChord(chord1, 16);
playChord(chord1, 16);

playChord(chord2, 6);
playChord(chord3, 2);
playChord(chord4, 8);
playChord(chord5, 6);
playChord(chord6, 2);
playChord(chord7, 8);

playChord(chord2, 6);
playChord(chord3, 2);
playChord(chord4, 8);
playChord(chord5, 6);
playChord(chord6, 2);
playChord(chord7, 8);

4 * 32 * beat => now;

playChord(chord2, 6);
playChord(chord3, 2);
playChord(chord4, 8);
playChord(chord5, 6);
playChord(chord6, 2);
playChord(chord7, 8);

playChord(chord2, 6);
playChord(chord3, 2);
playChord(chord4, 8);
playChord(chord5, 6);
playChord(chord6, 2);
playChord(chord7, 8);