package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class RuvSus extends Boyfriend
{
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/ruv/ruv', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'BF idle dance', 24, false);
		animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
		animation.addByPrefix('singRIGHT', 'BF NOTE LEFT0', 24, false);
		animation.addByPrefix('singLEFT', 'BF NOTE RIGHT0', 24, false);
		animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);

		animation.addByPrefix('singUPmiss', 'BF NOTE UP miss', 1, false);
		animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT miss', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT miss', 1, false);
		animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN miss', 1, false);
	}

	override function noteEventBF(noteData:Note)
	{
		gameState.shakeNormal();
		GameState.songPlayer.gf.playAnimForce("scared", 0.35);
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -6, 0);
		addOffset("singUP", -56, 0);
		addOffset("singRIGHT", -51, 0);
		addOffset("singLEFT", 1, 0);
		addOffset("singDOWN", -17, 0);

		addOffset("singUPmiss", -48, 0);
		addOffset("singRIGHTmiss", -8, 0);
		addOffset("singLEFTmiss", -48, 0);
		addOffset("singDOWNmiss", -13, 0);

		playAnim('idle');
		flipX = false;

	}
	
}
