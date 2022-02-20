 package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class HeartbassEvent extends SongPlayer	
{
	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/date/carol_dance', 'mods');
		dad.frames = tex;
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;

		animation.addByPrefix('singUP', 'Carol dance up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Carol dance right0', 24, false);
		animation.addByPrefix('singLEFT', 'Carol dance left0', 24, false);
		animation.addByPrefix('singDOWN', 'Carol dance down0', 24, false);

		animation.addByPrefix('singUP-alt', 'Carol dance up0', 24, false);
		animation.addByPrefix('singRIGHT-alt', 'Carol dance right0', 24, false);
		animation.addByPrefix('singLEFT-alt', 'Carol dance left0', 24, false);
		animation.addByPrefix('singDOWN-alt', 'Carol dance down0', 24, false);

		dad.animation = animation;
		
	}

	override function createDadAnimationOffsets():Void
	{
		dad.dance();
		dad.scale.x = 1.07;
		dad.scale.y = 1.07;

		dad.x = 632;
		dad.y = 233;
	}
	
}
