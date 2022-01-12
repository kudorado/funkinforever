package fmf.songs;
import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Carefree extends SongPlayer	
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/qt/qt', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{

		var bg:FlxSprite = new FlxSprite(-783, -390).loadGraphic(Paths.image('bg/qt/streetBackCute', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1;
		bg.scale.x = 1;
		gamePlayState.add(bg);

		createTV();

	}

	function createTV()
	{
		gamePlayState.defaultCamZoom = 0.9;

		var bg:FlxSprite = new FlxSprite(100, 356).loadGraphic(Paths.image('bg/qt/TV_V2_off', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1;
		bg.scale.x = 1;
		gamePlayState.add(bg);
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Final_Idle', 18, false);
		animation.addByPrefix('singUP', 'Final_Up00', 24, false);
		animation.addByPrefix('singRIGHT', 'Final_Right00', 24, false);
		animation.addByPrefix('singLEFT', 'Final_Left00', 24, false);
		animation.addByPrefix('singDOWN', 'Final_Down00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -7, 0);
		dad.addOffset("singUP", 19, 34);
		dad.addOffset("singRIGHT", -29, 35);
		dad.addOffset("singLEFT", -82, 22);
		dad.addOffset("singDOWN", 8, 78);
		dad.dance();


		dad.scale.x = 1;
		dad.scale.y = 1;

		dad.x = 48;
		dad.y = 277;
	
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.y -= 100;
		bf.x += 200;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.y = -40;
	}

	override function updateCamFollowBF()
	{
		gamePlayState.targetCamFollow.x = gf.getGraphicMidpoint().x + 120;
		gamePlayState.targetCamFollow.y = 360;

	}

	override function updateCamFollowDad()
	{
		gamePlayState.targetCamFollow.x = gf.getGraphicMidpoint().x - 120;
		gamePlayState.targetCamFollow.y = 360;

	}


	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('bg/qt/iconGrid', 'mods'), true, 150, 150);
		icon.animation.add('dad', [26, 27], 0, false, false);
		icon.animation.play("dad");
	}

}
