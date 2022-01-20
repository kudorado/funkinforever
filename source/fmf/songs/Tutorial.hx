package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import fmf.characters.*;
import Song.SwagSong;

class Tutorial extends SongPlayer
{
	override function createCharacters():Void
	{
		super.createCharacters();
		
		gf.alpha = 0;
		dad.scrollFactor.set(0.95, 0.95);
		gameState.daTutorial = true;
	}

	override function getDadVersion():Character
	{
		return new GFTutorial(100, 100);
	}
	override function midSongEventUpdate(curBeat:Int):Void
	{

		if (curBeat % 16 == 15  && curBeat > 16 && curBeat < 48)
		{
			bf.hey();
			dad.playAnimForce('cheer', 0.35);
		}
	}
}