package fmf.characters;
import state.*;
import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class BFTankmen extends BFTabi
{
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('psychengine/week7/BOYFRIEND', 'mods');
		frames = tex;
	}
}
