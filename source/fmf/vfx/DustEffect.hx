package fmf.vfx;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSprite;

class DustEffect extends MadEffect
{


	private override function getEffectPath():String
	{
		return  'note_effects/dust';
	}

	public override function getVFX(i:Int, vfx:FlxSprite)
	{
		vfx.loadGraphic(Paths.image(getEffectPath() + '/lit', 'mods'), true, 256, 256);

		vfx.ID = i;
		vfx.animation.add('hit', getArray(60), 90, false);

		vfx.x -= 75;
		vfx.y -= 75;

		vfx.antialiasing = true;
		vfx.setGraphicSize(Std.int(vfx.width * 1.5));
	}
}