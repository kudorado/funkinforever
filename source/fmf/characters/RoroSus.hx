package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class RoroSus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc/roro/roroAssets', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Roro Idle0', 24, false);

		animation.addByPrefix('singUP', 'Roro Up Note0', 24, false);
		animation.addByPrefix('singDOWN', 'Roro Down Note0', 24, false);
		animation.addByPrefix('singLEFT', 'Roro Left Note0', 24, false);
		animation.addByPrefix('singRIGHT', 'Roro Right Note0', 24, false);

		animation.addByPrefix('singUPmiss', 'Roro Up Note MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Roro Down Note MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Roro Left Note MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Roro Right Note MISS0', 1, false);

		this.scale.x = 0.85;
		this.scale.y = 0.85;


		dance();
	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, 0);

		addOffset("singUP", 0, 0);
		addOffset("singRIGHT", -0, -0);
		addOffset("singLEFT", 0, -0);
		addOffset("singDOWN", -0, -0);

		addOffset("singUPmiss", -0, 0);
		addOffset("singRIGHTmiss", -0, -0);
		addOffset("singLEFTmiss", 0, -0);
		addOffset("singDOWNmiss", -0, -0);
	
		flipX = false;
	}
	

}
