package fmf.songs;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import fmf.characters.*;
import Song.SwagSong;

class TargetPractice extends Trueform
{


	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('trueform/matt/GF', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
		super.loadMap();

		playState.defaultCamZoom = 0.9;

		var bg:FlxSprite = new FlxSprite(-600, -300).loadGraphic(Paths.image('trueform/matt/arenanightbg', 'mods'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.9, 0.9);

		playState.add(bg);

		hole = new FlxSprite(-650, 600);
		hole.loadGraphic(Paths.image('trueform/lila/gfshit', 'mods'), true, 512, 512);
		hole.scrollFactor.set(0.9, 0.9);

		hole.animation.add('shit', getArray(0, 16), 16, true);
		hole.animation.play('shit', true);

	}

	override function createCharacters()
	{
		super.createCharacters();
		bf.alpha = 0.9;
		dad.alpha = 0.9;
	}
}