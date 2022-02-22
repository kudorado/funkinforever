package fmf.vfx;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSprite;

class CyberEffect extends MadEffect
{

	override function getEffectPath():String
	{
		return  'note_effects/shuriken';
	}

	override function getFrames():Int
	{
		return 16;
	}

	public override function getVFX(i:Int, vfx:FlxSprite)
	{
		
		vfx.loadGraphic(Paths.image(getEffectPath()  + '/cyber', 'mods'), true, 512, 512);

		vfx.ID = i; 
		vfx.animation.add('hit', getArray(getFrames()), 24, false);

		vfx.antialiasing = true;
		vfx.setGraphicSize(Std.int(vfx.width * 0.65));
		vfx.x -= 200;
		vfx.y -= 180;

	}
}