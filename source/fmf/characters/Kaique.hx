package fmf.characters;

import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

import fmf.songs.KaiqueClown;

using StringTools;

class Kaique extends TikyMask
{
	private var defaultCamZoom:Float;

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/kaique/kaique', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		defaultCamZoom = playState.defaultCamZoom;

		animation.addByPrefix('idle', 'BF idle dance', 24, false);
		animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
		animation.addByPrefix('singRIGHT', 'BF NOTE LEFT0', 24, false);
		animation.addByPrefix('singLEFT', 'BF NOTE RIGHT0', 24, false);
		animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
		animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
		animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
		animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
		animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
		animation.addByPrefix('hey', 'BF HEY', 24, false);
		animation.addByPrefix('scared', 'BF idle shaking', 24);

		heyable = true;
	}
	
	override function noteEventBF(noteData:Note)
	{
		if (FlxG.random.bool(35) && !clown.spookyRendered && !noteData.isSustainNote) // create spooky text :flushed:
			clown.noteEvent(noteData, x, y);

		playState.shakeMinimal();


		if(playState.curBeat % 6 == 0)
			PlayState.songPlayer.gf.playAnimForce("cheer", 0.1);

		super.noteEventBF(noteData);
		
	}

	override function noteEventDad(noteData:Note)
	{
		if (playState.bfTurn)
			return;

		playState.defaultCamZoom = defaultCamZoom;

		super.noteEventDad(noteData);
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -6, -1);
		addOffset("singUP", -17, -2);
		addOffset("singRIGHT", -17, -1);
		addOffset("singLEFT", -4, 0);
		addOffset("singDOWN", -7, -3);

		addOffset("singUPmiss", -17, -2);
		addOffset("singRIGHTmiss", -17, -1);
		addOffset("singLEFTmiss", -4, 0);
		addOffset("singDOWNmiss", -7, -3);

		addOffset("hey", -6, -1);
		addOffset('scared', -6, -1);

		playAnim('idle');
		flipX = true;

		// i dunno why i should do this, LOl
		dance();
		flipX = !flipX;

		// Doesn't flip for BF, since his are already in the right place???		{
		var oldRight = animation.getByName('singRIGHT').frames;
		animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
		animation.getByName('singLEFT').frames = oldRight;

		// IF THEY HAVE MISS ANIMATIONS??
		if (animation.getByName('singRIGHTmiss') != null)
		{
			var oldMiss = animation.getByName('singRIGHTmiss').frames;
			animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
			animation.getByName('singLEFTmiss').frames = oldMiss;
		}

		this.scale.x = 0.25;
		this.scale.y = 0.25;

		clown = new KaiqueClown();
		clown.createStaticBG();
	}


}
