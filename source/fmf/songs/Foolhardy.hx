package fmf.songs;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import fmf.characters.*;
import Song.SwagSong;

class Foolhardy extends Trueform
{



	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('trueform/zardy/GF', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
		super.loadMap();

		playState.defaultCamZoom = 0.9;

		hole = new FlxSprite(-650, 600);
		hole.loadGraphic(Paths.image('trueform/zardy/gfshit', 'mods'), true, 512, 512);
		hole.scrollFactor.set(0.9, 0.9);

		hole.animation.add('shit', getArray(5, 16), 16, true);
		hole.animation.play('shit', true);

		
		var hallowTex = Paths.getSparrowAtlas('trueform/zardy/bg', 'mods');
		var bg = new FlxSprite(-200, -100);
		bg.frames = hallowTex;
		bg.animation.addByPrefix('idle', 'Stage0');
		bg.animation.play('idle');
		bg.antialiasing = true;

		bg.scale.x = 2;
		bg.scale.y = 2;

		bg.x += 250;

		bg.y += 200;

		playState.add(bg);

	}

	override function createCharacters()
	{
		super.createCharacters();
		bf.alpha  = 0.75;
		dad.alpha = 0.75;
		bf.y += 100;
	}
}