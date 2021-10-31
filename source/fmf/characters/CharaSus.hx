package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class CharaSus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc/chara/chara', 'mods');
		var tex2 = Paths.getSparrowAtlas('pc/chara/chara_miss', 'mods');

		for (frame in tex2.frames)
		{
			tex.pushFrame(frame);
		}

		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'chara0', 24, false);

		animation.addByPrefix('singUP', 'chara up0', 24, false);
		animation.addByPrefix('singDOWN', 'chara down0', 24, false);
		animation.addByPrefix('singLEFT', 'chara left0', 24, false);
		animation.addByPrefix('singRIGHT', 'chara right0', 24, false);

		animation.addByPrefix('singUPmiss', 'Chara up MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Chara down MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Chara left MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Chara right MISS0', 1, false);

		dance();
	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, 0);

		addOffset("singUP", 0, 3);
		addOffset("singRIGHT", -2, -5);
		addOffset("singLEFT", 10, -1);
		addOffset("singDOWN", 1, -12);

		addOffset("singUPmiss", 0, 3);
		addOffset("singRIGHTmiss", -2, -5);
		addOffset("singLEFTmiss", 10, -1);
		addOffset("singDOWNmiss", 1, -12);
	
		flipX = true;
	}
	

}
