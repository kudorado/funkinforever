package fmf.characters;
import state.*;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class MikuSus extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/miku/miku', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	
	{
		animation.addByPrefix('idle', 'BF idle dance', 24, false);
		animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
		animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
		animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
		animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);


		animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 48, false);
		animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 48, false);
		animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 48, false);
		animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 48, false);
		animation.addByPrefix('hey', 'BF HEY', 24, false);
		animation.addByPrefix('scared', 'BF idle shaking', 24);

		heyable = true;
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -5, -2);
		addOffset("singUP", -17, -1);
		addOffset("singRIGHT", -33, -2);
		addOffset("singLEFT", 38, -1);
		addOffset("singDOWN", 14, -1);
		
		addOffset("singUPmiss", -17, -1);
		addOffset("singRIGHTmiss", -33, -1);
		addOffset("singLEFTmiss", 39, -1);
		addOffset("singDOWNmiss", 15, 1);

		addOffset("hey", 9, 0);
		addOffset('scared', -4, -2);

		playAnim('idle');
		flipX = false;

	}
	

}
