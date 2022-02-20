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

class Disruption extends SongPlayerPE
{	

	override function loadMap()
	{
		gameState.defaultCamZoom = 0.7;
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
		return new CharacterPE('disruption bambi');	
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('psychengine/week_ga/images/icons/disrupt', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}

	
}