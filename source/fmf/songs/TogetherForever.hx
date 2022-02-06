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

class TogetherForever extends SongPlayer
{
	override function loadLua()
	{
		// autoload itself

		// var bo = SongPlayer.luaFolder + "custom_notetypes/BO.lua";
		// var gFGlitch = SongPlayer.luaFolder + "custom_notetypes/GF Glitch.lua";
		// var glitch = SongPlayer.luaFolder + "custom_notetypes/Glitch.lua";
		// var sword = SongPlayer.luaFolder + "custom_notetypes/Sword.lua";

		// GameState.createLuas([bo, gFGlitch, glitch, sword]);
	}

	override function loadMap()
	{
	// 	var place = SongPlayer.luaFolder + "stages/place.lua";
	// 	GameState.createLua(place);
		gameState.defaultCamZoom = 0.9;
	}

	override function getGFVersion()
	{
		return new CharacterPE('finn');
	}

	override function getDadVersion()
	{
		return new CharacterPE('jake');
	}

	override function createDad()
	{
		super.createDad();
		dad.x = 60;
		dad.y = 200;
	}

	override function createGF()
	{
		super.createGF();
		gf.x = 150;
		gf.y = 0;
	}

	override function createBF()
	{
		super.createBF();
		bf.x += 150;
		bf.y -= 80;
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/finnandjake/icon-jake', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
}
