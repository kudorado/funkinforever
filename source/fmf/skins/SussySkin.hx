package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class SussySkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_itzdarkart/sussy', 'mods');
	}
}