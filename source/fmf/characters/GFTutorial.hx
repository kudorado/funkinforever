package fmf.characters;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class GFTutorial extends Character
{
	override function dance():Void
	{
		playAnim('idle');
	}

	override function update(elapsed:Float)
	{
		if (PlayState.playAsDad)
		{
			bfBehaviour(elapsed);
		}
		else
		{
			dadBehaviour(elapsed);
		}
		super.update(elapsed);
	}

	private function bfBehaviour(elapsed:Float)
	{
		if (animation == null || animation.curAnim == null || animation.curAnim.name == null)
			return;

		if (animation.curAnim.name.startsWith('sing'))
		{
			holdTimer += elapsed;
		}
		else
			holdTimer = 0;

		if (animation.curAnim.name.endsWith('miss') && animation.curAnim.finished && !debugMode)
		{
			playAnim('idle', true, false, 10);
		}

		if (animation.curAnim.name.startsWith('sing'))
		{
			holdTimer += elapsed;
		}
	}

	private function dadBehaviour(elapsed:Float)
	{
		if (animation == null || animation.curAnim == null || animation.curAnim.name == null)
			return;

		if (animation.curAnim.name.startsWith('sing'))
		{
			holdTimer += elapsed;
		}

		var dadVar:Float = 6.1;

		if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
		{
			dance();
			holdTimer = 0;
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
