package fmf.vfx;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSprite;

class DemonEffect extends MadEffect
{
	private override function getEffectPath():String
	{
		return 'note_effects/demon';
	}

	override function getFrames():Int
	{
		return 60;
	}

	override function getFPS():Int
	{
		return 90;
	}

	public override function getVFX(i:Int, vfx:FlxSprite)
	{
		super.getVFX(i, vfx);
		vfx.setGraphicSize(Std.int(vfx.width * 1.25));

		vfx.cameras = [PlayState.instance.camGame];
		vfx.x =  -75 + (PlayState.boyfriend().x + i * 50);
		vfx.y = PlayState.boyfriend().y;

		PlayState.instance.remove(PlayState.boyfriend());
		PlayState.instance.add(PlayState.boyfriend());

	}
}