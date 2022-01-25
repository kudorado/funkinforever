package fmf.characters;
import state.*;
import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class WhittySimpDance extends Boyfriend
{

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/date/whitty_dance', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{

		animation.addByPrefix('singUP', 'Whitty dance up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Whitty dance right0', 24, false);
		animation.addByPrefix('singLEFT', 'Whitty dance left0', 24, false);
		animation.addByPrefix('singDOWN', 'Whitty dance down0', 24, false);

		animation.addByPrefix('singUP-alt', 'Whitty dance up0', 24, false);
		animation.addByPrefix('singRIGHT-alt', 'Whitty dance right0', 24, false);
		animation.addByPrefix('singLEFT-alt', 'Whitty dance left0', 24, false);
		animation.addByPrefix('singDOWN-alt', 'Whitty dance down0', 24, false);

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
		
		playAnim('singUP');
		flipX = false;



	}
	
}
