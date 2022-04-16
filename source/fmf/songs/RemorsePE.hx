package fmf.songs;

import reactor.*;
import ui.*;
import state.*;
import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class RemorsePE extends SongPlayer
{
	override function getDadVersion()
	{
		return new CharacterPE(400, 400, "eep");
	}

	override function loadMap()
	{

        gameState.defaultCamZoom = 0.7;

		// there was no map

		// var daPath = "images/psychengine/week_tails/stages/SonicP2.lua";
		// var luaFile:String = SongPlayer.luaFolder + "stages/happy.lua";
		// GameState.createLua(luaFile);
		// lua.call('onCreate', []);
	}

    override function updateCamFollowBF()
	{
        super.updateCamFollowBF();
        gameState.defaultCamZoom = 1;
	}

	override function updateCamFollowDad()
	{
        super.updateCamFollowDad();
        gameState.defaultCamZoom = 0.7;

	}

	override function createStoryBF()
	{
		var newPc = new CharacterPE('beef');
		changeCharacter(newPc);
	}

	override function createDad()
	{
		super.createDad();
		dad.x = 0;
		dad.y = 26;
	}

	override function getGFVersion()
	{
		return new CharacterPE('geef');
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/tails/icons/icon-cough', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
}