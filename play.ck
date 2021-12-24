me.dir() + "tom.ck" => string tomFileName;
me.dir() + "hi-hat.ck" => string hatFileName;
me.dir() + "ride.ck" => string rideFileName;
me.dir() + "drum.ck" => string drumFileName;
me.dir() + "pluck.ck" => string pluckFileName;
me.dir() + "pluck2.ck" => string pluck2FileName;
me.dir() + "chord.ck" => string chordFileName;
me.dir() + "chord2.ck" => string chord2FileName;
me.dir() + "piano.ck" => string pianoFileName;
me.dir() + "pad1.ck" => string pad1FileName;
me.dir() + "pad2.ck" => string pad2FileName;
me.dir() + "bass.ck" => string bassFileName;
me.dir() + "saw_lead.ck" => string sawFileName;
me.dir() + "main_lead.ck" => string mainFileName;
me.dir() + "greyscale_lead.ck" => string greyscaleFileName;
me.dir() + "slap.ck" => string slapFileName;
me.dir() + "clap.ck" => string clapFileName;
me.dir() + "roll.ck" => string rollFileName;
me.dir() + "fx.ck" => string fxFileName;

21512::samp => dur beat;
21512::samp / 2 => dur half;
21512::samp / 4 => dur quater;

Machine.add(pluckFileName) => int pluckId;
Machine.add(pad1FileName) => int pad1Id;
Machine.add(pad2FileName) => int pad2Id;

beat * 28 => now;

Machine.add(tomFileName) => int tomId;

beat * 4 => now;

Machine.remove(tomId);
Machine.add(pianoFileName) => int pianoId;
Machine.add(chordFileName) => int chordId;
Machine.add(bassFileName) => int bassId;
Machine.add(fxFileName) => int fxId;

beat * 15 => now;

Machine.remove(bassId);

beat * 1 => now;

Machine.add(bassFileName) => bassId;

beat * 15 => now;

Machine.remove(bassId);

beat * 1 => now;

Machine.add(hatFileName) => int hatId;
Machine.add(sawFileName) => int sawId;
Machine.add(chord2FileName) => int chord2Id;
Machine.add(bassFileName) => bassId;

beat * 15 => now;

Machine.remove(bassId);

beat * 1 => now;

Machine.add(bassFileName) => bassId;

beat * 8 => now;

Machine.add(greyscaleFileName) => int greyscaleId;

beat * 4 => now;

Machine.remove(hatId);
Machine.add(rideFileName) => int rideId;

beat * 4 => now;

Machine.remove(rideId);

Machine.add(drumFileName) => int drumId;
Machine.add(slapFileName) => int slapId;
Machine.add(pluck2FileName) => int pluck2Id;

beat * 60 => now; 

Machine.add(rideFileName) => rideId;
Machine.remove(drumId);

beat * 4 => now;

Machine.remove(rideId);
Machine.add(drumFileName) => drumId;

beat * 32 => now;

Machine.add(hatFileName) => hatId;

beat * 31 => now;

Machine.remove(hatId);

beat * 1 => now;

beat * 28 => now;

Machine.add(tomFileName) => tomId;

beat * 4 => now;

Machine.remove(tomId);
Machine.remove(sawId);
Machine.add(rollFileName) => int rollId;
Machine.add(clapFileName) => int clapId;
Machine.add(mainFileName) => int mainId;
beat * 28 => now;

Machine.add(rideFileName) => rideId;
beat * 4 => now;
Machine.remove(rollId);
Machine.remove(clapId);
Machine.remove(rideId);
Machine.add(hatFileName) => hatId;
Machine.add(drumFileName) => drumId;
Machine.add(pluck2FileName) => pluck2Id;

beat * 32 => now;
beat * 24 => now;

half => now;
Machine.remove(drumId);
half => now;

beat * 3 => now;
Machine.remove(hatId);

Machine.add(drumFileName) => drumId;
half => now;
Machine.remove(drumId);
half => now;

beat * 3 => now;

Machine.remove(mainId);

beat * 32 => now;

Machine.add(rollFileName) => rollId;
Machine.add(sawFileName) => sawId;
beat * 28 => now;

beat * 4 => now;
Machine.remove(rollId);
Machine.remove(sawId);

beat * 4 => now;

Machine.add(hatFileName) => hatId;

beat * 4 * 4 => now;

Machine.add(drumFileName) => drumId;

beat * 4 * 4 => now;

Machine.remove(drumId);
Machine.add(drumFileName) => drumId;
Machine.add(mainFileName) => mainId;

beat * 4 * 4 => now;

Machine.remove(drumId);
Machine.add(drumFileName) => drumId;

beat * 3 * 4 => now;

Machine.remove(drumId);
Machine.remove(hatId);

beat * 4 => now;

Machine.remove(mainId);