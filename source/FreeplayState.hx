package;

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
	static var curSelected:Int = 0;
	var curDifficulty:Int = 1;

	var scoreText:FlxText;
	var diffText:FlxText;
	var lerpScore:Int = 0;
	var intendedScore:Int = 0;

	private var grpSongs:FlxTypedGroup<Alphabet>;
	private var curPlaying:Bool = false;

	private var iconArray:Array<HealthIcon> = [];
	private var videoArray:Array<VideoIcon> = [];

	override function create()
	{

		// fetch song shits from SongManager
		songs = new Array<SongMetadata>();
		var weekNum = 0;
		for (i in SongManager.songs)
		{
			var wweekSongs:Array<String> = i.songList;
			var firstSong:Bool = true;
			for (song in wweekSongs)
			{
				addSong(song, weekNum, firstSong);
				firstSong = false;
			}

			weekNum++;
		}


		for(i in songs)
			trace(i.songName);


		 #if windows
		 // Updating Discord Rich Presence
		 DiscordClient.changePresence("In the Freeplay Menu", null);
		 #end

		var isDebug:Bool = false;

		#if debug
		isDebug = true;
		#end

		// LOAD MUSIC

		// LOAD CHARACTERS

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuBGBlue'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.15;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();

		bg.screenCenter(X);
		bg.antialiasing = true;

		bg.scale.x *= Main.fx;
		bg.scale.y *= Main.fy;


		add(bg);

		grpSongs = new FlxTypedGroup<Alphabet>();
		add(grpSongs);

		for (i in 0...songs.length)
		{
			var songText:Alphabet = new Alphabet(0, (70 * i) + 30, songs[i].songName, true, false, true);
			songText.isMenuItem = true;
			songText.targetY = i;
			grpSongs.add(songText);

			var baseSong:BaseSong = SongPlayerManager.getCurrentSong(songs[i].songName);

			var icon:HealthIcon = new HealthIcon();
			baseSong.getDadIcon(icon);

			icon.sprTracker = songText;

			var videoIcon:VideoIcon = new VideoIcon();
			videoIcon.sprTracker = songText;

			// using a FlxGroup is too much fuss!

			videoArray.push(videoIcon);
			iconArray.push(icon);
			add(icon);
			add(videoIcon);

			// songText.x += 40;
			// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
			// songText.screenCenter(X);
		}

		scoreText = new FlxText(FlxG.width * 0.7, 5, 0, "", 32);
		// scoreText.autoSize = false;
		scoreText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, RIGHT);
		// scoreText.alignment = RIGHT;

		var scoreBG:FlxSprite = new FlxSprite(scoreText.x - 6, 0).makeGraphic(Std.int(FlxG.width * 0.35), 66, 0xFF000000);
		scoreBG.alpha = 0.6;
		add(scoreBG);

		diffText = new FlxText(scoreText.x, scoreText.y + 36, 0, "", 24);
		diffText.font = scoreText.font;
		add(diffText);

		add(scoreText);

		changeSelection();
		changeDiff();

		// FlxG.sound.playMusic(Paths.music('title'), 0);
		// FlxG.sound.music.fadeIn(2, 0, 0.8);
		selector = new FlxText();

		selector.size = 40;
		selector.text = ">";
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

			trace(md);
		 */

		AdMob.hideBanner();

		Controller.init(this, FULL, A_B);
		LoadingState.createBlackFadeOut(this);

		AdMob.onInterstitialEvent = onRewarded;

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

	public function addWeek(songs:Array<String>, weekNum:Int, ?songCharacters:Array<String>)
	{
		if (songCharacters == null)
			songCharacters = ['dad'];

		var num:Int = 0;
		var firstSong:Bool = true;
		for (song in songs)
		{
			addSong(song, weekNum, firstSong);
			firstSong = false;
			if (songCharacters.length != 1)
				num++;
		}
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

		scoreText.text = "PERSONAL BEST:" + lerpScore;

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
		var songLowercase = StringTools.replace(songs[curSelected].songName, " ", "-").toLowerCase();
		switch (songLowercase)
		{
			case 'dad-battle':
				songLowercase = 'dadbattle';
			case 'philly-nice':
				songLowercase = 'philly';
		}
		// adjusting the highscore song name to be compatible (update)
		// would read original scores if we didn't change packages
		var songHighscore = StringTools.replace(songs[curSelected].songName, " ", "-");
		switch (songHighscore)
		{
			case 'Dad-Battle':
				songHighscore = 'Dadbattle';
			case 'Philly-Nice':
				songHighscore = 'Philly';
		}

		trace(songLowercase);

		var poop:String = Highscore.formatSong(songHighscore, curDifficulty);

		trace(poop);

		var curSong = songs[curSelected];

		PlayState.playingSong = SongManager.songs[curSong.week];
		PlayState.SONG = Song.loadFromJson(poop, SongManager.songs[curSong.week].folder + songLowercase);

		PlayState.isStoryMode = false;
		PlayState.storyDifficulty = curDifficulty;
		PlayState.storyWeek = songs[curSelected].week;

		LoadingState.loadAndSwitchState(new SelectionState());
	}

	function changeDiff(change:Int = 0)
	{
		curDifficulty += change;

		if (curDifficulty < 0)
			curDifficulty = 2;
		if (curDifficulty > 2)
			curDifficulty = 0;

		// adjusting the highscore song name to be compatible (changeDiff)
		var songHighscore = StringTools.replace(songs[curSelected].songName, " ", "-");
		switch (songHighscore) {
			case 'Dad-Battle': songHighscore = 'Dadbattle';
			case 'Philly-Nice': songHighscore = 'Philly';
		}
		
		#if !switch
		intendedScore = Highscore.getScore(songHighscore, curDifficulty);
		#end

		switch (curDifficulty)
		{
			case 0:
				diffText.text = "EASY";
			case 1:
				diffText.text = 'NORMAL';
			case 2:
				diffText.text = "HARD";
		}
	}

	function changeSelection(change:Int = 0)
	{
		#if !switch
		// //NGio.logEvent('Fresh');
		#end

		// //NGio.logEvent('Fresh');
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = songs.length - 1;
		if (curSelected >= songs.length)
			curSelected = 0;

		// selector.y = (70 * curSelected) + 30;
		
		// adjusting the highscore song name to be compatible (changeSelection)
		// would read original scores if we didn't change packages
		var songHighscore = StringTools.replace(songs[curSelected].songName, " ", "-");
		switch (songHighscore) {
			case 'Dad-Battle': songHighscore = 'Dadbattle';
			case 'Philly-Nice': songHighscore = 'Philly';
		}

		#if !switch
		intendedScore = Highscore.getScore(songHighscore, curDifficulty);
		// lerpScore = 0;
		#end

		var curSong = songs[curSelected];


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
