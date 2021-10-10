package fmf.songs;

import fmf.characters.*;
import Song.SwagSong;

class Tutorial extends SongPlayer
{
	override function createCharacters():Void
	{
		super.createCharacters();
		
		gf.alpha = 0;
		dad.scrollFactor.set(0.95, 0.95);
	}

	override function getDadVersion():Character
	{
		return new GF(100, 100);
	}
	override function midSongEventUpdate(curBeat:Int):Void
	{
		if (curBeat % 2 == 1 && dad.animOffsets.exists('danceLeft'))
			dad.playAnim('danceLeft');
		if (curBeat % 2 == 0 && dad.animOffsets.exists('danceRight'))
			dad.playAnim('danceRight');

		if (curBeat % 16 == 15  && curBeat > 16 && curBeat < 48)
		{
			bf.hey();
			dad.playAnimForce('cheer', 0.35);
		}
	}
}