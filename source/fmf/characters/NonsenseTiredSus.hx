package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class NonsenseTiredSus extends NonsenseSus
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc_updated/nonsense_tired', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Idle Tired0', 24, false);
		animation.addByPrefix('singUP', 'Up tired0', 24, false);
		animation.addByPrefix('singRIGHT', 'Right Tired0', 24, false);
		animation.addByPrefix('singLEFT', 'Left Tired0', 24, false);
		animation.addByPrefix('singDOWN', 'Down tired0', 24, false);
		
		animation.addByPrefix('singUPmiss', 'Up tired MISS0', 24, false);
		animation.addByPrefix('singRIGHTmiss', 'Right Tired MISS0', 24, false);
		animation.addByPrefix('singLEFTmiss', 'Left Tired MISS0', 24, false);
		animation.addByPrefix('singDOWNmiss', 'Down tired MISS0', 24, false);

		playAnim('idle');

	}
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle');

		addOffset("singUP", 16, 10);
		addOffset("singRIGHT", -3, -17);
		addOffset("singLEFT", 28, -8);
		addOffset("singDOWN", 21, -50);

		addOffset("singUPmiss", 10, 20);
		addOffset("singRIGHTmiss", -4, -16);
		addOffset("singLEFTmiss", 29, -9);
		addOffset("singDOWNmiss", 26, -54);

		flipX = true;
	}
}
