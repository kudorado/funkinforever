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

class PhantasmFF extends SongPlayer
{	

	override function loadLua()
	{
		//autoload itself 

		// var bo = SongPlayer.luaFolder + "custom_notetypes/BO.lua";
		// var gFGlitch = SongPlayer.luaFolder + "custom_notetypes/GF Glitch.lua";
		// var glitch = SongPlayer.luaFolder + "custom_notetypes/Glitch.lua";
		// var sword = SongPlayer.luaFolder + "custom_notetypes/Sword.lua";

		// GameState.createLuas([bo, gFGlitch, glitch, sword]);
	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		gameState.targetCamFollow.x += 125;
		gameState.targetCamFollow.y += 125;

	}

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		gameState.targetCamFollow.x += 125;
		gameState.targetCamFollow.y += 125;

	}

	override function loadMap()
	{
		// var place = SongPlayer.luaFolder + "stages/place.lua";
		// GameState.createLua(place);
		// gameState.defaultCamZoom = 0.9;
	}

	override function createStoryBF()
	{
		var newPc = new CharacterPE('sonic');
		changeCharacter(newPc);
		newPc.flipX = !newPc.flipX;
	}

		
	override function getDadVersion()
	{
		return new CharacterPE('sonic');
	}
	
	override function getVersion()
	{
		return new CharacterPE('sonic');
	}
	
	override function createDad()
	{
		super.createDad();
		// dad.visible = false;
		// if (bf != null)
		// {
		// 	dad.x = bf.x;
		// 	dad.y = bf.y;
		// }
	}


	override function createGF()
	{
		super.createGF();
		// gf.visible = false;
	}

	override function createBF()
	{
		super.createBF();
	}

}