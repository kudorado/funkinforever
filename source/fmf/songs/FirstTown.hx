package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class FirstTown extends SongPlayer	
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/camellia/camellia', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
		gameState.defaultCamZoom = 0.5;
		var bg:FlxSprite = new FlxSprite(311, -378).loadGraphic(Paths.image('bg/camellia/BG_CITY', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1.3;
		bg.scale.x = 1.3;
		gameState.add(bg);

		var bg1:FlxSprite = new FlxSprite(116, -108).loadGraphic(Paths.image('bg/camellia/BG_WALL', 'mods'));
		bg1.antialiasing = true;
		bg1.scale.y = 1.718;
		bg1.scale.x = 1.718;
		gameState.add(bg1);

        var bg2:FlxSprite = new FlxSprite(309, -148).loadGraphic(Paths.image('bg/camellia/FG_Floor', 'mods'));
		bg2.antialiasing = true;
		bg2.scale.y = 1.7;
		bg2.scale.x = 1.7;
		gameState.add(bg2);
	}



	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Camellia_Idle00', 18, false);
		animation.addByPrefix('singUP', 'Camellia_Up00', 24, false);
		animation.addByPrefix('singRIGHT', 'Camellia_Right00', 24, false);
		animation.addByPrefix('singLEFT', 'Camellia_Left00', 24, false);
		animation.addByPrefix('singDOWN', 'Camellia_Down00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{

        dad.addOffset('idle',0, 0);

		dad.addOffset('singDOWN', 0, 68);
		dad.addOffset('singRIGHT', 1 , -3);
		dad.addOffset('singUP', 4, 65);
		dad.addOffset('singLEFT', 69, 14);


		dad.dance();
        dad.scale.x = 0.75;
        dad.scale.y = 0.75;
		dad.x = 182;
		dad.y = 160;
	
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.x += 787;
		bf.y += 35;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.y = 151;
        gf.x = 877;
	}

	override function updateCamFollowBF()
	{
		gameState.targetCamFollow.x = gf.getGraphicMidpoint().x + 120;
		gameState.targetCamFollow.y = 360;

	}

	override function updateCamFollowDad()
	{
		gameState.targetCamFollow.x = gf.getGraphicMidpoint().x - 120;
		gameState.targetCamFollow.y = 360;

	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/camellia/iconGrid', 'mods'), true, 150, 150);
		icon.animation.add('dad', [10, 11], 0, false, false);
		icon.animation.play("dad");
	}

}
