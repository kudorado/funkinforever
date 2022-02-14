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

	// create animation for BF
	public override function createAnimations():Void
	{
		// animation.addByPrefix('idle', 'SSBF IDLE instance 100', 24, false);
		// animation.addByPrefix('singUP', 'SSBF UP instance', 24, false);
		// animation.addByPrefix('singRIGHT', 'SSBF RIGHT instance', 24, false);
		// animation.addByPrefix('singLEFT', 'SSBF LEFT instance 100', 24, false);
		// animation.addByPrefix('singDOWN', 'SSBF DOWN instance', 24, false);

		// animation.addByPrefix('singUPmiss', 'SSBF UPmiss instance', 1, false);
		// animation.addByPrefix('singRIGHTmiss', 'SSBF RIGHTmiss instance', 1, false);
		// animation.addByPrefix('singLEFTmiss', 'SSBF LEFTmiss instance', 1, false);
		// animation.addByPrefix('singDOWNmiss', 'SSBF DOWNmiss instance', 1, false);

	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
	
		addOffset('idle', 0, 0);

		addOffset('singUP', -2, 4);
		addOffset('singRIGHT', -2, -6);
		addOffset('singLEFT', 24, 9);
		addOffset('singDOWN', 2, -13);
		
		addOffset('singUPmiss', -2, 5);
		addOffset('singRIGHTmiss', 10, 13);
		addOffset('singLEFTmiss', 19, -2);
		addOffset('singDOWNmiss', 17, 17);
		
		playAnim('idle');


		this.scale.x = 2;
		this.scale.y = 2;


	}
	
}
