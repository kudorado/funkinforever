package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class ShinyMetalSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_itzdarkart/shiny_metal', 'mods');
	}
}