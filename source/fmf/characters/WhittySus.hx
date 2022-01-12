package fmf.characters;
import state.*;
import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class WhittySus extends Boyfriend
{

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/whitty/WhittySprites', 'mods');

		var tex2 = Paths.getSparrowAtlas('pc/whitty/WhittySprites_miss', 'mods');

		for (frame in tex2.frames)
		{
			tex.pushFrame(frame);
		}

		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Idle', 24, false);
		animation.addByPrefix('singUP', 'Sing Up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Sing Right0', 24, false);
		animation.addByPrefix('singLEFT', 'Sing Left0', 24, false);
		animation.addByPrefix('singDOWN', 'Sing Down0', 24, false);

		animation.addByPrefix('singUPmiss', 'Sing Up MISS', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Sing Right MISS', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Sing Left MISS', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Sing Down MISS', 1, false);

	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
	
		addOffset('idle', -63, 1);
		addOffset('singUP', -87, 48);
		addOffset('singRIGHT', -31, 27);
		addOffset('singLEFT', -146, -20);
		addOffset('singDOWN', -120, -40);
		
		addOffset('singUPmiss', -87, 48);
		addOffset('singRIGHTmiss', -31, 27);
		addOffset('singLEFTmiss', -146, -20);
		addOffset('singDOWNmiss', -120, -40);
		
		playAnim('idle');
		flipX = true;


	}
	
}
