package fmf.characters;
import state.*;
import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class BFBoxing extends Boyfriend
{

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc_updated/BOYFRIENDMII', 'mods');
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
		addOffset('idle', -6, -6);

		addOffset('singUP', -53, 22);
		addOffset('singRIGHT', -46,-5);
		addOffset('singLEFT', 6, -5);
		addOffset('singDOWN', -10, -57);
		
		addOffset('singUPmiss', -40, 15);
		addOffset('singRIGHTmiss', -40, 15);
		addOffset('singLEFTmiss', 4, 17);
		addOffset('singDOWNmiss', -10,-25);
		
		playAnim('idle');


		this.scale.x = 1;
		this.scale.y = 1;

	}
	
}
