package fmf.vfx;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSprite;

class BloodHitEffect extends MadEffect
{

	override function getEffectPath():String
	{
		return  'note_effects/bloodhit';
	}

	override function getFrames():Int
	{
		return 63;
	}

	public override function getVFX(i:Int, vfx:FlxSprite)
	{
		
		vfx.loadGraphic(Paths.image(getEffectPath()  + '/bloodhit', 'mods'), true, 512, 512);

		vfx.ID = i; 
		vfx.animation.add('hit', getArray(getFrames()), 24, false);

		vfx.x -= 75;
		vfx.y -= 125;

		vfx.antialiasing = true;
		vfx.setGraphicSize(Std.int(vfx.width * 0.65));

		switch (i)
		{
			case 0: //left
				vfx.angle = -90;
				vfx.y += 50;
				vfx.x -= 25;
			
			
			case 1://down
				vfx.angle = 180;
				vfx.y += 75;

			case 2://up
				vfx.y += 25;

			case 3://right
				vfx.angle = 90;
				vfx.y += 50;
				vfx.x += 25;

		}
	}
}