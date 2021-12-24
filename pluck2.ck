SndBuf pluck => dac;
SndBuf chunckpad => dac;
SndBuf arp => dac;
SndBuf ghost => dac;
SndBuf ambience => dac;
SndBuf voc => dac;

me.dir() + "Pluck.wav" => string pluckfilename;
me.dir() + "Chunck_Pad.wav" => string chunckpadfilename;
me.dir() + "Arp.wav" => string arpfilename;
me.dir() + "Ghost.wav" => string ghostfilename;
me.dir() + "Ambience.wav" => string ambiencefilename;
me.dir() + "Voc.wav" => string vocfilename;

pluckfilename => pluck.read;
chunckpadfilename => chunckpad.read;
arpfilename => arp.read;
ghostfilename => ghost.read;
ambiencefilename => ambience.read;
vocfilename => voc.read;

0.25 => pluck.gain;
0.25 => chunckpad.gain;
0.25 => arp.gain;
0.25 => ghost.gain;
0.25 => ambience.gain;
0.25 => voc.gain;

21512::samp => dur beat;
beat / 4 => dur quater;
beat / 2 => dur half;

pluck.samples() -1 => pluck.pos;
chunckpad.samples() -1 => chunckpad.pos;
arp.samples() -1 => arp.pos;
ghost.samples() -1 => ghost.pos;
ambience.samples() -1 => ambience.pos;
voc.samples() -1 => voc.pos;

for (0 => int i; i < 2; i++) {
    0 => pluck.pos;
    0 => chunckpad.pos;

    beat * 6 => now;
    0 => arp.pos;
    beat => now;
    0 => ambience.pos;
    beat => now;
    ambience.samples() -1 => ambience.pos;
    arp.samples() -1 => arp.pos;

    beat * 7 => now;
    half => now;
    0 => voc.pos;
    half => now;
    voc.samples() -1 => voc.pos;

    beat * 6 => now;
    0 => arp.pos;
    beat * 2 => now;
    arp.samples() -1 => arp.pos;

    beat * 5 => now;
    half => now;
    0 => ghost.pos;
    half * 3 => now;
    ghost.samples() -1 => ghost.pos;

    half => now;
    0 => voc.pos;
    half => now;
    voc.samples() -1 => voc.pos;

    pluck.samples() -1 => pluck.pos;
    chunckpad.samples() -1 => chunckpad.pos;
}


