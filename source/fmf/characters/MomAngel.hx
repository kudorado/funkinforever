package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class MomAngel extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/momangel/mom', "mods");
		frames = tex;
	
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', "Mom Idle", 24, false);
		animation.addByPrefix('singUP', "Mom Up Pose0", 24, false);
		animation.addByPrefix('singDOWN', "MOM DOWN POSE0", 24, false);
		animation.addByPrefix('singLEFT', 'Mom Left Pose0', 24, false);
		animation.addByPrefix('singRIGHT', 'Mom Pose Left0', 24, false);


		animation.addByPrefix('singUPmiss', 'Mom Up Pose MISS', 1, false);
		animation.addByPrefix('singRIGHTmiss',  'Mom Pose Left MISS', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Mom Left Pose MISS', 1, false);
		animation.addByPrefix('singDOWNmiss', 'MOM DOWN POSE MISS', 1, false);

	}

	override function noteEventBF(noteData:Note)
	{
		super.noteEventBF(noteData);
		playState.targetCamFollow.y = this.getMidpoint().y - 250;

	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -24, 104);

		addOffset("singUP", 19, 112);
		addOffset("singRIGHT", 119, 108);
		addOffset("singLEFT", 50, 106);
		addOffset("singDOWN", 145, 99);

		addOffset("singUPmiss", 19, 112);
		addOffset("singRIGHTmiss", 119, 108);
		addOffset("singLEFTmiss", 50, 106);
		addOffset("singDOWNmiss", 145, 99);



		playAnim('idle');
		flipX = true;

	}
	

}
