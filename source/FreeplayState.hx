package;

import flixel.graphics.frames.FlxAtlasFrames;
import extension.admob.AdMob;
import fmf.songs.*;
import ui.FlxVirtualPad.FlxActionMode;
import ui.FlxVirtualPad.FlxDPadMode;
import ui.Controller;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;


#if windows
import Discord.DiscordClient;
#end

using StringTools;

class FreeplayState extends MusicBeatState
{
	var songs:Array<SongMetadata> = [];

	var selector:FlxText;
	static var curSelected:Int = 1;

	var scoreText:FlxText;
	var diffText:FlxText;
	var lerpScore:Int = 0;
	var intendedScore:Int = 0;

	private var grpSongs:FlxTypedGroup<AlphabetShit>;
	private var curPlaying:Bool = false;

	private var iconArray:Array<HealthIcon> = [];
	private var videoArray:Array<VideoIcon> = [];

	private var curWeek:Int;

	private var totalWeek:Int;

	private var bg:FlxSprite;

	var daDiff:String;
	var daDiffColor:FlxColor;

	function removeOldWeek()
	{

		if (grpSongs != null)
		{

			for (i in 0...videoArray.length)
			{
				var daMember = videoArray.pop();
				remove(daMember);
			}

			for (i in 0...iconArray.length)
			{
				var daMember = iconArray.pop();
				remove(daMember);
			}

			for (i in 0...grpSongs.length)
			{
				var daMember = grpSongs.members.pop();
				remove(daMember);
			}

		}
		songs = new Array<SongMetadata>();

	}

	private function getArray(num:Int):Array<Int>
	{
		var result:Array<Int> = new Array<Int>();
		for (i in 0...num)
		{
			result.push(i);
		}
		return result;
	}

	function getSkinTex():FlxAtlasFrames
	{
		var skin = SkinManager.loadSkin(new Tutorial());
		return skin.getSkinTex();
	}

	function loadWeek()
	{
		removeOldWeek();

		var i = SongManager.songs[curWeek];
		var wweekSongs:Array<String> = i.songList;
		var firstSong:Bool = true;

		var prevWeek = curWeek - 1 < 0 ? totalWeek - 1 : curWeek - 1;
		var nextWeek = curWeek + 1 >= totalWeek ? 0 : curWeek + 1;
	
		//(SongManager.songs[prevWeek].songTitle
		addSong('shit', curWeek, false);
		for (song in wweekSongs)
		{
			addSong(song, curWeek, firstSong);
			firstSong = false;
		}
		addSong('shit', curWeek, false);

		scoreText.text = i.songTitle;
		
		grpSongs = new FlxTypedGroup<AlphabetShit>();
		add(grpSongs);
	

		for (i in 0...songs.length)
		{

			var shitSong:Bool = songs[i].songName == 'shit';

			var songText:AlphabetShit = new AlphabetShit(0, (70 * i) + 30, shitSong ? '' : SongFilter.filter(songs[i].songName), true, false, true);
			songText.isMenuItem = true;
			songText.targetY = i + 4;
			grpSongs.add(songText);


			var baseSong:BaseSong = SongPlayerManager.getCurrentSong(songs[i].songName);
			var icon:HealthIcon = new HealthIcon();
			if (!shitSong)
				baseSong.getDadIcon(icon);
			else
			{
				// icon.loadGraphic(Paths.image('note_effects/fire'  + '/shit', 'mods'), true, 256, 256);
				icon.animation.add('hit', getArray(63), 90, true);
				
				icon.frames = getSkinTex();

				if (i != 0)
				{
					// icon.angle = 180;
					icon.animation.addByPrefix('hit', 'blue0');
				}
				else
					icon.animation.addByPrefix('hit', 'green0');


				icon.animation.play('hit');
				
				icon.scale.x = 0.35;
				icon.scale.y = 0.35;

				icon.setOffsetX(-50);

				//flip arrow
				
			}

		
			icon.sprTracker = songText;

			var videoIcon:VideoIcon = new VideoIcon();
			videoIcon.sprTracker = songText;

			// using a FlxGroup is too much fuss!

			videoArray.push(videoIcon);
			iconArray.push(icon);
			add(icon);
			add(videoIcon);
		}




	}

	function loadBG()
	{
		bg = new FlxSprite().loadGraphic(Paths.image('menuBGBlue'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.10;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;

		if (Main.daTabletShit)
		{
			bg.scale.x *= Main.shitZoom;
			bg.scale.y *= Main.shitZoom;
		}

		add(bg);

	
		var pX:Float = FlxG.width * 0.4;

		scoreText = new FlxText(pX, 5, 0, "", 32);
		// scoreText.autoSize = false;
		// scoreText.screenCenter(X);
		scoreText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER);
		// scoreText.alignment = RIGHT;

		var scoreBG:FlxSprite = new FlxSprite(0, 0).makeGraphic(Std.int(FlxG.width * 1.1), 77, 0xFF000000);
		scoreBG.alpha = 0.6;
		scoreBG.screenCenter(X);
		add(scoreBG);

		diffText = new FlxText(pX, scoreText.y + 36, 0, "", 24);
		diffText.font = scoreText.font;
		diffText.setFormat(Paths.font("vcr.ttf"), 24, FlxColor.WHITE, CENTER);

		// diffText.screenCenter(X);
		add(diffText);

		add(scoreText);

	

		// FlxG.sound.playMusic(Paths.music('title'), 0);
		// FlxG.sound.music.fadeIn(2, 0, 0.8);
		selector = new FlxText();

		selector.size = 40;
		selector.text = ">";
	}


	override function create()
	{

		totalWeek = SongManager.songs.length;
		loadBG();
		
		// fetch song shits from SongManager
		songs = new Array<SongMetadata>();
		var weekNum = 0;

		curWeek = 0;
		loadWeek();
		


		// for(i in songs)
			//@notrace(i.songName);


		 #if windows
		 // Updating Discord Rich Presence
		 DiscordClient.changePresence("In the Freeplay Menu", null);
		 #end

		var isDebug:Bool = false;

		#if !mobile
		#if debug
		isDebug = true;
		#end
		#end
		
		// LOAD MUSIC

		// LOAD CHARACTERS


		// add(selector);

		var swag:Alphabet = new Alphabet(1, 0, "swag");

		// JUST DOIN THIS SHIT FOR TESTING!!!
		/* 
			var md:String = Markdown.markdownToHtml(Assets.getText('CHANGELOG.md'));

			var texFel:TextField = new TextField();
			texFel.width = FlxG.width;
			texFel.height = FlxG.height;
			// texFel.
			texFel.htmlText = md;

			FlxG.stage.addChild(texFel);

			// scoreText.textField.htmlText = md;

			//@notrace(md);
		 */

		 getDiff();
		 changeSelection(0);
		 changeDiff();

		AdMob.hideBanner();

		Controller.init(this, FULL, A_B);
		LoadingState.createBlackFadeOut(this);

		AdMob.onInterstitialEvent = onRewarded;

		LoadingState.clearCachedSong();

		// Debugger.create(this, camera);

		super.create();
	}

	function onRewarded(shitReward)
	{
		playLevel();
	}
	
	public function addSong(songName:String, weekNum:Int, firstSong:Bool)
	{
		songs.push(new SongMetadata(songName, weekNum, firstSong));
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		lerpScore = Math.floor(FlxMath.lerp(lerpScore, intendedScore, 0.4));

		if (Math.abs(lerpScore - intendedScore) <= 10)
			lerpScore = intendedScore;


		var upP = Controller.UP_P;
		var downP = Controller.DOWN_P;
		var accepted = Controller.ACCEPT;

		if (upP)
		{
			changeSelection(-1);
		}
		if (downP)
		{
			changeSelection(1);
		}

		if (Controller.LEFT_P)
			changeDiff(-1);
		if (Controller.RIGHT_P)
			changeDiff(1);

		if (Controller.BACK)
		{
			// #if PRELOAD_ALL
			// FlxG.sound.music.stop();
			// #end

			FlxG.switchState(new MainMenuState());
		}

		if (accepted)
		{
			// pre lowercasing the song name (update)

			// if (songs[curSelected].firstSong)
			// {
			FlxG.sound.play(Paths.sound('confirmMenu'));
			AdMob.showInterstitial(60);
			playLevel();
			// }
			// else
			// {
			// 	// try show video

			// 	var showVideoSuccess = AdMob.showRewardVideo();

			// 	#if !mobile
			// 	playLevel();
			// 	#end
			// 	// showVideoSuccess = true;
			// 	// #end
			// 	// if(showVideoSuccess)
			// 	// {
			// 	// 	playLevel();
			// 	// }
			// }
		}
	}

	function playLevel()
	{
		var songLowercase = SongFilter.filter(songs[curSelected].songName);

		//@notrace(songLowercase);

		var poop:String = Highscore.formatSong(songLowercase, StoryMenuState.curDifficulty);

		//@notrace(poop);

		var curSong = songs[curSelected];

		PlayState.playingSong = SongManager.songs[curSong.week];
		PlayState.SONG = Song.loadFromJson(poop, SongManager.songs[curSong.week].folder + songLowercase);
		PlayState.SONG_NAME = songLowercase;
		PlayState.RAW_SONG_NAME = songs[curSelected].songName;

		PlayState.isStoryMode = false;
		PlayState.storyDifficulty = StoryMenuState.curDifficulty;
		PlayState.storyWeek = songs[curSelected].week;

		LoadingState.loadAndSwitchState(new SelectionState());
	}

	function changeDiff(change:Int = 0)
	{
		StoryMenuState.curDifficulty += change;

		if (StoryMenuState.curDifficulty < 0)
			StoryMenuState.curDifficulty = 3;
		if (StoryMenuState.curDifficulty > 3)
			StoryMenuState.curDifficulty = 0;

		// adjusting the highscore song name to be compatible (changeDiff)
		var songHighscore = SongFilter.filter(songs[curSelected].songName);
		
		#if !switch
		intendedScore = Highscore.getScore(songHighscore, StoryMenuState.curDifficulty);
		#end

		getDiff();
		diffText.text = songHighscore.toUpperCase() + " " + daDiff;
	}


	function getDiff()
	{
		switch (StoryMenuState.curDifficulty)
		{
			case 0:
				daDiff = "EASY";
				daDiffColor = FlxColor.GREEN;
			case 1:
				daDiff = 'NORMAL';
				daDiffColor = FlxColor.YELLOW;
			case 2:
				daDiff = "HARD";
				daDiffColor = FlxColor.RED;

			case 3:
				daDiff = "SHIT";
				daDiffColor = FlxColor.BLUE;
		}

		diffText.color = daDiffColor;

	}

	function changeSelection(change:Int = 0)
	{
		#if !switch
		// //NGio.logEvent('Fresh');
		#end

		// //NGio.logEvent('Fresh');
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curSelected += change;

		if (curSelected <= 0)
		{
			curWeek --;
			if (curWeek < 0)
				curWeek = totalWeek - 1;

			loadWeek();
			curSelected = songs.length - 2;
		}

		if (curSelected + 1 >= songs.length)
		{
			curWeek ++;

			if (curWeek >= totalWeek)
				curWeek = 0;

			loadWeek();
			curSelected = 1;
		}

		// selector.y = (70 * curSelected) + 30;
		
		// adjusting the highscore song name to be compatible (changeSelection)
		// would read original scores if we didn't change packages
		var songHighscore = SongFilter.filter(songs[curSelected].songName);
	
		#if !switch
		intendedScore = Highscore.getScore(songHighscore, StoryMenuState.curDifficulty);
		// lerpScore = 0;
		#end

		var curSong = songs[curSelected];

		diffText.text = songHighscore.toUpperCase() + " " + daDiff;



		// #if PRELOAD_ALL
		// FlxG.sound.playMusic(Paths.inst(songs[curSelected].songName, SongManager.songs[curSong.week].folder), 0);
		// #end

		var bullShit:Int = 0;


		for (i in 0...iconArray.length)
		{			
			//all unlocked, hail kdorado
			var unlocked:Bool = true; //songs[i].firstSong;
			iconArray[i].alpha = unlocked ? 0.6 : 0;
			videoArray[i].alpha = unlocked ? 0 : 0.6;

		}

		var unlocked:Bool =  true; // songs[curSelected].firstSong;

		iconArray[curSelected].alpha = unlocked ? 1 : 0;
		videoArray[curSelected].alpha = unlocked ? 0 : 1;

		for (item in grpSongs.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));
			}
		}
	}
}

class SongMetadata
{
	public var songName:String = "";
	public var week:Int = 0;
	public var firstSong:Bool;

	//we no longer need character per song,
	// I'm using the SongManager to handle which character should be render
	// public var songCharacter:String = "";

	public function new(song:String, week:Int, firstSong:Bool)
	{
		this.songName = song;
		this.week = week;
		this.firstSong = firstSong;
		// this.songCharacter = songCharacter;
	}
}
