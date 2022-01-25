package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class GF extends CharacterES
{
	override function debugName():String
	{
		return "gf";
	}

	override function dance():Void
	{
		if (animation.curAnim == null ||  !animation.curAnim.name.startsWith('hair'))
		{
			if (animation.curAnim != null && !animation.curAnim.finished)
				return;

			danced = !danced;
			playAnim('idle');
			
			if (danced)
				playAnim('danceRight');
			else
				playAnim('danceLeft');
		}
	}


	public override function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		super.playAnim(AnimName, Force, Reversed, Frame);
	
		if (AnimName == 'singLEFT')
		{
			danced = true;
		}
		else if (AnimName == 'singRIGHT')
		{
			danced = false;
		}

		if (AnimName == 'singUP' || AnimName == 'singDOWN')
		{
			danced = !danced;
		}
	}


}
