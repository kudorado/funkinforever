package fmf.skins;

import flixel.graphics.frames.FlxAtlasFrames;



class AEGlowSplashSkin extends Skin
{
	override function getSkinTex():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('note_skins/notes_aetherlynx/glow_splash', 'mods');
	}
}