package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class SundaySus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc/sunday/sunday', 'mods');

		var tex2 = Paths.getSparrowAtlas('pc/sunday/sunday_miss', 'mods');

		for (frame in tex2.frames)
		{
			tex.pushFrame(frame);
		}

		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Dad idle dance0', 24, false);

		animation.addByPrefix('singUP', 'Dad Sing Note UP0', 24, false);
		animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN0', 24, false);
		animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT0', 24, false);
		animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT0', 24, false);
		
		animation.addByPrefix('singUPmiss', 'Dad Sing Note UP MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Dad Sing Note DOWN MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Dad Sing Note LEFT MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Dad Sing Note RIGHT MISS0', 1, false);
		

		dance();
	}

	override function noteEventBF(noteData:Note)
	{
		super.noteEventBF(noteData);
		playState.camFollow.y = this.getMidpoint().y + 100;

		playState.shakeNormal();

	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, 0);

		addOffset("singUP", -28, 60);
		addOffset("singRIGHT", -62, 15);
		addOffset("singLEFT", 55, 37);
		addOffset("singDOWN", 48, -32);

		addOffset("singUPmiss", -30, 61);
		addOffset("singRIGHTmiss", -64, 18);
		addOffset("singLEFTmiss", 54, 40);
		addOffset("singDOWNmiss", 47, -30);
	
		flipX = true;
	}
	

}
