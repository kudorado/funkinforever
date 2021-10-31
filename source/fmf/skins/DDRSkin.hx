package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class DDRSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/ddr/NOTE_assets_ddr', 'mods');
	}
}