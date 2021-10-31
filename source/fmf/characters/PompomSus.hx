package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class PompomSus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc/pompom/pompommad_assets', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Pompom sad idle0', 24, false);

		animation.addByPrefix('singUP', 'Pompom sad up0', 24, false);
		animation.addByPrefix('singDOWN', 'Pompom sad down0', 24, false);
		animation.addByPrefix('singLEFT', 'Pompom sad left0', 24, false);
		animation.addByPrefix('singRIGHT', 'Pompom sad right0', 24, false);

		animation.addByPrefix('singUPmiss', 'Pompom mad up MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Pompom mad down MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Pompom mad left MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Pompom mad right MISS0', 1, false);

		dance();
	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, 0);

		addOffset("singUP", -6, 8);
		addOffset("singRIGHT", 35, -3);
		addOffset("singLEFT", 22, -3);
		addOffset("singDOWN", 19, -29);

		addOffset("singUPmiss", 10, 11);
		addOffset("singRIGHTmiss", 140, -43);
		addOffset("singLEFTmiss", 80, -7);
		addOffset("singDOWNmiss", 50, -80);
	
		flipX = true;
	}
	

}
