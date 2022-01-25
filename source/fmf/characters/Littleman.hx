package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class Littleman extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/littleman/Small_Guy', 'mods');

		var tex2 = Paths.getSparrowAtlas('pc/littleman/Small_Guy_miss', 'mods');

		for (frame in tex2.frames){
			tex.pushFrame(frame);
		}
		
		frames = tex;
		
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'idle0', 24, false);
		animation.addByPrefix('singUP', 'up0', 24, false);
		animation.addByPrefix('singRIGHT', 'left0', 24, false);
		animation.addByPrefix('singLEFT', 'right0', 24, false);
		animation.addByPrefix('singDOWN', 'down0', 24, false);

		animation.addByPrefix('singUPmiss', 'up_miss', 24, false);
		animation.addByPrefix('singLEFTmiss', 'left_miss', 24, false);
		animation.addByPrefix('singRIGHTmiss', 'right_miss', 24, false);
		animation.addByPrefix('singDOWNmiss', 'down_miss', 24, false);

	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -7, -2);
		addOffset("singUP", -14, 4);
		addOffset("singRIGHT", -13, -3);
		addOffset("singLEFT", -3, -1);
		addOffset("singDOWN", -3, -7);

		addOffset("singUPmiss", -14, 4);
		addOffset("singRIGHTmiss", -3, -2);
		addOffset("singLEFTmiss", -12, -3);
		addOffset("singDOWNmiss", -4, -8);

		playAnim('idle');
		flipX = true;

	
		this.scale.x = 0.85;
		this.scale.y = 0.85;
	}

}
