package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class TikyBlackSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_itzdarkart/tikyblack', 'mods');
	}
}