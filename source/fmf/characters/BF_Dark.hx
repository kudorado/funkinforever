package fmf.characters;
import state.*;
import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class BF_Dark extends Boyfriend
{

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/tailsexe/bf_dark', 'mods');

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
        animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
        animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
        animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
        animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
        animation.addByPrefix('hey', 'BF HEY', 24, false);
        animation.addByPrefix('scared', 'BF idle shaking', 24);

	}

	// // create animation offset for BF
	// public override function createAnimationOffsets():Void
	// {
	
	// 	addOffset('idle', -6, -1);
	// 	addOffset("singUP", -56, 30);
	// 	addOffset("singRIGHT", 1, -8);
	// 	addOffset("singLEFT", -50, -9);
	// 	addOffset("singDOWN", -18, -53);

	// 	addOffset("singUPmiss", -41, 25);
	// 	addOffset("singRIGHTmiss", -45, 18);
	// 	addOffset("singLEFTmiss", -2, 14);
	// 	addOffset("singDOWNmiss", -10, -26);
	// 	addOffset("hey", -6, 3);
	// 	addOffset('scared', -7, -1);

	// 	playAnim('idle');
	// 	flipX = false;


	// }
	
}
