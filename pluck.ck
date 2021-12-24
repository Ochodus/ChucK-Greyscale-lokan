SawOsc osc1 => ADSR env1 => NRev rev1 => LPF filter1 => dac;
SawOsc osc2 => ADSR env2 => NRev rev2 => LPF filter2 => dac;

me.dir() + "drum.ck" => string tomFileName;
me.dir() + "chord.ck" => string chordFileName;

21512::samp => dur beat;
21512::samp / 4 => dur quater;

(quater/4, quater/2, 0.2, quater) => env1.set;
(quater/8, quater/4, 0.2, quater) => env2.set;

0.1 => rev1.mix;
0.1 => rev2.mix;

60 => int offset;

[-7, -6, 5, 6] @=> int arp1[];
[-7, -6, 6, 10] @=> int arp2[];
[-7, -6, 10, 13] @=> int arp3[];

0.01 => float gain1;
0.01 => float gain2;

gain1 => osc1.gain;
gain2 => osc2.gain;

fun void playArp(int arp[]) {
    for(0 => int i; i < 4; i++) {
        Std.mtof(arp[i] + offset) => osc1.freq;
        Std.mtof(arp[i] + offset) => osc2.freq;
        1 => env1.keyOn;
        1 => env2.keyOn;
        quater => now;
    }
}

fun void repeatArp(int times, int arp[], int getInc) {
    for (0 => int i; i < times; i++) {
        playArp(arp);
    }
}

fun void SweepFilter() {
    for(250 => int i; i < 3000; i++) {
        i => filter1.freq;
        i => filter2.freq;
        (64 * beat) / 2750 => now;
    }
}

fun void increaseGain() {
    for (0 => int i; i < 96; i++) {
        gain1 + 0.0002 => gain1;
        gain2 + 0.0004 => gain2;
        gain1 => osc1.gain;
        gain2 => osc2.gain;
        (64 * beat) / (96 * 3) => now;
    }
}

spork ~ SweepFilter();
spork ~ increaseGain();

repeatArp(64, arp1, 1);

repeatArp(4, arp1, 1);
repeatArp(4, arp2, 1);
repeatArp(8, arp3, 1);

repeatArp(4, arp1, 1);
repeatArp(4, arp2, 1);
repeatArp(7, arp3, 1);

beat => now;
32 * 4 * beat => now;

repeatArp(4, arp1, 1);
repeatArp(4, arp2, 1);
repeatArp(8, arp3, 1);

repeatArp(4, arp1, 1);
repeatArp(4, arp2, 1);
repeatArp(7, arp3, 1);

beat => now;

repeatArp(4, arp1, 1);
repeatArp(4, arp2, 1);
repeatArp(8, arp3, 1);

repeatArp(4, arp1, 1);
repeatArp(4, arp2, 1);
repeatArp(7, arp3, 1);

beat => now;