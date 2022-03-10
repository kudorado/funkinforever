package fmf.songs;

import reactor.*;
import ui.*;
import fmf.characters.*;
import state.*;
import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class BopeeboHD extends SongPlayerHD
{
	var cameraTwn:FlxTween;

	override function loadLua()
	{
	}

	override function loadMap()
	{	
		gameState.defaultCamZoom = 0.9;
		var bg:FlxSprite = new FlxSprite(-400, -657).loadGraphic(Paths.image('bg/week_hd/stageback', 'mods'));
		bg.antialiasing = true;
		gameState.add(bg);

		var stageFront:FlxSprite = new FlxSprite(-400, 569).loadGraphic(Paths.image('bg/week_hd/stagefront', 'mods'));
		stageFront.antialiasing = true;
		gameState.add(stageFront);
	}

	override function getDadVersion()
	{
		return new CharacterPE('dad');
	}

	override function createDad()
	{
		super.createDad();
	}


	override function updateCamFollowDad()
	{
		gameState.defaultCamZoom = 0.9;
		gameState.targetCamFollow.x += 75;

	}
	

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		gameState.targetCamFollow.x -= 125;
		gameState.targetCamFollow.y -= 350;
		gameState.defaultCamZoom = 0.9;
	}
	
		
	override function createGF()
	{
		super.createGF();
	}

	override function createBF()
	{
		super.createBF();
	}
		

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/finnandjake/icon-jake', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
}
