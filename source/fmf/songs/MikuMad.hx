package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class MikuMad extends Miku
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/mikumad/ev_miku_mad', 'mods');
		dad.frames = tex;
	}
	

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Miku idle dance0', 24, false);

		animation.addByPrefix('singUP', 'Miku Scream Sing Note UP0', 24, false);
		animation.addByPrefix('singDOWN', 'Miku Scream Sing Note DOWN0', 24, false);
		animation.addByPrefix('singLEFT', 'Miku Scream Sing Note LEFT 0', 24, false);
		animation.addByPrefix('singRIGHT', 'Miku Scream Sing Note RIGHT 0', 24, false);


		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', 0, 0);

		dad.addOffset("singUP", 9, 24);
		dad.addOffset("singRIGHT", -23, 5);
		dad.addOffset("singLEFT", 41, -5);
		dad.addOffset("singDOWN", 0, -3);

	}
	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('bg/miku/iconGrid', 'mods'), true, 150, 150);
		icon.animation.add('dad', [24, 25], 0, false, false);
		icon.animation.play("dad");
	}

}