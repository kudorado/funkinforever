package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class HexHelloWorld extends Ram
{
	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/hex/night/DADDY_DEAREST', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
		gameState.defaultCamZoom = 0.85;

		var bg:FlxSprite = new FlxSprite(-400, -400).loadGraphic(Paths.image('bg/hex/night/stageback', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 2;
		bg.scale.x = 2;
		gameState.add(bg);
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Dad idle dance00', 18, false);
		animation.addByPrefix('singUP', 'Dad Sing Note UP00', 24, false);
		animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT00', 24, false);
		animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT00', 24, false);
		animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN00', 24, false);
		dad.animation = animation;
	}

    override function updateCamFollowDad()
	{
		gameState.targetCamFollow.y = dad.getGraphicMidpoint().y - 50;
	}
    
	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.y -= 200;
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [38, 39], 0, false, false);
		icon.animation.play("dad");
	}
}