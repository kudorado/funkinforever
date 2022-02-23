package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class AEShinningMetalSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_aetherlynx/shiny_metal', 'mods');
	}
}