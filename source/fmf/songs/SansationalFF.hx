package fmf.songs;
import reactor.*;
import ui.*;
import fmf.characters.*;

import state.*;
import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxRect;

class SansationalFF extends SongPlayer
{	

	// SANS
	var battle:FlxSprite;
	var battleBG:FlxSprite;
	var bg:FlxSprite;
	var battleMode:Bool = false;
	var battleBoundaries:FlxRect;


	override function getGFTex()
	{
		var tex = Paths.getSparrowAtlas('psychengine/week7/gfTankman', 'mods');
		gf.frames = tex;
	}

	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('psychengine/week_ffmix/images/characters/Sans', 'mods');
		dad.frames = tex;
	}

	override function createGFAnimations():Void
	{
		var animation = gf.animation;
		animation.addByIndices('sad', 'GF Crying at Gunpoint 0', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
		animation.addByIndices('danceLeft', 'GF Dancing at Gunpoint0', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
		animation.addByIndices('danceRight', 'GF Dancing at Gunpoint0', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
		animation.addByPrefix('idle', 'GF Dancing at Gunpoint0', 24, false);
		animation.addByPrefix('scared', 'GF Crying at Gunpoint 0',	 24);
		gf.animation = animation;
	}


	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByIndices('idleLeft', 'Sans FNF instance 1', [28, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, true);
		animation.addByIndices('idleRight', 'Sans FNF instance 1', [13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27], "", 24, true);
		animation.addByPrefix('singUP', 'Up instance 1', 24, false);
		animation.addByPrefix('singRIGHT', 'Right instance 1', 24, false);
		animation.addByPrefix('singDOWN', 'Down instance 1', 24, false);
		animation.addByPrefix('singLEFT', 'Left instance 1', 24, false);
		animation.addByPrefix('singUP-alt', 'Up 02 instance 1', 24, false);
		animation.addByPrefix('singRIGHT-alt', 'Right 02 instance 1', 24, false);
		animation.addByPrefix('singDOWN-alt', 'Down 02 instance 1', 24, false);
		animation.addByPrefix('singLEFT-alt', 'Left 02 instance 1', 24, false);
		animation.addByPrefix('miss', 'SansDodge instance 1', 24, false);
		animation.addByPrefix('snap', 'Switch to UT mode instance 1', 24, false);
		dad.animation = animation;

		dad.dance();
	}

	override function getDadVersion()
	{
		return new Sans(100, 100);
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idleLeft');
		dad.addOffset('idleRight');
		dad.addOffset("singUP", -8, 27);
		dad.addOffset("singRIGHT", -14, 2);
		dad.addOffset("singLEFT", 49, 2);
		dad.addOffset("singDOWN", -4, -10);
		dad.addOffset("singUP-alt", 41, 24);
		dad.addOffset("singRIGHT-alt", -17, -1);
		dad.addOffset("singLEFT-alt", 47, 2);
		dad.addOffset("singDOWN-alt", -4, -13);
		dad.addOffset("miss", 39, 3);
		dad.addOffset('snap', 17, 3);

		dad.dance();
	}

	override function loadMap()
	{

		gameState.defaultCamZoom = 0.9;
		var subDirectory = "psychengine/week_ffmix/images/";

		battle = new FlxSprite(-600, -200).loadGraphic(Paths.image(subDirectory + 'battleUI/battle', 'mods'));
		battle.antialiasing = FlxG.save.data.highquality;
		battle.scrollFactor.set(1, 1);
		battle.alpha = 0.0001;

		battleBG = new FlxSprite(-600, 0).loadGraphic(Paths.image(subDirectory + 'battleUI/bg', 'mods'));
		battleBG.antialiasing = false;
		battleBG.scrollFactor.set(1, 1);
		battleBG.alpha = 0.0001;
		battleBG.setGraphicSize(Std.int(battle.width));
		battleBG.updateHitbox();

		gameState.add(battle);
		gameState.add(battleBG);
		battleBoundaries = new FlxRect(battle.x + 220,battle.y + 1239,1516,750);



		bg = new FlxSprite();
		bg.loadGraphic(Paths.image(subDirectory + 'hall', 'mods'));

		bg.setGraphicSize(Std.int(bg.width * 1.5));
		bg.updateHitbox();
		bg.screenCenter();
		bg.x -= 300;

		bg.antialiasing = true;
		bg.scrollFactor.set(1.0, 1.0);
		// bg.active = false;
		gameState.add(bg);


	}


	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		gameState.targetCamFollow.x -= 200;
		gameState.targetCamFollow.y -= 50;


	}

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		gameState.targetCamFollow.x += 150;
		gameState.targetCamFollow.y += 25;

	}


	override function createStoryBF()
	{
		changePc('bf crff');
		bf.x = 600;
		bf.y = 370;
	}
		
	override function createDad()
	{
		super.createDad();
		dad.x = -405;
		dad.y = 246;
		// dad.flipX = !dad.flipX;
	}


	override function createGF()
	{
		super.createGF();
		gf.visible = false;
		// gf.x = 314;
		// gf.y = 172;
	}

	override function createBF()
	{
		super.createBF();
		// bf.x += 848 - 700;
		// bf.y += 445 - 425;
	}



	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
	

}