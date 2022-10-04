package fmf.characters;
import state.*;
import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class BFTrollFF extends Boyfriend
{

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('psychengine/week_ffmix/images/characters/BOYFRIENDTROLL', 'mods');
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
		addOffset('singUP', -104, 29);
		addOffset('singRIGHT', -51, -11);
		addOffset('singLEFT', 7, -16);
		addOffset('singDOWN', -10, -57);

		addOffset('singUPmiss', -20, 75);
		addOffset('singRIGHTmiss', -46, 32);
		addOffset('singLEFTmiss', 6, 20);
		addOffset('singDOWNmiss', -20, -21);
		playAnim('idle');

	}
	
		
}
