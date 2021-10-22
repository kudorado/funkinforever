package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Sky extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/sky/sky_assets', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
		playState.defaultCamZoom = 0.8;

		var hallowTex = Paths.getSparrowAtlas('bg/sky/bg_normal', 'mods');
		var bg = new FlxSprite(-200, -300);

		bg.frames = hallowTex;
		bg.animation.addByPrefix('idle', 'Bg0', 6, true);
		bg.animation.play('idle');
		bg.antialiasing = true;

		bg.scale.x = 2;
		bg.scale.y = 2;

		playState.add(bg);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Sky idle', 24, false);
		animation.addByPrefix('singUP', 'Sky up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Sky right0', 24, false);
		animation.addByPrefix('singDOWN', 'Sky down0', 24, false);
		animation.addByPrefix('singLEFT', 'Sky left0', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{

		dad.addOffset('idle');
		dad.addOffset("singUP", 0, 0);
		dad.addOffset("singRIGHT", 0, 0);
		dad.addOffset("singLEFT", 0, 0);
		dad.addOffset("singDOWN", 0, 0);

		dad.dance();
	
	}
	
	override function createDad()
	{
		super.createDad();
		dad.x -= 250;
		dad.y += 75;
	}

	override function createBF()
	{
		super.createBF();
		bf.x += 100;
	}
	override function createGF()
	{
		super.createGF();
		gf.y -= 100;
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('bg/sky/iconGrid', 'mods'), true, 150, 150);
		icon.animation.add('dad', [24, 25], 0, false, false);
		icon.animation.play("dad");
	}


}