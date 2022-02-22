package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class TikyBigSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_itzdarkart/tikybig', 'mods');
	}
}