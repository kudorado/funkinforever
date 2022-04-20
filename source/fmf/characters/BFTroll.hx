package fmf.characters;
import state.*;
import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class BFTroll extends Boyfriend
{

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('psychengine/week_tgt/images/BOYFRIEND', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'BF idle dance0', 24, false);
		animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
		animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
		animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
		animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);

		animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS0', 24, false);
		animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS0', 24, false);
		animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS0', 24, false);
		animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS0', 24, false);
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -6, -6);
		addOffset('singUP', -53, 22);
		addOffset('singRIGHT', -46, -5);
		addOffset('singLEFT', 6, -5);
		addOffset('singDOWN', -10, -57);

		addOffset('singUPmiss', -40, 15);
		addOffset('singRIGHTmiss', -40, 15);
		addOffset('singLEFTmiss', 4, 17);
		addOffset('singDOWNmiss', -10, -25);
		playAnim('idle');

	}
	
		
}
