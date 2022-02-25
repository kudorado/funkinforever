package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.tweens.FlxTween;
import flixel.math.FlxRandom;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class ArtificialLustRGB extends ArtificialLust	
{
	override function getGFTex()
	{
		var tex = Paths.getSparrowAtlas('pc/starlingmayhem/NoGFRGB', 'mods');
		gf.frames = tex;
	}

	override function createBG()
	{
		bg = new FlxSprite(0, -396).loadGraphic(Paths.image('bg/starlingmayhem/event/bg', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1;
		bg.scale.x = 1;
		//gameState.add(bg);
	}

	override function createStage()
	{
		stage = new FlxSprite(0, -469).loadGraphic(Paths.image('bg/starlingmayhem/event/stage', 'mods'));
		stage.antialiasing = true;
		stage.scale.y = 1;
		stage.scale.x = 1;
		//gameState.add(stage);
	}

	override function createHeadlight()
	{
		headlight = new FlxSprite(0, 0);
		headlight.frames = Paths.getSparrowAtlas('bg/starlingmayhem/headlightsRGB', 'mods');
		headlight.animation.addByPrefix('idle', 'Lightsrepeated00', 24, true);
		headlight.animation.play('idle');
		headlight.antialiasing = true;
		headlight.scale.x = 2;
		headlight.scale.y = 2;
		headlight.x = 657;
		headlight.y = -150;
		//gameState.add(headlight);
	}

	override function createSimp()
	{
		simp = new FlxSprite(0, 0);
		simp.frames = Paths.getSparrowAtlas('bg/starlingmayhem/RGBfrontboppers', 'mods');
		simp.animation.addByPrefix('idle', 'frontboppers000', 24, true);
		simp.animation.play('idle');
		simp.antialiasing = true;
		simp.scale.x = 1;
		simp.scale.y = 1;
		simp.x = 0;
		simp.y = 753;
		//gameState.add(simp);
	}

	override function loadMap()
	{
		gameState.defaultCamZoom = 0.6;
		gameState.defaultCamZoom = camZoomShit;

		createBG();
		createStage();
		createHeadlight();
		createSimp();
		createAbel();
		createMax();
	}

	override function getVersion()
	{
		return new BFGFRGB(700 + 913, 425 - 112);
	}

	override function createMax()
	{
		max = new FlxSprite(0, 0);
		max.frames = Paths.getSparrowAtlas('pc/starlingmayhem/MaxRGB', 'mods');

		max.animation.addByPrefix('idle', 'MAXIDLE00', 24, true);
		max.animation.addByPrefix('singUP', 'MAXUP00', 24, false);
		max.animation.addByPrefix('singDOWN', 'MAXDOWN00', 24, false);
		max.animation.addByPrefix('singLEFT', 'MAXLEFT00', 24, false);
		max.animation.addByPrefix('singRIGHT', 'MAXRIGHT00', 24, false);
		max.animation.play('idle');
		max.antialiasing = true;

		max.scale.x = 0.9;
		max.scale.y = 0.9;

		max.x = 1700;
		max.y = 103;

		if (FlxG.save.data.distractions)
		{
			//gameState.add(max);
		}
	}

	override function createAbel()
	{
		abel = new FlxSprite(0, 0);
		abel.frames = Paths.getSparrowAtlas('pc/starlingmayhem/AbelRGB', 'mods');

		abel.animation.addByPrefix('idle', 'ABEL', 110, true);
		abel.animation.addByPrefix('singUP', 'ABELUP00', 48, false);
		abel.animation.addByPrefix('singDOWN', 'ABELDOWN00', 48, false);
		abel.animation.addByPrefix('singLEFT', 'ABELLEFT00', 48, false);
		abel.animation.addByPrefix('singRIGHT', 'ABELRIGHT00', 48, false);
		abel.animation.play('idle');
		abel.antialiasing = true;

		abel.scale.x = 0.8;
		abel.scale.y = 0.8;

		abel.x = 253;
		abel.y = 70;

		if (FlxG.save.data.distractions)
		{
			//gameState.add(abel);
		}
	}


	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/starlingmayhem/duetRGB_assets', 'mods');
		dad.frames = tex;
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Duet idle dance00', 18, false);
		animation.addByPrefix('singUP', 'Duet Sing Note UP00', 24, false);
		animation.addByPrefix('singRIGHT', 'Duet Sing Note RIGHT00', 24, false);
		animation.addByPrefix('singLEFT', 'Duet Sing Note LEFT00', 24, false);
		animation.addByPrefix('singDOWN', 'Duet Sing Note DOWN00', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', 0, 0);

		dad.addOffset('singUP', -0, 0);
		dad.addOffset('singRIGHT', -0, 0);
		dad.addOffset('singLEFT', -0, 0);
		dad.addOffset('singDOWN', -0, 0);
		dad.scale.x = 1.1;
		dad.scale.y = 1.1;
		dad.x = 620;
		dad.y = 0;
		dad.dance();
	}
        
    
}
