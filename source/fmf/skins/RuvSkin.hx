package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class RuvSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/ruv/NOTE_Assets_Ruv', 'mods');
	}
}