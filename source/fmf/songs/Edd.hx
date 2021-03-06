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

class Edd extends SongPlayer
{	
	override function loadLua()
	{
	}
	override function loadMap()
	{
		gameState.defaultCamZoom = 0.66;
	}

	override function createBF()
	{
		super.createBF();
		bf.x += (2154-750);
		bf.y -= 25;
	}

	override function createGF()
	{
		super.createGF();
		gf.x = 1632;
		gf.y = 200;
	}


	override function updateCamFollowDad()
	{
		if (gameState.curBeat >= 507 && gameState.curBeat < 510)
		{
			super.updateCamFollowDad();
			gameState.targetCamFollow.y = -350;
		}
		else if (gameState.curBeat >= 252)
		{
			gameState.targetCamFollow.x = 2000;
			gameState.targetCamFollow.y = 600;
		}
		else if (gameState.curBeat >= 240)
		{
			super.updateCamFollowDad();
			gameState.targetCamFollow.y = -200;
		}
		else
			super.updateCamFollowDad();
	}

	override function updateCamFollowBF()
	{
		if (gameState.curBeat >= 507 && gameState.curBeat < 510)
		{
			super.updateCamFollowBF();
			gameState.targetCamFollow.y = -350;
		}
		else if (gameState.curBeat >= 252)
		{
			gameState.targetCamFollow.x = 2000;
			gameState.targetCamFollow.y = 600;
		}
		else if (gameState.curBeat >= 240)
		{
			super.updateCamFollowBF();
			gameState.targetCamFollow.y = -500;
		}
		else
		{
			super.updateCamFollowBF();
		}

	}
	
	override function getDadVersion()
	{
		return new CharacterPE('edd');
	}


	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/hank/icon-Eduardo', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}

		

  
}