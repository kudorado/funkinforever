package fmf.characters;
import state.*;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class SkyAngrySus extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/skyangry/sky_angry', "mods");
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Sky annoyed alt idle', 24, false);

		animation.addByPrefix('singUP', 'Sky annoyed alt up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Sky annoyed alt right0', 24, false);
		animation.addByPrefix('singDOWN', 'Sky annoyed alt down0', 24, false);
		animation.addByPrefix('singLEFT', 'Sky annoyed alt left0', 24, false);

		animation.addByPrefix('singUPmiss', 'Sky annoyed alt up MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Sky annoyed alt right MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Sky annoyed alt down MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Sky annoyed alt left MISS0', 1, false);

	}

	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, 0);

		addOffset("singUP", -7, 0);
		addOffset("singRIGHT", -39, 0);
		addOffset("singLEFT", 35, 0);
		addOffset("singDOWN", -18, 0);

		addOffset("singUPmiss", -7, 0);
		addOffset("singRIGHTmiss", -39, 0);
		addOffset("singLEFTmiss", 35, 0);
		addOffset("singDOWNmiss", -18, 0);
		
		playAnim('idle');

		flipX = false;

	}
	

}
