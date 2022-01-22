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


	override function createDad()
	{
        super.createDad();

        dad.x = 0;
        dad.y = 26;
    }
  
}