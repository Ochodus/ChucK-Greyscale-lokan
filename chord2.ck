SndBuf chord1 => dac;
SndBuf chord2 => dac;
SndBuf chord3 => dac;
SndBuf chord4 => dac;
SndBuf chord5 => dac;

me.dir() + "Chord1.wav" => string chord1filename;
me.dir() + "Chord2.wav" => string chord2filename;
me.dir() + "Chord3.wav" => string chord3filename;
me.dir() + "Chord4.wav" => string chord4filename;
me.dir() + "Chord5.wav" => string chord5filename;

chord1filename => chord1.read;
chord2filename => chord2.read;
chord3filename => chord3.read;
chord4filename => chord4.read;
chord5filename => chord5.read;

0.25 => chord1.gain;
0.25 => chord2.gain;
0.25 => chord3.gain;
0.25 => chord4.gain;
0.25 => chord5.gain;

21512::samp => dur beat;
beat / 4 => dur quater;
beat / 2 => dur half;

chord1.samples() -1 => chord1.pos;
chord2.samples() -1 => chord2.pos;
chord3.samples() -1 => chord3.pos;
chord4.samples() -1 => chord4.pos;
chord5.samples() -1 => chord5.pos;

0 => chord1.pos;
beat * 16 => now;
chord1.samples() -1 => chord1.pos;

0 => chord2.pos;
beat * 12 => now;
chord2.samples() -1 => chord2.pos;

beat * 4 => now;

0 => chord3.pos;

beat * 32 => now;

chord3.samples() -1 => chord3.pos;

0 => chord3.pos;

beat * 32 => now;

chord3.samples() -1 => chord3.pos;

beat * 32 => now;

0 => chord4.pos;

beat * 32 => now;

chord4.samples() -1 => chord4.pos;

0 => chord1.pos;
beat * 16 => now;
chord1.samples() -1 => chord1.pos;

0 => chord2.pos;
beat * 15 => now;
chord2.samples() -1 => chord2.pos;

beat => now;

0 => chord1.pos;
beat * 16 => now;
chord1.samples() -1 => chord1.pos;

0 => chord2.pos;
beat * 15 => now;
chord2.samples() -1 => chord2.pos;

beat => now;

0 => chord3.pos;

beat * 32 => now;

chord3.samples() -1 => chord3.pos;

0 => chord3.pos;

beat * 24 => now;

chord3.samples() -1 => chord3.pos;

beat * 8 => now;

beat * 4 * 16 => now;

beat * 4 => now;

0 => chord5.pos;

beat * 4 * 16 => now;