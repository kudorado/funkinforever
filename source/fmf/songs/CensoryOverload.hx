package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class CensoryOverload extends Carefree  
{

    override function getDadTex()
    {
        var tex = Paths.fromGenericXML('pc/qt/robot', 'mods');
        dad.frames = tex;
    }

    override function loadMap()
    {

        var bg:FlxSprite = new FlxSprite(-783, -390).loadGraphic(Paths.image('bg/qt/streetBackError', 'mods'));
        bg.antialiasing = true;
        bg.scale.y = 1;
        bg.scale.x = 1;
        gameState.add(bg);

        createTV();

    }

	override function createTV()
	{
		gameState.defaultCamZoom = 0.9;
		var bg:FlxSprite = new FlxSprite(100, 356).loadGraphic(Paths.image('bg/qt/TV_V3', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1;
		bg.scale.x = 1;
		gameState.add(bg);
	}

    override function createDadAnimations():Void
    {
        var animation = dad.animation;

        animation.addByPrefix('idle', 'KB_DanceLeft0', 24, false);
        animation.addByPrefix('singUP', 'KB_Up0', 24, false);
        animation.addByPrefix('singRIGHT', 'KB_Right0', 24, false);
        animation.addByPrefix('singLEFT', 'KB_Left0', 24, false);
        animation.addByPrefix('singDOWN', 'KB_Down0', 24, false);
        dad.animation = animation;

    }

    override function createDadAnimationOffsets():Void
    {
        dad.addOffset('idle', 0, 0);
        dad.addOffset("singUP", -20, 21);
        dad.addOffset("singRIGHT", -77, 6);
        dad.addOffset("singLEFT", -20, 7);
        dad.addOffset("singDOWN", 0, 7);
        dad.dance();


        dad.scale.x = 1.2;
        dad.scale.y = 1.2;

        dad.x = 0;
        dad.y = 327;
    }

    public override function getDadIcon(icon:Icon)
    {
        icon.loadGraphic(Paths.image('bg/qt/iconGrid', 'mods'), true, 150, 150);
        icon.animation.add('dad', [28, 29], 0, false, false);
        icon.animation.play("dad");
    }
}

