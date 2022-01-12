package fmf.characters;
import state.*;
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
		defaultCamZoom = gamePlayState.defaultCamZoom;

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

		gamePlayState.shakeMinimal();


		if(gamePlayState.curBeat % 6 == 0)
			GamePlayState.songPlayer.gf.playAnimForce("cheer", 0.1);

		super.noteEventBF(noteData);
		
	}

	override function noteEventDad(noteData:Note)
	{
		if (gamePlayState.bfTurn)
			return;

		gamePlayState.defaultCamZoom = defaultCamZoom;

		super.noteEventDad(noteData);
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -6, -1);
		addOffset("singUP", -18, -2);
		addOffset("singRIGHT", -4, -2);
		addOffset("singLEFT", -17, -3);
		addOffset("singDOWN", -8, -3);

		addOffset("singUPmiss", -18, -3);
		addOffset("singRIGHTmiss", -18, -3);
		addOffset("singLEFTmiss", -4, -2);
		addOffset("singDOWNmiss", -7, -3);

		addOffset("hey", -6, -2);
		addOffset('scared', -7, -2);

		playAnim('idle');
		flipX = false;

	
		this.scale.x = 0.25;
		this.scale.y = 0.25;

		clown = new KaiqueClown();
		clown.createStaticBG();
	}


}
