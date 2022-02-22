package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class SoftBrightSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_itzdarkart/soft_bright', 'mods');
	}
}