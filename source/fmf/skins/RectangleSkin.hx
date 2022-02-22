package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class RectangleSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_itzdarkart/rectangle', 'mods');
	}
}