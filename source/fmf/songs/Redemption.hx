package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Redemption extends SongPlayer	
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/blueballs_incident/TrollgeFinal', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
        playState.defaultCamZoom = 0.6;
		var bg:FlxSprite = new FlxSprite(157, -426).loadGraphic(Paths.image('bg/blueballs_incident/redemp/sad', 'mods'));
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

        dad.addOffset('idle',0, 0);

		dad.addOffset('singUP', 0, 0);
		dad.addOffset('singRIGHT', 0 , 0);
		dad.addOffset('singLEFT', 0, 0);
		dad.addOffset('singDOWN', 0, 0);
		dad.dance();
        dad.scale.x = 1;
        dad.scale.y = 1;
		dad.x = 400;
		dad.y = 176;
	
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
		playState.camFollow.x = gf.getGraphicMidpoint().x + 120;
		playState.camFollow.y = 360;

	}

	override function updateCamFollowDad()
	{
		playState.camFollow.x = gf.getGraphicMidpoint().x - 120;
		playState.camFollow.y = 360;

	}
}
