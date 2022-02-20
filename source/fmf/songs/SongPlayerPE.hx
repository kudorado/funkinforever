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

class SongPlayerPE extends SongPlayer
{	

	override function loadLua()
	{
		//autoload itself 
	}
	override function loadMap()
	{
		
	}

	override function createStoryBF()
	{
	}


	override function getDadVersion()
	{
		return new CharacterPE('');
	}


}