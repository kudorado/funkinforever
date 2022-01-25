package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class LuciSarvSus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc/lucisarv/luci_sarv', 'mods');

		var tex2 = Paths.getSparrowAtlas('pc/lucisarv/luci_sarv_miss', 'mods');

		for (frame in tex2.frames)
		{
			tex.pushFrame(frame);
		}

		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', "LuciferSarvIdle0", 24, false);
		animation.addByPrefix('singUP', "LuciferSarvUp0", 24, false);
		animation.addByPrefix('singDOWN', "LuciferSarvDown0", 24, false);
		animation.addByPrefix('singLEFT', 'LuciferSarvLeft0', 24, false);
		animation.addByPrefix('singRIGHT', 'LuciferSarvRight0', 24, false);
		
		dance();
	}

	var counter:Float;
	var direction:Float = 1;

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		y += Math.sin(200) * direction;
		counter += elapsed;
		if (counter >= 2.5)
		{
			direction *= -1;
			counter = 0;
		}

	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset("idle", 0, 0);

		addOffset("singUP", 0, 0);
		addOffset("singDOWN", 0, 0);
		addOffset("singLEFT", 0, 0);
		addOffset("singRIGHT", 0, 0);

		flipX = true;
	}
	

}
