package fmf.characters;

import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class WhittySimp extends Boyfriend
{

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/date/whitty_assets', 'mods');

		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Whitty idle0', 24, false);
		animation.addByPrefix('singUP', 'Whitty up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Whitty down0', 24, false);
		animation.addByPrefix('singLEFT', 'Whitty left0', 24, false);
		animation.addByPrefix('singDOWN', 'Whitty down0', 24, false);

		animation.addByPrefix('singUP-alt', 'Whitty up0', 24, false);
		animation.addByPrefix('singRIGHT-alt', 'Whitty down0', 24, false);
		animation.addByPrefix('singLEFT-alt', 'Whitty left0', 24, false);
		animation.addByPrefix('singDOWN-alt', 'Whitty down0', 24, false);
		
		animation.addByPrefix('singUPmiss', 'Whitty miss up0', 24, false);
		animation.addByPrefix('singRIGHTmiss', 'Whitty miss down0', 24, false);
		animation.addByPrefix('singLEFTmiss', 'Whitty miss left0', 24, false);
		animation.addByPrefix('singDOWNmiss', 'Whitty miss down0', 24, false);


	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
	
		addOffset('idle', 0, 0);

		addOffset('singUP', 0, 0);
		addOffset('singRIGHT', 0, 0);
		addOffset('singLEFT', 0, 0);
		addOffset('singDOWN', 0, 0);
		
		addOffset('singUPmiss', 0, 0);
		addOffset('singRIGHTmiss',-28, -49);
		addOffset('singLEFTmiss', 0, 0);
		addOffset('singDOWNmiss', -28, -49);
		
		playAnim('idle');
		flipX = false;



	}
	
}
