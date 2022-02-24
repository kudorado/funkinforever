package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class BobOnslaughtSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_itzdarkart/bobonslaught', 'mods');
	}
}