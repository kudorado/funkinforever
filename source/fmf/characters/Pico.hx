package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class Pico extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/pico/pico', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);//

		animation.addByPrefix('singUP', 'pico Up note0', 24, false);//
		animation.addByPrefix('singLEFT', 'Pico NOTE LEFT0', 24, false);//
		animation.addByPrefix('singRIGHT', 'Pico Note Right0', 24, false);//
		animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);//

		animation.addByPrefix('singUPmiss', 'pico Up note miss', 24, false);//
		animation.addByPrefix('singLEFTmiss', 'Pico NOTE LEFT miss', 24, false);//
		animation.addByPrefix('singRIGHTmiss', 'Pico Note Right Miss', 24, false);//
		animation.addByPrefix('singDOWNmiss', 'Pico Down Note MISS', 24, false);//
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, 0);

		addOffset("singUP", 2, 20);
		addOffset("singRIGHT", -48, 2);
		addOffset("singLEFT", 85, -9);
		addOffset("singDOWN", 112, -83);

		addOffset("singUPmiss", 17, 57);
		addOffset("singRIGHTmiss", -29, 46);
		addOffset("singLEFTmiss", 88, 24);
		addOffset("singDOWNmiss", 112, -46);


		playAnim('idle');
		flipX = false;

	}

}
