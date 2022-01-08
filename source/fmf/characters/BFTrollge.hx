package fmf.characters;

import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class BFTrollge extends Boyfriend
{

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/blueballs_incident/new_boyfriend', 'mods');

		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'BF idle dance0', 9, false);
		animation.addByPrefix('singUP', 'BF NOTE UP0', 9, false);
		animation.addByPrefix('singRIGHT', 'BF NOTE LEFT0', 9, false);
		animation.addByPrefix('singLEFT', 'BF NOTE RIGHT0', 9, false);
		animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 9, false);
		
		animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 9, false);
		animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 9, false);
		animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 9, false);
		animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 9, false);
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
	
		addOffset('idle', 0, 0);

		addOffset('singUP', -53, 38);
		addOffset('singRIGHT', 17, 2);
		addOffset('singLEFT', -41, -2);
		addOffset('singDOWN', -37, -43);
		
		addOffset('singUPmiss', -47, 40);
		addOffset('singRIGHTmiss', -40, 0);
		addOffset('singLEFTmiss', 20, 4);
		addOffset('singDOWNmiss', -36, -38);
		
		playAnim('idle');
		flipX = false;


	}
	
}
