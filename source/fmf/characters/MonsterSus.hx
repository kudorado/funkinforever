package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class MonsterSus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc/monster/Monster_Assets', 'mods');
		var tex2 = Paths.getSparrowAtlas('pc/monster/Monster_Assets_miss', 'mods');

		for (frame in tex2.frames)
		{
			tex.pushFrame(frame);
		}
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'monster idle', 24, false);

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
		addOffset('idle', -2, 3);

		addOffset("singUP", -23, 60);
		addOffset("singRIGHT", -50, 7);
		addOffset("singLEFT", -37, 8);
		addOffset("singDOWN", -58, -33);
		
		addOffset("singUPmiss", -28, 55);
		addOffset("singRIGHTmiss", -62, 12);
		addOffset("singLEFTmiss", -50, 2);
		addOffset("singDOWNmiss", -79, -67);

		flipX = false;
	}
	

}
