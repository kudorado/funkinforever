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

class BabSplit extends SongPlayer	
{

    var bobsipAnim:FlxSprite;
	var bgAnim2:FlxSprite;
	var pc:FlxSprite;
	var pixcelthing:FlxSprite;

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/bab/split/amor', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{

		gameState.defaultCamZoom = 0.8;

		var bg1:FlxSprite = new FlxSprite(-1200, -500).loadGraphic(Paths.image('bg/bab/night/BG1', 'mods'));
		bg1.antialiasing = true;
		bg1.scale.y = 0.5;
		bg1.scale.x = 0.5;
		//bg1.scrollFactor.set(0.9,0.9);
		
		gameState.add(bg1);

		var bg2:FlxSprite = new FlxSprite(-1200, -500).loadGraphic(Paths.image('bg/bab/night/BG2', 'mods'));
		bg2.antialiasing = true;
		bg2.scale.y = 0.5;
		bg2.scale.x = 0.5;
		//bg2.scrollFactor.set(0.9,0.9);
		gameState.add(bg2);


		bobsipAnim = new FlxSprite(0, 0);
		bobsipAnim.frames = Paths.getSparrowAtlas('bg/bab/night/bobsip', 'mods');
		bobsipAnim.animation.addByPrefix('idle', 'bobsip00', 24, true);
		bobsipAnim.animation.play('idle');
		bobsipAnim.antialiasing = true;
		//bobsipAnim.scrollFactor.set(0.9,0.9);
		bobsipAnim.scale.x = 0.5;
		bobsipAnim.scale.y = 0.5;
		bobsipAnim.x = 870;
		bobsipAnim.y = 230;

		bobsipAnim.y += 100;

		if (FlxG.save.data.distractions)
		{
			gameState.add(bobsipAnim);
		}

		

		var bg:FlxSprite = new FlxSprite(-560, -140).loadGraphic(Paths.image('bg/bab/night/BG3', 'mods'));
		bg.antialiasing = true;
		//bg.scrollFactor.set(0.9,0.9);
		bg.scale.y = 0.75;
		bg.scale.x = 0.75;
		gameState.add(bg);

		var bg4:FlxSprite = new FlxSprite(-1400, -500).loadGraphic(Paths.image('bg/bab/night/BG4', 'mods'));
		bg4.antialiasing = true;
		
		bg4.scale.y = 0.5;
		bg4.scale.x = 0.5;
		gameState.add(bg4);

		pc = new FlxSprite(0, 0);
		pc.frames = Paths.getSparrowAtlas('bg/bab/night/pc', 'mods');
		
		pc.animation.addByPrefix('idle', 'PC idle00', 24, false);
		pc.animation.addByPrefix('singUP', 'PC Note UP00', 24, false);
		pc.animation.addByPrefix('singDOWN', 'PC Note DOWN00', 24, false);
		pc.animation.addByPrefix('singLEFT', 'PC Note LEFT00', 24, false);
		pc.animation.addByPrefix('singRIGHT', 'PC Note RIGHT00', 24, false);
		pc.animation.play('idle');
		pc.antialiasing = true;

		pc.scale.x = 0.8;
		pc.scale.y = 0.8;
		
		pc.x += 120;
		pc.y += 380;

		if (FlxG.save.data.distractions)
		{
			gameState.add(pc);
		}

		pixcelthing = new FlxSprite(0, 0);
		pixcelthing.frames = Paths.getSparrowAtlas('bg/bab/night/pixelthing', 'mods');
		pixcelthing.animation.addByPrefix('idle', 'pixelthing00', 24, true);
		pixcelthing.animation.play('idle');
		pixcelthing.antialiasing = true;

		pixcelthing.scale.x = 1.2;
		pixcelthing.scale.y = 1.5;
		pixcelthing.y += 220;
		pixcelthing.x -= 60;

		if (FlxG.save.data.distractions)
		{
			gameState.add(pixcelthing);
		}
		
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Amor idle dance00', 24, false);
		animation.addByPrefix('singUP', 'Amor Sing Note UP00', 24, false);
		animation.addByPrefix('singDOWN', 'Amor Sing Note DOWN00', 24, false);
		animation.addByPrefix('singLEFT', 'Amor Sing Note LEFT00', 24, false);
		animation.addByPrefix('singRIGHT', 'Amor Sing Note RIGHT00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', 0, 0);
		dad.addOffset("singUP", 0, 0);
		dad.addOffset("singRIGHT", 0, 0);
		dad.addOffset("singLEFT", 0, 0);
		dad.addOffset("singDOWN", 0, 0);
		dad.dance();

		dad.scale.x = 1.8;
		dad.scale.y = 1.8;
		dad.x -= 450;
		dad.y += 180;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.x += 360;
		gf.y += 100;
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.y += 180;
		bf.x += 300;
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('bg/bab/iconGrid','mods'), true, 150, 150);
		icon.animation.add('dad', [24,26], 0, false, false);
		icon.animation.play("dad");
	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		gameState.targetCamFollow.x -= 300;
		gameState.targetCamFollow.y -= 100;
	}

	override function updateCamFollowdaddy()
	{
		super.updateCamFollowdaddy();
		gameState.targetCamFollow.x += 200;
	}

	override function dadNoteEvent(noteData:Note)
	{
		super.dadNoteEvent(noteData);
		var lastNote = gameState.lastNote;
		pc.animation.play(lastNote);
	}
}