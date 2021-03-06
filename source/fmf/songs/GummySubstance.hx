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

class GummySubstance extends SongPlayer
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
		// var place = SongPlayer.luaFolder + "stages/place.lua";
		// GameState.createLua(place);
	}

	override function getGFVersion()
	{
		return new CharacterPE('finn');
	}

	override function getDadVersion()
	{
		return new CharacterPE('bubble');
	}

	override function createDad()
	{
		super.createDad();
	}

	override function createGF()
	{
		super.createGF();
		// gf.x = 47;
		// gf.y = 220;
		gf.scale.x = 0;
		gf.scale.y = 0;
	}

	override function updateCamFollowDad()
	{
		gameState.setCamFollowBF();
		gameState.targetCamFollow.x -= 200;
		// gameState.targetCamFollow.y -= 150;
		gameState.defaultCamZoom = 0.85;

	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		gameState.defaultCamZoom = 0.9;
	}

	override function createBF()
	{
		super.createBF();
		bf.x += 150;
		bf.y -= 80;
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/finnandjake/icon-bubble', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
}
