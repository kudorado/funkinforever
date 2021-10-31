package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;


class GuraAmelia extends SongPlayer
{
	
	override function getDadTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/guraamelia/gura_amelia', "mods");
		dad.frames = tex;
	}

	// create animation for BF
	public override function createDadAnimations():Void
	
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', "spooky dance idle0", 24, false);
		animation.addByPrefix('singUP', "spooky UP NOTE0", 24, false);
		animation.addByPrefix('singDOWN', "spooky DOWN note0", 24, false);
		animation.addByPrefix('singLEFT', 'note sing left0', 24, false);
		animation.addByPrefix('singRIGHT', 'spooky sing right0', 24, false);
		dad.animation = animation;
	}

	// create animation offset for BF
	public override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', 0, 0);
		dad.addOffset("singUP", -13, 32);
		dad.addOffset("singRIGHT", -98, -12);
		dad.addOffset("singLEFT", 109, -3);
		dad.addOffset("singDOWN", 57, -142);

		dad.playAnim('idle');
		dad.flipX = false;

	}
	

}
