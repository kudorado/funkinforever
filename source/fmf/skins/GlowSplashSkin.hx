package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class GlowSplashSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_itzdarkart/glow_splash', 'mods');
	}
}