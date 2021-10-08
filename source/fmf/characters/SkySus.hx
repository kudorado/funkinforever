package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class SkySus extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/sky/sky_assets', "mods");
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Sky idle', 24, false);

		animation.addByPrefix('singUP', 'Sky up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Sky right0', 24, false);
		animation.addByPrefix('singDOWN', 'Sky down0', 24, false);
		animation.addByPrefix('singLEFT', 'Sky left0', 24, false);

		animation.addByPrefix('singUPmiss', 'Sky up MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Sky right MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Sky down MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Sky left MISS0', 1, false);

	}

	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, 0);

		addOffset("singUP", -43, 0);
		addOffset("singRIGHT", -17, 0);
		addOffset("singLEFT", -10, 0);
		addOffset("singDOWN", -4, 0);

		addOffset("singUPmiss", -43, 0);
		addOffset("singRIGHTmiss", -17, 0);
		addOffset("singLEFTmiss", -10, 0);
		addOffset("singDOWNmiss", -4, 0);


		playAnim('idle');

		flipX = true;

	}
	

}
