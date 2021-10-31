package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class TextSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/text/NOTE_assets_text', 'mods');
	}
}