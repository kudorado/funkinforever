package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class DokiSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/dokidoki/NOTE_assets', 'mods');
	}
}