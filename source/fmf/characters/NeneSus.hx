package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class NeneSus extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/nene/Nene_FNF_assetss', "mods");
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);//

		animation.addByPrefix('singUP', 'Pico Up note0', 2, false);//
		animation.addByPrefix('singLEFT', 'Pico NOTE LEFT0', 2, false);//
		animation.addByPrefix('singRIGHT', 'Pico Note Right0', 2, false);//
		animation.addByPrefix('singDOWN', 'Pico Down Note0', 2, false);//

		animation.addByPrefix('singUPmiss', 'Pico Up note MISS0', 1, false);//
		animation.addByPrefix('singLEFTmiss', 'Pico NOTE LEFT MISS0', 1, false);//
		animation.addByPrefix('singRIGHTmiss', 'Pico Note Right MISS0', 1, false);//
		animation.addByPrefix('singDOWNmiss', 'Pico Down Note MISS0', 1, false);//
	}

	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, 0);

		addOffset("singUP", 43, 7);
		addOffset("singRIGHT", -19, 0);
		addOffset("singLEFT", 0, 0); 
		addOffset("singDOWN", 0, 0);

		addOffset("singUPmiss", 43, 7);
		addOffset("singRIGHTmiss", -19, 0);
		addOffset("singLEFTmiss", 0, 0);
		addOffset("singDOWNmiss", 0, 0);

		playAnim('idle');

		flipX = false;

	}
	

}
