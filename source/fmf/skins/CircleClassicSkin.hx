package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class CircleClassicSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_aetherlynx/circle_classic', 'mods');
	}
}