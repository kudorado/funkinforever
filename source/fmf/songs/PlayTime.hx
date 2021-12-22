package fmf.songs;

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
        playState.defaultCamZoom = 0.6;
		var bg:FlxSprite = new FlxSprite(-669, -362).loadGraphic(Paths.image('bg/huggy_wuggy/factory', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1.2;
		bg.scale.x = 1.2;
		playState.add(bg);

        var bg1:FlxSprite = new FlxSprite(-669, -250).loadGraphic(Paths.image('bg/huggy_wuggy/shadow', 'mods'));
		bg1.antialiasing = true;
		bg1.scale.y = 1.2;
		bg1.scale.x = 1.2;
		bg1.cameras = [playState.camHUD];

		playState.add(bg1);



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
		playState.targetCamFollow.x = gf.getGraphicMidpoint().x + 150;
		playState.targetCamFollow.y -= 100;
		playState.defaultCamZoom = 0.75;


	}

	override function updateCamFollowDad()
	{
		playState.targetCamFollow.x = gf.getGraphicMidpoint().x - 120;
		playState.targetCamFollow.y = 400;
		playState.defaultCamZoom = 0.6;


	}

    public override function getDadIcon(icon:HealthIcon)
    {
        icon.loadGraphic(Paths.image('health_icon/icon_huggy/icon-huggy', 'mods'), true, 150, 150);
        icon.animation.add('dad', [0, 1], 0, false, false);
        icon.animation.play("dad");
    }
}
