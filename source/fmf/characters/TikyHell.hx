package fmf.characters;

import fmf.songs.HellClown;
import flixel.math.FlxPoint;
import fmf.songs.Clown;
import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class TikyHell extends TikyMask
{
	private var defaultCamZoom:Float;
	private var miniPos:FlxPoint;
	private var largePos:FlxPoint;

	//pretent zoom in-out very faste
	private var smolFrame:Int = 5;
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/trickyhell/tiky', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		defaultCamZoom = playState.defaultCamZoom;

		animation.addByPrefix('idle', 'Idle', 24, false);
		animation.addByPrefix('singUP', 'Proper Up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Proper Right0', 24, false);
		animation.addByPrefix('singLEFT', 'Proper Left0', 24, false);
		animation.addByPrefix('singDOWN', 'Proper Down0', 24, false);

		animation.addByPrefix('singUPmiss', 'Proper Up MISS', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Proper Right MISS', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Proper Left MISS', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Proper Down MISS', 1, false);
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, 0);
		addOffset('singUP', -153, -248);
		addOffset('singRIGHT', -50, 0);
		addOffset('singLEFT', -17, 0);
		addOffset('singDOWN', -70, 70);

		addOffset('singUPmiss', -153, -248);
		addOffset('singRIGHTmiss', -50, 0);
		addOffset('singLEFTmiss', -17, 0);
		addOffset('singDOWNmiss', -70, 70);

		playAnim('idle');
		flipX = true;

		this.scale.x = 4;
		this.scale.y = 4;

		clown = new HellClown();
		clown.createStaticBG();
	}

	public override function characterCreatedEvent()
	{
		largePos = new FlxPoint(this.x, this.y);
		miniPos = new FlxPoint(this.x - 350, this.y + 300);

		smolTiky();
	}

	override function noteEventBF(noteData:Note)
	{
		smolFrame ++;

		if (FlxG.random.bool(45) && !clown.spookyRendered && !noteData.isSustainNote) // create spooky text :flushed:
			clown.noteEvent(noteData, x - 300, y - 200);

		biggeTiky();
	}


	override function noteEventDad(noteData:Note)
	{
		if (playState.bfTurn)
		{
			smolFrame = 0;
			return;
		}

		if (smolFrame < 2)
		{
			smolFrame ++;
			return;
		}

		smolTiky();
		playState.defaultCamZoom = defaultCamZoom;
	}

	private function biggeTiky()
	{
		this.scale.x = 4;
		this.scale.y = 4;

		this.x = largePos.x;
		this.y = largePos.y;

		playState.targetCamFollow.y = this.getMidpoint().y + 250;
		playState.targetCamFollow.x = this.getMidpoint().x;

		playState.defaultCamZoom = 0.4;
	}

	private function smolTiky()
	{
		smolFrame = 0;
		this.scale.x = 1;
		this.scale.y = 1;
		
		this.x = miniPos.x;
		this.y = miniPos.y;
	}
}
