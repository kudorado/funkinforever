package fmf.characters;
import state.*;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class GFSus extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/playablegf/playableGF', "mods");
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
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
	}


	override function noteEventBF(noteData:Note)
	{
		super.noteEventBF(noteData);
		gamePlayState.targetCamFollow.y = this.getMidpoint().y - 150;
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{

		addOffset('idle', 0, 0);
		addOffset("singUP", -45, 0);
		addOffset("singRIGHT", 7, 0);
		addOffset("singLEFT", -42, 0);
		addOffset("singDOWN", 7, 0);

		addOffset("singUPmiss", -45, 0);
		addOffset("singRIGHTmiss", -46, 0);
		addOffset("singLEFTmiss", 5, 0);
		addOffset("singDOWNmiss", 4, 0);

		addOffset("hey", -23, 0);
		addOffset('scared', 0, 0);

		playAnim('idle');

		flipX = false;
		
	}
	

}
