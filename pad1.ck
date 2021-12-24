SinOsc osc[3];
SinOsc osc2[3];
ADSR env[3];
ADSR env2[3];
NRev rev[3];
NRev rev2[3];
LPF filter[3];
LPF filter2[3];
Delay delay[3];
Delay delay2[3];
Delay delay3[3];

21512::samp => dur beat;
21512::samp / 4 => dur quater;

60 => int offset;

for (0 => int i; i < osc.cap(); i++) {
    osc[i] => env[i] => rev[i] => filter[i] => dac;
    filter[i] => delay[i] => dac;
    osc2[i] => env2[i] => rev2[i] => delay2[i] => filter2[i] => dac;
    filter2[i] => delay3[i] => dac;
    (quater, quater, 0.0, quater) => env[i].set;
    (quater, quater, 0.0, quater) => env2[i].set;
    0.3 => rev[i].mix;
    0.3 => rev2[i].mix;
    5000 => filter[i].freq;
    5000 => filter2[i].freq;
    1 => filter[i].Q;
    1 => filter2[i].Q;
    0.15 / osc.cap() => osc[i].gain;
    0.15 / osc2.cap() => osc2[i].gain;
    beat * 16 => delay[i].max;
    beat * 7 => delay[i].delay;
    beat * 8 => delay2[i].max;
    beat * 3 => delay2[i].delay;
    beat * 16 => delay3[i].max;
    beat * 7 => delay3[i].delay;
}

[3, 8, 10] @=> int chord1[];

fun void playChord(int chord[], int length) {
    for(0 => int i; i < chord.cap(); i++) {
        Std.mtof(chord[i] + offset) => osc[i].freq;
        Std.mtof(chord[i] + offset + 12) => osc2[i].freq;
        1 => env[i].keyOn;
        1 => env2[i].keyOn;
    }

    length * beat => now;
}

fun void increaseGain() {
    0.0000 => float gain1;
    0.0000 => float gain2;
    for (0 => int i; i < 96; i++) {
        gain1 + 0.0002 => gain1;
        gain2 + 0.0004 => gain2;
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
playChord(chord1, 16);
playChord(chord1, 16);
playChord(chord1, 16);
playChord(chord1, 16);