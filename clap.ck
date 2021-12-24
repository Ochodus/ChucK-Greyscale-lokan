SndBuf clap => dac;

me.dir() + "Clap.wav" => string clapfilename;
clapfilename => clap.read;

clap.samples() -1 => clap.pos;

21512::samp => dur beat;
beat / 2 => dur half;
beat / 4 => dur quater;
beat / 8 => dur eighth;

0.25 => clap.gain;

fun void clapping(int times, dur length) {
    for(0 => int i; i < times; i++) {
        0 => clap.pos;
        length => now;
        clap.samples() -1 => clap.pos;
    }
}

clapping(16, beat);
clapping(15, beat);

beat => now;