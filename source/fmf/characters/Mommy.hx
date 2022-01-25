package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class Mommy extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/mom/mom', "mods");

		var tex2 = Paths.getSparrowAtlas('pc/mom/mom_miss', 'mods');

		for (frame in tex2.frames){
			tex.pushFrame(frame);
		}

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


		animation.addByPrefix('singUPmiss', 'Mom Up Pose miss', 1, false);
		animation.addByPrefix('singLEFTmiss',  'Mom Right Pose miss', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Mom Pose Left miss', 1, false);
		animation.addByPrefix('singDOWNmiss', 'MOM DOWN POSE miss', 1, false);

	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -24, 104);
		addOffset("singUP", -11, 172);
		addOffset("singRIGHT", 114, 43);
		addOffset("singLEFT", 114, 76);
		addOffset("singDOWN", -16, -71);

		addOffset("singUPmiss", -11, 172);
		addOffset("singRIGHTmiss", 114, 43);
		addOffset("singLEFTmiss", 114, 76);
		addOffset("singDOWNmiss", -16, -71);

		playAnim('idle');
		flipX = true;

	}
	

}
