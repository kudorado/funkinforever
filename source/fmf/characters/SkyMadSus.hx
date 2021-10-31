package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class SkyMadSus extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/skymad/sky_mad_assets', "mods");
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Sky mad idle', 24, false);

		animation.addByPrefix('singUP', 'Sky mad up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Sky mad right0', 24, false);
		animation.addByPrefix('singDOWN', 'Sky mad down0', 24, false);
		animation.addByPrefix('singLEFT', 'Sky mad left0', 24, false);

		animation.addByPrefix('singUPmiss', 'Sky mad up MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Sky mad right MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Sky mad down MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Sky mad left MISS0', 1, false);

	}

	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, 0);

		addOffset("singUP", 0, 0);
		addOffset("singRIGHT", 0, 0);
		addOffset("singLEFT", 0, 0);
		addOffset("singDOWN", 0, 0);

		addOffset("singUPmiss", 0, 0);
		addOffset("singRIGHTmiss", 0, 0);
		addOffset("singLEFTmiss", 0, 0);
		addOffset("singDOWNmiss", 0, 0);

		playAnim('idle');

		flipX = true;

	}
	

}
