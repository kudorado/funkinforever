package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class SquareSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/square/NOTE_assets_square', 'mods');
	}
}