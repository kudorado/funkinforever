package fmf.songs;

import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import fmf.characters.*;
import Song.SwagSong;

class Incident extends Trueform
{
	var whiteBG:FlxSprite;
	var gfbg:FlxSprite;

	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('trueform/trollge/trollge', 'mods');
		dad.frames = tex;
	}

	override function createDadAnimations()
	{
		var animation = dad.animation;
		animation.addByPrefix('singLEFT', 'TrollgeLeft', 24, false);
		animation.addByPrefix('singRIGHT', 'TrollgeRight', 24, false);
		animation.addByPrefix('singUP', 'TrollgeUp', 24, false);
		animation.addByPrefix('singDOWN', 'TrollgeDown', 24, false);
		animation.addByPrefix('danceLeft', 'TrollgeIdle', 24, false);
		animation.addByPrefix('danceRight', 'TrollgeIdle', 24, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets()
	{
		dad.addOffset('danceLeft', -1, -11);
		dad.addOffset('danceRight', -1, -11);

		dad.addOffset("singUP", 76, -10);
		dad.addOffset("singRIGHT", -133, -10);
		dad.addOffset("singLEFT", -118, -10);
		dad.addOffset("singDOWN", 34, -16);
	}

	override function loadMap()
	{
		super.loadMap();

		playState.defaultCamZoom = 0.9;

		hole = new FlxSprite(-650, 600);
		hole.loadGraphic(Paths.image('trueform/sky/gfshit', 'mods'), true, 512, 512);
		hole.scrollFactor.set(0.9, 0.9);

		hole.animation.add('shit', getArray(5, 16), 16, true);
		hole.animation.play('shit', true);

		
		var bg:FlxSprite = new FlxSprite(-600, 500).loadGraphic(Paths.image('trueform/trollge/bg', 'mods'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.9, 0.9);

		bg.y -= 650;
		playState.add(bg);


		whiteBG = new FlxSprite(-600, -200).makeGraphic(FlxG.width * 2, FlxG.height * 2, FlxColor.WHITE);

		whiteBG.antialiasing = true;
		whiteBG.scrollFactor.set(0.9, 0.9);
		whiteBG.alpha = 0;


		bg.y -= 250;

		gfbg = new FlxSprite(-600, 300).loadGraphic(Paths.image('trueform/trollge/GF', 'mods'));
		gfbg.antialiasing = true;
		gfbg.scrollFactor.set(0.9, 0.9);



		playState.add(bg);
		playState.add(gfbg);
		playState.add(whiteBG);



	}

	override function midSongEventUpdate(curBeat:Int)
	{
		switch(curBeat)
		{
			case 1 | 287 | 660:
				playState.camZooming = true;

				hole.alpha = 0;
				whiteBG.color = FlxColor.BLACK;
				FlxTween.tween(whiteBG, {alpha: 1}, 0.5, {});
				FlxTween.tween(bf, {alpha: 1}, 0.5, {});
				dad.alpha = 0;
				gfbg.alpha = 0;
				playState.defaultCamZoom = 1.1;

			case 32 | 353:

				hole.alpha = 1;
				dad.alpha = 1;
				gfbg.alpha = 1;
				bf.alpha = 0.25;
				whiteBG.alpha = 0;
				playState.defaultCamZoom = 0.9;


			case 97:
				FlxTween.tween(whiteBG, {alpha: 1}, 0.5, {});
				FlxTween.tween(dad, {alpha: 1}, 0.5, {});
				FlxTween.tween(gfbg, {alpha: 1}, 0.5, {});

				bf.alpha = 0;

			case 127:
				bf.alpha = 0.25;
				whiteBG.alpha = 0;
				dad.alpha = 1;
				gfbg.alpha = 1;
	

		}


	}

	override function createCharacters()
	{
		super.createCharacters();
		bf.alpha = 0.25;
		dad.alpha = 1;

		gfbg.flipX = true;
		gfbg.x = dad.x;
		gfbg.y = dad.y;

		hole.x += 125;
		hole.y -= 50;


		gfbg.x += 175;
		gfbg.y += 90;

		// hole.x = gfbg.x;
		// hole.y = gfbg.y;


	}
}