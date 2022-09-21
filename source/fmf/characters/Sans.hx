package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Sans extends Character
{
	override function dance():Void
	{
		danced = !danced;

		if (danced)
		{
			playAnim('idleRight' + idleSuffix);
		}
		else
		{
			playAnim('idleLeft' + idleSuffix);
		}
	}

}
