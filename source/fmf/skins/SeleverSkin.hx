package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class SeleverSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/selever/NOTE_Assets_Selever', 'mods');
	}
}