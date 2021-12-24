SndBuf nuke => dac;
SndBuf fpc => dac;
SndBuf crash => dac;
SndBuf cymCrash => dac;
SndBuf down => dac;
SndBuf spin => dac;

me.dir() + "Nuked Kick.wav" => string nukefilename;
me.dir() + "FPC.wav" => string fpcfilename;
me.dir() + "Crash.wav" => string crashfilename;
me.dir() + "Cym Crash.wav" => string cymCrashfilename;
me.dir() + "Down.wav" => string downfilename;
me.dir() + "Spin Down.wav" => string spinfilename;

nukefilename => nuke.read;
fpcfilename => fpc.read;
crashfilename => crash.read;
cymCrashfilename => cymCrash.read;
downfilename => down.read;
spinfilename => spin.read;

nuke.samples() -1 => nuke.pos;
fpc.samples() -1 => fpc.pos;
crash.samples() -1 => crash.pos;
cymCrash.samples() -1 => cymCrash.pos;
down.samples() -1 => down.pos;
spin.samples() -1 => spin.pos;

21512::samp => dur beat;
beat * 4 => dur bar;
beat / 4 => dur quater;

0.25 => nuke.gain;
0.25 => fpc.gain;
0.25 => crash.gain;
0.25 => cymCrash.gain;
0.25 => down.gain;
0.25 => spin.gain;

0 => nuke.pos;

beat => now;

nuke.samples() -1 => nuke.pos;

beat * 3 => now;
bar * 6 => now;

beat * 3 => now;

0 => fpc.pos;

beat => now;

fpc.samples() -1 => fpc.pos;

bar * 3 => now;

beat => now;

0 => crash.pos;

beat * 3 => now;
bar * 3 => now;
beat * 3 => now;

crash.samples() -1 => crash.pos;

beat => now;

bar * 11 => now;

beat * 2 => now;

0 => crash.pos;

beat * 2 => now;
bar * 4 => now;

crash.samples() -1 => crash.pos;

0 => cymCrash.pos;

bar => now;
beat * 2 => now;

cymCrash.samples() -1 => cymCrash.pos;

beat * 2 => now;

bar * 9 => now;

beat => now;

0 => crash.pos;

beat * 3 => now;
bar * 3 => now;
beat * 3 => now;

crash.samples() -1 => crash.pos;

beat => now;

0 => nuke.pos;

beat => now;

nuke.samples() -1 => nuke.pos;

beat * 3 => now;
bar * 7 => now;

0 => down.pos;

bar * 3 => now;
beat * 1 => now;

0 => crash.pos;

beat * 3 => now;
bar * 3 => now;
beat * 3 => now;

crash.samples() -1 => crash.pos;

beat => now;

down.samples() -1 => down.pos;

bar => now;
beat * 2 => now;

cymCrash.samples() -1 => cymCrash.pos;

beat * 2 => now;

bar * 14 => now;

0 => nuke.pos;

beat => now;

nuke.samples() -1 => nuke.pos;

beat * 3 => now;
bar * 14 => now;

0 => spin.pos;

bar * 2 => now;
beat => now;

spin.samples() -1 => spin.pos;

beat * 3 => now;
bar * 10 => now;
beat * 2 => now;

0 => crash.pos;

beat * 2 => now;
bar * 4 => now;

crash.samples() -1 => crash.pos;

