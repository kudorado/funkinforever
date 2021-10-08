package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class Littleman extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/littleman/Small_Guy', 'mods');

		var tex2 = Paths.getSparrowAtlas('pc/littleman/Small_Guy_miss', 'mods');

		for (frame in tex2.frames){
			tex.pushFrame(frame);
		}
		
		frames = tex;
		
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'idle0', 24, false);
		animation.addByPrefix('singUP', 'up0', 24, false);
		animation.addByPrefix('singRIGHT', 'left0', 24, false);
		animation.addByPrefix('singLEFT', 'right0', 24, false);
		animation.addByPrefix('singDOWN', 'down0', 24, false);

		animation.addByPrefix('singUPmiss', 'up_miss', 24, false);
		animation.addByPrefix('singLEFTmiss', 'left_miss', 24, false);
		animation.addByPrefix('singRIGHTmiss', 'right_miss', 24, false);
		animation.addByPrefix('singDOWNmiss', 'down_miss', 24, false);

	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -7, -2);
		addOffset("singUP", -15, 4);
		addOffset("singRIGHT", -6, -1);
		addOffset("singLEFT", -16, -3);
		addOffset("singDOWN", -14, -8);

		addOffset("singUPmiss", -15, 4);
		addOffset("singRIGHTmiss", -16, -3);
		addOffset("singLEFTmiss", -6, -1);
		addOffset("singDOWNmiss", -14, -8);

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

		this.scale.x = 0.85;
		this.scale.y = 0.85;
	}

}
