package fmf.characters;

import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class AgotiSus extends Boyfriend
{

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/agoti/AGOTI', 'mods');

		var tex2 = Paths.getSparrowAtlas('pc/agoti/AGOTI_miss', 'mods');

		for (frame in tex2.frames)
		{
			tex.pushFrame(frame);
		}

		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Agoti_Idle', 24, false);
		animation.addByPrefix('singUP', 'Agoti_Up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Agoti_Right0', 24, false);
		animation.addByPrefix('singLEFT', 'Agoti_Left0', 24, false);
		animation.addByPrefix('singDOWN', 'Agoti_Down0', 24, false);

		animation.addByPrefix('singUPmiss', 'Agoti_Up MISS1', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Agoti_Right MISS1', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Agoti_Left MISS1', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Agoti_Down MISS1', 1, false);

	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
	
		addOffset('idle', 0, 150);

		addOffset('singUP', -37, 206);
		addOffset('singRIGHT', 201, 169);
		addOffset('singLEFT', 157, 117);
		addOffset('singDOWN', 91, -22);
		
		addOffset('singUPmiss', -37, 206);
		addOffset('singRIGHTmiss', 201, 169);
		addOffset('singLEFTmiss', 157, 117);
		addOffset('singDOWNmiss', 91, -22);
		
		playAnim('idle');
		flipX = false;

		// i dunno why i should do this, LOl
		dance();
		flipX = !flipX;

		// Doesn't flip for BF, since his are already in the right place???		{
		var oldRight = animation.getByName('singRIGHT').frames;
		animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
		animation.getByName('singLEFT').frames = oldRight;

		// IF THEY HAVE MISS ANIMATIONS??
		if (animation.getByName('singRIGHTmiss') != null)
		{
			var oldMiss = animation.getByName('singRIGHTmiss').frames;
			animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
			animation.getByName('singLEFTmiss').frames = oldMiss;
		}

		this.scale.x = 1.5;
		this.scale.y = 1.5;


	}
	
}
