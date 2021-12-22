package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class BlueballsIncident extends SongPlayer	
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/blueballs_incident/trollgeStatic4', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
        playState.defaultCamZoom = 0.6;
		var bg:FlxSprite = new FlxSprite(157, -426).loadGraphic(Paths.image('bg/blueballs_incident/incidenti/B0', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1.2;
		bg.scale.x = 1.2;
		playState.add(bg);
	}



	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'TrollgeIdle00', 18, false);
		animation.addByPrefix('singUP', 'TrollgeUp00', 24, false);
		animation.addByPrefix('singRIGHT', 'TrollgeRight00', 24, false);
		animation.addByPrefix('singLEFT', 'TrollgeLeft00', 24, false);
		animation.addByPrefix('singDOWN', 'TrollgeDown00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{

        dad.addOffset('idle',0, 23);

		dad.addOffset('singUP', 66, 29);
		dad.addOffset('singRIGHT', -25, 20);
		dad.addOffset('singLEFT', 83, 22);
		dad.addOffset('singDOWN', 28, -39);
		dad.dance();
        dad.scale.x = 1;
        dad.scale.y = 1;
		dad.x = 400;
		dad.y = 199;
	
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.y = 494;
		bf.x = 1613;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.y = 176;
        gf.x = 863;
	}

	override function updateCamFollowBF()
	{
		playState.targetCamFollow.x = gf.getGraphicMidpoint().x + 120;
		playState.targetCamFollow.y = 360;

	}

	override function updateCamFollowDad()
	{
		playState.targetCamFollow.x = gf.getGraphicMidpoint().x - 120;
		playState.targetCamFollow.y = 360;

	}
}
