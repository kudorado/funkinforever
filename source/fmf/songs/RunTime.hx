package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class RunTime extends SongPlayer
{

	override function getDadVersion()
	{
		return new CharacterPE(176, -334, 'huggyvent');
	}

	override function getVersion()
	{
		return new CharacterPE(448, -150, 'bfvent');
	}

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		gameState.targetCamFollow.y += 200;

	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		gameState.targetCamFollow.y -= 350;

	}

		
	override function createGF()
	{
		super.createGF();
		gf.visible = false;
	}

	override function loadMap()
	{
		//hahaha fuck you
		// loadIconLua('icon-huggy');
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('psychengine/week_huggywuggy/images/icons/icon-huggy', 'mods'), true, 150, 150);
		icon.animation.add('dad', [16, 6], 0, false, false);
		icon.animation.play("dad");
	}


}
