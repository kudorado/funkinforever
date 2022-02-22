package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class SadnessSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_itzdarkart/sadness', 'mods');
	}
}