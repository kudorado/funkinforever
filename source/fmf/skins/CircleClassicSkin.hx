package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class CircleClassicSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_itzdarkart/circle_classic', 'mods');
	}
}