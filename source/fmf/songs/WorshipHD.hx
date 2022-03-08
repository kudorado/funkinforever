package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.addons.effects.FlxTrail;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class WorshipHD extends ParishHD	
{

	override function getDadVersion()
	{
		return new CharacterPE('sarvente_dark');
	}


}