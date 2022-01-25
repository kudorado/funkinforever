package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class NonsenseGodSus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc/nonsensegod/nonsense_god', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Idle god0', 24, false);
	
		animation.addByPrefix('singUP', 'God up long note0', 24, false);
		animation.addByPrefix('singRIGHT', 'God right0', 24, false);
		animation.addByPrefix('singLEFT', 'Left god0', 24, false);
		animation.addByPrefix('singDOWN', 'God down0', 24, false);
	
		animation.addByPrefix('singUPmiss', 'God up long note MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'God right MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Left god MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'God down MISS0', 1, false);
		

		playAnim('idle');
	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle');

		addOffset("singUP", -1, 1);
		addOffset("singRIGHT", -1, 0);
		addOffset("singLEFT", 1, 0);
		addOffset("singDOWN", -1, 0);

		addOffset("singUPmiss", -1, 6);
		addOffset("singRIGHTmiss", -1, 0);
		addOffset("singLEFTmiss", -1, 0);
		addOffset("singDOWNmiss", -1, 0);


		flipX = true;
	}

	var sillyHotBabe:Bool = true;
	var counter:Float;
	var direction:Float = 1;

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sillyHotBabe)
		{
			this.y += Math.cos(700) * direction;
			counter += elapsed;
			if (counter >= 0.5)
			{
				direction *= -1;
				counter = 0;
			}
		}
	}


}
