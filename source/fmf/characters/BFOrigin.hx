package fmf.characters;
import state.*;
import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class BFOrigin extends BFTabi
{
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc_updated/sixsheet', 'mods');
		frames = tex;
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -6, -6);

		addOffset('singUP', 12, 73);
		addOffset('singRIGHT', 5, -5);
		addOffset('singLEFT', 116, -38);
		addOffset('singDOWN', 136, -66);

		addOffset('singUPmiss', 10, 58);
		addOffset('singRIGHTmiss', 8, -5);
		addOffset('singLEFTmiss', 100, -44);
		addOffset('singDOWNmiss', -10, -25);

		playAnim('idle');

		this.scale.x = 1;
		this.scale.y = 1;
	}
			
}
