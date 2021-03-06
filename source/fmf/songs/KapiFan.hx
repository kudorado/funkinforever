package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class KapiFan extends Kapi
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/kapifan/flatzone', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		var bg:FlxSprite = new FlxSprite(-200, -225).loadGraphic(Paths.image('bg/kapi/fanclub', 'mods'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.9, 0.9);
		bg.scale.x = 1.25;
		bg.scale.y = 1.25;

		bg.active = false;
		gameState.add(bg);
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'idle', 24);
		animation.addByPrefix('singUP', 'up0', 24);
		animation.addByPrefix('singRIGHT', 'right0', 24);
		animation.addByPrefix('singDOWN', 'down0', 24);
		animation.addByPrefix('singLEFT', 'left0', 24);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle');
		dad.addOffset("singUP", 2, 3);
		dad.addOffset("singRIGHT", 33, -4);
		dad.addOffset("singLEFT", -32, -1);
		dad.addOffset("singDOWN", -100, 2);

		dad.dance();
	}

	override function createCharacters()
	{
		super.createCharacters();

		dad.x += 125;

		gf.y += 75;
		bf.y += 75;

		dad.x += 50;
		dad.y += 70;


		dad.scale.x = 1;
		dad.scale.y = 1;

	}


	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('bg/kapi/iconGrid', 'mods'), true, 150, 150);
		icon.animation.add('dad', [2, 3], 0, false, false);
		icon.animation.play("dad");
	}

}