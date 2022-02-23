package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class AEShadowSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_aetherlynx/shadow', 'mods');
	}
}