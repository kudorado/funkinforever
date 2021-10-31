package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class AgotiSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/agoti/NOTE_assets', 'mods');
	}
}