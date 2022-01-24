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

class Octane extends SongPlayer
{
	override function getDadVersion():Character
	{
		return new CharacterPE(400, 400, "cough");
	}

	override function loadMap()
	{
		//there was no map
		
		// var luaFile:String = luaFolder + "happy.lua";
		// var lua = GameState.createLua(luaFile);
		// lua.call('onCreate', []);
	}

	override function createDad()
	{
        super.createDad();

        dad.x = 0;
        dad.y = 26;
    }

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/tails/icons/icon-cough', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
  
}