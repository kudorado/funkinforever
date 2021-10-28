package fmf.songs;

import js.html.rtc.PeerConnectionIceEvent;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class SussusMoogus extends SongPlayer	
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/impostor/impostor', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{

		playState.defaultCamZoom = 0.8;

		var bg1:FlxSprite = new FlxSprite(0, -300).loadGraphic(Paths.image('bg/impostor/red/polusSky', 'mods'));
		bg1.antialiasing = true;
		bg1.scale.y = 1.4;
		bg1.scale.x = 1.4;
		playState.add(bg1);

        

        var bg3:FlxSprite = new FlxSprite(-100, -100).loadGraphic(Paths.image('bg/impostor/red/polusrocks', 'mods'));
		bg3.antialiasing = true;
		bg3.scale.y = 1;
		bg3.scale.x = 1;
        bg3.scrollFactor.set(0.6,0.6);
		playState.add(bg3);


        var bg2:FlxSprite = new FlxSprite(200, 150).loadGraphic(Paths.image('bg/impostor/red/polusWarehouse', 'mods'));
		bg2.antialiasing = true;
		bg2.scale.y = 1;
		bg2.scale.x = 1;
        bg2.scrollFactor.set(0.8,0.8);
		playState.add(bg2);
        

        var bg3:FlxSprite = new FlxSprite(-250, 300).loadGraphic(Paths.image('bg/impostor/red/polusHills', 'mods'));
		bg3.antialiasing = true;
		bg3.scale.y = 1;
		bg3.scale.x = 1;
        bg3.scrollFactor.set(0.8,0.8);
		playState.add(bg3);

        var bg4:FlxSprite = new FlxSprite(-0, 600).loadGraphic(Paths.image('bg/impostor/red/polusGround', 'mods'));
		bg4.antialiasing = true;
		bg4.scale.y = 1.4;
		bg4.scale.x = 1.4;
		playState.add(bg4);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Impostor idle00', 24, false);
		animation.addByPrefix('singUP', 'Impostor up00', 24, false);
		animation.addByPrefix('singDOWN', 'Impostor down00', 24, false);
		animation.addByPrefix('singLEFT', 'Impostor left00', 24, false);
		animation.addByPrefix('singRIGHT', 'Impostor right00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', 0, -187);
		dad.addOffset("singUP", 0, 0);
		dad.addOffset("singRIGHT", 0, 0);
		dad.addOffset("singLEFT", 0, 0);
		dad.addOffset("singDOWN", 0, 0);
		dad.dance();

		dad.scale.x = 2;
		dad.scale.y = 2;
		dad.x -= 150;
		dad.y += 113;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		
		bf.x += 250;
        bf.y += 50;
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('bg/impostor/red/iconGrid','mods'), true, 150, 150);
		icon.animation.add('dad', [24,25], 0, false, false);
		icon.animation.play("dad");
	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		playState.camFollow.x -= 150;
	}

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		//playState.camFollow.x += 00;
	}
}