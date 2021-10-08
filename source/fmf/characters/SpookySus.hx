package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class SpookySus extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/spooky/spooky_kids_assets', "mods");
		var tex2 = Paths.getSparrowAtlas('pc/spooky/spooky_kids_assets_miss', "mods");

		for (frame in tex2.frames)
		{
			tex.pushFrame(frame);
		}
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'spooky dance idle', 24, false);

		animation.addByPrefix('singUP', 'spooky UP NOTE0', 24, false);
		animation.addByPrefix('singDOWN', 'spooky DOWN note0', 24, false);
		animation.addByPrefix('singLEFT', 'note sing left0', 24, false);
		animation.addByPrefix('singRIGHT', 'spooky sing right0', 24, false);

		animation.addByPrefix('singUPmiss', 'spooky UP NOTE MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'spooky DOWN note MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'note sing left MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'spooky sing right MISS0', 1, false);
		
		dance();
	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, 0);

		addOffset("singUP", -20, 26);
		addOffset("singRIGHT", -130, -14);
		addOffset("singLEFT", 130, -10);
		addOffset("singDOWN", -50, -130);

		addOffset("singUPmiss", -20, 26);
		addOffset("singRIGHTmiss", -130, -14);
		addOffset("singLEFTmiss", 130, -10);
		addOffset("singDOWNmiss", -50, -130);
	
		flipX = false;
	}
	

}
