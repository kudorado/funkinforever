package fmf.vfx;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSprite;

class HoleEffect extends MadEffect
{


	private override function getEffectPath():String
	{
		return  'note_effects/hole';
	}

	public override function getVFX(i:Int, vfx:FlxSprite)
	{
		switch (i)
		{
			case 0:
				vfx.loadGraphic(Paths.image(getEffectPath() + '/left', 'mods'), true, 256, 256);

			case 1:
				vfx.loadGraphic(Paths.image(getEffectPath()  + '/down', 'mods'), true, 256, 256);

			case 2:
				vfx.loadGraphic(Paths.image(getEffectPath()  + '/up', 'mods'), true, 256, 256);

			case 3:
				vfx.loadGraphic(Paths.image(getEffectPath()  + '/right', 'mods'), true, 256, 256);

		}

		vfx.ID = i;
		vfx.animation.add('hit', getArray(58), 90, false);

		vfx.x -= 75;
		vfx.y -= 75;

		vfx.antialiasing = true;
		vfx.setGraphicSize(Std.int(vfx.width * 2));
	}
}