package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;


class Tom extends SongPlayer
{
	
	override function getDadTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/tom/tom_assets', "mods");
		var tex2 = Paths.getSparrowAtlas('pc/tom/tom_assets_miss', 'mods');

		for (frame in tex2.frames)
		{
			tex.pushFrame(frame);
		}
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
		dad.addOffset('idle', -5, -2);
		dad.addOffset("singUP", -19, -1);
		dad.addOffset("singRIGHT", 32, -1);
		dad.addOffset("singLEFT", -30, 0);
		dad.addOffset("singDOWN", 17, 1);

		dad.playAnim('idle');
		dad.flipX = false;

	}
	

}
