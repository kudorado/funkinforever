package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class BoyfriendDeath extends Character
{
	override function debugName():String
	{
		return "boyfriendDeath";
	}

	public function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/bf/BoyFriend_Death_Assets', 'mods');
		frames = tex;
	}

	// create animation offset for BF
	public function createAnimationOffsets():Void
	{
		flipX = false;
	}

	// create animation for BF
	public function createAnimations():Void
	{
		animation.addByPrefix('firstDeath', "BF dies", 24, false);
		animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
		animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);
	}

	public function createCharacter():Void
	{
		getTex();
		createAnimations();
		createAnimationOffsets();
	}
	
}
