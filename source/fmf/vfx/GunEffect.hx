package fmf.vfx;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSprite;

class GunEffect extends ConstellaEffect
{
	public override function getVFX(i:Int, vfx:FlxSprite)
	{
		switch (i)
		{
			case 0:
				vfx.loadGraphic(Paths.image(getEffectPath() + '/gun_l', 'mods'), true, 512, 512);

			case 1:
				vfx.loadGraphic(Paths.image(getEffectPath()  + '/gun_d', 'mods'), true, 512, 512);

			case 2:
				vfx.loadGraphic(Paths.image(getEffectPath()  + '/gun_u', 'mods'), true, 512, 512);

			case 3:
				vfx.loadGraphic(Paths.image(getEffectPath()  + '/gun_r', 'mods'), true, 512, 512);

		}

		vfx.ID = i; 
		vfx.animation.add('hit', getArray(getFrames()), 24, false);
		vfx.antialiasing = true;
		vfx.x -= 200;
		vfx.y -= 180;
		vfx.setGraphicSize(Std.int(vfx.width * 0.5));
	}
}