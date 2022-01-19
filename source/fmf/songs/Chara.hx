package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Chara extends SongPlayer
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/chara/chara', 'mods');
		dad.frames = tex;
	}
	

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'chara0', 24, false);

		animation.addByPrefix('singUP', 'chara up0', 24, false);
		animation.addByPrefix('singDOWN', 'chara down0', 24, false);
		animation.addByPrefix('singLEFT', 'chara left0', 24, false);
		animation.addByPrefix('singRIGHT', 'chara right0', 24, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', 0, 0);

		dad.addOffset("singUP", 0, 3);
		dad.addOffset("singRIGHT", -2, -5);
		dad.addOffset("singLEFT", 10, -1);
		dad.addOffset("singDOWN", 1, -12);
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [26, 27], 0, false, false);
		icon.animation.play("dad");
	}

}