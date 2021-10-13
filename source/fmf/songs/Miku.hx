package fmf.songs;

import fmf.songs.SongPlayer;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class Miku extends SongPlayer
{
	var simp:FlxSprite; 

	override function loadMap()
	{
		playState.defaultCamZoom = 0.8;
		var bg:FlxSprite = new FlxSprite(-275, -300).loadGraphic(Paths.image('bg/miku/stageback', "mods"));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.9, 0.9);

		bg.setGraphicSize(Std.int(bg.width * 1.25));

		bg.active = true;
		playState.add(bg);

		var hallowTex = Paths.getSparrowAtlas('bg/miku/bunch_of_simps', 'mods');
		
		simp = new FlxSprite(-200, 300);
		simp.frames = hallowTex;
		simp.animation.addByPrefix('idle', 'Downer Crowd Bob0');
		simp.animation.play('idle');
		simp.antialiasing = true;

	}

	public override function getDadTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/miku/miku', 'mods');
		dad.frames = tex;
	}

	// create animation for BF
	public override function createDadAnimations():Void
	
	{
		var animation = dad.animation;

		animation.addByPrefix('idle', 'BF idle dance', 24, false);
		animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
		animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
		animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
		animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);

		dad.animation = animation;
	}

	// create animation offset for BF
	public override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -5, -2);
		dad.addOffset("singUP", 7, -1);
		dad.addOffset("singRIGHT", 24, -1);
		dad.addOffset("singLEFT", -57, 0);
		dad.addOffset("singDOWN", -31, 1);

		dad.playAnim('idle');
		dad.flipX = true;

	}

	override function createBF()
	{
		super.createBF();
		bf.y -= 350;
		bf.x += 50;
	}

	override function createDad()
	{
	
		super.createDad();
		dad.x -= 350;
		dad.y -= 400;

	}

	override function createGF()
	{
		super.createGF();
		gf.y -= 400;
	}

	override function createCharacters()
	{
		super.createCharacters();
		playState.add(simp);
	}
}
