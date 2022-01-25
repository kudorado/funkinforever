package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class NonsenseMadSus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc/nonsensemad/nonsense_mad', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Mad Idle0', 24, false);

		animation.addByPrefix('singUP', 'MAD up0', 24, false);
		animation.addByPrefix('singRIGHT', 'MadRight0', 24, false);
		animation.addByPrefix('singLEFT', 'Mad Left0', 24, false);
		animation.addByPrefix('singDOWN', 'Mad down0', 24, false);

		animation.addByPrefix('singUPmiss', 'MAD up MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'MadRight MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Mad Left MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Mad down MISS0', 1, false);


		dance();
	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle');

		addOffset("singUP", 18, 4);
		addOffset("singRIGHT", 48, 0);
		addOffset("singLEFT", 18, 0);
		addOffset("singDOWN", 27, -49);

		addOffset("singUPmiss", 8, 12);
		addOffset("singRIGHTmiss", 60, 0);
		addOffset("singLEFTmiss", 9, -1);
		addOffset("singDOWNmiss", 34, -57);



		flipX = true;
	}
	

}
