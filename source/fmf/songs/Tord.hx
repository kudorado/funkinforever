package fmf.songs;
import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;


class Tord extends SongPlayer
{
	
	override function getDadTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/tord/tord_assets', "mods");
		dad.frames = tex;
	}

	// create animation for BF
	public override function createDadAnimations():Void
	
	{
		var animation = dad.animation;

		animation.addByPrefix('idle', "tord idle0", 24, false);
		animation.addByPrefix('singUP', "tord up0", 24, false);
		animation.addByPrefix('singDOWN', "tord down0", 24, false);
		animation.addByPrefix('singLEFT', 'tord left0', 24, false);
		animation.addByPrefix('singRIGHT', 'tord right0', 24, false);
		
		dad.animation = animation;
	}

	// create animation offset for BF
	public override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -24, 104);

		dad.addOffset("singUP", -15, 128);
		dad.addOffset("singRIGHT", -53, 90);
		dad.addOffset("singLEFT", 0, 83);
		dad.addOffset("singDOWN", -28, 85);

		dad.playAnim('idle');
		dad.flipX = false;

	}
	

}
