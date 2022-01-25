package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class ExGF extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/exgf/exGF', "mods");
		frames = tex;
	
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', "Mom Idle", 24, false);
		animation.addByPrefix('singUP', "Mom Up Pose0", 24, false);
		animation.addByPrefix('singDOWN', "MOM DOWN POSE0", 24, false);
		animation.addByPrefix('singLEFT', 'Mom Left Pose0', 24, false);
		animation.addByPrefix('singRIGHT', 'Mom Pose Left0', 24, false);

		animation.addByPrefix('singUPmiss', 'Mom Up Pose MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Mom DOWN Left MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss',  'Mom Right Pose MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Mom Pose Left MISS0', 1, false);
		
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -24, 104);
		
		addOffset("singUP", -32, 104);
		addOffset("singRIGHT", 10, 104);
		addOffset("singLEFT", -44, 102);
		addOffset("singDOWN", -14, 104);

		addOffset("singUPmiss", -32, 104);
		addOffset("singRIGHTmiss", 10, 104);
		addOffset("singLEFTmiss", -44, 102);
		addOffset("singDOWNmiss", -14, 104);

		playAnim('idle');
		flipX = true;

	}
	

}
