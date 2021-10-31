package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class MikuMadSus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc/mikumad/ev_miku_mad', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Miku idle dance0', 24, false);

		animation.addByPrefix('singUP', 'Miku Scream Sing Note UP0', 24, false);
		animation.addByPrefix('singDOWN', 'Miku Scream Sing Note DOWN0', 24, false);
		animation.addByPrefix('singLEFT', 'Miku Scream Sing Note LEFT 0', 24, false);
		animation.addByPrefix('singRIGHT', 'Miku Scream Sing Note RIGHT 0', 24, false);

		animation.addByPrefix('singUPmiss', 'Miku Scream Sing Note UP MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Miku Scream Sing Note DOWN MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Miku Scream Sing Note LEFT MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Miku Scream Sing Note RIGHT MISS0', 1, false);
		
		dance();
	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, 0);

		addOffset("singUP", -5, 24);
		addOffset("singRIGHT", 20, 5);
		addOffset("singLEFT", -18, -5);
		addOffset("singDOWN", -4, -3);

		addOffset("singUPmiss", -12, 30);
		addOffset("singRIGHTmiss", 26, 6);
		addOffset("singLEFTmiss", -20, -5);
		addOffset("singDOWNmiss", -3, -9);
	
		flipX = true;
	}
	

}
