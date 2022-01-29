package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class Hex extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/hex/hex', "mods");
		var tex2 = Paths.getSparrowAtlas('pc/hex/hex_miss', 'mods');

		for (frame in tex2.frames)
		{
			tex.pushFrame(frame);
		}

		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', "Dad idle dance", 24, false);
		animation.addByPrefix('singUP', "Dad Sing Note UP0", 24, false);
		animation.addByPrefix('singDOWN', "Dad Sing Note DOWN0", 24, false);
		animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT0', 24, false);
		animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT0', 24, false);
		animation.addByPrefix('jump', 'Dad Jump0', 24, false);


		animation.addByPrefix('singUPmiss', 'Dad Miss Note sussy UP MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Dad Miss Note sussy LEFT MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Dad Miss Note sussy RIGHT MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Dad Miss Note sussy DOWN MISS0', 1, false);	
	}

	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -5, 28);
		addOffset('jump', -15, 250);

		addOffset("singUP", -48, 67);
		addOffset("singRIGHT", 36, 48);
		addOffset("singLEFT", -58, 27);
		addOffset("singDOWN", -15, -4);

		addOffset("singUPmiss", -21, 79);
		addOffset("singRIGHTmiss", -16, 54);
		addOffset("singLEFTmiss", -16, 38);
		addOffset("singDOWNmiss", -2, -3);

		playAnim('idle');

		flipX = true;

	}
	

}
