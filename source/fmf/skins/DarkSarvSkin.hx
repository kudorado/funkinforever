package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class DarkSarvSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/dark-sarv/NOTE_Assets_Dark-Sarv', 'mods');
	}
}