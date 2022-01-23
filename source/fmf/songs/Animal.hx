package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Animal extends SongPlayer	
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/annie/monsterChristmas', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
		var bg:FlxSprite = new FlxSprite(-340, -770).loadGraphic(Paths.image('bg/annie/christmas/evilBG', 'mods'));
		bg.antialiasing = true;
		gameState.add(bg);

        var bg2:FlxSprite = new FlxSprite(544, -325).loadGraphic(Paths.image('bg/annie/christmas/evilTree', 'mods'));
		bg2.antialiasing = true;
		gameState.add(bg2);

        var bg1:FlxSprite = new FlxSprite(0, 542).loadGraphic(Paths.image('bg/annie/christmas/evilSnow', 'mods'));
		bg1.antialiasing = true;
		gameState.add(bg1);
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'monster idle00', 18, false);
		animation.addByPrefix('singUP', 'monster up note00', 24, false);
		animation.addByPrefix('singRIGHT', 'Monster Right note00', 24, false);
		animation.addByPrefix('singLEFT', 'Monster left note00', 24, false);
		animation.addByPrefix('singDOWN', 'monster down00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
        dad.addOffset('idle',0, 0);

		dad.addOffset('singUP', 0, 0);
		dad.addOffset('singRIGHT', 0 , 0);
		dad.addOffset('singLEFT', 0, 0);
		dad.addOffset('singDOWN', 0, 0);

		dad.x = 50;
		dad.y = 195;
		
		dad.playAnim('idle');
	
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.x += 412;
		bf.y -= 117;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.y = 50;
        gf.x = 514;
	}

	override function updateCamFollowBF()
	{
		gameState.targetCamFollow.x = gf.getGraphicMidpoint().x + 120;
		gameState.targetCamFollow.y = 360;

	}

	override function updateCamFollowdaddy()
	{
		gameState.targetCamFollow.x = gf.getGraphicMidpoint().x - 120;
		gameState.targetCamFollow.y = 360;

	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('bg/annie/iconGrid', 'mods'), true, 150, 150);
		icon.animation.add('dad', [19, 20], 0, false, false);
		icon.animation.play("dad");
	}

}
