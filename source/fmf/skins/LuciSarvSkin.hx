package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class LuciSarvSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/luci-sarv/NOTE_Assets_Luci-Sarv', 'mods');
	}
}