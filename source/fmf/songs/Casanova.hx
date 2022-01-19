package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Casanova extends SongPlayer	
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/selever/selever_sheet', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{

		gamePlayState.defaultCamZoom = 0.75;

		var bg:FlxSprite = new FlxSprite(-200, -700).loadGraphic(Paths.image('bg/sacredmass/churchSelever/base', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1.3;
		bg.scale.x = 1.3;
		gamePlayState.add(bg);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'SelIdle0', 24, false);
		animation.addByPrefix('singUP', 'SelUp0', 24, false);
		animation.addByPrefix('singDOWN', 'SelDown0', 24, false);
		animation.addByPrefix('singLEFT', 'SelLeft0', 24, false);
		animation.addByPrefix('singRIGHT', 'SelRight0', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -7, 48);
		dad.addOffset("singUP", -15, 106);
		dad.addOffset("singRIGHT", -6, 70);
		dad.addOffset("singLEFT", -16, 42);
		dad.addOffset("singDOWN", -14, 8);
		dad.dance();

		dad.scale.x = 1;
		dad.scale.y = 1;

		dad.x -= 350;
		
		//dad.flipX = true;
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.y += 120;
		bf.x += 300;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [36, 37], 0, false, false);
		icon.animation.play("dad");
	}

}