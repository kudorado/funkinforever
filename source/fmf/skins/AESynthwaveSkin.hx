package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class AESynthwaveSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_aetherlynx/synthwave', 'mods');
	}
}