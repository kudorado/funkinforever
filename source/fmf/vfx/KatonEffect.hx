package fmf.vfx;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSprite;

class KatonEffect extends MadEffect
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
		
		vfx.loadGraphic(Paths.image(getEffectPath()  + '/katon', 'mods'), true, 512, 512);

		vfx.ID = i; 
		vfx.animation.add('hit', getArray(getFrames()), 24, false);


		vfx.x -= 200;
		vfx.x -= 180;
		
		vfx.antialiasing = true;
		vfx.setGraphicSize(Std.int(vfx.width * 1));
		
		switch (i)
		{
			case 0: // left
				// vfx.x = 211;
				// vfx.y = 360;

			case 1: // down
				// vfx.x = 332;
				// vfx.y = 360;
			case 2: // up
				// vfx.x = 447;
			// vfx.y = 360;

			case 3: // right
				// vfx.x = 560;
				// vfx.y = 360;
		}

	}
}