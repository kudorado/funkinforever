package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Ron extends SongPlayer	
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/ron/Tankman', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{

		gameState.defaultCamZoom = 0.8;

		var bg:FlxSprite = new FlxSprite(-400, -300).loadGraphic(Paths.image('bg/bob/happysky', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 2;
		bg.scale.x = 2;
		gameState.add(bg);


		var stageFront:FlxSprite = new FlxSprite(-650, -600).loadGraphic(Paths.image('bg/bob/nothappy_ground', 'mods'));
		stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
		stageFront.updateHitbox();
		stageFront.antialiasing = true;
		stageFront.scrollFactor.set(0.9, 0.9);
		stageFront.active = false;
		gameState.add(stageFront);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Idle00', 18, false);
		animation.addByPrefix('singUP', 'Sing Up00', 24, false);
		animation.addByPrefix('singRIGHT', 'Sing Right00', 24, false);
		animation.addByPrefix('singLEFT', 'Sing Left00', 24, false);
		animation.addByPrefix('singDOWN', 'Sing Down00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -7, -2);
		dad.addOffset("singUP", -15, 4);
		dad.addOffset("singRIGHT", -6, -1);
		dad.addOffset("singLEFT", -16, -3);
		dad.addOffset("singDOWN", -14, -8);
		dad.dance();


		dad.scale.x = 0.75;
		dad.scale.y = 0.75;

		dad.x -= 300;
		dad.y += 0;
	
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.y -= 150;
		bf.x += 200;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.y -= 150;
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('bg/bob/iconGrid', 'mods'), true, 150, 150);
		icon.animation.add('dad', [30, 31], 0, false, false);
		icon.animation.play("dad");
	}

}