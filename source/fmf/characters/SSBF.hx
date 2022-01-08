package fmf.characters;

import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class SSBF extends Boyfriend
{

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/sonic/SSBF_Assets', 'mods');

		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'SSBF IDLE instance 100', 24, false);
		animation.addByPrefix('singUP', 'SSBF UP instance', 24, false);
		animation.addByPrefix('singRIGHT', 'SSBF RIGHT instance', 24, false);
		animation.addByPrefix('singLEFT', 'SSBF LEFT instance 100', 24, false);
		animation.addByPrefix('singDOWN', 'SSBF DOWN instance', 24, false);

		animation.addByPrefix('singUPmiss', 'SSBF UPmiss instance', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'SSBF RIGHTmiss instance', 1, false);
		animation.addByPrefix('singLEFTmiss', 'SSBF LEFTmiss instance', 1, false);
		animation.addByPrefix('singDOWNmiss', 'SSBF DOWNmiss instance', 1, false);

	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
	
		addOffset('idle', 0, 0);

		addOffset('singUP', -0, 0);
		addOffset('singRIGHT', 0, 0);
		addOffset('singLEFT', -0, 0);
		addOffset('singDOWN', 0, 0);
		
		addOffset('singUPmiss', -0, 0);
		addOffset('singRIGHTmiss', -0, 0);
		addOffset('singLEFTmiss', -0, 0);
		addOffset('singDOWNmiss', 0, 0);
		
		playAnim('idle');
		flipX = true;


		this.scale.x = 2;
		this.scale.y = 2;


	}
	
}
