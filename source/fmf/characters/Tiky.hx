package fmf.characters;

import fmf.songs.Clown;
import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class Tiky extends TikyMask
{
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/tricky/tikyangry', 'mods');
		var tex2 = Paths.getSparrowAtlas('pc/tricky/tikyangry_miss', 'mods');

		for (frame in tex2.frames)
		{
			tex.pushFrame(frame);
		}
		
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Idle instance 10', 24, false);
		animation.addByPrefix('singUP', 'Sing Up instance 10', 24, false);
		animation.addByPrefix('singRIGHT', 'Sing Right instance 10', 24, false);
		animation.addByPrefix('singLEFT', 'Sing Left instance 10', 24, false);
		animation.addByPrefix('singDOWN', 'Sing Down instance 10', 24, false);

		animation.addByPrefix('singUPmiss', 'Sing Up instance MISS', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Sing Right instance MISS', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Sing Left instance MISS', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Sing Down instance MISS', 1, false);
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{

		this.flipX = true;

		addOffset('idle', 0, 4);
		addOffset('singUP', -70, -1);
		addOffset('singRIGHT', 160, -64); 
		addOffset('singLEFT', -3, 0);
		addOffset('singDOWN', 45, -12);
	
		addOffset('singUPmiss', -70, -1);
		addOffset('singRIGHTmiss', 160, -64); 
		addOffset('singLEFTmiss', -3, 0);
		addOffset('singDOWNmiss', 45, -12);

		playAnim('idle');

		this.scale.y = 2;
		this.scale.x = 2;

		clown = new Clown();
		clown.createStaticBG();

	}

	override function noteEventBF(noteData:Note)
	{
		if (FlxG.random.bool(20) && !clown.spookyRendered && !noteData.isSustainNote) // create spooky text :flushed:
			clown.noteEvent(noteData, x - 300, y - 200);
	}


	
}
