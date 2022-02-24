package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class BloodSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_itzdarkart/blood', 'mods');
	}
}