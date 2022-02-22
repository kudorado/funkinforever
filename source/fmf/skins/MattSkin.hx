package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class MattSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_itzdarkart/matt', 'mods');
	}
}