package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class AETransparentSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_aetherlynx/transparent', 'mods');
	}
}