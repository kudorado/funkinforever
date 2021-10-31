package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class SarvSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/sarv/NOTE_Assets_Sarvente', 'mods');
	}
}