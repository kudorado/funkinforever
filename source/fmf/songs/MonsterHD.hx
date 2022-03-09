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

class MonsterHD extends SongPlayerHD
{
	var cameraTwn:FlxTween;

	var bg: FlxSprite;
	
	override function loadLua()
	{
	}

	override function loadMap()
	{	
		gameState.defaultCamZoom = 1;

		bg = new FlxSprite(0, 0);
		bg.frames = Paths.getSparrowAtlas('bg/week_hd/week2/halloween_bg', 'mods');
		
		bg.animation.addByPrefix('lightning', 'Halloweem bg lightning strike00', 18, false);
		bg.animation.addByPrefix('idle', 'Halloweem bg0000', 18, false);
		bg.animation.play('idle');
		bg.antialiasing = true;

		bg.scale.x = 3.6;
		bg.scale.y = 3.6;
		
		bg.x = 236;
		bg.y = 143;

		if (FlxG.save.data.distractions)
		{
			gameState.add(bg);
		}
	}

	function createOverlay()
	{
		var stageFront:FlxSprite = new FlxSprite(-400, 569).loadGraphic(Paths.image('bg/week_hd/week2/overlay', 'mods'));
		stageFront.antialiasing = true;
		stageFront.scale.x = 3;
		stageFront.scale.y = 3;
		gameState.add(stageFront);
	}

	override function createCharacters() {
		super.createCharacters();
		createOverlay();
	}

	override function getDadVersion()
	{
		return new CharacterPE('monster');
	}

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		gameState.targetCamFollow.x -= 100;
		gameState.defaultCamZoom = 1;

	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		gameState.targetCamFollow.x += 100;
		gameState.defaultCamZoom = 1;
	}

	override function createGF()
	{
		super.createGF();
        gf.visible = false;
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/finnandjake/icon-jake', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
}
