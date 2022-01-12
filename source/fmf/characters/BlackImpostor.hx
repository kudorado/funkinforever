package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class BlackImpostor extends Dad
{


	override function bfBehaviour(elapsed:Float)
	{
		// no anim
	}

	override function dadBehaviour(elapsed:Float)
	{
	}

	public override function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		if (isLockAnim)
			return;

		if (!isVisible)
			return;

	}
}
