package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class PlayTime extends SongPlayer
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/huggy_wuggy/huggy', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
        gameState.defaultCamZoom = 0.6;
		var bg:FlxSprite = new FlxSprite(-669, -362).loadGraphic(Paths.image('bg/huggy_wuggy/factory', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1.2;
		bg.scale.x = 1.2;
		gameState.add(bg);

        var bg1:FlxSprite = new FlxSprite(-669, -250).loadGraphic(Paths.image('bg/huggy_wuggy/shadow', 'mods'));
		bg1.antialiasing = true;
		bg1.scale.y = 1.2;
		bg1.scale.x = 1.2;
		bg1.cameras = [gameState.camHUD];

		gameState.add(bg1);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'huggyidle00', 18, false);
		animation.addByPrefix('singUP', 'huggyup00', 24, false);
		animation.addByPrefix('singRIGHT', 'huggyright00', 24, false);
		animation.addByPrefix('singLEFT', 'huggyleft00', 24, false);
		animation.addByPrefix('singDOWN', 'huggydown00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{

        dad.addOffset('idle',30, 220);

		dad.addOffset('singUP', 224, 221);
		dad.addOffset('singRIGHT', 80, 196);
		dad.addOffset('singLEFT', 80, 157);
		dad.addOffset('singDOWN', 110, -257);
		dad.dance();
        dad.scale.x = 1.5;
        dad.scale.y = 1.5;
		dad.x = 117;
		dad.y = 49;
	
	}

    

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.y += 50;
		bf.x += 240;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
	}

	override function updateCamFollowBF()
	{
		gameState.targetCamFollow.x = gf.getGraphicMidpoint().x + 150;
		gameState.targetCamFollow.y -= 100;
		gameState.defaultCamZoom = 0.75;


	}

	override function updateCamFollowDad()
	{
		gameState.targetCamFollow.x = gf.getGraphicMidpoint().x - 120;
		gameState.targetCamFollow.y = 400;
		gameState.defaultCamZoom = 0.6;


	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('psychengine/week_huggywuggy/images/icons/icon-huggy', 'mods'), true, 150, 150);
		icon.animation.add('dad', [16, 6], 0, false, false);
		icon.animation.play("dad");
	}
}
