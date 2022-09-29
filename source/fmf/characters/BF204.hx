package fmf.characters;
import state.*;
import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class BF204 extends BFTabi
{
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('psychengine/week_204/images/characters/BOYFRIEND', 'mods');
		frames = tex;
	}

	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -6, -6);
		addOffset("singUP", -73, 22);
		addOffset("singRIGHT", -39, -13);
		addOffset("singLEFT", -7, -9);
		addOffset("singDOWN", -22, -54);

		addOffset("singUPmiss", -70, 30);
		addOffset("singRIGHTmiss", -40, 17);
		addOffset("singLEFTmiss", -2, -2);
		addOffset("singDOWNmiss", -14, -22);

		playAnim('idle');
		flipX = false;
	}
}
