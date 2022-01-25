package fmf.characters;
import state.*;
import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class WhittyCrazySus extends Boyfriend
{

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/whittycrazy/WhittyCrazy', 'mods');

		var tex2 = Paths.getSparrowAtlas('pc/whittycrazy/WhittyCrazy_miss', 'mods');

		for (frame in tex2.frames)
		{
			tex.pushFrame(frame);
		}

		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Whitty idle dance', 24, false);

		animation.addByPrefix('singUP', 'Whitty Sing Note UP instance 10', 24, false);
		animation.addByPrefix('singRIGHT', 'whitty sing note right instance 10', 24, false);
		animation.addByPrefix('singLEFT', 'Whitty Sing Note LEFT instance 10', 24, false);
		animation.addByPrefix('singDOWN', 'Whitty Sing Note DOWN instance 10', 24, false);

		animation.addByPrefix('singUPmiss', 'Whitty Sing Note UP MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Whitty sing note right MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Whitty Sing Note LEFT MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Whitty Sing Note DOWN MISS0', 1, false);

	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -14, 68);
		addOffset("singUP", 10, 166);
		addOffset("singRIGHT", 150, -25);
		addOffset("singLEFT", 90, 85);
		addOffset("singDOWN", 73, -76);

		addOffset("singUPmiss", 10, 166);
		addOffset("singRIGHTmiss", 150, -25);
		addOffset("singLEFTmiss", 90, 85);
		addOffset("singDOWNmiss", 73, -76);
		
		playAnim('idle');
		flipX = true;

	}
	
}
