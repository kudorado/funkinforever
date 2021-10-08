package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class Anchor extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/anchor/anchorAssets', "mods");
		var tex2 = Paths.getSparrowAtlas('pc/anchor/anchorAssets_miss', 'mods');

		for (frame in tex2.frames)
		{
			tex.pushFrame(frame);
		}

		frames = tex;	
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', "Anchor Idle0", 24, false);
		animation.addByPrefix('singUP', "Anchor Up Pose0", 24, false);
		animation.addByPrefix('singDOWN', "Anchor DOWN POSE0", 24, false);
		animation.addByPrefix('singLEFT', 'Anchor Left Pose0', 24, false);
		animation.addByPrefix('singRIGHT', 'Anchor Pose Left0', 24, false);

		animation.addByPrefix('singUPmiss', "Anchor Up Pose MISS0", 1, false);
		animation.addByPrefix('singDOWNmiss', "Anchor DOWN POSE MISS0", 1, false);
		animation.addByPrefix('singLEFTmiss', 'Anchor Left Pose MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Anchor Pose Left MISS0', 1, false);

	}

	override function noteEventBF(noteData:Note)
	{
		super.noteEventBF(noteData);
		playState.camFollow.y = this.getMidpoint().y - 250;

	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -24, 104);

		addOffset("singUP", -115, 120);
		addOffset("singRIGHT", 7, 113);
		addOffset("singLEFT", -137, 116);
		addOffset("singDOWN", -7, 139);

		
		addOffset("singUPmiss", -115, 120);
		addOffset("singRIGHTmiss", 7, 113);
		addOffset("singLEFTmiss", -137, 116);
		addOffset("singDOWNmiss", -7, 139);



		playAnim('idle');
		flipX = true;

	}
	

}
