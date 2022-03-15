package state; 

import extension.admob.AdMob;
import fmf.songs.*;
import state.*;
import selection.*;
import reactor.*;

import flixel.group.FlxGroup;
import flixel.FlxCamera;
import ui.FlxVirtualPad.FlxActionMode;
import ui.FlxVirtualPad.FlxDPadMode;
import ui.Controller;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.net.curl.CURLCode;

#if sys
import Sys;
import sys.FileSystem;
#end



using StringTools;

class StoryState extends MusicBeatState
{
	var scoreText:FlxText;

	var dad:MenuCharacter;
	var bf:MenuCharacter;
	var gf:MenuCharacter;


	public static var difficulties:Array<Dynamic> = 
	[
		'baby', 'easy', '',
		'normal', 'legacy', 'og',
		'hard', 'hell', 'finale',
		'shit', 'unfair', 'ex', 'fucked'
		
	];


	public static var curDifficulty:Int = 0;

	public static var weekUnlocked:Array<Bool> = 
	[
		true, false, false, false, false, false, false,
		false, false, false, false, false, false, false,
		false, false, false, false, false, false, false,
		false, false, false, false, false, false, false,
		false, false, false, false, false, false, false,
		false, false, false, false, false, false, false,
		false, false, false, false, false, false, false,
		false, false, false, false, false, false, false
	];

	var txtWeekTitle:FlxText;

	public static var curWeek:Int = 0;

	var txtTracklist:FlxText;

	var grpWeekText:FlxTypedGroup<MenuItem>;
	// var grpWeekCharacters:FlxTypedGroup<MenuCharacter>;

	var grpLocks:FlxTypedGroup<FlxSprite>;

	var difficultySelectors:FlxGroup;
	var sprDifficulty:FlxSprite;
	var leftArrow:FlxSprite;
	var rightArrow:FlxSprite;
	var baseSong:BaseSong;
	
	var yellowBG:FlxSprite;

	var alertCam(get, never):FlxCamera;
	inline function get_alertCam():FlxCamera
		return Controller.camera;
	
	override function create()
	{

		AdMob.hideBanner();

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		if (FlxG.sound.music != null)
		{
			if (!FlxG.sound.music.playing)
				FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}

		baseSong = SongPlayerManager.getCurrentSong(SongManager.songs[curWeek].songList[0]);

		persistentUpdate = persistentDraw = true;

		scoreText = new FlxText(10, 10, 0, "SCORE: 49324858", 36);
		scoreText.setFormat("VCR OSD Mono", 32);

		txtWeekTitle = new FlxText(FlxG.width * 0.7, 10, 0, "", 32);
		txtWeekTitle.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, RIGHT);
		txtWeekTitle.alpha = 0.7;

		var rankText:FlxText = new FlxText(0, 10);
		rankText.text = 'RANK: GREAT';
		rankText.setFormat(Paths.font("vcr.ttf"), 32);
		rankText.size = scoreText.size;
		rankText.screenCenter(X);

		var ui_tex = Paths.getSparrowAtlas('campaign_menu_UI_assets');
		yellowBG = new FlxSprite(0, 56);


		loadWeekBG(0);


		// .makeGraphic(FlxG.width, 400, 0xFFF9CF51);


		grpWeekText = new FlxTypedGroup<MenuItem>();
		add(grpWeekText);

		var blackBarThingie:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, 56, FlxColor.BLACK);

		// grpWeekCharacters = new FlxTypedGroup<MenuCharacter>();

		grpLocks = new FlxTypedGroup<FlxSprite>();
		add(grpLocks);

		//@notrace("Line 70");

		for (i in 0...SongManager.songs.length)
		{
			var weekThing:MenuItem = new MenuItem(0, yellowBG.y + yellowBG.height + 10, SongManager.songs[i].character);
			weekThing.y += ((weekThing.height + 20) * i);
			weekThing.targetY = i;
			grpWeekText.add(weekThing);

			weekThing.screenCenter(X);
			weekThing.x -= 25;
			weekThing.antialiasing = true;
			// weekThing.updateHitbox();

			// Needs an offset thingie
			if (!weekUnlocked[i])
			{
				var lock:FlxSprite = new FlxSprite(weekThing.width + 10 + weekThing.x);
				lock.frames = ui_tex;
				lock.animation.addByPrefix('lock', 'lock');
				lock.animation.play('lock');
				lock.ID = i;
				lock.antialiasing = true;
				grpLocks.add(lock);
			}
		}


		add(yellowBG);
		add(blackBarThingie);

		//@notrace("Line 96");

		// dad = new MenuCharacter(0, 100, 0.5, false);
		// bf = new MenuCharacter(450, 25, 0.9, true);
		// gf = new MenuCharacter(850, 100, 0.5, true);

		// dad.alpha = 0;
		// gf.alpha = 0;
		// bf.alpha = 0;


		// grpWeekCharacters.add(dad);
		// grpWeekCharacters.add(bf);
		// grpWeekCharacters.add(gf);

		//@notrace('base song: ' + baseSong.songLabel);

		//we se bf and gf one time, cuz its enough.
		// baseSong.setBFMenuCharacter(bf);
		// baseSong.setGFMenuCharacter(gf);
		
		difficultySelectors = new FlxGroup();
		add(difficultySelectors);

		//@notrace("Line 124");

		leftArrow = new FlxSprite(grpWeekText.members[0].x + grpWeekText.members[0].width + 10, grpWeekText.members[0].y + 10);
		leftArrow.frames = ui_tex;
		leftArrow.animation.addByPrefix('idle', "arrow left");
		leftArrow.animation.addByPrefix('press', "arrow push left");
		leftArrow.animation.play('idle');
		difficultySelectors.add(leftArrow);

		sprDifficulty = new FlxSprite(leftArrow.x + 130, leftArrow.y);
		sprDifficulty.frames = ui_tex;
		sprDifficulty.animation.addByPrefix('easy', 'EASY');
		sprDifficulty.animation.addByPrefix('normal', 'NORMAL');
		sprDifficulty.animation.addByPrefix('hard', 'HARD');
		sprDifficulty.animation.addByPrefix('alt', 'ALT');

		sprDifficulty.animation.play('easy');
		changeDifficulty();

		difficultySelectors.add(sprDifficulty);

		rightArrow = new FlxSprite(sprDifficulty.x + sprDifficulty.width + 50, leftArrow.y);
		rightArrow.frames = ui_tex;
		rightArrow.animation.addByPrefix('idle', 'arrow right');
		rightArrow.animation.addByPrefix('press', "arrow push right", 24, false);
		rightArrow.animation.play('idle');
		difficultySelectors.add(rightArrow);
		

	
		#if Portrait
		leftArrow.scale.x = 0.5;
		leftArrow.scale.y = 0.5;

		rightArrow.scale.x = 0.5;
		rightArrow.scale.y = 0.5;


		sprDifficulty.scale.x = 0.5;
		sprDifficulty.scale.y = 0.5;
		sprDifficulty.updateHitbox();

		sprDifficulty.x -= 50;
		rightArrow.x = sprDifficulty.x + 100;
		#end

		// trace(sprDifficulty.x);

		// //@notrace("Line 150");
		// var bgShit:FlxSprite = new FlxSprite().loadGraphic(Paths.image('weeks/bg0'));	
		// bgShit.setGraphicSize(Std.int(yellowBG.width));

		// add(bgShit);
		// add(grpWeekCharacters);

		txtTracklist = new FlxText(FlxG.width * 0.05, yellowBG.x + yellowBG.height - 325, 0, "Tracks", 32);
		txtTracklist.alignment = CENTER;
		txtTracklist.font = rankText.font;
		txtTracklist.color = FlxColor.BLACK;

		txtTracklist.alpha = 0;
		txtTracklist.setFormat(Paths.font("vcr.ttf"), 35, FlxColor.WHITE, CENTER);

		txtTracklist.setBorderStyle(OUTLINE, 0xFF000000, 3, 1);

		add(txtTracklist);
		// add(rankText);
		add(scoreText);
		add(txtWeekTitle);

		updateText();



		//@notrace("Line 165");



		LoadingState.clearCachedSong();

		LoadingState.isAlertVisible = false;
		
		changeWeek(0);
		
		super.create();

		
		Controller.init(this, FULL, A_B, true);

	}

	function loadWeekBG(curWeek:Int)
	{
		var char:String = SongManager.songs[curWeek].character;
		yellowBG.loadGraphic(Paths.image('weeks/' + char)); 

		yellowBG.antialiasing = true;
		yellowBG.screenCenter(X);

	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (LoadingState.isAlertVisible)
			return;

		// scoreText.setFormat('VCR OSD Mono', 32);
		lerpScore = Math.floor(FlxMath.lerp(lerpScore, intendedScore, 0.5));

		scoreText.text = "WEEK SCORE:" + lerpScore;

		txtWeekTitle.text = SongManager.songs[curWeek].songTitle.toUpperCase();
		txtWeekTitle.x = FlxG.width - (txtWeekTitle.width + 10);

		// FlxG.watch.addQuick('font', scoreText.font);

		difficultySelectors.visible = weekUnlocked[curWeek] && isUnlocked();

		grpLocks.forEach(function(lock:FlxSprite)
		{
			lock.y = grpWeekText.members[lock.ID].y;
		});

		if (!movedBack)
		{
			if (!selectedWeek)
			{
				if (Controller.UP_P)
				{
					changeWeek(-1);
				}

				if (Controller.DOWN_P)
				{
					changeWeek(1);
				}

				if (Controller.RIGHT)
					rightArrow.animation.play('press')
				else
					rightArrow.animation.play('idle');

				if (Controller.LEFT)
					leftArrow.animation.play('press');
				else
					leftArrow.animation.play('idle');

				if (Controller.RIGHT_P && isUnlocked())
					changeDifficulty(1);
				if (Controller.LEFT_P && isUnlocked())
					changeDifficulty(-1);
			}

			if (Controller.ACCEPT)
			{
				selectWeek();
			}
		}

		if (Controller.BACK && !movedBack && !selectedWeek)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			movedBack = true;
			FlxG.switchState(new MenuState());
		}

	}

	var movedBack:Bool = false;
	var selectedWeek:Bool = false;
	var stopspamming:Bool = false;

	function selectWeek()
	{
		var daUnlocked = weekUnlocked[curWeek];

		#if debug
			daUnlocked = true;
		#end
		
		if (daUnlocked)
		{
			if (stopspamming)
				return;

			if (!stopspamming)
			{
				FlxG.sound.play(Paths.sound('confirmMenu'));

				grpWeekText.members[curWeek].startFlashing();
				// grpWeekCharacters.members[1].animation.play('bfConfirm');
				stopspamming = true;

				AdMob.showInterstitial(60);

			}

			GameState.storyPlaylist = SongManager.songs[curWeek].copySongList;
			var temp = SongManager.songs[curWeek].copySongList;
			for (s in GameState.storyPlaylist)
			{
				var isUnlocked = FreePlayState.data.get(s);
				if(isUnlocked){
					trace('Song ' + s + " already passed, ignore!");
					temp.remove(s);
				}
			}
			GameState.storyPlaylist = temp;

			//this story already clear, reset
			if (GameState.storyPlaylist.length == 0)
			{
				GameState.storyCompleted = true;
				GameState.storyPlaylist = SongManager.songs[curWeek].copySongList;
				trace('This story is cleared, play from beginning');
			}
			else
			{
				//reset diff
				curDifficulty = 0;
				GameState.storyCompleted = false;

				trace('Continue story: ' + SongManager.songs[curWeek].songTitle);
			}
			
			GameState.playingSong = SongManager.songs[curWeek];
			
			GameState.isStoryMode = true;
			selectedWeek = true;
			GameState.SONG_NAME = SongFilter.filter(GameState.storyPlaylist[0]);
			GameState.RAW_SONG_NAME = (GameState.storyPlaylist[0]);

			// var daSong = GameState.SONG_NAME + diffic;
			// var daFolder = GameState.playingSong.folder + StringTools.replace(GameState.storyPlaylist[0], " ", "-").toLowerCase();
	
			loadDataFile(GameState.SONG_NAME);

			GameState.storyWeek = curWeek;
			GameState.campaignScore = 0;

			LoadingState.createBlackFadeIn(this, function()
			{
				LoadingState.didLoadout = true;
				LoadingState.setStaticTransition();
				LoadingState.loadAndSwitchState(new SelectionState());
			});

			
		}
		else
		{
			LoadingState.showAlert(this, "Story locked, please complete previous week first!", alertCam);
		}
	}

	public static function loadDataFileAndroid(songName:String, forceRestartScene:Bool = true)
	{
		
		var diffic = "";
		switch (curDifficulty)
		{
			case 0:
				diffic = '-easy';
			case 2:
				diffic = '-hard';
			case 3:
				diffic = '-shit';
		}

		var songLowercase = songName;
		var file = '';
		var daDirectory = '';
		var daSong = songName + diffic;

		daDirectory = "assets/data/" + SongPlayer.folder + songLowercase;
		file = daDirectory + '/' + daSong + '.json';

		var oldSong = GameState.SONG;
		GameState.SONG = null; // reset cache

		if (!openfl.utils.Assets.exists(file))
		{
			trace('Oh shit not found difficult for this file: ' + file);
			//reverse array it if hard -> shit

			var ra:Array<String> = [];
			for(i in StoryState.difficulties)
			{
				ra.push(i);
			}

			if(curDifficulty >= 2)
			{
				ra.reverse();
				trace('Recheck reverse difficult');
			}

			// so attempting to load other difficult
			for (diff in ra)
			{
				var s = diff;

				if (diff != '')
					s = "-" + diff;

				file = daDirectory + '/' + songLowercase + s + '.json';
				if (openfl.utils.Assets.exists(file))
				{
					trace('Load alternative difficult: ' + ((s == '') ? "Normal" : s));
					var popipo = songLowercase + s;
					GameState.SONG = Song.loadFromJson(popipo, GameState.playingSong.folder + songLowercase);
					break;
				}
			}

			// oh shit load freeplay again
			if (GameState.SONG == null)
			{
				//re-set it
				GameState.SONG = oldSong;
				trace('data file not found for song: ' + songLowercase + ", forced reset state!");
				if (forceRestartScene)
				{
					FlxG.resetState();
				}
				return;
			}
		}
		else
		{
			trace('data file loaded sucessful!: ' + file);
			GameState.SONG = Song.loadFromJson(daSong, GameState.playingSong.folder + songLowercase);
		}
	}

	public static function loadDataFile(songName:String, forceRestartScene:Bool = true)
	{
		#if android
		loadDataFileAndroid(songName, forceRestartScene);
		//holy shit android suck.	
		return;
		#end

		var diffic = "";
		switch (curDifficulty)
		{
			case 0:
				diffic = '-easy';
			case 2:
				diffic = '-hard';
			case 3:
				diffic = '-shit';
		}

		var songLowercase = songName;
		var file = '';
		var daDirectory = '';
		var daSong = songName + diffic;

		#if ios
		daDirectory = "assets/assets/data/" + SongPlayer.folder + songLowercase;
		#else
		daDirectory = "assets/data/" + SongPlayer.folder + songLowercase;
		#end

		file = daDirectory + '/' + daSong + '.json';

		var oldSong = GameState.SONG;
		GameState.SONG = null; // reset cache

		#if LUA_ALLOWED
		if (!FileSystem.exists(file))
		{
			trace('Oh shit not found difficult for this file: ' + file);
			//reverse array it if hard -> shit

			var ra:Array<String> = [];
			for(i in StoryState.difficulties)
			{
				ra.push(i);
			}

			if(curDifficulty >= 2)
			{
				ra.reverse();
				trace('Recheck reverse difficult');
			}

			// so attempting to load other difficult
			for (diff in ra)
			{
				var s = diff;

				if (diff != '')
					s = "-" + diff;

				file = daDirectory + '/' + songLowercase + s + '.json';
				if (FileSystem.exists(file))
				{
					trace('Load alternative difficult: ' + ((s == '') ? "Normal" : s));
					var popipo = songLowercase + s;
					GameState.SONG = Song.loadFromJson(popipo, GameState.playingSong.folder + songLowercase);
					break;
				}
			}

			// oh shit load freeplay again
			if (GameState.SONG == null)
			{
				//re-set it
				GameState.SONG = oldSong;
				trace('data file not found for song: ' + songLowercase + ", forced reset state!");
				if (forceRestartScene)
				{
					FlxG.resetState();
				}
				return;
			}
		}
		else
		{
			trace('data file loaded sucessful!: ' + file);
			GameState.SONG = Song.loadFromJson(daSong, GameState.playingSong.folder + songLowercase);
		}
		#end
	}

	function changeDifficulty(change:Int = 0):Void
	{
		curDifficulty += change;

		if (curDifficulty < 0)
			curDifficulty = 3;
		if (curDifficulty > 3)
			curDifficulty = 0;

		sprDifficulty.offset.x = 0;
		sprDifficulty.offset.y = 0;

		switch (curDifficulty)
		{
			case 0:
				sprDifficulty.animation.play('easy');
				sprDifficulty.offset.x = 20;
				// #if Portrait
				// sprDifficulty.offset.x = 786 - 751;
				// sprDifficulty.offset.y = 491 - 472;
				// #end
			
			case 1:
				sprDifficulty.animation.play('normal');
				sprDifficulty.offset.x = 70;

				#if Portrait
				sprDifficulty.offset.x -= 20;
				// sprDifficulty.offset.x = 786 - 775;
				// sprDifficulty.offset.y = 491 - 491;
				#end				
			case 2:
				sprDifficulty.animation.play('hard');
				sprDifficulty.offset.x = 20;

				#if Portrait
				sprDifficulty.offset.x += 10;
				#end

			case 3:
				sprDifficulty.animation.play('alt');
				sprDifficulty.offset.x = 60;

				#if Portrait
				sprDifficulty.offset.x -= 15;
				#end
		}

		sprDifficulty.alpha = 0;
	

		// USING THESE WEIRD VALUES SO THAT IT DOESNT FLOAT UP
		sprDifficulty.y = leftArrow.y - 15;
		intendedScore = Highscore.getWeekScore(curWeek, curDifficulty);

		#if !switch
		intendedScore = Highscore.getWeekScore(curWeek, curDifficulty);
		#end

		FlxTween.tween(sprDifficulty, {y: leftArrow.y + 15, alpha: 1}, 0.07);

	}


	function isUnlocked():Bool
	{
		return (curWeek + 1 >= weekUnlocked.length && FlxG.save.data.unlockedAllWeekShit)
			|| (weekUnlocked[curWeek + 1]);
	}
	

	var lerpScore:Int = 0;
	var intendedScore:Int = 0;

	function changeWeek(change:Int = 0):Void
	{
		curWeek += change;

		if (curWeek >= SongManager.songs.length)
			curWeek = 0;
		if (curWeek < 0)
			curWeek = SongManager.songs.length - 1;

		var bullShit:Int = 0;

		for (item in grpWeekText.members)
		{
			item.targetY = bullShit - curWeek;
			if (item.targetY == Std.int(0) && weekUnlocked[curWeek])
				item.alpha = 1;
			else
				item.alpha = 0.6;
			bullShit++;
		}

		//get first song in the selected week
		baseSong = SongPlayerManager.getCurrentSong(SongManager.songs[curWeek].songList[0]);
		FlxG.sound.play(Paths.sound('scrollMenu'));

		updateText();
	}

	function updateText()
	{
		// grpWeekCharacters.members[0].setCharacter(SongManager.songs[curWeek].character);
		// grpWeekCharacters.members[1].setCharacter('bf');
		// grpWeekCharacters.members[2].setCharacter('gf');
		
		loadWeekBG(curWeek);
		// baseSong.setDadMenuCharacter(dad);

		txtTracklist.text = "Tracks\n";
		var stringThing:Array<String> = SongManager.songs[curWeek].songList;

		for (i in stringThing)
			txtTracklist.text += "\n" + i;

		txtTracklist.text = txtTracklist.text.toUpperCase();

		txtTracklist.screenCenter(X);
		txtTracklist.x -= FlxG.width * 0.35;

		txtTracklist.text += "\n";

		#if !switch
		intendedScore = Highscore.getWeekScore(curWeek, curDifficulty);
		#end
	}
}
