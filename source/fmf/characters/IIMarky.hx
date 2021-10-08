package fmf.characters;

import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class IIMarky extends Boyfriend
{
	var whiteBG:FlxSprite;
	private var defaultCamZoom:Float;

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/iimarky/iimarky', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		defaultCamZoom = playState.defaultCamZoom;

		animation.addByPrefix('idle', 'BF idle dance', 24, false);
		animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
		animation.addByPrefix('singRIGHT', 'BF NOTE LEFT0', 24, false);
		animation.addByPrefix('singLEFT', 'BF NOTE RIGHT0', 24, false);
		animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
		animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
		animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
		animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
		animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
		animation.addByPrefix('hey', 'BF HEY', 24, false);
		animation.addByPrefix('scared', 'BF idle shaking', 24);

		heyable = true;
	}
	
	override function noteEventBF(noteData:Note)
	{
		playState.defaultCamZoom = 1.1;
		whiteBG.color = FlxColor.BLACK;

		
		if(whiteBG.alpha <= 0)
			FlxTween.tween(whiteBG, {alpha: 1}, 0.5, {});

		super.noteEventBF(noteData);
	}

	override function noteEventDad(noteData:Note)
	{
		if (playState.bfTurn)
			return;

		if(whiteBG.alpha > 0)
			FlxTween.tween(whiteBG, {alpha: 0}, whiteBG.alpha, {});


		playState.defaultCamZoom = defaultCamZoom;
		super.noteEventDad(noteData);
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -7, -2);
		addOffset("singUP", -46, -2);
		addOffset("singRIGHT", -46, -1);
		addOffset("singLEFT", -1, -20);
		addOffset("singDOWN", -15, -44);

		addOffset("singUPmiss", -46, -2);
		addOffset("singRIGHTmiss", -46, -1);
		addOffset("singLEFTmiss", -1, -20);
		addOffset("singDOWNmiss", -15, -44);

		addOffset("hey", -7, -2);
		addOffset('scared', -7, -2);

		playAnim('idle');
		flipX = true;

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

		this.scale.x = 0.85;
		this.scale.y = 0.85;
	}

	override function characterAddedEvent()
	{
		whiteBG = new FlxSprite(-600, -200).makeGraphic(FlxG.width * 2, FlxG.height * 2, FlxColor.WHITE);

		whiteBG.antialiasing = true;
		whiteBG.scrollFactor.set(0.9, 0.9);
		whiteBG.alpha = 0;
		whiteBG.screenCenter(X);

		playState.remove(this);
		playState.add(whiteBG);

		playState.add(this);

	}

}
