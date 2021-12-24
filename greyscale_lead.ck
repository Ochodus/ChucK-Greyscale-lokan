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
0.3 => rev.mix;
4000 => filter.freq;
0.4 => filter.Q;
0.25 => osc.gain;

fun void playLead(int key, int length) {
    0.25 => osc.gain;
    Std.mtof(key + offset) => osc.freq;
    1 => env.keyOn;
    length * half => now;
    0 => osc.gain;
}

playLead(22, 7);
playLead(18, 7);