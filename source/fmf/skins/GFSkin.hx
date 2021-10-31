package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class GFSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/gf/NOTE_Assets_GF', 'mods');
	}
}