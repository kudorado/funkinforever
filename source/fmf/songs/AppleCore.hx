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

class AppleCore extends SongPlayerPE
{	

	override function loadMap()
	{
		gameState.defaultCamZoom = 0.4;
	}

	override function createBF()
	{
		super.createBF();
	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		gameState.targetCamFollow.x -= 200;
	}


	override function updateCamFollowDad()
	{
		gameState.setCamFollowBF();
		gameState.targetCamFollow.x -= 200;
	}

		
	override function getDadVersion()
	{
		return new CharacterPE('bandu');
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('psychengine/week_ga/images/icons/icon-bandu', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}

	var direction:Float = 1;
	override function update(elapsed)
	{
		var maxX = 915;
		var minX = 125;
		var step = 895;

		if (gameState.curStep > step)
		{
			step = 2695;
		}

		if (gameState.curStep < step)
		{
			if (direction == 1) // move right
			{
				// trace('1.x: ' + gameState.dad + ", " + (gameState.dad >= maxX));
				// if position > max, then move left
				if (gameState.dad.x >= maxX)
				{
					direction = -1;
					gameState.dadGroup.remove(gameState.dad);
					gameState.boyfriendGroup.add(gameState.dad);
				}
			}

			if (direction == -1)
			{
				// trace('-1.x: ' + gameState.dad + ", " + (gameState.dad <= minX));
				// if position < min, then move right
				if (gameState.dad.x <= minX)
				{
					direction = 1;
					gameState.boyfriendGroup.remove(gameState.dad);
					gameState.dadGroup.add(gameState.dad);
				}
			}
		}
		else
			gameState.defaultCamZoom = 0.4;

		
		super.update(elapsed);
	}
	
}