package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.math.FlxRandom;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class InvertedAscension extends SongPlayer	
{

	var abel:FlxSprite;
	var max: FlxSprite;
	var light0: FlxSprite;
	var light1: FlxSprite;
	var light2: FlxSprite;
	var light3: FlxSprite;

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/starlingmayhem/cj_assets', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
        gamePlayState.defaultCamZoom = 0.6;
		var bg:FlxSprite = new FlxSprite(0, -396).loadGraphic(Paths.image('bg/starlingmayhem/morning/bg', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1;
		bg.scale.x = 1;
		gamePlayState.add(bg);

        light0 = new FlxSprite(0, -469).loadGraphic(Paths.image('bg/starlingmayhem/light0', 'mods'));
		light0.antialiasing = true;
		light0.scale.y = 1;
		light0.scale.x = 1;
		gamePlayState.add(light0);

		light1 = new FlxSprite(0, -469).loadGraphic(Paths.image('bg/starlingmayhem/light1', 'mods'));
		light1.antialiasing = true;
		light1.scale.y = 1;
		light1.scale.x = 1;
		light1.visible = false;
		gamePlayState.add(light1);

		light2 = new FlxSprite(0, -469).loadGraphic(Paths.image('bg/starlingmayhem/light2', 'mods'));
		light2.antialiasing = true;
		light2.scale.y = 1;
		light2.scale.x = 1;
		light2.visible = false;
		gamePlayState.add(light2);

		light3 = new FlxSprite(0, -469).loadGraphic(Paths.image('bg/starlingmayhem/light3', 'mods'));
		light3.antialiasing = true;
		light3.scale.y = 1;
		light3.scale.x = 1;
		light3.visible = false;
		gamePlayState.add(light3);

        var bg1:FlxSprite = new FlxSprite(0, -469).loadGraphic(Paths.image('bg/starlingmayhem/stage', 'mods'));
		bg1.antialiasing = true;
		bg1.scale.y = 1;
		bg1.scale.x = 1;
		gamePlayState.add(bg1);

        var headlight = new FlxSprite(0, 0);
		headlight.frames = Paths.getSparrowAtlas('bg/starlingmayhem/headlights', 'mods');
		headlight.animation.addByPrefix('idle', 'Lightsrepeated00', 24, true);
		headlight.animation.play('idle');
		headlight.antialiasing = true;
        headlight.scale.x = 2;
        headlight.scale.y = 2;
		headlight.x = 657;
		headlight.y = -128;
        gamePlayState.add(headlight);

        var headlight = new FlxSprite(0, 0);
		headlight.frames = Paths.getSparrowAtlas('bg/starlingmayhem/frontboppers', 'mods');
		headlight.animation.addByPrefix('idle', 'frontboppers000', 24, true);
		headlight.animation.play('idle');
		headlight.antialiasing = true;
        headlight.scale.x = 1;
        headlight.scale.y = 1;
		headlight.x = 0;
		headlight.y = 753;
        gamePlayState.add(headlight);

		createAbel();
		createMax();
	}

	function createAbel() {
		abel = new FlxSprite(0, 0);
		abel.frames = Paths.getSparrowAtlas('pc/starlingmayhem/Abel', 'mods');
		
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
		abel.y = -33;

		if (FlxG.save.data.distractions)
		{
			gamePlayState.add(abel);
		}
	}

	function createMax() {
		max = new FlxSprite(0, 0);
		max.frames = Paths.getSparrowAtlas('pc/starlingmayhem/Max', 'mods');
		
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
		max.y = 50;

		if (FlxG.save.data.distractions)
		{
			gamePlayState.add(max);
		}
	}



	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Cj idle dance00', 18, false);
		animation.addByPrefix('singUP', 'Cj Sing Note UP00', 24, false);
		animation.addByPrefix('singRIGHT', 'Cj Sing Note RIGHT00', 24, false);
		animation.addByPrefix('singLEFT', 'Cj Sing Note LEFT00', 24, false);
		animation.addByPrefix('singDOWN', 'Cj Sing Note DOWN00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{

        dad.addOffset('idle',0, 0);

		dad.addOffset('singUP', 0, 0);
		dad.addOffset('singRIGHT', 0 , 0);
		dad.addOffset('singLEFT', 0, 0);
		dad.addOffset('singDOWN', 0, 0);
		dad.dance();
        dad.scale.x = 1.9;
        dad.scale.y = 1.9;
		dad.x = 809;
		dad.y = 66;
	
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.x += 913;
		bf.y -= 112;

	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.y = 43;
        gf.x = 972;
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

	override function dadNoteEvent(noteData:Note)
	{
		super.dadNoteEvent(noteData);
		var lastNote = gamePlayState.lastNote;
		max.animation.play(lastNote);
	}
	
	override function bfNoteEvent(noteData:Note)
	{
		super.bfNoteEvent(noteData);
		var lastNote = gamePlayState.lastNote;
		max.animation.play(lastNote);
	}

	var daFrame = 0;

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		daFrame ++;

		if (daFrame >= 12)
		{
			daFrame  = 0;
		}
		else
			daFrame ++;


	}
	
	override function playBeatEvent() 
	{
		var x = FlxG.random.int(0, 3);
		light0.visible = false;
		light1.visible = false;
		light2.visible = false;
		light3.visible = false;
		if(x == 0) {
			light0.visible = true;
		}
		else {
			if(x == 1) {
				light1.visible = true;
			}
			else {
				if(x == 2) {
					light2.visible = true;
				}
				else {
					light3.visible = true;
				}
			}
		}
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/starlingMayhemIconGrid', 'mods'), true, 150, 150);
		icon.animation.add('dad', [45, 46], 0, false, false);
		icon.animation.play("dad");
	}
}
