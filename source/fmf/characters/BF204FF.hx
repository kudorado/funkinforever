package fmf.characters;
import state.*;
import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class BF204FF extends BFTabi
{
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('psychengine/week_ffmix/images/characters/BFNIKKU', 'mods');
		frames = tex;
	}
}
