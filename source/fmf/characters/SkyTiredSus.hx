package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class SkyTiredSus extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/skytired/sky_tired', "mods");
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Sky annoyed idle', 24, false);
		
		animation.addByPrefix('singUP', 'Sky annoyed up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Sky annoyed right0', 24, false);
		animation.addByPrefix('singDOWN', 'Sky annoyed down0', 24, false);
		animation.addByPrefix('singLEFT', 'Sky annoyed left0', 24, false);

		animation.addByPrefix('singUPmiss', 'Sky annoyed up MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Sky annoyed right MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Sky annoyed down MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Sky annoyed left MISS0', 1, false);

	}

	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, 0);

		addOffset("singUP", -18, 0);
		addOffset("singRIGHT", -49, 0);
		addOffset("singLEFT", 25, 0);
		addOffset("singDOWN", -33, 0);

		addOffset("singUPmiss", -18, 0);
		addOffset("singRIGHTmiss", -49, 0);
		addOffset("singLEFTmiss", 25, 0);
		addOffset("singDOWNmiss", -33, 0);

		playAnim('idle');

		flipX = false;

	}
	

}
