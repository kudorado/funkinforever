package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class MonikaSus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc/monika/monika', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Angry Senpai Idle instance 10', 24, false);

		animation.addByPrefix('singUP', 'Angry Senpai UP NOTE instance 10', 24, false);
		animation.addByPrefix('singDOWN', 'Angry Senpai DOWN NOTE instance 10', 24, false);
		animation.addByPrefix('singLEFT', 'Angry Senpai LEFT NOTE instance 10', 24, false);
		animation.addByPrefix('singRIGHT', 'Angry Senpai RIGHT NOTE instance 10', 24, false);

		animation.addByPrefix('singUPmiss', 'Green Senpai UP NOTE instance 10', 24, false);
		animation.addByPrefix('singDOWNmiss', 'Green Senpai DOWN NOTE instance 10', 24, false);
		animation.addByPrefix('singLEFTmiss', 'Green Senpai LEFT NOTE instance 10', 24, false);
		animation.addByPrefix('singRIGHTmiss', 'Green Senpai RIGHT NOTE instance 10', 24, false);

		dance();
	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, 0);

		addOffset("singUP", -48, 3);
		addOffset("singRIGHT", -3, -17);
		addOffset("singLEFT", -8, -8);
		addOffset("singDOWN", -33, -35);

		addOffset("singUPmiss", -49, -3);
		addOffset("singRIGHTmiss", -1, -18);
		addOffset("singLEFTmiss", -7, -10);
		addOffset("singDOWNmiss", -12, -37);

		this.scale.x = 4;
		this.scale.y = 4;
	
		flipX = false;
	}
	

}
