package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class LowContrastSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_itzdarkart/low_contrast', 'mods');
	}
}