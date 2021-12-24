SndBuf kick => dac;
SndBuf snare => dac;

me.dir() + "kick.wav" => string kickfilename;
me.dir() + "snare.wav" => string snarefilename;

kickfilename => kick.read;
snarefilename => snare.read;

kick.samples() -1 => kick.pos;
snare.samples() -1 => snare.pos;

21512::samp => dur beat;
beat / 4 => dur quater;
quater / 3 => dur quater_triple;

0.25 => kick.gain;
0.4 => snare.gain;

fun void playDrum(int bars) {
    for (0 => int i; i < bars; i++) {
        for (0 => int j; j < 4; j++) {
            0 => kick.pos;
            if (j % 2 == 1) {
                0 => snare.pos;
            }
            beat => now;
        }
    }
}

playDrum(4);
playDrum(4);
playDrum(4);
playDrum(3);