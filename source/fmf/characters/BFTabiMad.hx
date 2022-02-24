package fmf.characters;
import state.*;
import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class BFTabiMad extends BFTabi
{

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/bf/tabi/BF_post_exp', 'mods');
		frames = tex;
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -6, -6);

		addOffset('singUP', -53, 22);
		addOffset('singRIGHT', -46, -5);
		addOffset('singLEFT', 6, -5);
		addOffset('singDOWN', -10, -57);

		addOffset('singUPmiss', -40, -5);
		addOffset('singRIGHTmiss', -40, 15);
		addOffset('singLEFTmiss', 4, 17);
		addOffset('singDOWNmiss', -10, -25);

		playAnim('idle');

		this.scale.x = 2;
		this.scale.y = 2;
	}
	
	
}
