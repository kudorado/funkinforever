package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class WhittySkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_itzdarkart/whitty', 'mods');
	}
}