package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class NGSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_itzdarkart/ng', 'mods');
	}
}