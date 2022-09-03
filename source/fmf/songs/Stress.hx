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


class Stress extends Guns
{	

	override function getGFTex()
	{
		var tex = Paths.getSparrowAtlas('psychengine/week7/picoSpeaker', 'mods');
		gf.frames = tex;
	}

	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('psychengine/week7/tankmanCaptain', 'mods');
		dad.frames = tex;
	}

	override function createGFAnimations():Void
	{
		var animation = gf.animation;
		animation.addByPrefix('shoot1', 'Pico shoot 1', 24, false);
		animation.addByPrefix('shoot2', 'Pico shoot 2', 24, false);
		animation.addByPrefix('shoot3', 'Pico shoot 3', 24, false);
		animation.addByPrefix('shoot4', 'Pico shoot 4', 24, false);


		gf.animation = animation;
	}


	override function createGFAnimationOffsets()
	{
		gf.addOffset('shoot1', 0, 0);
		gf.addOffset('shoot2', -2, -126);
		gf.addOffset('shoot3', 404, -63);
		gf.addOffset('shoot4', 430, -20);
		
	}

	override function loadMap()
	{
		super.loadMap();
	
	}

	function loadTankmen()
	{
		var firstTank:TankmenBG = new TankmenBG(20, 500, true);
		firstTank.resetShit(20, 600, true);
		firstTank.strumTime = 10;
		tankmanRun.add(firstTank);

		for (i in 0...TankmenBG.animationNotes.length)
		{
			if (FlxG.random.bool(16))
			{
				var tankBih = tankmanRun.recycle(TankmenBG);
				tankBih.strumTime = TankmenBG.animationNotes[i][0];
				tankBih.resetShit(500, 200 + FlxG.random.int(50, 100), TankmenBG.animationNotes[i][1] < 2);
				tankmanRun.add(tankBih);
			}
		}
	}


	override function midSongEventUpdate(curBeat:Int)
	{
		if (curBeat == 185)
		{
			gameState.defaultCamZoom = 0.7;
			dad.playAnimForce("prettyGood", 3);
		}

		if (curBeat == 186)
		{
			gameState.defaultCamZoom = 0.8;
		}

		if (curBeat == 187)
		{
			gameState.defaultCamZoom = 0.85;
		}
		if (curBeat == 190)
		{
			gameState.defaultCamZoom = 0.9;
		}

		if (curBeat == 193)
		{
			gameState.shakeNormal();
		}


	}


	override function createCharacters()
	{
		super.createCharacters();
		loadTankmen();

	}

	override function getGFVersion():GFPicoSpeaker
	{
		var gfVer =  new GFPicoSpeaker(400, 200);
		gfVer.loadMappedAnims();
		return gfVer;
	}

	override function createStoryBF()
	{
		changePc('bfgf');
		bf.x = 840;
		bf.y = 460;
	}
		


	override function createGF()
	{
		super.createGF();
		gf.x = 605;
		gf.y = 157;
		gf.scale.x = 1.96;
		gf.scale.y = 1.96;
	}

	override function createBF()
	{
		super.createBF();
		bf.x += 848 - 700;
		bf.y += 445 - 425;
	}

}