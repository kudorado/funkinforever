package fmf.songs;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import fmf.characters.*;
import Song.SwagSong;

class Run extends Trueform
{

	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('trueform/bob/GF', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{

		playState.defaultCamZoom = 0.9;

		hole = new FlxSprite(-650, 600);
		hole.loadGraphic(Paths.image('trueform/trollge/gfshit', 'mods'), true, 512, 512);
		hole.scrollFactor.set(0.9, 0.9);

		hole.animation.add('shit', getArray(5, 16), 16, true);
		hole.animation.play('shit', true);
		
		var bg:FlxSprite = new FlxSprite(0, -100).loadGraphic(Paths.image('trueform/bob/bg', 'mods'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.9, 0.9);
		bg.scale.x = 1.5;	
		bg.scale.y = 1.5;

		playState.add(bg);

		var bg1:FlxSprite = new FlxSprite(-200, 200).loadGraphic(Paths.image('trueform/bob/fg', 'mods'));
		bg1.antialiasing = true;
		bg1.scrollFactor.set(0.9, 0.9);

		bg1.y -= 250;
		playState.add(bg1);

		var stageFront:FlxSprite = new FlxSprite(-600, -300).loadGraphic(Paths.image('trueform/bob/ground', 'mods'));
		stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
		stageFront.updateHitbox();
		stageFront.antialiasing = true;
		stageFront.scrollFactor.set(0.9, 0.9);
		playState.add(stageFront);

	}

	private override function createDadAnimations()
	{
		var animation = dad.animation;
		animation.addByIndices('singLEFT', 'GF Dancing Beat instance 1', [6], "", 1, false);
		animation.addByIndices('singRIGHT', 'GF Dancing Beat instance 1', [6], "", 1, false);
		animation.addByIndices('singUP', 'GF Dancing Beat instance 1', [6], "", 1, false);
		animation.addByIndices('singDOWN', 'GF Dancing Beat instance 1', [6], "", 1, false);

		animation.addByIndices('danceLeft', 'GF Dancing Beat instance 1', [6], "", 1, false);
		animation.addByIndices('danceRight', 'GF Dancing Beat instance 1', [6], "", 1, false);
		dad.animation = animation;
	}

	// create dad animation offsets
	private override function createDadAnimationOffsets()
	{

		dad.playAnim('danceRight');
		dad.dance();
	}
	
	
	override function midSongEventUpdate(curBeat:Int)
	{
		if (curBeat % playState.gfSpeed == 0 && playState.turn == -1)
		{
			playState.shakeNormal();
		}
	}


	override function createCharacters()
	{
		super.createCharacters();
		bf.alpha = 0.85;
		dad.alpha = 1;

		// create hell bob over dad

		var bob:FlxSprite = new FlxSprite();

		var tex = Paths.getSparrowAtlas('trueform/bob/hellbob_assets', 'mods');
		bob.frames = tex;

		bob.animation.addByPrefix('mad', 'bobismad', 24, true);

		bob.animation.play('mad');

		bob.x = dad.x + 35;
		bob.y = dad.y + 15;
		bob.scale.x = 0.9;
		bob.scale.y = 0.9;

		playState.add(bob);

	}
}