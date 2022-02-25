package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Ram extends SongPlayer
{

	override function getGFTex()
	{
		var tex = Paths.getSparrowAtlas('pc_updated/sunsetgf', 'mods');
		gf.frames = tex;
	}

	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/hex/sunset/DADDY_DEAREST', 'mods');
		dad.frames = tex;
	}

	override function createStoryBF()
	{
		changePc('bf ram');
	}
		

	override function loadMap()
	{
		gameState.defaultCamZoom = 0.85;

		var bg:FlxSprite = new FlxSprite(-400, -400).loadGraphic(Paths.image('bg/hex/sunset/stageback', 'mods'));
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

		dad.x = 160;
		dad.y = -134;
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.x += 760 - 700;
		bf.y += 425 - 274;
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