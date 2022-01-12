package fmf.characters;
import state.*;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class AnnieSus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc/annie/annie', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'BF idle dance', 24, false);
		animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
		animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
		animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
		animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);

		animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS0', 1, false);

		dance();
	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle',-2, -38);

		addOffset('singUP', -4, -23);
		addOffset('singRIGHT', -12 , -45);
		addOffset('singLEFT',44, -45);
		addOffset('singDOWN', 15, -66);

		addOffset('singUPmiss', -4, -23);
		addOffset('singRIGHTmiss', -12 , -45);
		addOffset('singLEFTmiss',44, -45);
		addOffset('singDOWNmiss', 15, -66);


		flipX = false;
	}
	

}
