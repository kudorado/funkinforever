package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class GarcelloGhosty extends GarcelloDead
{

	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/garcelloghosty/garcello_ghosty', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
		super.loadMap();
	}

	override function createSmoke()
	{
		// no smoke
	}

	override function addSmoke()
	{
		// dont add smoke
	}


	override function createDadAnimations():Void
	{
		var animation = dad.animation;

		animation.addByPrefix('idle', 'Garcello idle dance', 18, false);
		animation.addByPrefix('singUP', 'Garcello Sing Note UP0', 24, false);
		animation.addByPrefix('singRIGHT', 'Garcello Sing Note RIGHT0', 24, false);
		animation.addByPrefix('singLEFT', 'Garcello Sing Note LEFT0', 24, false);
		animation.addByPrefix('singDOWN', 'Garcello Sing Note DOWN0', 24, false);

		dad.animation.addByPrefix('coolGuy', 'Garcello coolguy', 6, false);

		dad.dance();
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('coolGuy',-2, -38);
		dad.addOffset('idle',-2, -38);
		dad.addOffset('singUP', -4, -38);
		dad.addOffset('singRIGHT', -10 , -43);
		dad.addOffset('singLEFT', 9, -34);
		dad.addOffset('singDOWN', -5, -29);

		dad.dance();
	}
	override function midSongEventUpdate(curBeat:Int)
	{
		if (curBeat == 63)
		{
			dad.playAnim('coolGuy', true);
			FlxTween.tween(dad, {alpha: 0}, 1.25, {});

		}
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [28, 29], 0, false, false);
		icon.animation.play("dad");
	}

}