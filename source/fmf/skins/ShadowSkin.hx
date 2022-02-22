package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class ShadowSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_itzdarkart/shadow', 'mods');
	}
}