package fmf.characters;
import state.*;
import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class BFFly extends BFTabi
{
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc_updated/bfFly', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Fall !idle0', 24, false);
		animation.addByPrefix('singUP', 'Fall 2up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Fall 3right0', 24, false);
		animation.addByPrefix('singLEFT', 'Fall 0left0', 24, false);
		animation.addByPrefix('singDOWN', 'Fall 1down0', 24, false);

		animation.addByPrefix('singUPmiss', 'MISS 2up0', 24, false);
		animation.addByPrefix('singRIGHTmiss', '"MISS 3right0', 24, false);
		animation.addByPrefix('singLEFTmiss', 'MISS 0left0', 24, false);
		animation.addByPrefix('singDOWNmiss', 'MISS 1down0', 24, false);
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -6, -6);

		addOffset('singUP', -53, 22);
		addOffset('singRIGHT', -46, -5);
		addOffset('singLEFT', 6, -5);
		addOffset('singDOWN', -10, -57);

		addOffset('singUPmiss', -40, 15);
		addOffset('singRIGHTmiss', -40, 15);
		addOffset('singLEFTmiss', 4, 17);
		addOffset('singDOWNmiss', -10, -25);

		playAnim('idle');

		this.scale.x = 1;
		this.scale.y = 1;
	}

}
