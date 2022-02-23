package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class AELowContrastSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_aetherlynx/low_contrast', 'mods');
	}
}