package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class LizSus extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/liz/liz_assets', "mods");
		var tex2 = Paths.getSparrowAtlas('pc/liz/liz_miss', 'mods');

		for (frame in tex2.frames)
		{
			tex.pushFrame(frame);
		}

		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'liz idle0', 24, false);//

		animation.addByPrefix('singUP', 'liz up pose0', 24, false);//
		animation.addByPrefix('singLEFT', 'liz left pose0', 24, false);//
		animation.addByPrefix('singRIGHT', 'liz right pose0', 24, false);//
		animation.addByPrefix('singDOWN', 'liz down pose0', 24, false);//

		animation.addByPrefix('singUPmiss', 'Liz up pose MISS0', 1, false);//
		animation.addByPrefix('singLEFTmiss', 'Liz left pose MISS0', 1, false);//
		animation.addByPrefix('singRIGHTmiss', 'Liz right pose MISS0', 1, false);//
		animation.addByPrefix('singDOWNmiss', 'Liz down pose MISS0', 1, false);//
	}

	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, 0);

		addOffset("singUP", -71, -30);
		addOffset("singRIGHT", -22, -28);
		addOffset("singLEFT", -100, -2);
		addOffset("singDOWN", -60, -10);

		addOffset("singUPmiss", -71, -30);
		addOffset("singRIGHTmiss", -22, -28);
		addOffset("singLEFTmiss", -100, -2);
		addOffset("singDOWNmiss", -60, -10);

		playAnim('idle');

		flipX = true;

	}
	

}
