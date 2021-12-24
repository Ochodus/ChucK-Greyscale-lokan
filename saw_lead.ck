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

3 * half => now;

playLead(3, 8);
playLead(8, 2);
playLead(10, 1);
playLead(13, 1);
playLead(10, 13);

beat => now;

playLead(13, 1);
playLead(15, 8);
playLead(13, 4);
playLead(18, 3);
playLead(17, 1);
playLead(13, 8);
playLead(15, 7);

beat => now;

beat * 56 => now;
beat * 2 => now;

playLead(3, 1.5);
playLead(6, 1.5);
playLead(8, 1);
playLead(10, 1.5);
playLead(8, 1.5);
playLead(3, 5);

beat * 96 => now;