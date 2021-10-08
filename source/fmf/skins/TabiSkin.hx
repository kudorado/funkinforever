package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class TabiSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/tabi/NOTE_assets_tabi', 'mods');
	}
}