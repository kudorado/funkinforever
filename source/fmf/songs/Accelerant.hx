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

class Accelerant extends SongPlayer
{	

	override function loadLua()
	{
		//autoload itself 

		// var bullet = SongPlayer.luaFolder + "custom_notetypes/BulletNote.lua";
		// var ex = SongPlayer.luaFolder + "custom_notetypes/EXNote.lua";
		// var hell = SongPlayer.luaFolder + "custom_notetypes/HellNote.lua";

		// GameState.createLuas([bullet, ex, hell]);
	}
	override function loadMap()
	{
		gameState.defaultCamZoom = 1;
		var nevada = SongPlayer.luaFolder + "stages/nevada.lua";
		GameState.createLua(nevada);
		gameState.defaultCamZoom = 0.65;
	}

	override function getDadVersion()
	{
		return new CharacterPE('hank');
	}

	override function createDad()
	{
		super.createDad();
		dad.x = -116;
		dad.y = 518;
		dad.scale.x = 1.5;
		dad.scale.y = 1.5;
	}

	override function getGFVersion()
	{
		return new CharacterPE('gf-handsup');
	}

	override function createGF()
	{
		super.createGF();
		gf.x = 107;
		gf.y = 288;

	}

	override function createBF()
	{
		super.createBF();
		bf.x -= 230;
		bf.y += 104;

	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/tails/icons/icon-cough', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
  
}