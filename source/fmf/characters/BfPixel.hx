package fmf.characters;
import state.*;
import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class BfPixel extends Boyfriend
{

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/bf/bfPixel', 'mods');

		frames = tex;
	}

	//create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'BF IDLE00', 24, false);
		animation.addByPrefix('singUP', 'BF UP NOTE00', 24, false);
		animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE00', 24, false);
		animation.addByPrefix('singLEFT', 'BF LEFT NOTE00', 24, false);
		animation.addByPrefix('singDOWN', 'BF DOWN NOTE00', 24, false);

		animation.addByPrefix('singUPmiss', 'BF UP MISS00', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS00', 1, false);
		animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS00', 1, false);
		animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS00', 1, false);
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
	
		addOffset('idle', 0, 0);

		addOffset('singUP', 0, 0);
		addOffset('singRIGHT', 0, 0);
		addOffset('singLEFT', 0, 0);
		addOffset('singDOWN', 0, 0);
		
		addOffset('singUPmiss', 0, 0);
		addOffset('singRIGHTmiss', 0, 0);
		addOffset('singLEFTmiss', 0, 0);
		addOffset('singDOWNmiss', 0, 0);
		
		playAnim('idle');


		this.scale.x = 7;
		this.scale.y = 7;


	}
	
}
