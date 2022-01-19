package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Cessation extends CensoryOverload	
{
	override function loadMap()
	{
		var bg:FlxSprite = new FlxSprite(-783, -390).loadGraphic(Paths.image('bg/qt/streetBackCute', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1;
		bg.scale.x = 1;
		gamePlayState.add(bg);

		createTV();
	}

	override function createTV()
	{
        gamePlayState.defaultCamZoom = 0.9;
		var bg:FlxSprite = new FlxSprite(100, 356).loadGraphic(Paths.image('bg/qt/TV_V5', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1;
		bg.scale.x = 1;
		gamePlayState.add(bg);
    }
}
