package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Careless extends Carefree	
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/qt/qt_annoyed', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		var bg:FlxSprite = new FlxSprite(-783, -390).loadGraphic(Paths.image('bg/qt/streetBack', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1;
		bg.scale.x = 1;
		playState.add(bg);

		createTV();

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Final_Idle', 18, false);
		animation.addByPrefix('singUP', 'glitch_up', 24, false);
		animation.addByPrefix('singRIGHT', 'glitch_right', 24, false);
		animation.addByPrefix('singLEFT', 'glitch_left', 24, false);
		animation.addByPrefix('singDOWN', 'glitch_down', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -7, 0);
		dad.addOffset("singUP", 19, 34);
		dad.addOffset("singRIGHT", -29, 30);
		dad.addOffset("singLEFT", -12, 27);
		dad.addOffset("singDOWN", 13, 72);
		dad.dance();


		dad.scale.x = 1;
		dad.scale.y = 1;

		dad.x = 48;
		dad.y = 277;
	
	}
}
