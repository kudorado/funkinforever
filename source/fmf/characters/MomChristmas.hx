package fmf.characters;
import state.*;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class MomChristmas extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/parents/mom', "mods");
		frames = tex;
	
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', "Parent Christmas Idle", 24, false);
		animation.addByPrefix('singUP', "Parent Up Note Mom0", 2, false);
		animation.addByPrefix('singDOWN', "Parent Down Note Mom0", 24, false);
		animation.addByPrefix('singLEFT', 'Parent Left Note Mom0', 24, false);
		animation.addByPrefix('singRIGHT', 'Parent Right Note Mom0', 24, false);

		animation.addByPrefix('singUPmiss', "Parent Up Note Mom MISS", 1, false);
		animation.addByPrefix('singDOWNmiss', "Parent Down Note Mom MISS", 1, false);
		animation.addByPrefix('singLEFTmiss', 'Parent Left Note Mom MISS', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Parent Right Note Mom MISS', 1, false);

	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -24, 104);
		
		addOffset("singUP", 207, 102);
		addOffset("singRIGHT", -18, 103);
		addOffset("singLEFT", 28, 96);
		addOffset("singDOWN", -17, 100);

		addOffset("singUPmiss", 207, 102);
		addOffset("singRIGHTmiss", -18, 103);
		addOffset("singLEFTmiss", 28, 96);
		addOffset("singDOWNmiss", -17, 100);


		playAnim('idle');
		flipX = true;

	}
	

}
