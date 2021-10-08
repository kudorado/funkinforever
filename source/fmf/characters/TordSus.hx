package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class TordSus extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/tord/tord_assets', "mods");
		var tex2 = Paths.getSparrowAtlas('pc/tord/tord_assets_miss', 'mods');

		for (frame in tex2.frames)
		{
			tex.pushFrame(frame);
		}

		frames = tex;
	
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', "tord idle0", 24, false);
		animation.addByPrefix('singUP', "tord up0", 24, false);
		animation.addByPrefix('singDOWN', "tord down0", 24, false);
		animation.addByPrefix('singLEFT', 'tord left0', 24, false);
		animation.addByPrefix('singRIGHT', 'tord right0', 24, false);

		animation.addByPrefix('singUPmiss', "Tord up MISS0", 1, false);
		animation.addByPrefix('singDOWNmiss', "Tord down MISS0", 1, false);
		animation.addByPrefix('singLEFTmiss', 'Tord left MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Tord right MISS0', 1, false);

	}


	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -24, 104);

		addOffset("singUP", -7, 128);
		addOffset("singRIGHT", 31, 93);
		addOffset("singLEFT", -20, 86);
		addOffset("singDOWN", 5, 85);
		
		addOffset("singUPmiss", -7, 128);
		addOffset("singRIGHTmiss", 31, 93);
		addOffset("singLEFTmiss", -20, 86);
		addOffset("singDOWNmiss", 5, 85);




		playAnim('idle');
		flipX = true;

	}
	

}
