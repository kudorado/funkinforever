package fmf.vfx;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSprite;

class NuclearEffect extends MadEffect
{

	override function getEffectPath():String
	{
		return  'note_effects/nuclear';
	}

	override function getFrames():Int
	{
		return 60;
	}

	public override function getVFX(i:Int, vfx:FlxSprite)
	{
		
		vfx.loadGraphic(Paths.image(getEffectPath()  + '/shit', 'mods'), true, 256, 256);

		vfx.ID = i; 
		vfx.animation.add('hit', getArray(getFrames()), 60, false);

		vfx.x -= 75;
		vfx.y -= 75;

		vfx.antialiasing = true;
		vfx.setGraphicSize(Std.int(vfx.width * 1));
	}
}