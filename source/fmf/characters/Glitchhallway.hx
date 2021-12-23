package fmf.characters;

import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class Glitchhallway extends Boyfriend
{

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/eteled/austin_assets', 'mods');

		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Austin idle dance00', 24, false);
		animation.addByPrefix('singUP', 'Austin Sing Note UP00', 24, false);
		animation.addByPrefix('singRIGHT', 'Austin Sing Note RIGHT00', 24, false);
		animation.addByPrefix('singLEFT', 'Austin Sing Note LEFT00', 24, false);
		animation.addByPrefix('singDOWN', 'Austin Sing Note DOWN00', 24, false);

		animation.addByPrefix('singUPmiss', 'Austin miss up00', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Austin miss right00', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Austin miss left00', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Austin miss down0', 1, false);

	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
	
		addOffset('idle', 0, 32);

		addOffset('singUP', -132, 32);
		addOffset('singRIGHT', 0, 32);
		addOffset('singLEFT', -216, 32);
		addOffset('singDOWN', 0, 32);
		
		addOffset('singUPmiss', -141, 32);
		addOffset('singRIGHTmiss', -21, 32);
		addOffset('singLEFTmiss', -231, 32);
		addOffset('singDOWNmiss', 0, 32);
		
		playAnim('idle');
		flipX = true;


		this.scale.x = 1.5;
		this.scale.y = 1.5;


	}
	
}
