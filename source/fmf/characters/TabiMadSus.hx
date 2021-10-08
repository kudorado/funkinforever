package fmf.characters;

import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class TabiMadSus extends Boyfriend
{

	var trail:FlxTrail;

	private var defaultCamZoom:Float;

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/tabimad/MadTabi', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		defaultCamZoom = playState.defaultCamZoom;

		animation.addByPrefix('idle', 'MadTabiIdle', 24, false);

		animation.addByPrefix('singUP', 'MadTabiUp0', 24, false);
		animation.addByPrefix('singDOWN', 'MadTabiDown0', 24, false);
		animation.addByPrefix('singLEFT', 'MadTabiLeft0', 24, false);
		animation.addByPrefix('singRIGHT', 'MadTabiRight0', 24, false);

		animation.addByPrefix('singUPmiss', 'MadTabiUp MISS', 1, false);
		animation.addByPrefix('singLEFTmiss', 'MadTabiDown MISS', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'MadTabiRight MISS', 1, false);
		animation.addByPrefix('singDOWNmiss', 'MadTabiDown MISS', 1, false);
	}

	override function noteEventBF(noteData:Note)
	{
		if (playState.curBeat % 6 == 0)
		{
			playState.defaultCamZoom = 1.15;
			playState.shakeGenocide();

			if (FlxG.save.data.distractions)
			{
				trail.visible = true;
			}
		}
		else
		{
			playState.defaultCamZoom = 0.95;
			playState.shakePrettyBig();

			if (FlxG.save.data.distractions)	
				trail.visible = false;
		}
	}

	override function noteEventDad(noteData:Note)
	{
		playState.defaultCamZoom = defaultCamZoom;
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
	
		addOffset('idle', 2, -14);

		addOffset("singUP", 32, -19);
		addOffset("singRIGHT", -4, -13);
		addOffset("singLEFT", 60, -19);
		addOffset("singDOWN", -30, -25);

		addOffset("singUPmiss", 32, -19);
		addOffset("singRIGHTmiss", -4, -13);
		addOffset("singLEFTmiss", 60, -19);
		addOffset("singDOWNmiss", -30, -25);

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

		createTrail();
	}

	private function createTrail()
	{
		if (FlxG.save.data.distractions)
		{
			trail = new FlxTrail(this, null, 1, 12, 0.85, 0.069);
			trail.color = FlxColor.RED;

			playState.add(trail);
			trail.visible = false;
		}
	}
}
