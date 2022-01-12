package fmf.songs;
import state.*;
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
        gamePlayState.defaultCamZoom = 0.5;
		var bg:FlxSprite = new FlxSprite(311, -378).loadGraphic(Paths.image('bg/camellia/BG_CITY', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1.3;
		bg.scale.x = 1.3;
		gamePlayState.add(bg);

		var bg1:FlxSprite = new FlxSprite(309, -267).loadGraphic(Paths.image('bg/camellia/BG_WALL', 'mods'));
		bg1.antialiasing = true;
		bg1.scale.y = 1.4;
		bg1.scale.x = 1.4;
		gamePlayState.add(bg1);

        var bg2:FlxSprite = new FlxSprite(309, -100).loadGraphic(Paths.image('bg/camellia/FG_Floor', 'mods'));
		bg2.antialiasing = true;
		bg2.scale.y = 1.4;
		bg2.scale.x = 1.4;
		gamePlayState.add(bg2);
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
		bf.x += 913;
		bf.y += 70;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.y = 151;
        gf.x = 877;
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
		icon.loadGraphic(Paths.image('health_icon/camellia/iconGrid', 'mods'), true, 150, 150);
		icon.animation.add('dad', [10, 11], 0, false, false);
		icon.animation.play("dad");
	}

}
