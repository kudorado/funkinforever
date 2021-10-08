package fmf.songs;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import fmf.characters.*;
import Song.SwagSong;

class Eeeeaaaooo extends Trueform
{
	var halloweenBG:FlxSprite;

	var lightningStrikeBeat:Int = 0;
	var lightningOffset:Int = 8;

	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('trueform/lila/GF', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
		super.loadMap();

		hole = new FlxSprite(-650, 600);
		hole.loadGraphic(Paths.image('trueform/lila/gfshit', 'mods'), true, 512, 512);
		hole.scrollFactor.set(0.9, 0.9);

		hole.animation.add('shit', getArray(0, 16), 16, true);
		hole.animation.play('shit', true);

		
		var hallowTex = Paths.getSparrowAtlas('trueform/lila/halloween_bg', 'mods');
		halloweenBG = new FlxSprite(350, 400);
		halloweenBG.setGraphicSize(Std.int(halloweenBG.width * 1.5));
		halloweenBG.frames = hallowTex;
		halloweenBG.animation.addByPrefix('idle', 'halloweem bg0' );
		halloweenBG.animation.addByPrefix('lightning', 'halloweem bg lightning strike', 24, false);
		halloweenBG.animation.play('idle');
		halloweenBG.antialiasing = true;
		halloweenBG.scale.y = 4.5;
		halloweenBG.scale.x = 4.5;
		halloweenBG.scrollFactor.set(0.9, 0.9);
		halloweenBG.y -= 125;
		halloweenBG.x += 350;

		playState.add(halloweenBG);
		
	}

	override function midSongEventUpdate(curBeat:Int):Void
	{
		if (FlxG.random.bool(10) && curBeat > lightningStrikeBeat + lightningOffset)
		{
			if (FlxG.save.data.distractions)
			{
				lightningStrikeShit(curBeat);
			}
		}
	}

	function lightningStrikeShit(curBeat:Int):Void
	{
		FlxG.sound.play(Paths.soundRandom('thunder_', 1, 2));
		halloweenBG.animation.play('lightning');

		lightningStrikeBeat = curBeat;
		lightningOffset = FlxG.random.int(8, 24);

		dad.playAnimForce('scared', 0.1);
		bf.playAnimForce('scared', 0.5);

		var mul = FlxG.random.int(-35, 35);

		dad.x += mul; 
		hole.x += mul;


	}
}