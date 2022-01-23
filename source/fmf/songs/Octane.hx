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

class Octane extends Sidekick
{
	override function getDadVersion():Character
	{
		return new CharacterPE(400, 400, "cough");
	}

	override function loadMap()
	{
		var songFolder = GameState.playingSong.folder;
		var dataDirectory = "assets/mods/images/psychengine/" + songFolder;

		var luaFile:String = (dataDirectory + "stages/SonicP3.lua");
		var lua = new FunkinLua(luaFile);
		lua.call('onCreate', []);
	}

	override function createDad()
	{
        super.createDad();

        dad.x = 0;
        dad.y = 26;
    }
  
}