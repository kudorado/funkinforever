package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Termination extends CensoryOverload	
{
	override function getDadTex()
	{
		var tex = Paths.fromGenericXML('pc/qt/robot_error', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
		var bg:FlxSprite = new FlxSprite(-783, -390).loadGraphic(Paths.image('bg/qt/streetError', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1;
		bg.scale.x = 1;
		playState.add(bg);

		createTV();
	}
}
