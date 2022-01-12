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
		defaultCamZoom = gamePlayState.defaultCamZoom;

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
		if (gamePlayState.curBeat % 6 == 0)
		{
			gamePlayState.defaultCamZoom = 1.15;
			gamePlayState.shakeGenocide();

			if (FlxG.save.data.distractions)
			{
				trail.visible = true;
			}
		}
		else
		{
			gamePlayState.defaultCamZoom = 0.95;
			gamePlayState.shakePrettyBig();

			if (FlxG.save.data.distractions)	
				trail.visible = false;
		}
	}

	override function noteEventDad(noteData:Note)
	{
		gamePlayState.defaultCamZoom = defaultCamZoom;
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
		flipX = true;


		createTrail();
	}

	private function createTrail()
	{
		if (FlxG.save.data.distractions)
		{
			trail = new FlxTrail(this, null, 1, 12, 0.85, 0.069);
			trail.color = FlxColor.RED;

			gamePlayState.add(trail);
			trail.visible = false;
		}
	}
}
