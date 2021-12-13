package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class FirstTown extends SongPlayer	
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/camellia/camellia', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
        playState.defaultCamZoom = 0.5;
		var bg:FlxSprite = new FlxSprite(311, -378).loadGraphic(Paths.image('bg/camellia/BG_CITY', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1.3;
		bg.scale.x = 1.3;
		playState.add(bg);

		var bg1:FlxSprite = new FlxSprite(309, -267).loadGraphic(Paths.image('bg/camellia/BG_WALL', 'mods'));
		bg1.antialiasing = true;
		bg1.scale.y = 1.4;
		bg1.scale.x = 1.4;
		playState.add(bg1);

        var bg2:FlxSprite = new FlxSprite(309, -100).loadGraphic(Paths.image('bg/camellia/FG_Floor', 'mods'));
		bg2.antialiasing = true;
		bg2.scale.y = 1.4;
		bg2.scale.x = 1.4;
		playState.add(bg2);
	}



	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Camellia_Idle00', 18, false);
		animation.addByPrefix('singUP', 'Camellia_Up00', 24, false);
		animation.addByPrefix('singRIGHT', 'Camellia_Right00', 24, false);
		animation.addByPrefix('singLEFT', 'Camellia_Left00', 24, false);
		animation.addByPrefix('singDOWN', 'Camellia_Down00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{

        dad.addOffset('idle',0, 0);

		dad.addOffset('singUP', 5, 73);
		dad.addOffset('singRIGHT', 0 , -22);
		dad.addOffset('singLEFT', 94, 26);
		dad.addOffset('singDOWN', 0, 77);
		dad.dance();
        dad.scale.x = 1;
        dad.scale.y = 1;
		dad.x = 150;
		dad.y = 4;
	
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
		gf.y = 151;
        gf.x = 877;
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
