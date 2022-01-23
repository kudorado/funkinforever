package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
//import js.html.rtc.PeerConnectionIceEvent;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class SussusMoogus extends SongPlayer	
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/sus/impostor', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{

		gameState.defaultCamZoom = 0.8;

		var bg1:FlxSprite = new FlxSprite(0, -300).loadGraphic(Paths.image('bg/impostor/red/polusSky', 'mods'));
		bg1.antialiasing = true;
		bg1.scale.y = 1.4;
		bg1.scale.x = 1.4;
		gameState.add(bg1);

        

        var bg3:FlxSprite = new FlxSprite(-100, -100).loadGraphic(Paths.image('bg/impostor/red/polusrocks', 'mods'));
		bg3.antialiasing = true;
		bg3.scale.y = 1;
		bg3.scale.x = 1;
        bg3.scrollFactor.set(0.6,0.6);
		gameState.add(bg3);


        var bg2:FlxSprite = new FlxSprite(200, 150).loadGraphic(Paths.image('bg/impostor/red/polusWarehouse', 'mods'));
		bg2.antialiasing = true;
		bg2.scale.y = 1;
		bg2.scale.x = 1;
        bg2.scrollFactor.set(0.8,0.8);
		gameState.add(bg2);
        

        var bg3:FlxSprite = new FlxSprite(-250, 300).loadGraphic(Paths.image('bg/impostor/red/polusHills', 'mods'));
		bg3.antialiasing = true;
		bg3.scale.y = 1;
		bg3.scale.x = 1;
        bg3.scrollFactor.set(0.8,0.8);
		gameState.add(bg3);

        var bg4:FlxSprite = new FlxSprite(-0, 600).loadGraphic(Paths.image('bg/impostor/red/polusGround', 'mods'));
		bg4.antialiasing = true;
		bg4.scale.y = 1.4;
		bg4.scale.x = 1.4;
		gameState.add(bg4);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Impostor idle', 18, false);
		animation.addByPrefix('singUP', 'Impostor up', 24, false);
		animation.addByPrefix('singDOWN', 'Impostor down', 24, false);
		animation.addByPrefix('singLEFT', 'Impostor left', 24, false);
		animation.addByPrefix('singRIGHT', 'Impostor right', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', 0, -138);
		dad.addOffset("singUP", -64, -4);
		dad.addOffset("singRIGHT", -98, -1);
		dad.addOffset("singLEFT", 9, -2);
		dad.addOffset("singDOWN", -57, -16);
		dad.dance();

		dad.scale.x = 1.5;
		dad.scale.y = 1.5;
		dad.x -= 150;
		dad.y += 225;
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

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('bg/impostor/red/iconGrid','mods'), true, 150, 150);
		icon.animation.add('dad', [24,25], 0, false, false);
		icon.animation.play("dad");
	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		gameState.targetCamFollow.x = bf.getMidpoint().x - 240;
		gameState.targetCamFollow.y = bf.getMidpoint().y - 150;
	}

	override function updateCamFollowdaddy()
	{
		super.updateCamFollowdaddy();
		gameState.targetCamFollow.x = bf.getMidpoint().x - 500;
		gameState.targetCamFollow.y = bf.getMidpoint().y - 150;
	}

}