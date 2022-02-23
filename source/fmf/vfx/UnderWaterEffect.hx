package fmf.vfx;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSprite;

class UnderWaterEffect extends AfterRainEffect
{
	public override function getVFX(i:Int, vfx:FlxSprite)
	{
		vfx.loadGraphic(Paths.image(getEffectPath()  + '/underwater', 'mods'), true, 512, 512);

		vfx.ID = i; 
		vfx.animation.add('hit', getArray(getFrames()), 24, false);
		vfx.antialiasing = true;
		vfx.x -= 200;
		vfx.y -= 200;
		vfx.setGraphicSize(Std.int(vfx.width * 0.5));
	}
}