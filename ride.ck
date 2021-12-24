SndBuf ride => dac;
SndBuf snare => dac;

me.dir() + "ride.wav" => string ridefilename;
me.dir() + "snare.wav" => string snarefilename;

ridefilename => ride.read;
snarefilename => snare.read;

ride.samples() -1 => ride.pos;
snare.samples() -1 => snare.pos;

21512::samp => dur beat;
beat / 4 => dur quater;
quater / 3 => dur quater_triple;

0.25 => ride.gain;
0.4 => snare.gain;

fun void playRide(int bars) {
    for (0 => int i; i < bars; i++) {
        for (0 => int j; j < 4; j++) {
            0 => ride.pos;
            if (j == 3) {
                0 => snare.pos;
            }
            beat => now;
        }
    }
}

playRide(1);