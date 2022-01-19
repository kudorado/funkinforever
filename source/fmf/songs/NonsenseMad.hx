package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.tweens.FlxTween;
import flixel.effects.FlxFlicker;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class NonsenseMad extends Nonsense
{
	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/nonsensemad/nonsense_mad', 'mods');
		dad.frames = tex;
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Mad Idle0', 24, false);
		animation.addByPrefix('singUP', 'MAD up0', 24, false);
		animation.addByPrefix('singRIGHT', 'MadRight0', 24, false);
		animation.addByPrefix('singLEFT', 'Mad Left0', 24, false);
		animation.addByPrefix('singDOWN', 'Mad down0', 24, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle');
		dad.addOffset("singUP", 39, 4);
		dad.addOffset("singRIGHT", 18, 0);
		dad.addOffset("singLEFT", 38, 0);
		dad.addOffset("singDOWN", 43, -49);

		dad.dance();
	}

}