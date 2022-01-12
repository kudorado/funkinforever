package fmf.characters;
import state.*;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class DadAngel extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/dadangel/dad', "mods");

		frames = tex;

	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', "Dad idle dance", 24, false);
		animation.addByPrefix('singUP', "Dad Sing Note UP0", 24, false);
		animation.addByPrefix('singDOWN', "Dad Sing Note DOWN0", 24, false);
		animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT0', 24, false);
		animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT0', 24, false);

		animation.addByPrefix('singUPmiss', "Dad Sing Note UP MISS", 1, false);
		animation.addByPrefix('singDOWNmiss', "Dad Sing Note DOWN MISS", 1, false);
		animation.addByPrefix('singLEFTmiss', 'Dad Sing Note LEFT MISS', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Dad Sing Note RIGHT MISS', 1, false);


	}


	override function noteEventBF(noteData:Note)
	{
		super.noteEventBF(noteData);
		gamePlayState.targetCamFollow.y = this.getMidpoint().y - 150;
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -5, 28);
		addOffset("singUP", -38, 29);
		addOffset("singRIGHT", -5, 29);
		addOffset("singLEFT", -4, 30);
		addOffset("singDOWN", -5, 30);

		addOffset("singUPmiss", -38, 29);
		addOffset("singRIGHTmiss", -5, 29);
		addOffset("singLEFTmiss", -4, 30);
		addOffset("singDOWNmiss", -5, 30);


		playAnim('idle');

		flipX = true;


		
	}
	

}
