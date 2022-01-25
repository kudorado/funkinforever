package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class Tankman extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/tankman/tankmanCaptain', "mods");
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Tankman Idle Dance instance 10', 24, false);//

		animation.addByPrefix('singUP', 'Tankman UP note instance 10', 24, false);//
		animation.addByPrefix('singLEFT', 'Tankman Note Left instance 10', 24, false);//
		animation.addByPrefix('singRIGHT', 'Tankman Right Note instance 10', 24, false);//
		animation.addByPrefix('singDOWN', 'Tankman DOWN note instance 10', 24, false);//

		animation.addByPrefix('singUPmiss', 'Tankman UP note instance 1 MISS10', 1, false);//
		animation.addByPrefix('singLEFTmiss', 'Tankman Note Left instance 1 MISS10', 1, false);//
		animation.addByPrefix('singRIGHTmiss', 'Tankman Right Note instance 1 MISS10', 1, false);//
		animation.addByPrefix('singDOWNmiss', 'Tankman DOWN note instance 1 MISS10', 1, false);//
	}

	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, 0);

		addOffset("singUP", -57, 10);
		addOffset("singRIGHT", -72, 0);
		addOffset("singLEFT", 22, 1);
		addOffset("singDOWN", -58, 1);

		addOffset("singUPmiss", -57, 10);
		addOffset("singRIGHTmiss", -72, 0);
		addOffset("singLEFTmiss", 22, 1);
		addOffset("singDOWNmiss", -58, 1);

		playAnim('idle');

		flipX = false;

	}
	

}
