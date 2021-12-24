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
0.4 => osc.gain;

fun void playLead(int key, float length) {
    Std.mtof(key + offset) => osc.freq;
    0.4 => osc.gain;
    1 => env.keyOn;
    length * half => now;
    0.0 => osc.gain;
}

for (0 => int i; i < 2; i++) {
    playLead(15, 6);

    half => now;

    playLead(8, 5);
    playLead(5, 1);

    quater => now;

    playLead(6, 0.5);

    half => now;

    playLead(13, 0.5);

    quater => now;

    playLead(18, 3);
    playLead(17, 3);
    playLead(13, 1);
    playLead(8, 7);

    beat => now;

    playLead(15, 6);

    half => now;

    playLead(8, 5);
    playLead(5, 1);

    quater => now;

    playLead(6, 0.5);

    half => now;

    playLead(13, 0.5);

    quater => now;

    playLead(18, 3);
    playLead(17, 3);
    playLead(13, 1);
    playLead(22, 7);

    beat => now;
}

playLead(15, 6);

half => now;

playLead(8, 5);
playLead(5, 1);

quater => now;

playLead(6, 0.5);

half => now;

playLead(13, 0.5);

quater => now;

playLead(18, 3);
playLead(17, 3);
playLead(13, 1);
playLead(8, 7);

beat => now;

playLead(15, 6);

half => now;

playLead(8, 5);
playLead(5, 1);

quater => now;

playLead(6, 0.5);

half => now;

playLead(13, 0.5);

quater => now;

playLead(18, 3);
playLead(17, 3);
playLead(13, 1);
playLead(22, 4);
playLead(20, 3);
playLead(15, 2);