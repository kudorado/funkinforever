package state;

import reactor.*;
import state.*;
import ui.*;
import fmf.songs.SongManager;

import extension.admob.AdMob;
import extension.admob.GravityMode;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import openfl.Assets;


#if cpp
import sys.thread.Thread;
#end

using StringTools;

class StartState extends MusicBeatState
{
	static var initialized:Bool = false;

	var blackScreen:FlxSprite;
	var credGroup:FlxGroup;
	var credTextShit:Alphabet;
	var textGroup:FlxGroup;
	var ngSpr:FlxSprite;

	var curWacky:Array<String> = [];

	var wackyImage:FlxSprite;

	var credits:Array<CreditData>;
	var credit:CreditData;

	override public function create():Void
	{
		credits = CreditManager.credits;

		// #if polymod
		// polymod.Polymod.init({modRoot: "mods", dirs: ['introMod']});
		// #end
		
	
		PlayerSettings.init();

		curWacky = FlxG.random.getObject(getIntroTextShit());

		// DEBUG BULLSHIT

		#if ios
		AdMob.initIOS("11c519235", "", GravityMode.BOTTOM);
		#elseif android	
		AdMob.initAndroid();
		#end



		super.create();

		FlxG.save.bind('save', 'holyshit222');
		KadeEngineData.initSave();
		Highscore.load();

		if (FlxG.save.data.weekUnlocked != null)
		{
			// FIX LATER!!!
			// WEEK UNLOCK PROGRESSION!!
			StoryState.weekUnlocked = FlxG.save.data.weekUnlocked;

			var wu = 0;
			for (u in StoryState.weekUnlocked)
			{
				if (u)
					wu++;
			}

			trace('Load week progress, total unlocked: ' + wu);

			if (StoryState.weekUnlocked.length < 4)
				StoryState.weekUnlocked.insert(0, true);

			// QUICK PATCH OOPS!
			if (!StoryState.weekUnlocked[0])
				StoryState.weekUnlocked[0] = true;
		}
		else
		{
			trace('init week unlocked!');
			FlxG.save.data.weekUnlocked = StoryState.weekUnlocked;//yeah boiz
			FlxG.save.flush();
		}

		if (FlxG.save.data.songs == null)
		{
			trace('init song data!');
			FlxG.save.data.songs = new Map<String, Bool>(); 
			//init songs data
			for (i in SongManager.songs)
			{
				for (s in i.songList)
				{	
					var daTutorial = s.toLowerCase() == 'tutorial';
					FlxG.save.data.songs.set(s, daTutorial);
					trace('Save new song to disk: ' + s);
				}
			}

			FlxG.save.flush();
		}
		else
		{
			trace('song datas was loaded!');
		}

		#if FREEPLAY
		FlxG.switchState(new FreePlayState());
		#elseif CHARTING
		FlxG.switchState(new ChartingState());
		#else
		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			startIntro();
		});
		#end

		// Debugger.create(this, camera);
	}

	var logoBl:FlxSprite;
	var gfDance:FlxSprite;
	var danceLeft:Bool = false;
	var titleText:FlxSprite;

	function startIntro()
	{
		if (!initialized)
		{
			var diamond:FlxGraphic = FlxGraphic.fromClass(GraphicTransTileDiamond);
			diamond.persist = true;
			diamond.destroyOnNoUse = false;

			FlxTransitionableState.defaultTransIn = new TransitionData(FADE, FlxColor.BLACK, 1, new FlxPoint(0, -1), {asset: diamond, width: 32, height: 32},
				new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));
			FlxTransitionableState.defaultTransOut = new TransitionData(FADE, FlxColor.BLACK, 0.7, new FlxPoint(0, 1),
				{asset: diamond, width: 32, height: 32}, new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));

			transIn = FlxTransitionableState.defaultTransIn;
			transOut = FlxTransitionableState.defaultTransOut;
			FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);

			FlxG.sound.music.fadeIn(4, 0, 0.7);
		}

		Conductor.changeBPM(102);
		persistentUpdate = true;

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);


		var splash = 'splash';

		#if Portrait
		splash = 'psplash';
		#end

		var daSplash:FlxSprite = new FlxSprite().loadGraphic(Paths.image(splash));

		daSplash.screenCenter();
		daSplash.scaleToFit();

		// daSplash.setGraphicSize(Std.int(FlxG.width), Std.int(FlxG.height));
		
		// if (Main.daTabletShit)
		// {
		// 	daSplash.scale.x *= Main.shitZoom;
		// 	daSplash.scale.y *= Main.shitZoom;
		// }

		add(daSplash);


		titleText = new FlxSprite(100, FlxG.height * 0.6);
		titleText.frames = Paths.getSparrowAtlas('titleEnter');
		titleText.animation.addByPrefix('idle', "Press Enter to Begin", 24);
		titleText.animation.addByPrefix('press', "ENTER PRESSED0", 24);
		titleText.antialiasing = true;
		titleText.animation.play('idle');
		titleText.updateHitbox();
		titleText.screenCenter(X);
		titleText.setGraphicSize(Std.int(titleText.width * 0.7));
		titleText.x =  100;
		titleText.y = 100;

		#if Portrait
		titleText.x -= 350;
		titleText.scale.x = 0.5;
		titleText.scale.y = 0.5;
		if (Main.daTabletShit)
		{
			titleText.x += 100;
		}

		titleText.screenCenter(Y);
		titleText.y -= 90;
		#end


		
	

		add(titleText);

		credGroup = new FlxGroup();
		add(credGroup);
		textGroup = new FlxGroup();

		blackScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		credGroup.add(blackScreen);

		credTextShit = new Alphabet(0, 0, "ninjamuffin99\nPhantomArcade\nkawaisprite\nevilsk8er", true);
		credTextShit.screenCenter();

		credTextShit.visible = false;

		ngSpr = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image('newgrounds_logo'));
		add(ngSpr);
		ngSpr.visible = false;
		ngSpr.setGraphicSize(Std.int(ngSpr.width * 0.8));
		ngSpr.updateHitbox();
		ngSpr.screenCenter(X);
		ngSpr.antialiasing = true;

		FlxTween.tween(credTextShit, {y: credTextShit.y + 20}, 2.9, {ease: FlxEase.quadInOut, type: PINGPONG});






		#if mobile
		FlxG.mouse.visible = false;
		#end

		if (initialized)
			skipIntro();
		else
			initialized = true;

	}

	function getIntroTextShit():Array<Array<String>>
	{
		var fullText:String = Assets.getText(Paths.txt('introText'));

		var firstArray:Array<String> = fullText.split('\n');
		var swagGoodArray:Array<Array<String>> = [];

		for (i in firstArray)
		{
			swagGoodArray.push(i.split('--'));
		}

		return swagGoodArray;
	}

	var transitioning:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music != null)
		{
			#if debug
			Conductor.songPosition = FlxG.sound.music.time * FlxG.timeScale;
			#else
			Conductor.songPosition = FlxG.sound.music.time;
			#end			
		}

		if (FlxG.keys.justPressed.F)
		{
			FlxG.fullscreen = !FlxG.fullscreen;
		}

		var pressedEnter:Bool = FlxG.keys.justPressed.ENTER;

		#if mobile
		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
			{
				pressedEnter = true;
			}
		}
		#end

		var gamepad:FlxGamepad = FlxG.gamepads.lastActive;

		if (gamepad != null)
		{
			if (gamepad.justPressed.START)
				pressedEnter = true;

			#if switch
			if (gamepad.justPressed.B)
				pressedEnter = true;
			#end
		}

		if (pressedEnter && !transitioning && skippedIntro)
		{

			// if (FlxG.save.data.flashing)
			titleText.animation.play('press');

			FlxG.camera.flash(FlxColor.WHITE, 1);
			FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);

			transitioning = true;
			// FlxG.sound.music.stop();

			MenuState.firstStart = true;

			new FlxTimer().start(2, function(tmr:FlxTimer)
			{
				// LoadingState.loadAndSwitchState(new MenuState()); // preload mods folder
				FlxG.switchState(new MenuState()); // fail but we go anyway
			});
		}

		if (pressedEnter && !skippedIntro && initialized)
		{
			skipIntro();
		}

		super.update(elapsed);
	}

	function createCoolText(textArray:Array<String>)
	{
		for (i in 0...textArray.length)
		{
			var money:Alphabet = new Alphabet(0, 0, textArray[i], true, false);
			money.screenCenter(X);
			money.y += (i * 60) + 200;
			credGroup.add(money);
			textGroup.add(money);
		}
	}

	function addMoreText(text:String)
	{
		var coolText:Alphabet = new Alphabet(0, 0, text, true, false);
		coolText.screenCenter(X);
		coolText.y += (textGroup.length * 60) + 200;
		credGroup.add(coolText);
		textGroup.add(coolText);
	}

	function deleteCoolText()
	{
		while (textGroup.members.length > 0)
		{
			credGroup.remove(textGroup.members[0], true);
			textGroup.remove(textGroup.members[0], true);
		}
	}


	
	var creditStep:Int;
	override function beatHit()
	{
		super.beatHit();

		// logoBl.animation.play('bump');
		// danceLeft = !danceLeft;

		// if (danceLeft)
		// 	gfDance.animation.play('danceRight');
		// else
		// 	gfDance.animation.play('danceLeft');

		

		switch (creditStep)
		{
			case 1:
				deleteCoolText();
				credit = credits.shift();
				if (credit == null)
					skipIntro();

				creditStep++;


			case 2:
				if (credit == null)
				{
					creditStep = -9999;
					skipIntro();
					return;
				}
				createCoolText(credit.titles);
				creditStep++;

			case 4:
				deleteCoolText();
				creditStep++;

			case 6:
				createCoolText(credit.peopleWhoWeAppreciated);
				creditStep++;

			case 8:
				creditStep = 0;

			default:
				creditStep++;

		}


		// FlxG.log.add(curBeat);
	}

	var skippedIntro:Bool = false;

	function skipIntro():Void
	{
		if (!skippedIntro)
		{
			remove(ngSpr);

			FlxG.camera.flash(FlxColor.WHITE, 4);
			remove(credGroup);
			skippedIntro = true;
		}
	}
}
