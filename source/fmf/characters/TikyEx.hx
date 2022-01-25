package fmf.characters;
import state.*;
import fmf.songs.TrickyMask;
import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;
import fmf.songs.ExClown;

using StringTools;

class TikyEx extends TikyMask
{
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/trickyex/extiky', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Idle', 18, false);
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
	
		addOffset('idle', 0, 0);
		addOffset('singUP', 40, 0);
		addOffset('singRIGHT', 80, 0); 
		addOffset('singLEFT', 190, 0);
		addOffset('singDOWN', 107, 0);

		addOffset('singUPmiss', 40, 0);
		addOffset('singRIGHTmiss', 80, 0); 
		addOffset('singLEFTmiss', 190, 0);
		addOffset('singDOWNmiss', 107, 0);

		playAnim('idle');
		flipX = true;

		clown = new ExClown();
		clown.createStaticBG();

	}

	override function characterCreatedEvent()
	{
		var hole = new FlxSprite(0, 0).loadGraphic(Paths.image('bg/clown/fourth/Spawnhole_Ground_BACK', 'mods'));
		hole.antialiasing = true;
		hole.x = this.x;
		hole.y = this.y + 500;
		hole.flipX = true;

		hole.scale.y = 1.5;
		hole.scale.x = 1;
		gameState.add(hole);
	}

	override function noteEventBF(noteData:Note)
	{
		if (FlxG.random.bool(60) && !clown.spookyRendered && !noteData.isSustainNote) // create spooky text :flushed:
			clown.noteEvent(noteData, x - 300, y - 50);
	}
	

	
}
