package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class GSPico extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/gspico/pico', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);//

		animation.addByPrefix('singUP', 'Pico Up note0', 24, false);//
		animation.addByPrefix('singLEFT', 'Pico NOTE LEFT0', 24, false);//
		animation.addByPrefix('singRIGHT', 'Pico Note Right0', 24, false);//
		animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);//

		animation.addByPrefix('singUPmiss', 'Pico Up note MISS', 1, false);//
		animation.addByPrefix('singLEFTmiss', 'Pico NOTE LEFT MISS', 1, false);//
		animation.addByPrefix('singRIGHTmiss', 'Pico Note Right MISS', 1, false);//
		animation.addByPrefix('singDOWNmiss', 'Pico Down Note MISS', 1, false);//
	
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, 0);

		addOffset("singUP", -4, 30);
		addOffset("singRIGHT", 56, -54);
		addOffset("singLEFT", -46, -13);
		addOffset("singDOWN", 2, -25);

		addOffset("singUPmiss", -4, 30);
		addOffset("singRIGHTmiss", 56, -54);
		addOffset("singLEFTmiss", -46, -13);
		addOffset("singDOWNmiss", 2, -25);

		playAnim('idle');
		flipX = false;


	}

}
