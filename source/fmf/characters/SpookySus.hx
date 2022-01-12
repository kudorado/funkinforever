package fmf.characters;
import state.*;
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

		animation.addByPrefix('singUPmiss', 'Spooky UP NOTE MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Spooky DOWN note MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Note sing left MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Spooky sing right MISS0', 1, false);
		
		dance();
	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, 0);

		addOffset("singUP", -65, 26);
		addOffset("singRIGHT", 96, -11);
		addOffset("singLEFT", -17, -10);
		addOffset("singDOWN", 50, -141);

		addOffset("singUPmiss", -79, 27);
		addOffset("singRIGHTmiss", 95, -18);
		addOffset("singLEFTmiss", -21, -11);
		addOffset("singDOWNmiss", 59, -150);
	
		flipX = true;
	}
	

}
