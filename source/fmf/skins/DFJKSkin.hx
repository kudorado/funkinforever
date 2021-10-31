package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class DFJKSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/dfjk/NOTE_assets_dfjk', 'mods');
	}
}