package fmf.characters;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Dad extends Character
{

	override function update(elapsed:Float)
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

		super.update(elapsed);
	}


}
