package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class HellfireSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_itzdarkart/bob', 'mods');
	}
}