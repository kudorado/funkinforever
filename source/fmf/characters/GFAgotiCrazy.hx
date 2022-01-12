package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class GFAgotiCrazy extends Character
{
	override function debugName():String
	{
		return "gf";
	}

	override function dance():Void
	{
		playAnim('hairBlow');
	}


	public override function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		super.playAnim(AnimName, Force, Reversed, Frame);
	}


}
