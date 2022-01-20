package fmf.vfx;

import state.*;
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

		vfx.cameras = [GameState.instance.camGame];
		vfx.x =  -75 + (GameState.boyfriend().x + i * 50);
		vfx.y = GameState.boyfriend().y;

		GameState.instance.remove(GameState.boyfriend());
		GameState.instance.add(GameState.boyfriend());

	}
}