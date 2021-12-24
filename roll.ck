SndBuf roll => dac;

me.dir() + "Snare_roll.wav" => string rollfilename;
rollfilename => roll.read;

roll.samples() -1 => roll.pos;

21512::samp => dur beat;
beat / 2 => dur half;
beat / 4 => dur quater;
beat / 8 => dur eighth;

0.25 => roll.gain;

fun void rollSnare(int times, dur length) {
    for(0 => int i; i < times; i++) {
        0 => roll.pos;
        length => now;
        roll.samples() -1 => roll.pos;
    }
}

fun void waveVelocity(int times, dur length) {
    0.3 => float gain;
    for(0 => int i; i < times; i++) {
        if (i < times/2) {
            gain - 0.05 / (times/2) => gain;
        }
        else {
            gain + 0.05 / (times/2) => gain;
        }
        gain => roll.gain;
        length => now;
    }
}

rollSnare(16, beat);
rollSnare(16, half);
rollSnare(16, quater);

spork ~ waveVelocity(24, eighth);

rollSnare(24, eighth);

beat => now;