package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class DaddyDearest extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/dad/dad', "mods");
		dad.frames = tex;
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Dad idle dance', 24);
		animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
		animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
		animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
		animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{

		dad.addOffset('iddle');
		dad.addOffset("singUP", -6, 50);
		dad.addOffset("singRIGHT", 0, 27);
		dad.addOffset("singLEFT", -10, 10);
		dad.addOffset("singDOWN", 0, -30);
		dad.dance();

	}

	override function createDad()
	{
        dad = new Dad(0, 125);
		getDadTex();
		createDadAnimations();
		createDadAnimationOffsets();
		dad.dance();

    }

	override function midSongEventUpdate(curBeat:Int):Void
	{
		if (gameState.gfStep())
		{
			if (GameState.CURRENT_SONG == "bopeebo")
			{
				switch (GameState.CURRENT_SONG)
				{
					case 'bopeebo':
						bopeebooMidSongEvent(curBeat);

					case 'fresh':
						freshMidSongEvent(curBeat);
				}
			}
		}
	}

	function bopeebooMidSongEvent(curBeat:Int)
	{
		if (curBeat > 5 && curBeat < 130)
		{
			if (curBeat % 8 == 7)
			{
				gf.playAnimForce('cheer', 0.5);
			}
		}

		if (curBeat % 8 == 7)
		{
			bf.hey();
		}

		switch (curBeat)
		{
			case 128, 129, 130:
				gameState.vocals.volume = 0;
		}
	}

	function freshMidSongEvent(curBeat:Int)
	{
		switch (curBeat)
		{
			case 16:
				gameState.camZooming = true;
				gameState.gfSpeed = 2;

			case 48:
				gameState.gfSpeed = 1;

			case 80:
				gameState.gfSpeed = 2;
				
			case 112:
				gameState.gfSpeed = 1;
		}
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [17, 18], 0, false, false);
		icon.animation.play("dad");
	}

}