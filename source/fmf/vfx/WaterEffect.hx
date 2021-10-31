package fmf.vfx;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSprite;

class WaterEffect extends MadEffect
{
	private override function getEffectPath():String
	{
		return 'note_effects/water';
	}

	override function getFrames()
	{
		return 64;
	}

	public override function getVFX(i:Int, vfx:FlxSprite)
	{
		super.getVFX(i, vfx);
		vfx.setGraphicSize(Std.int(vfx.width * 1.25));

	}
}