package fmf.vfx;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSprite;

class AgotiEffect extends VFX
{
	
	private override function getVFXTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_effects/agoti/noteSplashes', 'mods');
	}

}