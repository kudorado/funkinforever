package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Rage extends SongPlayer	
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/blueballs_incident/1TrollgeRage', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
        playState.defaultCamZoom = 0.6;
		var bg:FlxSprite = new FlxSprite(157, -426).loadGraphic(Paths.image('bg/blueballs_incident/ragi/B0', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1.2;
		bg.scale.x = 1.2;
		playState.add(bg);
	}



	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', '1TrollgeRageIdle0', 18, true);
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
        dad.scale.x = 1;
        dad.scale.y = 1;
		dad.x = 569;
		dad.y = 322;
	
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
