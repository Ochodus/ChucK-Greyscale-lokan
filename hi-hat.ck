SndBuf hat => dac;

me.dir() + "Hi-Hat.wav" => string hatfilename;

hatfilename => hat.read;

hat.samples() -1 => hat.pos;

21512::samp => dur beat;
beat / 4 => dur quater;
quater / 3 => dur quater_triple;

0.25 => hat.gain;

fun void hi_hat(int bars) {
    for (0 => int i; i < bars; i++) {
        for (0 => int j; j < 4; j++) {
            0 => hat.pos;
            beat => now;
        }
    }
}

while(true) {
    hi_hat(8);
}