package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Rage extends Sadness	
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/blueballs_incident/1TrollgeRage', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
        gamePlayState.defaultCamZoom = 0.85;
		var bg:FlxSprite = new FlxSprite(157, -426).loadGraphic(Paths.image('bg/blueballs_incident/ragi/B0', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1.2;
		bg.scale.x = 1.2;
		gamePlayState.add(bg);
	}



	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', '1TrollgeRageIdle0', 9, true);
		animation.addByPrefix('singUP', '1TrollgeRageUp00', 24, false);
		animation.addByPrefix('singRIGHT', '1TrollgeRageRight00', 24, false);
		animation.addByPrefix('singLEFT', '1TrollgeRageLeft00', 24, false);
		animation.addByPrefix('singDOWN', '1TrollgeRageDown00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{

        dad.addOffset('idle',0, 0);

		dad.addOffset('singUP', 177, 24);
		dad.addOffset('singRIGHT', 18, -24);
		dad.addOffset('singLEFT', 25, 7);
		dad.addOffset('singDOWN', 41, -20);
		dad.dance();
        dad.scale.x = 1.3;
        dad.scale.y = 1.3;
		dad.x = 759;
		dad.y = 198;
	
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/blueballs', 'mods'), true, 150, 150);
		icon.animation.add('dad', [27, 28], 0, false, false);
		icon.animation.play("dad");
	}
	
}
