package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;
import flixel.math.FlxRandom;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class ArtificialLust extends SongPlayer	
{

	var showTime:Bool;
    var camZoomShit:Float = 0.6;
    var eventSong:ArtificialLustRGB;


	var abel:FlxSprite;
	var max: FlxSprite;

	var light0: FlxSprite;
	var light1: FlxSprite;
	var light2: FlxSprite;
	var light3: FlxSprite;

	var lightEvent: FlxSprite;


    public var bg:FlxSprite;
    public var stage:FlxSprite;
    public var headlight:FlxSprite;
    public var simp:FlxSprite;

	var blackShit:FlxSprite;


    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/starlingmayhem/duet_assets', 'mods');
		dad.frames = tex;
	}

	function createBG()
	{
		bg = new FlxSprite(0, -396).loadGraphic(Paths.image('bg/starlingmayhem/night/bg', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1;
		bg.scale.x = 1;
		gamePlayState.add(bg);
	}

	function createStage()
	{
        stage = new FlxSprite(0, -469).loadGraphic(Paths.image('bg/starlingmayhem/stage', 'mods'));
		stage.antialiasing = true;
		stage.scale.y = 1;
		stage.scale.x = 1;
		gamePlayState.add(stage);
	}

	function createLight()
	{

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

		lightEvent = new FlxSprite(0, -469).loadGraphic(Paths.image('bg/starlingmayhem/event/light', 'mods'));
		lightEvent.antialiasing = true;
		lightEvent.scale.y = 1;
		lightEvent.scale.x = 1;
		lightEvent.visible = false;
		gamePlayState.add(lightEvent);

	}

	function createHeadlight()
	{
        headlight = new FlxSprite(0, 0);
		headlight.frames = Paths.getSparrowAtlas('bg/starlingmayhem/headlights', 'mods');
		headlight.animation.addByPrefix('idle', 'Lightsrepeated00', 24, true);
		headlight.animation.play('idle');
		headlight.antialiasing = true;
        headlight.scale.x = 2;
        headlight.scale.y = 2;
		headlight.x = 657;
		headlight.y = -150;
        gamePlayState.add(headlight);

	}

	function createSimp()
	{
		simp = new FlxSprite(0, 0);
		simp.frames = Paths.getSparrowAtlas('bg/starlingmayhem/frontboppers', 'mods');
		simp.animation.addByPrefix('idle', 'frontboppers000', 24, true);
		simp.animation.play('idle');
		simp.antialiasing = true;
        simp.scale.x = 1;
        simp.scale.y = 1;
		simp.x = 0;
		simp.y = 753;
        gamePlayState.add(simp);
	}

	override function loadMap()
	{
        gamePlayState.defaultCamZoom = 0.6;
		gamePlayState.defaultCamZoom = camZoomShit;

		createBG();
		createLight();
		createStage();
		createHeadlight();
		createSimp();

		createBlackShit();

		createAbel();
		createMax();

		eventSong = new ArtificialLustRGB();
		eventSong.loadMap();
		eventSong.createDad();

	}

	function createCJAbel()
	{
		abel = new FlxSprite(0, 0);
		abel.frames = Paths.getSparrowAtlas('bg/starlingmayhem/CJBG', 'mods');

		abel.animation.addByPrefix('idle', 'CJ00', 24, true);
		abel.animation.play('idle');
		abel.antialiasing = true;

		abel.scale.x = 0.8;
		abel.scale.y = 0.8;

		abel.x = 767;
		abel.y = 221;

		if (FlxG.save.data.distractions)
		{
			gamePlayState.add(abel);
		}
	}

	override function createCharacters()
	{
		createGF();
		createBF();
		createDad();

		gf.scrollFactor.set(0.95, 0.95);
		gamePlayState.add(gf);
		gamePlayState.add(bf);
		gamePlayState.add(dad);

		bf.characterAddedEvent();


		eventEnter();

		//cache it babe
		new FlxTimer().start(0.1, function shit(tmr:FlxTimer)
		{
			eventExit();
		}, 1);

		//cache first.
		
	}

	function createBlackShit()
	{
		blackShit = new FlxSprite(-600, -200).makeGraphic(FlxG.width * 2, FlxG.height * 2, FlxColor.BLACK);

		blackShit.antialiasing = true;
		blackShit.scrollFactor.set(0.9, 0.9);
		blackShit.alpha = 0;
		blackShit.screenCenter(X);
		gamePlayState.add(blackShit);
	}

	function createMax()
	{
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
		max.y = 25;
		
		if (FlxG.save.data.distractions)
		{
			gamePlayState.add(max);
		}
	}

	function createAbel()
	{
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
		abel.y = 25;


		if (FlxG.save.data.distractions)
		{
			gamePlayState.add(abel);
		}
	}
	

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Duet idle dance00', 18, false);
		animation.addByPrefix('singUP', 'Duet Sing Note UP00', 24, false);
		animation.addByPrefix('singRIGHT', 'Duet Sing Note RIGHT00', 24, false);
		animation.addByPrefix('singLEFT', 'Duet Sing Note LEFT00', 24, false);
		animation.addByPrefix('singDOWN', 'Duet Sing Note DOWN00', 24, false);
		animation.addByPrefix('showTime', 'Duet SHOWTIME0', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{

        dad.addOffset('idle',0, 0);

		dad.addOffset('singUP', -0, 0);
		dad.addOffset('singRIGHT', -0 , 0);
		dad.addOffset('singLEFT', -0, 0);
		dad.addOffset('singDOWN', -0, 0);
        dad.scale.x = 1.8;
        dad.scale.y = 1.8;
		dad.x = 734;
		dad.y = 141;
		dad.dance();
	
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
		if (showTime)
		{
			gamePlayState.targetCamFollow.x = gf.getGraphicMidpoint().x - 300;
			gamePlayState.targetCamFollow.y = 300;
			return;
		}

		gamePlayState.targetCamFollow.x = gf.getGraphicMidpoint().x + 120;
		gamePlayState.targetCamFollow.y = 360;
	}

	override function updateCamFollowDad()
	{
		if (showTime)
		{
			gamePlayState.targetCamFollow.x = gf.getGraphicMidpoint().x - 300;
			gamePlayState.targetCamFollow.y = 300;
			return;
		}

		gamePlayState.targetCamFollow.x = gf.getGraphicMidpoint().x - 120;
		gamePlayState.targetCamFollow.y = 360;
	}

	override function dadNoteEvent(noteData:Note)
	{
		super.dadNoteEvent(noteData);
		var lastNote = gamePlayState.lastNote;
		if (showTime)
			eventSong.max.animation.play(lastNote);
		else
			max.animation.play(lastNote);
	}
	
	override function bfNoteEvent(noteData:Note)
	{
		super.bfNoteEvent(noteData);
		var lastNote = gamePlayState.lastNote;
		if (showTime)
			eventSong.max.animation.play(lastNote);
		else
			max.animation.play(lastNote);
	}

	override function midSongEventUpdate(curBeat:Int)
	{
		switch (curBeat)
		{

			case 57 :
				// sp.createDad();
				FlxTween.tween(blackShit, {alpha: 1}, 1, {});
				dad.playAnim('showTime');
				gamePlayState.defaultCamZoom =  1.25;
				showTime = true;
				gamePlayState.isMidSongEvent = true;
				
			case 62:
				gamePlayState.defaultCamZoom = camZoomShit;

			case 63:
				gamePlayState.isMidSongEvent = false;

				FlxTween.tween(blackShit, {alpha: 0}, 0.1, {});
				gamePlayState.shakeNormal();
				eventEnter();

			case 95 | 400:
				showTime = false;
				gamePlayState.shakeBig();
				eventExit();
			case 304:
				showTime = true;
				gamePlayState.shakeNormal();
				eventEnter();

		}
	}

	function eventEnter()
	{
		switchDad(eventSong, false);
		switchAbelAndMaxRGB();
	}
		
	function eventExit()
	{
		switchDad(new ArtificialLust(), true, false);
		switchAbelAndMax();
	}

	function switchAbelAndMaxRGB()
	{
		lightEvent.visible = true;
		gamePlayState.remove(bg);
		gamePlayState.remove(stage);
		gamePlayState.remove(headlight);
		gamePlayState.remove(simp);
		gamePlayState.remove(abel);
		gamePlayState.remove(max);
		gamePlayState.remove(bf);
		gamePlayState.remove(gf);

		gamePlayState.add(eventSong.bg);
		gamePlayState.add(eventSong.stage);
		gamePlayState.add(eventSong.headlight);
		gamePlayState.add(eventSong.simp);
		gamePlayState.add(eventSong.abel);
		gamePlayState.add(eventSong.max);
		gamePlayState.add(gf);
		gamePlayState.add(bf);

		eventSong.abel.animation.play('idle');
		eventSong.max.animation.play('idle');

	}

	function switchAbelAndMax()
	{
		lightEvent.visible = false;

		gamePlayState.remove(eventSong.bg);
		gamePlayState.remove(eventSong.stage);
		gamePlayState.remove(eventSong.headlight);
		gamePlayState.remove(eventSong.simp);
		gamePlayState.remove(eventSong.abel);
		gamePlayState.remove(eventSong.max);
		gamePlayState.remove(gf);
		gamePlayState.remove(bf);

		gamePlayState.add(bg);
		gamePlayState.add(stage);
		gamePlayState.add(headlight);
		gamePlayState.add(simp);
		gamePlayState.add(abel);
		gamePlayState.add(max);
		gamePlayState.add(bf);
		gamePlayState.add(gf);

		abel.animation.play('idle');
		max.animation.play('idle');

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
		icon.animation.add('dad', [49, 50], 0, false, false);
		icon.animation.play("dad");
	}
}
