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

class BabRonaldMcDonal extends SongPlayer	
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/bab/kill_yourself', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{

		gameState.defaultCamZoom = 0.3;

		var bg1:FlxSprite = new FlxSprite(-1200, -500).loadGraphic(Paths.image('bg/bab/day/happy/happy_sky', 'mods'));
		bg1.antialiasing = true;
		bg1.scale.y = 0.5;
		bg1.scale.x = 0.5;
		//bg1.scrollFactor.set(0.9,0.9);
		
		gameState.add(bg1);

		var bg2:FlxSprite = new FlxSprite(-1200, -500).loadGraphic(Paths.image('bg/bab/day/happy/happy_back', 'mods'));
		bg2.antialiasing = true;
		bg2.scale.y = 0.5;
		bg2.scale.x = 0.5;
		//bg2.scrollFactor.set(0.9,0.9);
		gameState.add(bg2);

		var bg:FlxSprite = new FlxSprite(-560, -140).loadGraphic(Paths.image('bg/bab/day/happy/happy_front', 'mods'));
		bg.antialiasing = true;
		//bg.scrollFactor.set(0.9,0.9);
		bg.scale.y = 0.75;
		bg.scale.x = 0.75;
		gameState.add(bg);
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'RON_IDLE00', 24, false);
		animation.addByPrefix('singUP', 'RON_UP00', 24, false);
		animation.addByPrefix('singDOWN', 'RON_DOWN00', 24, false);
		animation.addByPrefix('singLEFT', 'RON_LEFT00', 24, false);
		animation.addByPrefix('singRIGHT', 'RON_RIGHT00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -7, 0);
		dad.addOffset("singUP", -15, 63);
		dad.addOffset("singRIGHT", -6, 33);
		dad.addOffset("singLEFT", -16, 17);
		dad.addOffset("singDOWN", -14, 3);
		dad.dance();

		dad.scale.x = 1;
		dad.scale.y = 1;

		dad.x -= 350;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.y += 50;
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.y += 100;
		bf.x += 200;
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('bg/bab/icons/ronsip','mods'), true, 150, 150);
		icon.animation.add('dad', [2, 1], 0, false, false);
		icon.animation.play("dad");
	}

	override function updateCamFollowBF()
	{
		gameState.targetCamFollow.x = bf.getGraphicMidpoint().x - 300;
	}

	override function updateCamFollowdaddy()
	{
		gameState.targetCamFollow.x = dad.getGraphicMidpoint().x + 350;
	}

}