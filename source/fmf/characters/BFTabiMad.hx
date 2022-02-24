package fmf.characters;
import state.*;
import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class BFTabiMad extends BFTabi
{

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/bf/tabi/BF_post_exp', 'mods');
		frames = tex;
	}

	
	
}
