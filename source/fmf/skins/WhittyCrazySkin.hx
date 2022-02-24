package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class WhittyCrazySkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_itzdarkart/whitty_crazy', 'mods');
	}
}