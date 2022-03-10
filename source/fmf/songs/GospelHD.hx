package fmf.songs;

import reactor.*;
import ui.*;
import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class GospelHD extends SongPlayerHD
{

	override function loadMap()
	{
		gameState.defaultCamZoom = 0.95;
	}

	override function getDadVersion()
	{
		return new CharacterPE('sarvente_lucifer');
	}

	var sillyHotBabe:Bool = true;
	var counter:Float;
	var direction:Float = 1;

	
	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		gameState.targetCamFollow.x -= 275;
		gameState.targetCamFollow.y -= 300;
		gameState.targetCamFollow.x -= 325;
		gameState.targetCamFollow.y -= 100;

		gameState.targetCamFollow.y = gameState.clamp(gameState.targetCamFollow.y, 65, 500);
		
		gameState.defaultCamZoom = 0.95;
	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		gameState.targetCamFollow.x += 75;
		gameState.targetCamFollow.y -= 150;
		gameState.defaultCamZoom = 1;
		gameState.targetCamFollow.x -= 100;

		gameState.targetCamFollow.y = gameState.clamp(gameState.targetCamFollow.y, 65, 500);

	}

		
	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sillyHotBabe && dad != null)
		{
			dad.y += 2 *  Math.sin(200) * direction;
			counter += elapsed;
			if (counter >= 2.5)
			{
				direction *= -1;
				counter = 0;
			}
		}
	}
}