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
		dad.y = 469;
		dad.scale.x = 1.5;
		dad.scale.y = 1.5;
	}


	override function createGF()
	{
		super.createGF();
		gf.x = 47;
		gf.y = 220;
		gf.scale.x = 1.093;
		gf.scale.y = 1.093;

	}

	override function createBF()
	{
		super.createBF();
		bf.x -= 100;
		bf.y += 100;

	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/hank/icon-hank', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
  
}