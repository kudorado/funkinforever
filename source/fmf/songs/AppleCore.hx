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
		gameState.defaultCamZoom = 0.5;
	}

	override function createBF()
	{
		super.createBF();
	}
	override function createStoryBF()
	{
		
	}
	
	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
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
		var maxX = 850;
		var minX = 50;
		var step = 895;
		if (gameState.curStep > step)
		{
			step = 2543;
			maxX = 700;
			minX = 150;
		}

		if (gameState.curStep < step)
		{
			if (direction == 1) //move right
			{
				//if position > max, then move left
				if (dad.x >= maxX)
				{
					direction = -1;
					gameState.dadGroup.remove(dad);
					gameState.boyfriendGroup.add(dad);
				}
			}

			if (direction == -1)
			{
				// if position < min, then move right
				if (dad.x <= minX)
				{
					direction = 1;
					gameState.boyfriendGroup.remove(dad);
					gameState.dadGroup.add(dad);
				}
			}
		}
		super.update(elapsed);
	}
	
}