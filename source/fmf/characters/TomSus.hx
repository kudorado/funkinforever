package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class TomSus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc/tom/tom_assets', 'mods');
		var tex2 = Paths.getSparrowAtlas('pc/tom/tom_assets_miss', 'mods');

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

		dance();
	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, 0);
		addOffset("singUP", 18, 20);
		addOffset("singRIGHT", 57, -10);
		addOffset("singLEFT", 3, -11);
		addOffset("singDOWN", 32, -17);

		addOffset("singUPmiss", 1, 30);
		addOffset("singRIGHTmiss", 73, 8);
		addOffset("singLEFTmiss", -37, -1);
		addOffset("singDOWNmiss", -8, 3);


		flipX = true;
	}
	

}
