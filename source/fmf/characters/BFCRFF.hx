package fmf.characters;
import state.*;
import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class BFCRFF extends BFTabi
{
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('psychengine/week_ffmix/images/characters/BoyFriend_CRshader', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('attack', '0BF attack instance 1', 24, false);
		animation.addByPrefix('oof', 'OuchBonesinmyAss instance 1', 24, false);
		animation.addByPrefix('idle', 'BF idle dance instance 1', 24, false);
		animation.addByPrefix('singUP', 'BF NOTE UP instance 1', 24, false);
		animation.addByPrefix('singLEFT', 'BF NOTE LEFT instance 1', 24, false);
		animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT instance 1', 24, false);
		animation.addByPrefix('singDOWN', 'BF NOTE DOWN instance 1', 24, false);
		animation.addByPrefix('singUPmiss', 'U-Miss', 24, false);
		animation.addByPrefix('singLEFTmiss', 'R-Miss', 24, false);
		animation.addByPrefix('singRIGHTmiss', 'L-Miss', 24, false);
		animation.addByPrefix('singDOWNmiss', 'D-Miss', 24, false);

	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		
		addOffset('idle', 0, 0);
		addOffset('singUP', -49, 58);
		addOffset('singRIGHT', -34, 4);
		addOffset('singLEFT', 28, -3);
		addOffset('singDOWN', -23, -32);
		addOffset('singUPmiss', -56, 113);
		addOffset('singRIGHTmiss', -26, 24);
		addOffset('singLEFTmiss', 10, 23);
		addOffset('singDOWNmiss', -34, -24);
		addOffset('attack', 1101, -10);
		addOffset('oof', -20, -30);

		playAnim('idle');

		this.scale.x = 1;
		this.scale.y = 1;
	}

}
