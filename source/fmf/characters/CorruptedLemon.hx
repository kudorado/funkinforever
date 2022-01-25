package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class CorruptedLemon extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/lemon/lemon', "mods");

		frames = tex;

	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', "Monster idle", 24, false);
		animation.addByPrefix('singUP', "Monster up note0", 24, false);
		animation.addByPrefix('singDOWN', "Monster down0", 24, false);
		animation.addByPrefix('singLEFT', 'Monster left note0', 24, false);
		animation.addByPrefix('singRIGHT', 'Monster Right note0', 24, false);

		animation.addByPrefix('singUPmiss', "Monster up note MISS", 1, false);
		animation.addByPrefix('singDOWNmiss', "Monster down MISS", 1, false);
		animation.addByPrefix('singLEFTmiss', 'Monster left note MISS', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Monster Right note MISS', 1, false);


	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -5, 28);
		addOffset("singUP", 2, 33);
		addOffset("singRIGHT", 1, 37);
		addOffset("singLEFT", -4, 34);
		addOffset("singDOWN", -60, 28);

		addOffset("singUPmiss", 2, 33);
		addOffset("singRIGHTmiss", 1, 37);
		addOffset("singLEFTmiss", -4, 34);
		addOffset("singDOWNmiss", -60, 28);

		playAnim('idle');

		flipX = true;


		
	}
	

}
