package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class TrollgeSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/trollge/NOTE_assets_trollge', 'mods');
	}
}