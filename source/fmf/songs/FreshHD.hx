package fmf.songs;

import fmf.songs.BopeeboHD;
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

class FreshHD extends BopeeboHD
{

	override function loadLua()
	{
	}

	override function loadMap()
	{	
		gameState.defaultCamZoom = 1;
		var bg:FlxSprite = new FlxSprite(-400, -657).loadGraphic(Paths.image('bg/week_hd/stageback', 'mods'));
		bg.antialiasing = true;
		gameState.add(bg);

		var stageFront:FlxSprite = new FlxSprite(-400, 569).loadGraphic(Paths.image('bg/week_hd/stagefront', 'mods'));
		stageFront.antialiasing = true;
		gameState.add(stageFront);
	}

	function createCrowd()
	{
		var crowd = new FlxSprite(0, 0);
		crowd.frames = Paths.getSparrowAtlas('bg/week_hd/week1/CROWD_FRESH', 'mods');
		
		crowd.animation.addByPrefix('idle', 'crowd00', 18, true);
		crowd.animation.play('idle');
		crowd.antialiasing = true;

		crowd.scale.x = 1.5;
		crowd.scale.y = 1.5;
		
		crowd.x = 236;
		crowd.y = 600;

		if (FlxG.save.data.distractions)
		{
			gameState.add(crowd);
		}
	}

	override function createCharacters() {
		super.createCharacters();
		createCrowd();
	}

	override function getDadVersion()
	{
		return new CharacterPE('dad');
	}

	// override function updateCamFollowDad()
	// {
	// 	super.updateCamFollowDad();
	// 	gameState.defaultCamZoom = 0.4;
	// }

	// override function updateCamFollowBF()
	// {
	// 	super.updateCamFollowBF();
	// 	gameState.defaultCamZoom = 0.4;
	// }

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/finnandjake/icon-jake', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
}
