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
		vfx.antialiasing = true;
		vfx.x -= 200;
		vfx.y -= 180;
		vfx.setGraphicSize(Std.int(vfx.width * 0.65));
	

	
	
	}
}