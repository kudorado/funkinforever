package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Glitcher extends SongPlayer
{
	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/hex/glitcher/DADDY_DEAREST', 'mods');
		dad.frames = tex;
	}

	override function createStoryBF()
	{
		changePc('bf glitcher');
	}

	override function loadMap()
	{
		gameState.defaultCamZoom = 0.85;

		var bg:FlxSprite = new FlxSprite(-400, -400).loadGraphic(Paths.image('bg/hex/glitcher/stageback', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 2;
		bg.scale.x = 2;
		gameState.add(bg);
	}

	override function updateCamFollowDad()
	{
		gameState.targetCamFollow.y = dad.getGraphicMidpoint().y - 125;
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Hex crazy idle00', 18, false);
		animation.addByPrefix('singUP', 'Hex crazy up00', 24, false);
		animation.addByPrefix('singRIGHT', 'Hex crazy right00', 24, false);
		animation.addByPrefix('singLEFT', 'Hex crazy left00', 24, false);
		animation.addByPrefix('singDOWN', 'Hex crazy down00', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -7, -42);
		dad.addOffset("singUP", -15, 45);
		dad.addOffset("singRIGHT", -6, -54);
		dad.addOffset("singLEFT", -16, 10);
		dad.addOffset("singDOWN", -14, -86);
		dad.dance();

		dad.scale.x = 1;
		dad.scale.y = 1;

		dad.x -= 300;
		dad.y -= 300;
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

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [48, 49], 0, false, false);
		icon.animation.play("dad");
	}
}