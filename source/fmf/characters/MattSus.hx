package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class MattSus extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/matt/matt_assets', "mods");
		var tex2 = Paths.getSparrowAtlas('pc/matt/matt_assets_miss', 'mods');

		for (frame in tex2.frames)
		{
			tex.pushFrame(frame);
		}

		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', "matt idle", 24);

		animation.addByPrefix('singUP', 'matt up note', 24, false);
		animation.addByPrefix('singDOWN', 'matt down note', 24, false);
		animation.addByPrefix('singLEFT', 'matt left note', 24, false);
		animation.addByPrefix('singRIGHT', 'matt right note', 24, false);

		animation.addByPrefix('singUPmiss', 'Matt up note MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Matt down note MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Matt left note MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Matt right note MISS0', 1, false);


	}

	public override function createAnimationOffsets():Void
	{
		addOffset("idle", 0, 0);

		addOffset("singUP", -14, 16);
		addOffset("singRIGHT", 61, -25);
		addOffset("singLEFT", 40, -40);
		addOffset("singDOWN", 23, -25);

		addOffset("singUPmiss", -18, 16);
		addOffset("singRIGHTmiss", 64, -24);
		addOffset("singLEFTmiss", 42, -40);
		addOffset("singDOWNmiss", 22, -24);

		playAnim('idle');
		flipX = true;

	}
	

}
