package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class SynthwaveSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_itzdarkart/synthwave', 'mods');
	}
}