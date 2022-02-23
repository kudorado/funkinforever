package fmf.characters;
import state.*;
import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;
import fmf.songs.BenClown;

using StringTools;

class TikyBen extends TikyHell
{
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/tricky/tikyben', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		defaultCamZoom = gameState.defaultCamZoom;

		animation.addByPrefix('idle', 'Phase 3 Tricky Idle0', 24, false);
		animation.addByPrefix('singUP', 'Proper Up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Proper Right0', 24, false);
		animation.addByPrefix('singLEFT', 'Proper Left0', 24, false);
		animation.addByPrefix('singDOWN', 'Proper Down0', 24, false);

		animation.addByPrefix('singUPmiss', 'Proper Up MISS', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Proper Right MISS', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Proper Left MISS', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Proper Down MISS', 1, false);

	}

	private override function biggeTiky()
	{
		// this.scale.x = 4;
		// this.scale.y = 4;

		// this.x = largePos.x;
		// this.y = largePos.y;

		// gameState.targetCamFollow.y = this.getMidpoint().y + 250;
		// gameState.targetCamFollow.x = this.getMidpoint().x;

		// gameState.defaultCamZoom = 0.25;
	}
	

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
	
		addOffset('idle', 0, 79);

		addOffset('singUP', -2, -24);
		addOffset('singRIGHT', -1, 76);
		addOffset('singLEFT', -1, 59);
		addOffset('singDOWN', -2, 75);

		addOffset('singUPmiss', -2, -24);
		addOffset('singRIGHTmiss', -1, 76);
		addOffset('singLEFTmiss', -1, 59);
		addOffset('singDOWNmiss', -2, 75);



		playAnim('idle');
		flipX = true;


		this.scale.x = 4;
		this.scale.y = 4;


		clown = new BenClown();
		clown.createStaticBG();

	}


	override function noteEventBF(noteData:Note)
	{
		if (FlxG.random.bool(70) && !clown.spookyRendered && !noteData.isSustainNote) // create spooky text :flushed:
			clown.noteEvent(noteData, x, y + 100);
	}

	
}
