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

class Unloaded extends SongPlayer
{	
	override function loadLua()
	{
	}
	override function loadMap()
	{
		gameState.defaultCamZoom = 0.8;
	}

	// override function update(elapsed:Float)
	// {
	// 	super.update(elapsed);
	// 	gameState.defaultCamZoom = 0.3;
	// }
	

	override function getGFVersion()
	{
		return new CharacterPE('speaker');
	}

	override function getVersion()
	{
		return new CharacterPE('pico-uber');
	}


	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		gameState.targetCamFollow.x -= 100;
		gameState.targetCamFollow.y += 200;
	}
	
	override function getDadVersion()
	{
		return new CharacterPE('uberkid');
	}


	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/hank/icon-edd', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}

		

  
}