package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Dunk extends SongPlayer	
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/hex/normal/DADDY_DEAREST', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{

		playState.defaultCamZoom = 1;

		var bg:FlxSprite = new FlxSprite(-400, -400).loadGraphic(Paths.image('bg/hex/normal/stageback', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 2;
		bg.scale.x = 2;
		playState.add(bg);


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

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -7, -42);
		dad.addOffset("singUP", -15, -6);
		dad.addOffset("singRIGHT", -6, -31);
		dad.addOffset("singLEFT", -16, -43);
		dad.addOffset("singDOWN", -14, -68);
		dad.dance();


		dad.scale.x = 1;
		dad.scale.y = 1;

		dad.x -= 300;
		dad.y -= 400;
	
	}


	override function updateCamFollowDad()
	{
		playState.camFollow.y = dad.getGraphicMidpoint().y - 50;
	}


	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.y -= 180;
		bf.x += 300;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.y -= 200;
	}
	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [38, 39], 0, false, false);
		icon.animation.play("dad");
	}

}