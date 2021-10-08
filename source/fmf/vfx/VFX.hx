package fmf.vfx;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSprite;

class VFX
{

	public var label:String;
	public function new(skin:String = 'none')
	{
        this.label = skin;
    }

	private function getVFXTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_effects/default/noteSplashes', 'mods');
    }
	// get vfx depending on selection & song
	public function getVFX(i:Int, vfx:FlxSprite)
	{
        vfx.frames = getVFXTex();

		vfx.ID = i;

		switch (i)
		{
			case 0:
				vfx.animation.addByPrefix('hit', 'note impact 2 purple', 24, false);

			case 1:
				vfx.animation.addByPrefix('hit', 'note impact 2 green', 24, false);

			case 2:
				vfx.animation.addByPrefix('hit', 'note impact 2 blue', 24, false);

			case 3:
				vfx.animation.addByPrefix('hit', 'note impact 1 red', 24, false);

		}

		vfx.x -= 100;
		vfx.y -= 100;

		vfx.antialiasing = true;
		vfx.setGraphicSize(Std.int(vfx.width));
	}
}