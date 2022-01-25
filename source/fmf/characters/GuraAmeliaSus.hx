package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class GuraAmeliaSus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc/guraamelia/gura_amelia', 'mods');
		frames = tex;

	}

	// create animation for BF
	public override function createAnimations():Void
	{

		animation.addByPrefix('idle', "spooky dance idle0", 24, false);
		animation.addByPrefix('singUP', "spooky UP NOTE0", 24, false);
		animation.addByPrefix('singDOWN', "spooky DOWN note0", 24, false);
		animation.addByPrefix('singLEFT', 'note sing left0', 24, false);
		animation.addByPrefix('singRIGHT', 'spooky sing right0', 24, false);

		animation.addByPrefix('singUPmiss', "spooky UP NOTE MISS0", 24, false);
		animation.addByPrefix('singDOWNmiss', "spooky DOWN note MISS0", 24, false);
		animation.addByPrefix('singLEFTmiss', 'note sing left MISS0', 24, false);
		animation.addByPrefix('singRIGHTmiss', 'spooky sing right MISS0', 24, false);

		dance();
	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, 0);

		addOffset("singUP", -58, 24);
		addOffset("singRIGHT", 44, -15);
		addOffset("singLEFT", -23, -0);
		addOffset("singDOWN", -30, -144);

		addOffset("singUPmiss", -58, 24);
		addOffset("singRIGHTmiss", 44, -15);
		addOffset("singLEFTmiss", -23, -0);
		addOffset("singDOWNmiss", -30, -144);
	
		flipX = true;
	}
	

}
