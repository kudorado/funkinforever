package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class RonSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_itzdarkart/ron', 'mods');
	}
}