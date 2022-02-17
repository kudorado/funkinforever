package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class DrunkAnnieSus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc/annie/drunk_annie', 'mods');
		var tex2 = Paths.getSparrowAtlas('pc/annie/drunkAnnie_miss', 'mods');

		for (frame in tex2.frames)
		{
			tex.pushFrame(frame);
		}
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'monster idle0', 24, false);

		animation.addByPrefix('singUP', 'monster up note0', 24, false);
		animation.addByPrefix('singDOWN', 'monster down0', 24, false);
		animation.addByPrefix('singLEFT', 'Monster left note0', 24, false);
		animation.addByPrefix('singRIGHT', 'Monster Right note0', 24, false);

		animation.addByPrefix('singUPmiss', 'Monster up note MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Monster down MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Monster left note MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Monster Right note MISS0', 1, false);

		dance();
	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, 0);

		addOffset("singUP", 20, 50);
		addOffset("singRIGHT", 49, 0);
		addOffset("singLEFT", 42, 0);
		addOffset("singDOWN", 40,-90);
 
		addOffset("singUPmiss", -250, -214);
		addOffset("singRIGHTmiss", -213, -223);
		addOffset("singLEFTmiss", -265, -217);
		addOffset("singDOWNmiss", -225,-253);
	
		flipX = true;
	}
	

}
