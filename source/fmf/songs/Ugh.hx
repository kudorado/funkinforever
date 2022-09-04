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
import flixel.group.FlxGroup.FlxTypedGroup;


class Ugh extends Guns
{
	override function midSongEventUpdate(curBeat:Int)
	{

		switch (curBeat)
		{
			case 15 | 111 | 131 | 207:
				dad.playAnimForce("ugh", 0.5);
		}
	}
}
