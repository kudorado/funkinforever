package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class SharpSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/sharp/NOTE_assets_sharp', 'mods');
	}
}