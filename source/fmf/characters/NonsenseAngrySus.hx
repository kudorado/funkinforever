package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class NonsenseAngrySus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc/nonsense/nonsense_angry', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Idle pissed0', 24, false);
		animation.addByPrefix('singUP', 'Up Pissed0', 24, false);
		animation.addByPrefix('singRIGHT', 'Right Pissed0', 24, false);
		animation.addByPrefix('singLEFT', 'Pissed left0', 24, false);
		animation.addByPrefix('singDOWN', 'Pissed Down0', 24, false);

		animation.addByPrefix('singUPmiss', 'Up Pissed MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Right Pissed MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Pissed left MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Pissed Down MISS0', 1, false);

		playAnim('idle');
	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle');

		addOffset("singUP", 27, 13);
		addOffset("singRIGHT", 19, -13);
		addOffset("singLEFT", 45, -5);
		addOffset("singDOWN", 41, -48);

		addOffset("singUPmiss", 17, 21);
		addOffset("singRIGHTmiss", 17, -15);
		addOffset("singLEFTmiss", 51, -5);
		addOffset("singDOWNmiss", 48, -56);



		flipX = true;
	}
	

}
