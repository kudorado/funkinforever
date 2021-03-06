package fmf.characters;
import state.*;
import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class DDLCBoyFriend extends Boyfriend
{

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/bf/DDLCBoyFriend_Assets', 'mods');
		frames = tex;
	}

	//create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'BF idle dance00', 24, false);
		animation.addByPrefix('singUP', 'BF NOTE UP00', 24, false);
		animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT00', 24, false);
		animation.addByPrefix('singLEFT', 'BF NOTE LEFT00', 24, false);
		animation.addByPrefix('singDOWN', 'BF NOTE DOWN00', 24, false);

		animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS00', 1, false);
		animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS00', 1, false);
		animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS0', 1, false);
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -5, 0);

		addOffset('singUP', -54,27);
		addOffset('singRIGHT', -50,-5);
		addOffset('singLEFT', -13, -6);
		addOffset('singDOWN', -35, -50);
		
		addOffset('singUPmiss', -20,55);
		addOffset('singRIGHTmiss', -20,55);
		addOffset('singLEFTmiss', 20,35);
		addOffset('singDOWNmiss', 20,35);
		
		playAnim('idle');


		this.scale.x = 1;
		this.scale.y = 1;


	}
	
}
