package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class GFMadSus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc/gfmad/madGF', 'mods');
		var tex2 = Paths.getSparrowAtlas('pc/gfmad/madGF_miss', 'mods');

		for (frame in tex2.frames)
		{
			tex.pushFrame(frame);
		}

		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', "gf Idle Dance0", 24, false);
	
		animation.addByPrefix('singUP', "gf Up note0", 24, false);
		animation.addByPrefix('singDOWN', "gf Down Note0", 24, false);
		animation.addByPrefix('singLEFT', 'gf NOTE LEFT0', 24, false);
		animation.addByPrefix('singRIGHT', 'gf Note Right0', 24, false);

		animation.addByPrefix('singUPmiss', "Gf Up note MISS0", 1, false);
		animation.addByPrefix('singDOWNmiss', "Gf Down Note MISS0", 1, false);
		animation.addByPrefix('singLEFTmiss', 'Gf NOTE LEFT MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Gf Note Right MISS0', 1, false);

		dance();
	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset("idle", 0, 0);
		
		addOffset("singUP", -25, 0);
		addOffset("singDOWN", 74, 0); 
		addOffset("singRIGHT", 57, -2);
		addOffset("singLEFT", 13, -2);

		addOffset("singUPmiss", -43, -11);
		addOffset("singDOWNmiss", 64, -41);
		addOffset("singLEFTmiss", -33, -29);
		addOffset("singRIGHTmiss", 27, -30);


		flipX = false;
	}
	

}
