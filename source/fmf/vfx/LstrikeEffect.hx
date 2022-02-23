package fmf.vfx;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSprite;

class LstrikeEffect extends ConstellaEffect
{
	public override function getVFX(i:Int, vfx:FlxSprite)
	{
		switch (i)
		{
			case 0:
				vfx.loadGraphic(Paths.image(getEffectPath() + '/lstrike_l', 'mods'), true, 256, 256);

			case 1:
				vfx.loadGraphic(Paths.image(getEffectPath()  + '/lstrike_d', 'mods'), true, 256, 256);

			case 2:
				vfx.loadGraphic(Paths.image(getEffectPath()  + '/lstrike_u', 'mods'), true, 256, 256);
				vfx.x -= 10;
			case 3:
				vfx.loadGraphic(Paths.image(getEffectPath()  + '/lstrike_r', 'mods'), true, 256, 256);

		}

		vfx.ID = i; 
		vfx.animation.add('hit', getArray(getFrames()), 24, false);
		vfx.antialiasing = true;
		vfx.x -= 70;
		vfx.y -= 70;
		vfx.setGraphicSize(Std.int(vfx.width * 0.6));
	}
}