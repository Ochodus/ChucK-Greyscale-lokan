SndBuf tom => dac;

me.dir() + "Tom.wav" => string tomfilename;
tomfilename => tom.read;

tom.samples() -1 => tom.pos;

21512::samp => dur beat;
beat / 4 => dur quater;
quater / 3 => dur quater_triple;

0.25 => tom.gain;

fun void dottedTom() {
    for(0 => int i; i < 16; i++) {
        if(i == 7) {
            quater_triple * 2 => now;
            0 => tom.pos;
            quater_triple => now;
            tom.samples() -1 => tom.pos;
        }
        else if(i % 3 == 2 && i >= 8) {
            0 => tom.pos;
            quater => now;
                
        }
        else {
            quater => now;
        }
    }
}

dottedTom();

