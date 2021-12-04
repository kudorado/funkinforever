package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class CensoryOverload extends Carefree	
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/qt/robot_404-angry', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{

		playState.defaultCamZoom = 0.75;

		var bg:FlxSprite = new FlxSprite(-783, -390).loadGraphic(Paths.image('bg/qt/streetBack', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1;
		bg.scale.x = 1;
		playState.add(bg);


		var bg:FlxSprite = new FlxSprite(33, 451).loadGraphic(Paths.image('bg/qt/TV_V2_off', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1;
		bg.scale.x = 1;
		playState.add(bg);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'KB404ALT_idle', 18, false);
		animation.addByPrefix('singUP', 'KB404ALT_Up', 24, false);
		animation.addByPrefix('singRIGHT', 'KB404ALT_Right', 24, false);
		animation.addByPrefix('singLEFT', 'KB404ALT_Left', 24, false);
		animation.addByPrefix('singDOWN', 'KB404ALT_Down', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -7, 0);
		dad.addOffset("singUP", 17, 185);
		dad.addOffset("singRIGHT", -278, -26);
		dad.addOffset("singLEFT", 101, 173);
		dad.addOffset("singDOWN", 22, -42);
		dad.dance();


		dad.scale.x = 1;
		dad.scale.y = 1;

		dad.x = -230;
		dad.y = 97;
	}

    public override function getDadIcon(icon:HealthIcon)
    {
        icon.loadGraphic(Paths.image('bg/qt/iconGrid', 'mods'), true, 150, 150);
        icon.animation.add('dad', [28, 29], 0, false, false);
        icon.animation.play("dad");
    }
}
