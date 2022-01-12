package fmf.songs;
import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class GoodEnough extends SongPlayer	
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/annie/annie', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{

		var bg:FlxSprite = new FlxSprite(0, -151).loadGraphic(Paths.image('bg/annie/philly/sky', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1.5;
		bg.scale.x = 1.5;
		gamePlayState.add(bg);

        var bg1:FlxSprite = new FlxSprite(0, -151).loadGraphic(Paths.image('bg/annie/philly/city', 'mods'));
		bg1.antialiasing = true;
		bg1.scale.y = 1.5;
		bg1.scale.x = 1.5;
		gamePlayState.add(bg1);


        var bg2:FlxSprite = new FlxSprite(0, -218).loadGraphic(Paths.image('bg/annie/philly/behindTrain', 'mods'));
		bg2.antialiasing = true;
		bg2.scale.y = 1.5;
		bg2.scale.x = 1.5;
		gamePlayState.add(bg2);

        var bg3:FlxSprite = new FlxSprite(0, -224).loadGraphic(Paths.image('bg/annie/philly/street', 'mods'));
		bg3.antialiasing = true;
		bg3.scale.y = 1.5;
		bg3.scale.x = 1.5;
		gamePlayState.add(bg3);
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'BF idle dance00', 18, false);
		animation.addByPrefix('singUP', 'BF NOTE UP00', 24, false);
		animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT00', 24, false);
		animation.addByPrefix('singLEFT', 'BF NOTE LEFT00', 24, false);
		animation.addByPrefix('singDOWN', 'BF NOTE DOWN00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
	
        dad.addOffset('idle',-2, -38);

		dad.addOffset('singUP', 0, -22);
		dad.addOffset('singRIGHT', 15 , -44);
		dad.addOffset('singLEFT', -94, -44);
		dad.addOffset('singDOWN', -61, -69);

		dad.flipX = true;

		dad.x = 351;
		dad.y = 200;

		dad.playAnim('idle');
	
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.x += 144;
		bf.y -= 164;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.y = -12;
        gf.x = 514;
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
		icon.loadGraphic(Paths.image('bg/annie/iconGrid', 'mods'), true, 150, 150);
		icon.animation.add('dad', [4, 5], 0, false, false);
		icon.animation.play("dad");
	}

}
