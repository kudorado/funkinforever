package state; 

import ui.*;
import reactor.*;
import controls.*;
import state.*;

import flixel.ui.FlxButton;
import flixel.addons.editors.ogmo.FlxOgmo3Loader.Point;
import flixel.system.debug.FlxDebugger;
import extension.admob.AdMob;
import ui.FlxVirtualPad.FlxActionMode;
import ui.FlxVirtualPad.FlxDPadMode;
import ui.Controller;
import fmf.characters.*;
import fmf.songs.*;
import flixel.input.keyboard.FlxKey;
import haxe.Exception;
import openfl.geom.Matrix;
import openfl.display.BitmapData;
import openfl.utils.AssetType;
import lime.graphics.Image;
import flixel.graphics.FlxGraphic;
import openfl.utils.AssetManifest;
import openfl.utils.AssetLibrary;
import flixel.system.FlxAssets;
import lime.app.Application;
import lime.media.AudioContext;
import lime.media.AudioManager;
import openfl.Lib;
import Section.SwagSection;
import Song.SwagSong;
import WiggleEffect.WiggleEffectType;
import flixel.FlxBasic;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxObject;	
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.atlas.FlxAtlas;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;
import flixel.util.FlxCollision;
import flixel.util.FlxColor;
import flixel.util.FlxSort;
import flixel.util.FlxStringUtil;
import flixel.util.FlxTimer;
import haxe.Json;
import lime.utils.Assets;
import openfl.display.BlendMode;
import openfl.display.StageQuality;
import openfl.filters.ShaderFilter;
#if windows
import Discord.DiscordClient;
#end
#if windows
import Sys;
import sys.FileSystem;
#end

using StringTools;

class GamePlayState extends MusicBeatState
{
	public static var instance:GamePlayState = null;

	//SONG name in the json file
	public static var CURRENT_SONG:String;

	//SONG name in the SongManager (filtered)
	public static var SONG_NAME:String;

	// SONG name in the SongManager (raw)
	public static var RAW_SONG_NAME:String;


	public static var songPlayer:SongPlayer;
	public static var playingSong:SongData;

	
	public static var curStage:String = '';
	public static var SONG:SwagSong;



	public static var isStoryMode:Bool = false;
	public static var storyWeek:Int = 0;
	public static var storyPlaylist:Array<String> = [];

	public static var storyDifficulty:Int = 1;
	public static var weekSong:Int = 0;
	public static var shits:Int = 0;
	public static var bads:Int = 0;
	public static var goods:Int = 0;
	public static var sicks:Int = 0;

	public static var songPosBG:FlxSprite;
	public static var songPosBar:FlxBar;


	public static var healthBarShitBG:FlxSprite;
	public static var healthBarShit:FlxBar;


	public static var noteBools:Array<Bool> = [false, false, false, false];

	var halloweenLevel:Bool = false;
	var songLength:Float = 0;
	var kadeEngineWatermark:FlxText;

	public var camFollowSpeed:Float = 1;

	#if windows
	// Discord RPC variables
	var storyDifficultyText:String = "";
	var iconRPC:String = "";
	var detailsText:String = "";
	var detailsPausedText:String = "";
	#end

	public var vocals:FlxSound;

	public static function dad():Character
	{
		return songPlayer.dad;
	}

	public static function gf():Character
	{
		return songPlayer.gf;
	}

	public static function boyfriend():PlayableCharacter
	{
		return songPlayer.bf;
	}

	public var isMidSongEvent:Bool;

	public var restartGame:Bool;
	
	public var notes:FlxTypedGroup<Note>;

	private var unspawnNotes:Array<Note> = [];

	public var strumLine:FlxSprite;

	private var curSection:Int = 0;

	public var camFollow:FlxObject;

	public var prevCamFollow:FlxObject;

	public var strumLineNotes:FlxTypedGroup<FlxSprite> = null;
	public var playerStrums:FlxTypedGroup<FlxSprite> = null;
	public var cpuStrums:FlxTypedGroup<FlxSprite> = null;

	public var effectStrums:FlxTypedGroup<FlxSprite> = null;


	public var camZooming:Bool = false;

	private var curSong:String = "";

	public var gfSpeed:Float = 1;
	public var health:Float = 2; // making public because sethealth doesnt work without it

	private var combo:Int = 0;

	public static var misses:Int = 0;

	private var accuracy:Float = 0.00;
	private var accuracyDefault:Float = 0.00;
	private var totalNotesHit:Float = 0;
	private var totalNotesHitDefault:Float = 0;
	private var totalPlayed:Int = 0;
	private var ss:Bool = false;

	private var healthBarBG:FlxSprite;
	private var healthBar:FlxBar;
	private var songPositionBar:Float = 0;

	private var generatedMusic:Bool = false;
	private var startingSong:Bool = false;

	public var iconP1:Icon; // making these public again because i may be stupid
	public var iconP2:Icon; // what could go wrong?
	public var camHUD:FlxCamera;
	public var camGame:FlxCamera;


	var scoreTxt:FlxText;
	var missTxt:FlxText;
	var accuracyTxt:FlxText;
	var npsTxt:FlxText;
	var speedTxt:FlxText;

	var gfTimer:Float;
	public var daTutorial:Bool;


	var lerpScore:Int;
	
	//immortal godlike
	var invisible:Bool;


	public static var offsetTesting:Bool = false;

	var notesHitArray:Array<Date> = [];
	var currentFrames:Int = 0;

	public var dialogue:Array<String> = ['dad:blah blah blah', 'bf:coolswag'];

	public function gfStep():Bool
	{
		return (generatedMusic && SONG.notes[Std.int(curStep / 16)] != null);
	}

	var daAuto:String;
	var songName:FlxText;

	var wiggleShit:WiggleEffect = new WiggleEffect();

	public var talking:Bool = true;
	var songScore:Int = 0;
	var songScoreDef:Int = 0;
	var isOver:Bool;

	public static var campaignScore:Int = 0;

	public var defaultCamZoom:Float = 0.85;
	public var camZoomShit(get, never):Float;
	public inline function get_camZoomShit():Float
	{
		return defaultCamZoom * Main.fuckZoom;
	}

	public static var daPixelZoom:Float = 6;

	public static var theFunne:Bool = true;

	public var lastNote:String;


	var funneEffect:FlxSprite;

	public var inCutscene:Bool = false;

	public static var repPresses:Int = 0;
	public static var repReleases:Int = 0;

	public static var timeCurrently:Float = 0;
	public static var timeCurrentlyR:Float = 0;

	// Will fire once to prevent debug spam messages and broken animations
	private var triggeredAlready:Bool = false;

	// Will decide if she's even allowed to headbang at all depending on the song
	private var allowedToHeadbang:Bool = false;

	// Per song additive offset
	public static var songOffset:Float = 0;

	// BotPlay text
	private var botgamePlayState:FlxText;

	private var executeModchart = false;


	public static var playAsDad:Bool = false;

	//determine which's turn, 1 is player, -1 is dad
	public var turn:Int;


	public var bfTurn(get, never):Bool;
	inline function get_bfTurn()
		return turn == 1;

	public var dadTurn(get, never):Bool;
	inline function get_dadTurn()
		return !bfTurn;

	// API stuff

	public function addObject(object:FlxBasic)
	{
		add(object);
	}

	public function removeObject(object:FlxBasic)
	{
		remove(object);
	}

	override public function create()
	{

		instance = this;
		
		AdMob.hideBanner();

		songOffset = 0;

		if (FlxG.sound.music != null)
			FlxG.sound.music.stop();

		sicks = 0;
		bads = 0;
		shits = 0;
		goods = 0;

		misses = 0;

		repPresses = 0;
		repReleases = 0;

		CURRENT_SONG = SONG_NAME;

		botPlayShit =  FlxG.save.data.botplay;

		// pre lowercasing the song name (create)
		var songLowercase = SongFilter.filter(CURRENT_SONG);

		#if windows
		executeModchart = FileSystem.exists(Paths.lua(songLowercase + "/modchart"));
		#end
		#if !cpp
		executeModchart = false; // FORCE disable for non cpp targets
		#end

		//@notrace('Mod chart: ' + executeModchart + " - " + Paths.lua(songLowercase + "/modchart"));

		#if windows
		// Making difficulty text for Discord Rich Presence.
		switch (storyDifficulty)
		{
			case 0:
				storyDifficultyText = "Easy";
			case 1:
				storyDifficultyText = "Normal";
			case 2:
				storyDifficultyText = "Hard";
		}

		iconRPC = SONG.player2;

		// To avoid having duplicate images in Discord assets
		switch (iconRPC)
		{
			case 'senpai-angry':
				iconRPC = 'senpai';
			case 'monster-christmas':
				iconRPC = 'monster';
			case 'mom-car':
				iconRPC = 'mom';
		}

		// String that contains the mode defined here so it isn't necessary to call changePresence for each mode
		if (isStoryMode)
		{
			detailsText = "Story Mode: Week " + storyWeek;
		}
		else
		{
			detailsText = "Freeplay";
		}

		// String for when the game is paused
		detailsPausedText = "Paused - " + detailsText;

		// Updating Discord Rich Presence.
		DiscordClient.changePresence(detailsText
			+ " "
			+ CURRENT_SONG
			+ " ("
			+ storyDifficultyText
			+ ") "
			+ Ratings.GenerateLetterRank(accuracy),
			"\nAcc: "
			+ HelperFunctions.truncateFloat(accuracy, 2)
			+ "% | Score: "
			+ songScore
			+ " | Misses: "
			+ misses, iconRPC);
		#end

		// var gameCam:FlxCamera = FlxG.camera;
		camGame = new FlxCamera();
		camHUD = new FlxCamera();
		camHUD.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camHUD);

		FlxCamera.defaultCameras = [camGame];

		persistentUpdate = true;
		persistentDraw = true;

		Conductor.mapBPMChanges(SONG);
		Conductor.changeBPM(SONG.bpm);

		//@notrace('INFORMATION ABOUT WHAT U PLAYIN WIT:\nFRAMES: ' + Conductor.safeFrames + '\nZONE: ' + Conductor.safeZoneOffset + '\nTS: '
			// + Conductor.timeScale + '\nBotPlay : ' + botPlayShit);

		//@notrace("cur song shit: " + CURRENT_SONG);

		
		songPlayer = SongPlayerManager.getCurrentSong(RAW_SONG_NAME);

		//hardcode this shit
		if(CURRENT_SONG == 'sepai' || CURRENT_SONG == 'roses')
		curStage = 'school';

		if(CURRENT_SONG == 'thorns')
		curStage = 'schoolEvil';

		songPlayer.init();

		// no need create dialogue shit in freeplay, yay
		// if (isStoryMode)
			// songPlayer.createDialogue(startCountdown);

		songPlayer.applyCamPosition();
		
		Conductor.songPosition = -5000;

		strumLine = new FlxSprite(0, 50).makeGraphic(FlxG.width, 10);
		strumLine.scrollFactor.set();

		if (FlxG.save.data.downscroll)
			strumLine.y = FlxG.height - 165;

		strumLineNotes = new FlxTypedGroup<FlxSprite>();
		add(strumLineNotes);

		playerStrums = new FlxTypedGroup<FlxSprite>();
		effectStrums = new FlxTypedGroup<FlxSprite>();
		cpuStrums = new FlxTypedGroup<FlxSprite>();


		// startCountdown();

		// if (CURRENT_SONG == null)
			//@notrace('song is null???');
		// else
			//@notrace('song looks gucci');

		generateSong(CURRENT_SONG);

		camFollow = new FlxObject(0, 0, 1, 1);

		var daX = songPlayer.bf.x;
		var daY = songPlayer.bf.y + 50;

		setCamFollowPosition(daX, daY);
		camFollow.setPosition(daX, daY);

		if (prevCamFollow != null)
		{
			camFollow = prevCamFollow;
			prevCamFollow = null;
		}

		add(camFollow);

		camGame.follow(camFollow, LOCKON, 0.04);
		// camGame.follow(camFollow, LOCKON, 0.04 * (30 / (cast(Lib.current.getChildAt(0), Main)).getFPS()));
		// camGame.setScrollBounds(0, FlxG.width, 0, FlxG.height);
		camGame.zoom = camZoomShit;
		camGame.focusOn(camFollow.getPosition());

		FlxG.worldBounds.set(0, 0, FlxG.width, FlxG.height);
  
		FlxG.fixedTimestep = false;
		
		healthBarBG = new FlxSprite(0, FlxG.height * 0.9).loadGraphic(Paths.image('healthBar'));

		healthBarBG.color = FlxColor.BLACK;
		healthBarBG.alpha = 0.85;

		if (FlxG.save.data.downscroll)
			healthBarBG.y = 50;


		healthBarBG.screenCenter(X);
		healthBarBG.scrollFactor.set();
		add(healthBarBG);



		if (playAsDad)
		{
			healthBar = new FlxBar(healthBarBG.x + 4, healthBarBG.y + 4, LEFT_TO_RIGHT, Std.int(healthBarBG.width - 8), Std.int(healthBarBG.height - 8), this,
				'health', 0,  2);
		}
		else
		{
			healthBar = new FlxBar(healthBarBG.x + 4, healthBarBG.y + 4, RIGHT_TO_LEFT, Std.int(healthBarBG.width - 8), Std.int(healthBarBG.height - 8), this,
				'health', 0, 2);
		}

		healthBar.scrollFactor.set();
		healthBar.createFilledBar(0x000000FF, FlxColor.RED);

		healthBarBG.setGraphicSize(Std.int(healthBarBG.width * 0.35));
		healthBar.setGraphicSize(Std.int(healthBarBG.width * 0.35));

		// healthBar.alpha = 0;

		// healthBar
		add(healthBar);




//------------------------mic c up copy ----------------------------

		daAuto = botPlayShit ? " [A]" : "";
		songName = new FlxText(35, healthBarBG.y + 26, 0, CURRENT_SONG.toUpperCase() + ": " + getDiff().toUpperCase() + daAuto, 20);
		if (FlxG.save.data.downscroll)
			songName.y = healthBarBG.y - 18;

		songName.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, RIGHT);
		songName.setBorderStyle(OUTLINE, 0xFF000000, 3, 1);
		songName.scrollFactor.set();
		add(songName);

		scoreTxt = new FlxText(songName.x, songName.y - 26, 0, "", 20);
		if (FlxG.save.data.downscroll)
			scoreTxt.y = scoreTxt.y + 26 + 26;

		scoreTxt.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, RIGHT);
		scoreTxt.setBorderStyle(OUTLINE, 0xFF000000, 3, 1);
		scoreTxt.scrollFactor.set();
		add(scoreTxt);

		missTxt = new FlxText(scoreTxt.x, scoreTxt.y - 26, 0, "", 20);
		if (FlxG.save.data.downscroll)
			missTxt.y = scoreTxt.y + 26;
		missTxt.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, RIGHT);
		missTxt.setBorderStyle(OUTLINE, 0xFF000000, 3, 1);
		missTxt.scrollFactor.set();
		add(missTxt);

		accuracyTxt = new FlxText(missTxt.x, missTxt.y - 26, 0, "", 20);
		if (FlxG.save.data.downscroll)
			accuracyTxt.y = missTxt.y + 26;
		accuracyTxt.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, RIGHT);
		accuracyTxt.setBorderStyle(OUTLINE, 0xFF000000, 3, 1);
		accuracyTxt.scrollFactor.set();
		add(accuracyTxt);



		npsTxt = new FlxText(accuracyTxt.x, accuracyTxt.y - 26, 0, "", 20);
		if (FlxG.save.data.downscroll)
			npsTxt.y = accuracyTxt.y + 26;
		npsTxt.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, RIGHT);
		npsTxt.setBorderStyle(OUTLINE, 0xFF000000, 3, 1);
		npsTxt.scrollFactor.set();
		add(npsTxt);


		// speedTxt = new FlxText(npsTxt.x, npsTxt.y - 26, 0, "", 20);
		// if (FlxG.save.data.downscroll)
		// 	speedTxt.y = npsTxt.y + 26 + 26;

		// speedTxt.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, RIGHT);
		// speedTxt.setBorderStyle(OUTLINE, 0xFF000000, 3, 1);
		// speedTxt.scrollFactor.set();
		// add(speedTxt);

		


//-----------------------------------------------------------------------------



		// Add Kade Engine watermark
		kadeEngineWatermark = new FlxText(4, healthBarBG.y
			+ 50, 0,
			SONG.song
			+ " "
			+ getDiff());

			// + (Main.watermarks ? " - KE " + MenuState.kadeEngineVer : ""));
		kadeEngineWatermark.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		kadeEngineWatermark.scrollFactor.set();
		// add(kadeEngineWatermark);

		if (FlxG.save.data.downscroll)
			kadeEngineWatermark.y = FlxG.height * 0.9 + 45;

		// botgamePlayState = new FlxText(5, 5, "AUTO", 15);
		// botGamePlayState.setFormat(Paths.font("vcr.ttf"), 24, FlxColor.WHITE, RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		// botGamePlayState.scrollFactor.set();
		// botgamePlayState.cameras = [camHUD];

		// if (botPlayShit)
		// 	add(botgamePlayState);

		iconP1 = new Icon();
		iconP2 = new Icon();

		
		songPlayer.getDadIcon(iconP2);
		songPlayer.getBFIcon(iconP1);
		

		iconP1.y = healthBar.y - (iconP1.height / 2); //so subtract half babe
		add(iconP1);

		iconP2.y = healthBar.y - (iconP2.height / 2); //subtract half babe
		add(iconP2);


		//new system disable heatlhbar and icon

		healthBar.visible = false;
		healthBarBG.visible = false;

		iconP1.visible = false;
		iconP2.visible = false;


		// iconP1.y = healthBar.y;
		// iconP2.y = healthBar.y;
		add(effectStrums);


		effectStrums.cameras = [camHUD];
		strumLineNotes.cameras = [camHUD];
		notes.cameras = [camHUD];
		healthBar.cameras = [camHUD];
		healthBarBG.cameras = [camHUD];
		iconP1.cameras = [camHUD];
		iconP2.cameras = [camHUD];
		
		scoreTxt.cameras = [camHUD];
		missTxt.cameras = [camHUD];
		accuracyTxt.cameras = [camHUD];
		npsTxt.cameras = [camHUD];
		songName.cameras = [camHUD];


		// // doof.cameras = [camHUD];
		// if (FlxG.save.data.songPosition)
		// {
		// 	songPosBG.cameras = [camHUD];
		// 	songPosBar.cameras = [camHUD];
		// }

		// healthBarShitBG.cameras = [camHUD];
		// healthBarShit.cameras = [camHUD];


		kadeEngineWatermark.cameras = [camHUD];

		startingSong = true;

		gfSpeed = (SONG.bpm);


		//@notrace('starting');

		if (isStoryMode)
		{
			startCountdown();
			// songPlayer.showDialogue();
		}
		else
		{
			switch (curSong.toLowerCase())
			{
				default:
					startCountdown();
			}
		}

		mcontrols = new Mobilecontrols();
		mcontrols.cameras = [camHUD];

		if(!botPlayShit) add(mcontrols);
		
		Controller.init(this, NONE, B);
		Controller._pad.cameras = [camHUD];


		createBlackFadeOut();

		LibraryLoadState.hasCachedSong = true;

		calculateNPS();
		
		listeningModeCheck();

		createBounds();

		super.create();

		AdMob.hideBanner();
	
	}

	function createBounds()
	{
		boundMin = new FlxText(0, 0, "");
		boundMax = new FlxText(0, 25, "");


		boundMin.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, RIGHT);
		boundMin.setBorderStyle(OUTLINE, 0xFF000000, 3, 1);

		boundMax.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, RIGHT);
		boundMax.setBorderStyle(OUTLINE, 0xFF000000, 3, 1);

		boundMin.cameras = [camHUD];
		boundMax.cameras = [camHUD];


		add(boundMin);
		add(boundMax);

	}

	function isUnlocked():Bool
	{
		return (storyWeek + 1 >= StoryState.weekUnlocked.length && FlxG.save.data.unlockedAllWeekShit)
			|| (StoryState.weekUnlocked[storyWeek + 1]);
	}

	var mcontrols:Mobilecontrols; 
	var botPlayShit:Bool;
	var musicListeningShit:Bool;

	public var startTimer:FlxTimer;
	var perfectMode:Bool = false;

	var luaWiggles:Array<WiggleEffect> = [];

	#if windows
	public static var luaModchart:ModchartState = null;
	#end
	
	function getDiff():String
	{
		var dif:String = storyDifficulty == 3 ? "Shit" : storyDifficulty == 2 ? "Hard" : storyDifficulty == 1 ? "Normal" : "Easy";
		return dif;
	}

	function listeningModeCheck()
	{
		musicListeningShit = FlxG.save.data.musicListening;
		#if debug
		// musicListeningShit = true;
		// botPlayShit = true;
		#end

		if (musicListeningShit)
		{
			effectStrums.visible = false;
			strumLineNotes.visible = false;
			notes.visible = false;
			healthBar.visible = false;
			healthBarBG.visible = false;
			iconP1.visible = false;
			iconP2.visible = false;

			scoreTxt.visible = false;
			missTxt.visible = false;
			accuracyTxt.visible = false;
			npsTxt.visible = false;
			// botGamePlayState.visible = false;
		}
	}

	function startCountdown():Void
	{
		inCutscene = false;

		generateStaticArrows(0);
		generateStaticArrows(1);

		#if windows
		if (executeModchart)
		{
			luaModchart = ModchartState.createModchartState();
			luaModchart.executeState('start', [CURRENT_SONG]);
		}
		#end

		songPlayer.startCountdown();
	}

	var previousFrameTime:Int = 0;
	var lastReportedPlayheadPosition:Int = 0;
	var songTime:Float = 0;

	var songStarted = false;
	var kudoradoHandsome:Bool = true;

	function startSong():Void
	{
		
		startingSong = false;
		songStarted = true;
		previousFrameTime = FlxG.game.ticks;
		lastReportedPlayheadPosition = 0;

		if (!paused)
		{
			FlxG.sound.playMusic(Paths.inst(CURRENT_SONG, playingSong.folder), 1, false);
		}

		FlxG.sound.music.onComplete = endSong;
		vocals.play();

		// Song duration in a float, useful for the time left feature
		songLength = FlxG.sound.music.length;

		//@notrace('songLength: ' + songLength);

		if (kudoradoHandsome)
		{
			createHealthBarShit();
			createSongPosBar();
		}

		#if windows
		// Updating Discord Rich Presence (with Time Left)
		DiscordClient.changePresence(detailsText
			+ " "
			+ CURRENT_SONG
			+ " ("
			+ storyDifficultyText
			+ ") "
			+ Ratings.GenerateLetterRank(accuracy),
			"\nAcc: "
			+ HelperFunctions.truncateFloat(accuracy, 2)
			+ "% | Score: "
			+ songScore
			+ " | Misses: "
			+ misses, iconRPC);
		#end
	}

	public function shakeMinimal()
	{
		camGame.shake(0.005, 0.05);
	}

	public function shakeNormal()
	{
		camGame.shake(0.01, 0.1);
	}

	public function shakeBig()
	{
		camGame.shake(0.05, 0.25);
	}

	public function shakeGenocide()
	{
		boyfriend().playAnim("scared", true);
		camGame.shake();
	}

	public function shakePrettyBig()
	{
		camGame.shake(0.035, 0.15);
	}
		


	var targetNPS:Int;

	function calculateNPS()
	{
		var minTime = 100.0;
		var maxTime = 0.0;
		var noteCount = 0;
		for (section in SONG.notes)
		{
			for (songNotes in section.sectionNotes)
			{
				var gottaHitNote:Bool = playAsDad ? !section.mustHitSection : section.mustHitSection;
				if (songNotes[1] > 3)
				{
					gottaHitNote = (playAsDad ? section.mustHitSection : !section.mustHitSection);
				}

				if (gottaHitNote)
					noteCount++;

				var daStrumTime:Float = songNotes[0];
				if (daStrumTime < 0)
					daStrumTime = 0;
				else
				{
					daStrumTime = daStrumTime / 1000;

					if (daStrumTime < minTime)
						minTime = daStrumTime;

					if (daStrumTime > maxTime)
						maxTime = daStrumTime;
				}
			}
		}

		// var lastSections = SONG.notes[SONG.notes.length - 1].sectionNotes;
		var shit = (maxTime - minTime);
		var npsData = noteCount / shit;
		var npm = npsData * 60;
		targetNPS = Std.int(npm);
	}

	var npsShit:Int;



	private function generateSong(dataPath:String):Void
	{
		
		// FlxG.log.add(ChartParser.parse());

		var songData = SONG;
		Conductor.changeBPM(songData.bpm);

		curSong = songData.song;

		if (SONG.needsVoices)
			vocals = new FlxSound().loadEmbedded(Paths.voices(CURRENT_SONG, playingSong.folder));
		else
			vocals = new FlxSound();

		//@notrace('loaded vocals');

		FlxG.sound.list.add(vocals);

		notes = new FlxTypedGroup<Note>();
		add(notes);

		var noteData:Array<SwagSection>;

		// NEW SHIT
		noteData = songData.notes;

		var playerCounter:Int = 0;

		// pre lowercasing the song name (generateSong)
		var songLowercase = SongFilter.filter(CURRENT_SONG); 
		
		// Per song offset check
		#if windows
		var songPath = 'assets/data/' + songLowercase + '/';

		for (file in sys.FileSystem.readDirectory(songPath))
		{
			var path = haxe.io.Path.join([songPath, file]);
			if (!sys.FileSystem.isDirectory(path))
			{
				if (path.endsWith('.offset'))
				{
					//@notrace('Found offset file: ' + path);
					songOffset = Std.parseFloat(file.substring(0, file.indexOf('.off')));
					break;
				}
				else
				{
					//@notrace('Offset file not found. Creating one @: ' + songPath);
					sys.io.File.saveContent(songPath + songOffset + '.offset', '');
				}
			}
		}
		#end
		var daBeats:Int = 0; // Not exactly representative of 'daBeats' lol, just how much it has looped
		for (section in noteData)
		{
			var coolSection:Int = Std.int(section.lengthInSteps / 4);

			for (songNotes in section.sectionNotes)
			{
				var daStrumTime:Float = songNotes[0] + FlxG.save.data.offset + songOffset;
				if (daStrumTime < 0)
					daStrumTime = 0;

				var daNoteData:Int = Std.int(songNotes[1] % 4);

				var gottaHitNote:Bool = playAsDad ? !section.mustHitSection : section.mustHitSection;

				if (songNotes[1] > 3)
				{
					gottaHitNote = (playAsDad ? section.mustHitSection : !section.mustHitSection);
				}

				var oldNote:Note;
				if (unspawnNotes.length > 0)
					oldNote = unspawnNotes[Std.int(unspawnNotes.length - 1)];
				else
					oldNote = null;

				var swagNote:Note = new Note(daStrumTime, daNoteData, oldNote);
				swagNote.sustainLength = songNotes[2];
				swagNote.scrollFactor.set(0, 0);

				var susLength:Float = swagNote.sustainLength;
				susLength = susLength / Conductor.stepCrochet;
				unspawnNotes.push(swagNote);

				for (susNote in 0...Math.floor(susLength))
				{
					oldNote = unspawnNotes[Std.int(unspawnNotes.length - 1)];

					var sustainNote:Note = new Note(daStrumTime + (Conductor.stepCrochet * susNote) + Conductor.stepCrochet, daNoteData, oldNote, true);
					sustainNote.scrollFactor.set();
					unspawnNotes.push(sustainNote);

					sustainNote.mustPress = gottaHitNote;

					if (sustainNote.mustPress)
					{
						sustainNote.x += FlxG.width / 2; // general offset
					}
				}

				swagNote.mustPress = gottaHitNote;

				if (swagNote.mustPress)
				{
					swagNote.x += FlxG.width / 2; // general offset
				}
				else
				{
				}
			}
			daBeats += 1;
		}

		// //@notrace(unspawnNotes.length);
		// playerCounter += 1;

		unspawnNotes.sort(sortByShit);

		generatedMusic = true;
	}

	function sortByShit(Obj1:Note, Obj2:Note):Int
	{
		return FlxSort.byValues(FlxSort.ASCENDING, Obj1.strumTime, Obj2.strumTime);
	}

	private function generateStaticArrows(player:Int):Void
	{
		for (i in 0...4)
		{
			var babyArrow:FlxSprite = new FlxSprite(0, strumLine.y);
			
			// get arrow skin depending on song playing
			songPlayer.getArrowSkin(i, babyArrow);

			babyArrow.updateHitbox();
			babyArrow.scrollFactor.set();

			// fade arrow in
			babyArrow.y -= 10;
			babyArrow.alpha = 0;
			FlxTween.tween(babyArrow, {y: babyArrow.y + 10, alpha: 1}, 1, {ease: FlxEase.circOut, startDelay: 0.5 + (0.2 * i)});

			babyArrow.ID = i;

			var hideDadNote:Bool = !FlxG.save.data.showDadNote || !FlxG.save.data.showDad;
			var w:Float = FlxG.width;// / Main.fx;
			var shit:Float = 50;
			switch (player)
			{
				case 0:
					cpuStrums.add(babyArrow);
					if(hideDadNote)
						babyArrow.visible = false;
				case 1:
					if (hideDadNote)
					{
						babyArrow.x = w * 0.46;
						babyArrow.x -= (babyArrow.width * 2);
						babyArrow.x += Note.swagWidth * i;
						babyArrow.x += shit; // * Main.fx;
					}
					playerStrums.add(babyArrow);
			}

			babyArrow.animation.play('static');
			
			if (!hideDadNote)
			{
				var px:Int = player;
				px = playAsDad ? px == 0 ? 1 : 0 : px;

				babyArrow.x += shit;
				babyArrow.x += ((w / 2) * px);
			}

			cpuStrums.forEach(function(spr:FlxSprite)
			{
				spr.centerOffsets(); // CPU arrows start out slightly off-center
			});

			if (player == 1)
			{
				var vfx:FlxSprite = new FlxSprite(0, strumLine.y);
				vfx.x = babyArrow.x;
				vfx.y = babyArrow.y + 10;
				vfx.centerOffsets();
				songPlayer.getVFX(i, vfx);
				effectStrums.add(vfx);
			}

			strumLineNotes.add(babyArrow);
		}
	}

	function tweenCamIn():Void
	{
		FlxTween.tween(FlxG.camera, {zoom: 1.3}, (Conductor.stepCrochet * 4 / 1000), {ease: FlxEase.elasticInOut});
	}

	override function openSubState(SubState:FlxSubState)
	{
		if (paused)
		{
			if (FlxG.sound.music != null)
			{
				pauseGame();
			}

			#if windows
			DiscordClient.changePresence("PAUSED on "
				+ CURRENT_SONG
				+ " ("
				+ storyDifficultyText
				+ ") "
				+ Ratings.GenerateLetterRank(accuracy),
				"Acc: "
				+ HelperFunctions.truncateFloat(accuracy, 2)
				+ "% | Score: "
				+ songScore
				+ " | Misses: "
				+ misses, iconRPC);
			#end
			if (!startTimer.finished)
				startTimer.active = false;
		}

		super.openSubState(SubState);
	}

	override function destroy()
	{
		strumLineNotes.destroy();
		cpuStrums.destroy();
		playerStrums.destroy();

		super.destroy();
	}


	override function closeSubState()
	{
		if (paused)
		{
			if (!restartGame)
			{
				if (FlxG.sound.music != null && !startingSong)
				{
					resyncVocals();
				}

				if (!startTimer.finished)
					startTimer.active = true;
				paused = false;
			}

			#if windows
			if (startTimer.finished)
			{
				DiscordClient.changePresence(detailsText
					+ " "
					+ CURRENT_SONG
					+ " ("
					+ storyDifficultyText
					+ ") "
					+ Ratings.GenerateLetterRank(accuracy),
					"\nAcc: "
					+ HelperFunctions.truncateFloat(accuracy, 2)
					+ "% | Score: "
					+ songScore
					+ " | Misses: "
					+ misses, iconRPC, true,
					songLength
					- Conductor.songPosition);
			}
			else
			{
				DiscordClient.changePresence(detailsText, CURRENT_SONG + " (" + storyDifficultyText + ") " + Ratings.GenerateLetterRank(accuracy), iconRPC);
			}
			#end
		}
	
		super.closeSubState();
	}

	function createSongPosBar(){
		songPosBG = new FlxSprite(10, songName.y).loadGraphic(Paths.image('fuckbar', 'shared'));
		songPosBG.color = FlxColor.BLACK;

		songPosBG.y-= songPosBG.height / 2;

		songPosBG.x += 5;

		if (FlxG.save.data.downscroll)
			songPosBG.y += 62.5;
		else
			songPosBG.y -= 40;

	
		add(songPosBG);

		songPosBar = new FlxBar(songPosBG.x + 4, songPosBG.y + 4 ,  BOTTOM_TO_TOP  , Std.int(songPosBG.width - 8), Std.int(songPosBG.height - 8), this,
			'songPositionBar', 0, Math.max(songLength - 1000, 30));

		songPosBG.scrollFactor.set(1, 1);
		songPosBar.scrollFactor.set(1, 1);

		songPosBar.createFilledBar(FlxColor.TRANSPARENT, FlxColor.WHITE);
		add(songPosBar);

		songPosBG.cameras = [camHUD];
		songPosBar.cameras = [camHUD];

		songPosBG.setGraphicSize(Std.int(songPosBG.width * 0.5), Std.int(songPosBG.height * 0.2));
		songPosBar.setGraphicSize(Std.int(songPosBar.width * 0.5), Std.int(songPosBar.height * 0.2));


		
		songPosBG.cameras = [camHUD];
		songPosBar.cameras = [camHUD];
		songName.cameras = [camHUD];

		if (musicListeningShit)
		{
			songName.visible = false;
			songPosBG.visible = false;
			songPosBar.visible = false;
		}
	}

	function createHealthBarShit()
	{
		healthBarShitBG = new FlxSprite(0, songName.y).loadGraphic(Paths.image('fuckbar', 'shared'));
		healthBarShitBG.color = FlxColor.BLACK;

		healthBarShitBG.y -= healthBarShitBG.height / 2;

		healthBarShitBG.x += 5;

		if (FlxG.save.data.downscroll)
			healthBarShitBG.y += 62.5;
		else
			healthBarShitBG.y -= 40;

	
		healthBarShitBG.scrollFactor.set();
		add(healthBarShitBG);

		healthBarShitBG.cameras = [camHUD];
		healthBarShit = new FlxBar(healthBarShitBG.x + 4, healthBarShitBG.y + 4, BOTTOM_TO_TOP, Std.int(healthBarShitBG.width - 8), Std.int(healthBarShitBG.height - 8),
			this, 'health', 0, 2);
		healthBarShit.scrollFactor.set();
		healthBarShit.createFilledBar(FlxColor.TRANSPARENT, FlxColor.RED);
		add(healthBarShit);
		healthBarShit.cameras = [camHUD];

		healthBarShitBG.setGraphicSize(Std.int(healthBarShitBG.width * 0.5), Std.int(healthBarShitBG.height * 0.2));
		healthBarShit.setGraphicSize(Std.int(healthBarShit.width * 0.5), Std.int(healthBarShit.height * 0.2));



		if (musicListeningShit)
		{
			healthBarShitBG.visible = false;
			healthBarShit.visible = false;

		}
	}
	function truncateFloat(number:Float, precision:Int):Float
	{
		var num = number;
		num = num * Math.pow(10, precision);
		num = Math.round(num) / Math.pow(10, precision);
		return num;
	}
	

	function resyncVocals():Void
	{
		vocals.pause();

		FlxG.sound.music.play();
		Conductor.songPosition = FlxG.sound.music.time;
		vocals.time = Conductor.songPosition;
		vocals.play();

		#if windows
		DiscordClient.changePresence(detailsText
			+ " "
			+ CURRENT_SONG
			+ " ("
			+ storyDifficultyText
			+ ") "
			+ Ratings.GenerateLetterRank(accuracy),
			"\nAcc: "
			+ HelperFunctions.truncateFloat(accuracy, 2)
			+ "% | Score: "
			+ songScore
			+ " | Misses: "
			+ misses, iconRPC);
		#end
	}

	private var paused:Bool = false;
	public var startedCountdown:Bool = false;
	var itFuckingEnd = false;
	var canPause:Bool = true;
	var nps:Int = 0;
	var maxNPS:Int = 0;
	var secondToBeat:Float = 1.67164;

	public static var songRate = 1.5;

	public function restorePad()
	{
		Controller.init(this, NONE, B);
		Controller._pad.cameras = [camHUD];
	}
	public function switchState(callback:Void->Void)
	{
		if (FlxG.sound.music != null)
			FlxG.sound.music.stop();

		restartGame = true;
		camHUD.visible = true;

		var blackScreen:FlxSprite = new FlxSprite(0, 0).makeGraphic(Std.int(FlxG.width * 3), Std.int(FlxG.height * 3), FlxColor.BLACK);

		blackScreen.cameras = [camHUD];
		blackScreen.alpha = 0;
		add(blackScreen);

		FlxTween.tween(blackScreen, {alpha: 1}, {});
		new FlxTimer().start(1.1, function(tmr:FlxTimer)
		{
			//place shit here
			callback();
		});
	}

	var lockCamFollow:Bool;

	var maxCamFollowSafeFrame = 48;
	var camFollowSafeFrame = 0;

	function checkUnlockCamFollow()
	{
		if(camFollowSafeFrame >= maxCamFollowSafeFrame)
			lockCamFollow = false;
		else
			camFollowSafeFrame ++;
	}

	function updateSongPosBar()
	{
		if (startingSong)
		{
			if (startedCountdown)
			{
				Conductor.songPosition += FlxG.elapsed * 1000;
				if (Conductor.songPosition >= 0)
					startSong();
			}
		}
		else
		{
			if (itFuckingEnd)
				return;

			Conductor.songPosition += FlxG.elapsed * 1000;
			songPositionBar = Conductor.songPosition;

			if (!paused)
			{
				songTime += FlxG.game.ticks - previousFrameTime;
				previousFrameTime = FlxG.game.ticks;

				// Interpolation type beat
				if (Conductor.lastSongPos != Conductor.songPosition)
				{
					songTime = (songTime + Conductor.songPosition) / 2;
					Conductor.lastSongPos = Conductor.songPosition;
					// Conductor.songPosition += FlxG.elapsed * 1000;
					// //@notrace('MISSED FRAME');
				}
			}
		}
	}

	function updateTextShit()
	{
		if (itFuckingEnd)
			return;

		npsTxt.text =  getSongTimeLeft(); 
		accuracyTxt.text = "Score: " + songScore;
		missTxt.text = "Misses: " + misses;
		scoreTxt.text =  CURRENT_SONG.toUpperCase() + ": " + getDiff() + daAuto;
		songName.text =  playingSong.songTitle;
		
	}

	function getSongTimeLeft():String
	{
		var daTime = (songLength - songPositionBar) / 1000;
		
		if (daTime <= 0)
			return "...";

		var daMinute = Std.int(daTime / 60);
		var daSecond = Std.int(daTime - (60 * daMinute));
		
		if (daMinute < 1)
		{
			var shit = (daTime > 10 ? Std.int(daSecond) + "" : "0" + Std.int(daSecond));
			return "0:" + shit;
		}
		return daMinute + ":" +  (daSecond > 10 ? daSecond + "" : "0" + daSecond);
	}

	override public function update(elapsed:Float)
	{

		checkUnlockCamFollow();

		#if !mobile
		#if debug
		boundMin.text = "holdTimer: " + boyfriend().holdTimer +  ", camFollow: " + camFollow.getPosition() + ", safe frame: "  + camFollowSafeFrame;
		boundMax.text = "lockCamFollow: " + lockCamFollow + ", targetPosition: " + targetCamFollow;
		#end
		#end

		#if !debug
		perfectMode = false;
		#end

		if (botPlayShit && FlxG.keys.justPressed.ONE)
			camHUD.visible = !camHUD.visible;

		#if windows
		if (executeModchart && luaModchart != null && songStarted)
		{
			luaModchart.setVar('songPos', Conductor.songPosition);
			// luaModchart.setVar('hudZoom', camHUD.zoom);
			luaModchart.setVar('cameraZoom', camGame.zoom);
			luaModchart.executeState('update', [elapsed]);

			for (i in luaWiggles)
			{
				//@notrace('wiggle le gaming');
				i.update(elapsed);
			}

			/*for (i in 0...strumLineNotes.length) {
				var member = strumLineNotes.members[i];
				member.x = luaModchart.getVar("strum" + i + "X", "float");
				member.y = luaModchart.getVar("strum" + i + "Y", "float");
				member.angle = luaModchart.getVar("strum" + i + "Angle", "float");
			}*/

			camGame.angle = luaModchart.getVar('cameraAngle', 'float');
			camHUD.angle = luaModchart.getVar('camHudAngle', 'float');

			if (luaModchart.getVar("showOnlyStrums", 'bool'))
			{
				healthBarBG.visible = false;
				kadeEngineWatermark.visible = false;
				healthBar.visible = false;
				iconP1.visible = false;
				iconP2.visible = false;
			}
			else
			{
				healthBarBG.visible = true;
				kadeEngineWatermark.visible = true;
				healthBar.visible = true;
				iconP1.visible = true;
				iconP2.visible = true;
			}

			var p1 = luaModchart.getVar("strumLine1Visible", 'bool');
			var p2 = luaModchart.getVar("strumLine2Visible", 'bool');

			for (i in 0...4)
			{
				strumLineNotes.members[i].visible = p1;
				if (i <= playerStrums.length)
					playerStrums.members[i].visible = p2;
			}
		}
		#end

		// reverse iterate to remove oldest notes first and not invalidate the iteration
		// stop iteration as soon as a note is not removed
		// all notes should be kept in the correct order and this is optimal, safe to do every frame/update
		{
			var balls = notesHitArray.length - 1;
			while (balls >= 0)
			{
				var cock:Date = notesHitArray[balls];
				if (cock != null && cock.getTime() + 1000 < Date.now().getTime())
					notesHitArray.remove(cock);
				else
					balls = 0;
				balls--;
			}
			nps = notesHitArray.length;
			if (nps > maxNPS)
				maxNPS = nps;
		}

		//immortal babe
		if(invisible) health = 2;

		songPlayer.update(elapsed);


		if (npsShit < targetNPS)
		{
			npsShit ++;
		}

		#if !mobile
		#if debug
		health = 2;
		#end
		#end

		super.update(elapsed);

		gfTimer += elapsed;
		//1 / bps
		//1 / (bpm / 60)
		var daBeat = (1.0 / (gfSpeed / 60));
		if (gfTimer > daBeat)
		{
			if (daTutorial)
			{
				if (dad().animation.curAnim != null && dad().animation.curAnim.finished)
				{
					dad().dance();
				}
			}
			else
				gf().dance();

			gfTimer = 0;
		}

		var daX = FlxMath.lerp(camFollow.x, targetCamFollow.x, (1 / 30.0) * camFollowSpeed);
		var daY = FlxMath.lerp(camFollow.y, targetCamFollow.y, (1 / 30.0) * camFollowSpeed);

		camFollow.setPosition(daX, daY);
	
		updateTextShit();


		if (!FlxG.save.data.accuracyDisplay)
			scoreTxt.text = "Score: " + songScore;

		if (Controller.BACK && startedCountdown && canPause && !paused)
		{
			persistentUpdate = false;
			persistentDraw = true;
			paused = true;
		
			openSubState(new PauseSubState(boyfriend().getScreenPosition().x, boyfriend().getScreenPosition().y));
		}
		#if !mobile
		#if debug
		if (FlxG.keys.justPressed.P)
		{
			persistentUpdate = false;
			persistentDraw = true;
			paused = true;

			openSubState(new DebugPauseSubState(boyfriend().getScreenPosition().x, boyfriend().getScreenPosition().y));
		}
		#end
		#end
		
		if (FlxG.keys.justPressed.SEVEN)
		{
			#if windows
			DiscordClient.changePresence("Chart Editor", null, null, true);
			#end
			FlxG.switchState(new ChartingState());
			#if windows
			if (luaModchart != null)
			{
				luaModchart.die();
				luaModchart = null;
			}
			#end
		}

		// FlxG.watch.addQuick('VOL', vocals.amplitudeLeft);
		// FlxG.watch.addQuick('VOLRight', vocals.amplitudeRight);

		iconP1.setGraphicSize(Std.int(FlxMath.lerp(150, iconP1.width, 0.50)));
		iconP2.setGraphicSize(Std.int(FlxMath.lerp(150, iconP2.width, 0.50)));

		iconP1.updateHitbox();
		iconP2.updateHitbox();

		var iconOffset:Int = 26;

		if (playAsDad)
		{
			iconP1.x = healthBar.x + (healthBar.width * (FlxMath.remapToRange(100 - healthBar.percent, 100, 0, 0, 100) * 0.01) - iconOffset);
			iconP2.x = healthBar.x + (healthBar.width * (FlxMath.remapToRange(100 - healthBar.percent, 100, 0, 0, 100) * 0.01)) - (iconP2.width - iconOffset);
		
			if (health > 2)
				health = 2;

			if (healthBar.percent < 20)
				iconP2.animation.curAnim.curFrame = 1;
			else
				iconP2.animation.curAnim.curFrame = 0;
	
			if (healthBar.percent > 80)
				iconP1.animation.curAnim.curFrame = 1;
			else
				iconP1.animation.curAnim.curFrame = 0;
		}
		else
		{
			iconP1.x = healthBar.x + (healthBar.width * (FlxMath.remapToRange(healthBar.percent, 0, 100, 100, 0) * 0.01) - iconOffset);
			iconP2.x = healthBar.x + (healthBar.width * (FlxMath.remapToRange(healthBar.percent, 0, 100, 100, 0) * 0.01)) - (iconP2.width - iconOffset);
			
			if (health > 2)
				health = 2;
			if (healthBar.percent < 20)
				iconP1.animation.curAnim.curFrame = 1;
			else
				iconP1.animation.curAnim.curFrame = 0;
	
			if (healthBar.percent > 80)
				iconP2.animation.curAnim.curFrame = 1;
			else
				iconP2.animation.curAnim.curFrame = 0;
		}



		#if !mobile
		#if debug
		if (FlxG.keys.justPressed.EIGHT)
		{
			FlxG.switchState(new AnimationState(DAD));
			#if windows
			if (luaModchart != null)
			{
				luaModchart.die();
				luaModchart = null;
			}
			#end
		}


		if (FlxG.keys.justPressed.ZERO)
		{
			FlxG.switchState(new AnimationState(BF));
			#if windows
			if (luaModchart != null)
			{
				luaModchart.die();
				luaModchart = null;
			}
			#end
		}

		if (FlxG.keys.justPressed.NINE)
		{
			FlxG.switchState(new AnimationState(BF, true));
		}

		if (FlxG.keys.justPressed.SIX)
		{
			FlxG.switchState(new AnimationState(GF, true));
		}
		
		#end
		#end
	

		updateSongPosBar();
	
		if (generatedMusic && SONG.notes[Std.int(curStep / 16)] != null)
		{
			// Make sure Girlfriend cheers only for certain songs
			if (allowedToHeadbang)
			{
				// Don't animate GF if something else is already animating her (eg. train passing)
				if (gf().animation.curAnim.name == 'danceLeft'
					|| gf().animation.curAnim.name == 'danceRight'
					|| gf().animation.curAnim.name == 'idle')
				{
				}
			}

			#if windows
			if (luaModchart != null)
				luaModchart.setVar("mustHit", SONG.notes[Std.int(curStep / 16)].mustHitSection);
			#end

			if (!SONG.notes[Std.int(curStep / 16)].mustHitSection && camFollow.x != dad().getMidpoint().x + 150)
			{
				if (turn == -1) // repeat
 					camFollowSafeFrame = 0;

				var offsetX = 0;
				var offsetY = 0;

				setCamFollowPosition(dad().getMidpoint().x + 150 + offsetX, dad().getMidpoint().y - 100 + offsetY);
				songPlayer.updateCamFollowDad();
				turn = -1;
			}

			if (SONG.notes[Std.int(curStep / 16)].mustHitSection && camFollow.x != boyfriend().getMidpoint().x - 100 && !lockCamFollow)
			{
				if (turn == 1) // repeat
					camFollowSafeFrame = 0;
				
				var offsetX = 0;
				var offsetY = 0;


				setCamFollowPosition(boyfriend().getMidpoint().x - 100 + offsetX,
				clamp(boyfriend().getMidpoint().y - 100 + offsetY, songPlayer.bfCamFollowYMin(), songPlayer.bfCamFollowYMax()));
				
				turn = 1;
				songPlayer.updateCamFollowBF();
			}
		}

		if (camZooming)
		{
			camGame.zoom = FlxMath.lerp(camZoomShit, camGame.zoom, 0.95);
			// camHUD.zoom = FlxMath.lerp(1, camHUD.zoom, 0.95);
		}

		FlxG.watch.addQuick("beatShit", curBeat);
		FlxG.watch.addQuick("stepShit", curStep);

		if (health <= 0 && !isOver)
		{
			isOver = true;
			boyfriend().stunned = true;
			persistentUpdate = false;
			persistentDraw = true;
			paused = true;

			pauseGame();

			LibraryLoadState.createBlackFadeIn(this,function(){
				openSubState(new GameOverSubstate(boyfriend().getScreenPosition().x, boyfriend().getScreenPosition().y));
			}, camHUD, true);

			#if windows
			// Game Over doesn't get his own variable because it's only used here
			DiscordClient.changePresence("GAME OVER -- "
				+ CURRENT_SONG
				+ " ("
				+ storyDifficultyText
				+ ") "
				+ Ratings.GenerateLetterRank(accuracy),
				"\nAcc: "
				+ HelperFunctions.truncateFloat(accuracy, 2)
				+ "% | Score: "
				+ songScore
				+ " | Misses: "
				+ misses, iconRPC);
			#end

			// FlxG.switchState(new GameOverState(boyfriend().getScreenPosition().x, boyfriend().getScreenPosition().y));
		}
		if (FlxG.save.data.resetButton)
		{
			if (FlxG.keys.justPressed.R)
			{
				boyfriend().stunned = true;

				persistentUpdate = false;
				persistentDraw = false;
				paused = true;

				vocals.stop();
				FlxG.sound.music.stop();

				openSubState(new GameOverSubstate(boyfriend().getScreenPosition().x, boyfriend().getScreenPosition().y));

				#if windows
				// Game Over doesn't get his own variable because it's only used here
				DiscordClient.changePresence("GAME OVER -- "
					+ CURRENT_SONG
					+ " ("
					+ storyDifficultyText
					+ ") "
					+ Ratings.GenerateLetterRank(accuracy),
					"\nAcc: "
					+ HelperFunctions.truncateFloat(accuracy, 2)
					+ "% | Score: "
					+ songScore
					+ " | Misses: "
					+ misses, iconRPC);
				#end

				// FlxG.switchState(new GameOverState(boyfriend().getScreenPosition().x, boyfriend().getScreenPosition().y));
			}
		}

		if (unspawnNotes[0] != null)
		{
			if (unspawnNotes[0].strumTime - Conductor.songPosition < 3500)
			{
				var dunceNote:Note = unspawnNotes[0];
				notes.add(dunceNote);

				var index:Int = unspawnNotes.indexOf(dunceNote);
				unspawnNotes.splice(index, 1);
			}
		}

		if (generatedMusic)
		{
			notes.forEachAlive(function(daNote:Note)
			{


				// instead of doing stupid y > FlxG.height
				// we be men and actually calculate the time :)
				if (daNote.tooLate)
				{
					daNote.active = false;
					daNote.visible = false;
				}
				else
				{
					daNote.visible = true;
					daNote.active = true;
				}

				if (!daNote.modifiedByLua)
				{
					if (FlxG.save.data.downscroll)
					{
						if (daNote.mustPress)
							daNote.y = (playerStrums.members[Math.floor(Math.abs(daNote.noteData))].y
								+
								0.45 * (Conductor.songPosition - daNote.strumTime) * FlxMath.roundDecimal(FlxG.save.data.scrollSpeed == 1 ? SONG.speed : FlxG.save.data.scrollSpeed,
									2));
						else
							daNote.y = (strumLineNotes.members[Math.floor(Math.abs(daNote.noteData))].y
								+
								0.45 * (Conductor.songPosition - daNote.strumTime) * FlxMath.roundDecimal(FlxG.save.data.scrollSpeed == 1 ? SONG.speed : FlxG.save.data.scrollSpeed,
									2));
						if (daNote.isSustainNote)
						{
							// Remember = minus makes notes go up, plus makes them go down
							if (daNote.animation.curAnim.name.endsWith('end') && daNote.prevNote != null)
								daNote.y += daNote.prevNote.height;
							else
								daNote.y += daNote.height / 2;

							// If not in botplay, only clip sustain notes when properly hit, botplay gets to clip it everytime
							if (!botPlayShit)
							{
								if ((!daNote.mustPress || daNote.wasGoodHit || daNote.prevNote.wasGoodHit && !daNote.canBeHit)
									&& daNote.y - daNote.offset.y * daNote.scale.y + daNote.height >= (strumLine.y + Note.swagWidth / 2))
								{
									// Clip to strumline
									var swagRect = new FlxRect(0, 0, daNote.frameWidth * 2, daNote.frameHeight * 2);
									swagRect.height = (strumLineNotes.members[Math.floor(Math.abs(daNote.noteData))].y
										+ Note.swagWidth / 2
										- daNote.y) / daNote.scale.y;
									swagRect.y = daNote.frameHeight - swagRect.height;

									daNote.clipRect = swagRect;
								}
							}
							else
							{
								var swagRect = new FlxRect(0, 0, daNote.frameWidth * 2, daNote.frameHeight * 2);
								swagRect.height = (strumLineNotes.members[Math.floor(Math.abs(daNote.noteData))].y
									+ Note.swagWidth / 2
									- daNote.y) / daNote.scale.y;
								swagRect.y = daNote.frameHeight - swagRect.height;

								daNote.clipRect = swagRect;
							}
						}
					}
					else
					{
						if (daNote.mustPress)
							daNote.y = (playerStrums.members[Math.floor(Math.abs(daNote.noteData))].y
								- 0.45 * (Conductor.songPosition - daNote.strumTime) * FlxMath.roundDecimal(FlxG.save.data.scrollSpeed == 1 ? SONG.speed : FlxG.save.data.scrollSpeed,
									2));
						else
							daNote.y = (strumLineNotes.members[Math.floor(Math.abs(daNote.noteData))].y
								- 0.45 * (Conductor.songPosition - daNote.strumTime) * FlxMath.roundDecimal(FlxG.save.data.scrollSpeed == 1 ? SONG.speed : FlxG.save.data.scrollSpeed,
									2));
						if (daNote.isSustainNote)
						{
							daNote.y -= daNote.height / 2;

							if (!botPlayShit)
							{
								if ((!daNote.mustPress || daNote.wasGoodHit || daNote.prevNote.wasGoodHit && !daNote.canBeHit)
									&& daNote.y + daNote.offset.y * daNote.scale.y <= (strumLine.y + Note.swagWidth / 2))
								{
									// Clip to strumline
									var swagRect = new FlxRect(0, 0, daNote.width / daNote.scale.x, daNote.height / daNote.scale.y);
									swagRect.y = (strumLineNotes.members[Math.floor(Math.abs(daNote.noteData))].y
										+ Note.swagWidth / 2
										- daNote.y) / daNote.scale.y;
									swagRect.height -= swagRect.y;

									daNote.clipRect = swagRect;
								}
							}
							else
							{
								var swagRect = new FlxRect(0, 0, daNote.width / daNote.scale.x, daNote.height / daNote.scale.y);
								swagRect.y = (strumLineNotes.members[Math.floor(Math.abs(daNote.noteData))].y
									+ Note.swagWidth / 2
									- daNote.y) / daNote.scale.y;
								swagRect.height -= swagRect.y;

								daNote.clipRect = swagRect;
							}
						}
					}
				}

				if (!daNote.mustPress && daNote.wasGoodHit)
				{
					camZooming = true;

					if (playAsDad)
					{
						var altAnim:String = "";
						if (SONG.notes[Math.floor(curStep / 16)] != null)
						{
							if (SONG.notes[Math.floor(curStep / 16)].altAnim)
								altAnim = '-alt';
						}
						var fuckNote:String = '';
						switch (Math.abs(daNote.noteData))
						{
							case 2:
								fuckNote = "singUP";

							case 3:
								fuckNote = "singRIGHT";

							case 1:
								fuckNote = "singDOWN";

							case 0:
								fuckNote = "singLEFT";
						}

						if (dad().animation.getByName(fuckNote + altAnim) == null)
						{
							// no alt anim
						}
						else
							fuckNote += altAnim;
						
						//@notrace("fuckNote: " + fuckNote);
						boyfriend().playAnim(fuckNote, true);
					}
					else
					{
						setLastNote(daNote);
						dad().playAnim(lastNote, true);
					}

					//enemy note highlight
					if (FlxG.save.data.cpuStrums)
					{
						cpuStrums.forEach(function(spr:FlxSprite)
						{
							if (Math.abs(daNote.noteData) == spr.ID)
							{
								spr.animation.play('confirm', true);
							}
							if (spr.animation.curAnim.name == 'confirm' && !curStage.startsWith('school'))
							{
								spr.centerOffsets();
								spr.offset.x -= 13;
								spr.offset.y -= 13;
							}
							else
								spr.centerOffsets();
						});
					}

					// #if windows
					// if (luaModchart != null)
					// 	luaModchart.executeState('playerTwoSing', [Math.abs(daNote.noteData), Conductor.songPosition]);
					// #end
					//songPlayer.noteEvent(daNote);
					//trigger when dad hit a note
					if(playAsDad)
						songPlayer.bfNoteEvent(daNote);
					else
						songPlayer.dadNoteEvent(daNote);

					if (playAsDad)
						boyfriend().holdTimer = 0;
					else
					{
						dad().holdTimer = 0;
					}


					shitMode(daNote);
						

					if (SONG.needsVoices)
						vocals.volume = 1;

					daNote.active = false;

					daNote.kill();
					notes.remove(daNote, true);
					daNote.destroy();
				}
				// else if (daNote.mustPress)
				// {
				// 	// trigger when bf note spawn
				// 	songPlayer.bfNoteEvent(curBeat, daNote);
				// }


				if (daNote.mustPress && !daNote.modifiedByLua)
				{
					daNote.visible = playerStrums.members[Math.floor(Math.abs(daNote.noteData))].visible;
					daNote.x = playerStrums.members[Math.floor(Math.abs(daNote.noteData))].x;
					if (!daNote.isSustainNote)
						daNote.angle = playerStrums.members[Math.floor(Math.abs(daNote.noteData))].angle;
					daNote.alpha = playerStrums.members[Math.floor(Math.abs(daNote.noteData))].alpha;
				}
				else if (!daNote.wasGoodHit && !daNote.modifiedByLua)
				{
					daNote.visible = strumLineNotes.members[Math.floor(Math.abs(daNote.noteData))].visible;
					daNote.x = strumLineNotes.members[Math.floor(Math.abs(daNote.noteData))].x;
					if (!daNote.isSustainNote)
						daNote.angle = strumLineNotes.members[Math.floor(Math.abs(daNote.noteData))].angle;
					daNote.alpha = strumLineNotes.members[Math.floor(Math.abs(daNote.noteData))].alpha;
				}

				if (daNote.isSustainNote)
					daNote.x += daNote.width / 2 + 17;

				// //@notrace(daNote.y);
				// WIP interpolation shit? Need to fix the pause issue
				// daNote.y = (strumLine.y - (songTime - daNote.strumTime) * (0.45 * SONG.speed));

				if ((daNote.mustPress && daNote.tooLate && !FlxG.save.data.downscroll || daNote.mustPress && daNote.tooLate && FlxG.save.data.downscroll)
					&& daNote.mustPress)
				{
					if (daNote.isSustainNote && daNote.wasGoodHit)
					{

						daNote.kill();
						notes.remove(daNote, true);

					}
					else
					{

						if(!isMidSongEvent)
							vocals.volume = 0;

						if (theFunne)
							noteMiss(daNote.noteData, daNote);
					}

					daNote.visible = false;
					daNote.kill();
					notes.remove(daNote, true);
				}
			});
		}

		if (FlxG.save.data.cpuStrums)
		{
			cpuStrums.forEach(function(spr:FlxSprite)
			{
				if (spr.animation.finished)
				{
					spr.animation.play('static');
					spr.centerOffsets();
				}
			});
		}

		effectStrums.forEach(function(spr:FlxSprite)
		{
			if (spr.animation.finished)
			{
				spr.alpha = 0;
			}
		});

		if (!inCutscene)
			keyShit();

		#if !mobile
		if (FlxG.keys.justPressed.ONE)
			endSong();
		#end
	}

	function shitMode(daNote:Note)
	{
		if (storyDifficulty == 3)
		{
			//shit difficulty only
			if (health > 0.25)
			{
				var npsCalculated = Math.min(targetNPS, 100);
				npsCalculated = Math.max(targetNPS, 500);

				if (daNote.isSustainNote)
				{
					var subtract = 0.001;
					subtract *= (100 / npsCalculated);

					// if(CURRENT_SONG == 'tutorial' || CURRENT_SONG == 'tutorial-remix')
					// 	subtract /= 2;

					health -= subtract;
				}
				else
				{
					// health -= 0.04;
					var subtract = 0.08;
					subtract *= (100 / npsCalculated);
					health -= subtract;
				}
			}

		}
	}


	function setLastNote(daNote:Note)
	{
		var altAnim:String = "";
		if (SONG.notes[Math.floor(curStep / 16)] != null)
		{
			if (SONG.notes[Math.floor(curStep / 16)].altAnim)
				altAnim = '-alt';
		}

		switch (Math.abs(daNote.noteData))
		{
			case 2:
				lastNote = "singUP";

			case 3:
				lastNote = "singRIGHT";

			case 1:
				lastNote = "singDOWN";

			case 0:
				lastNote = "singLEFT";
		}

		if (dad().animation.getByName(lastNote + altAnim) == null)
		{
			// no alt anim
		}
		else
			lastNote += altAnim;
	}


	function endSong():Void
	{

		//wait next beat plus a bit offset (0.1) before ending.
		new FlxTimer().start(1 / secondToBeat + 0.1, function shit(tmr:FlxTimer)
		{
			itFuckingEnd = true;
		}, 1);

		botPlayShit = false;
		FlxG.save.data.scrollSpeed = 1;
	
		#if windows
		if (luaModchart != null)
		{
			luaModchart.die();
			luaModchart = null;
		}
		#end
		
		songPlayer.endSongEvent(endSongCallback);	

	}

	public var targetCamFollow:FlxPoint;

	public function setCamFollowPosition(x:Float, y:Float)
	{
		lockCamFollow = true;
		targetCamFollow = new FlxPoint(x, y);
	}

	function clamp(raw:Float, min:Float, max:Float)
	{
		if(raw < min) raw = min;
		if(raw > max) raw = max;

		return raw;
	}

	private function endSongCallback()
	{
		
		canPause = false;
		FlxG.sound.music.volume = 0;
		vocals.volume = 0;
		if (SONG.validScore)
		{
			// adjusting the highscore song name to be compatible
			// would read original scores if we didn't change packages
			var songHighscore = SongFilter.filter(CURRENT_SONG);

			#if !switch
			Highscore.saveScore(songHighscore, Math.round(songScore), storyDifficulty);
			#end
		}

		if (offsetTesting)
		{
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
			offsetTesting = false;
			LibraryLoadState.loadAndSwitchState(new OptionsMenu());
			FlxG.save.data.offset = offsetTest;
		}
		else
		{
			if (isStoryMode)
			{
				campaignScore += Math.round(songScore);

				storyPlaylist.remove(storyPlaylist[0]);
				if (storyPlaylist.length <= 0)
				{
					// FlxG.sound.playMusic(Paths.music('freakyMenu'));

					transIn = FlxTransitionableState.defaultTransIn;
					transOut = FlxTransitionableState.defaultTransOut;

					backHome();
					#if windows
					if (luaModchart != null)
					{
						luaModchart.die();
						luaModchart = null;
					}
					#end

					StoryState.weekUnlocked[Std.int(Math.min(storyWeek + 1, StoryState.weekUnlocked.length - 1))] = true;

					if (SONG.validScore)
					{
						// //NGio.unlockMedal(60961);
						Highscore.saveWeekScore(storyWeek, campaignScore, storyDifficulty);
					}

					FlxG.save.data.weekUnlocked = StoryState.weekUnlocked;
					FlxG.save.flush();
				}
				else
				{
					var difficulty:String = "";

					if (storyDifficulty == 0)
						difficulty = '-easy';

					if (storyDifficulty == 2 || storyDifficulty == 3)
						difficulty = '-hard';

					//@notrace('LOADING NEXT SONG');
					// pre lowercasing the next story song name
					var nextSongLowercase = SongFilter.filter(storyPlaylist[0]);
					
					//@notrace(nextSongLowercase + difficulty);

					// pre lowercasing the song name (endSong)
					var songLowercase = SongFilter.filter(CURRENT_SONG);

					if (songLowercase == 'eggnog')
					{
						var blackShit:FlxSprite = new FlxSprite(-FlxG.width * camGame.zoom,
							-FlxG.height * camGame.zoom).makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
						blackShit.scrollFactor.set();
						add(blackShit);
						camHUD.visible = false;

						FlxG.sound.play(Paths.sound('Lights_Shut_off'));
					}

					// FlxTransitionableState.skipNextTransIn = true;
					// FlxTransitionableState.skipNextTransOut = true;
					prevCamFollow = camFollow;
					
					GamePlayState.SONG_NAME = nextSongLowercase;
					GamePlayState.RAW_SONG_NAME = storyPlaylist[0];
					SONG = Song.loadFromJson(nextSongLowercase + difficulty, playingSong.folder + storyPlaylist[0]);
				
					CURRENT_SONG = SONG_NAME;

					FlxG.sound.music.stop(); 

					moveNext();

					// LibraryLoadState.loadAndSwitchState(new GamePlayState());
				}
			}
			else
			{
				backHome();
			}
		}
	}
	private function createEmptyBlack()
	{
		var blackScreen:FlxSprite = new FlxSprite(0, 0).makeGraphic(Std.int(FlxG.width * 3), Std.int(FlxG.height * 3), FlxColor.BLACK);

		blackScreen.cameras = [camHUD];
		add(blackScreen);
	}


	public function gameNa()
	{
		restartGame = true;
		vocals.stop();
		FlxG.sound.music.stop();
		createEmptyBlack();
	}
	
	public function nextSong()
	{
		FlxG.resetState();
	}


	public function revivePlayer()
	{
		invisible = true;
		health = 2;
		isOver = false;
		boyfriend().stunned = false;
		persistentUpdate = true;
		persistentDraw = true;
		paused = false;
		Controller.init(this, NONE, B);
		Controller._pad.cameras = [camHUD];
		resumeGame();

		new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			invisible = false;
		});
	}

	public function pauseGame()
	{
		vocals.volume = 0;
		vocals.pause();
		FlxG.sound.music.pause();
	}

	public function resumeGame()
	{
		resyncVocals();
	}

	function backHome()
	{
		isOver = true;
		boyfriend().stunned = true;
		persistentUpdate = false;
		persistentDraw = true;
		paused = true;

		pauseGame();


		createBlackFadeIn(function()
		{
			openSubState(new WeekCompleteSubState());
		});
	}
	function moveNext()
	{
		if(isOver)return;


		isOver = true;
		boyfriend().stunned = true;
		persistentUpdate = false;
		persistentDraw = true;
		paused = true;

		pauseGame();

		createBlackFadeIn(function()
		{
			openSubState(new VictorySubState(boyfriend().getScreenPosition().x, boyfriend().getScreenPosition().y));
		});
	}

	function zoomInAndFading()
	{
		camZooming = false;
		camGame.stopFX();

		new FlxTimer().start(0.016, function(tmr:FlxTimer)
		{
			camGame.zoom += 0.016;
		}, 120);
	}

	function createBlackFadeIn(callback:Void->Void)
	{

		zoomInAndFading();

		camHUD.visible = true;

		var blackScreen:FlxSprite = new FlxSprite(0, 0).makeGraphic(Std.int(FlxG.width * 3), Std.int(FlxG.height * 3), FlxColor.BLACK);

		blackScreen.cameras = [camHUD];
		blackScreen.alpha = 0;
		add(blackScreen);

		FlxTween.tween(blackScreen, {alpha: 1}, {});
		new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			callback();
			//place shit here
			remove(blackScreen);
			blackScreen = null;
		});
	
	}

	private function createBlackFadeOut()
	{
		var blackShit:FlxSprite = new FlxSprite().makeGraphic(FlxG.width * 2, FlxG.height * 2, FlxColor.BLACK);
		blackShit.scrollFactor.set(0.5, 0.5);
		blackShit.cameras = [camHUD];
		add(blackShit);
		FlxTween.tween(blackShit, {alpha: 0}, 0.5, {
			ease: FlxEase.quartInOut,
			onComplete: function(callback:FlxTween)
			{
				remove(blackShit);
				blackShit = null;
			}
		});
	}


	var endingSong:Bool = false;

	var hits:Array<Float> = [];
	var offsetTest:Float = 0;

	var timeShown = 0;

	function popUpHealth(daRating:String, rating:Float)
	{
		
		var healthRating:FlxText = new FlxText(0, 0, 0, "");
		healthRating.setFormat(Paths.font("vcr.ttf"), 15, FlxColor.CYAN, CENTER);
		
		switch (daRating)
		{
			case 'shit' | 'bad' | 'fuck':
				healthRating.setFormat(Paths.font("vcr.ttf"), 15, FlxColor.RED, CENTER);
		
			case 'good' | 'sick':
				healthRating.setFormat(Paths.font("vcr.ttf"), 15, FlxColor.CYAN, CENTER);
		
		}

		healthRating.setBorderStyle(OUTLINE, 0xFF000000, 1, 1);
		healthRating.text = rating == 0 ?  "" :
		(rating > 0 ? "+" : "") +
		(rating * 50);

		healthRating.x = healthBarShitBG.x - 5;
		
		if(FlxG.save.data.downscroll)
			healthRating.y = songName.y + 125;
		else
			healthRating.y = songName.y - 125;
	
		healthRating.size = 20;

		if (healthRating.alpha != 1)
			healthRating.alpha = 1;
		
		if (!botPlayShit)
			add(healthRating);
		

		healthRating.updateHitbox();
		healthRating.cameras = [camHUD];

		FlxTween.tween(healthRating, {alpha: 0}, 0.2, 
		{
			startDelay: Conductor.crochet * 0.0005,
		});

		
	}

	function popUpRating(daRating:String){

		var pixelShitPart1:String = "";
		var pixelShitPart2:String = '';

		if (curStage.startsWith('school'))
		{
			pixelShitPart1 = 'weeb/pixelUI/';
			pixelShitPart2 = '-pixel';
		}

		var rating:FlxSprite = new FlxSprite();

		rating.loadGraphic(Paths.image(pixelShitPart1 + daRating + pixelShitPart2));
		rating.screenCenter();
		var xPos:Float = FlxG.width * 0.55;

		rating.y -= 40;

		if (FlxG.save.data.downscroll)
		{
			rating.y -= 200;
			rating.x = xPos - 125;
		}
		else
		{
			rating.y += 100;

			if (playAsDad)
				rating.x = xPos + 25;
			else
				rating.x = xPos - 5;


		}

		if (FlxG.save.data.changedHit)
		{
			rating.x = FlxG.save.data.changedHitX;
			rating.y = FlxG.save.data.changedHitY;
		}

		rating.acceleration.y = 550;
		rating.velocity.y -= FlxG.random.int(140, 175);
		rating.velocity.x -= FlxG.random.int(0, 10);


		if (!botPlayShit)
			add(rating);

		if (!curStage.startsWith('school'))
		{
			rating.setGraphicSize(Std.int(rating.width * 0.7 * 0.5));
			rating.antialiasing = true;
		}
		else
		{
			rating.setGraphicSize(Std.int(rating.width * daPixelZoom * 0.5 * 0.7));
		}

		rating.updateHitbox();
		rating.cameras = [camHUD];


		FlxTween.tween(rating, {alpha: 0}, 0.2, {
			onComplete: function(tween:FlxTween)
			{
				rating.destroy();
			},
			startDelay: Conductor.crochet * 0.001
		});
	}

	private function popUpScore(daNote:Note, missNote:Bool = false):Void
	{
		if (musicListeningShit)
			return;


		var noteDiff:Float = Math.abs(Conductor.songPosition - daNote.strumTime);
		var wife:Float = EtternaFunctions.wife3(noteDiff, Conductor.timeScale);
		vocals.volume = 1;

		var placement:String = Std.string(combo);

	
		var score:Float = 350;
		var healthRating:Float = 0;
		if (FlxG.save.data.accuracyMod == 1)
			totalNotesHit += wife;

		var daRating = daNote.rating;

		if(missNote)
			daRating = "fuck";
		

		switch (daRating)
		{
			case 'fuck':
				score = -500;
				combo = 0;
				healthRating = -0.2;
				ss = false;
				shits++;
				if (FlxG.save.data.accuracyMod == 0)
					totalNotesHit += 0.25;

			case 'shit':
				score = -300;
				healthRating = -0.1;
				ss = false;
				shits++;
				if (FlxG.save.data.accuracyMod == 0)
					totalNotesHit += 0.25;
			case 'bad':
				daRating = 'bad';
				score = 0;
				healthRating -= 0.06;
				ss = false;
				bads++;
				if (FlxG.save.data.accuracyMod == 0)
					totalNotesHit += 0.50;
			case 'good':
				daRating = 'good';
				score = 200;
				ss = false;
				goods++;

				healthRating = 0.04;

				if (FlxG.save.data.accuracyMod == 0)
					totalNotesHit += 0.75;
			case 'sick':

				healthRating = 0.1;

				if (FlxG.save.data.accuracyMod == 0)
					totalNotesHit += 1;
				sicks++;
		}
		
		health += healthRating;
		if(health > 2)
			health = 2;

		popUpHealth(daRating, healthRating);

		if (daRating != 'shit' || daRating != 'bad')
		{
			songScore += Math.round(score);
			songScoreDef += Math.round(ConvertScore.convertScore(noteDiff));

			/* if (combo > 60)
					daRating = 'sick';
				else if (combo > 12)
					daRating = 'good'
				else if (combo > 4)
					daRating = 'bad';
			 */

			if (!FlxG.save.data.showCombo)
				return;
			
			var pixelShitPart1:String = "";
			var pixelShitPart2:String = '';

			if (curStage.startsWith('school'))
			{
				pixelShitPart1 = 'weeb/pixelUI/';
				pixelShitPart2 = '-pixel';
			}

			var coolText:FlxText = new FlxText(0, 0, 0, placement, 5);
			coolText.screenCenter();
			coolText.x = FlxG.width * 0.55;

			
			if (FlxG.save.data.downscroll)
			{
				coolText.y -= 1000;
			}
			else
			{
				coolText.y -= 350;
			}

			coolText.cameras = [camHUD];

			//
	
			var rating:FlxSprite = new FlxSprite();

			rating.loadGraphic(Paths.image(pixelShitPart1 + daRating + pixelShitPart2));
			rating.screenCenter();
			if (FlxG.save.data.downscroll)
			{
				rating.y -= 200;
				rating.x = coolText.x - 125;
			}
			else
			{
				rating.y += 100;

				if (playAsDad)
					rating.x = coolText.x + 25;
				else
					rating.x = coolText.x - 5;


			}

			if (FlxG.save.data.changedHit)
			{
				rating.x = FlxG.save.data.changedHitX;
				rating.y = FlxG.save.data.changedHitY;
			}

			rating.acceleration.y = 550;
			rating.velocity.y -= FlxG.random.int(140, 175);
			rating.velocity.x -= FlxG.random.int(0, 10);


			var msTiming = HelperFunctions.truncateFloat(noteDiff, 3);
			if (botPlayShit)
				msTiming = 0;

			if (msTiming >= 0.03 && offsetTesting)
			{
				// Remove Outliers
				hits.shift();
				hits.shift();
				hits.shift();
				hits.pop();
				hits.pop();
				hits.pop();
				hits.push(msTiming);

				var total = 0.0;

				for (i in hits)
					total += i;

				offsetTest = HelperFunctions.truncateFloat(total / hits.length, 2);
			}

			//ah shit here we go again!

			var comboSpr:FlxSprite = new FlxSprite().loadGraphic(Paths.image(pixelShitPart1 + 'combo' + pixelShitPart2));
			comboSpr.screenCenter();
			comboSpr.x = rating.x;
			comboSpr.y = rating.y + 100;
			comboSpr.acceleration.y = 600;
			comboSpr.velocity.y -= 150;

			comboSpr.setGraphicSize(Std.int(comboSpr.width * 0.5));


			comboSpr.velocity.x += FlxG.random.int(1, 10);
		
			if (!botPlayShit)
				add(rating);

			if (!curStage.startsWith('school'))
			{
				rating.setGraphicSize(Std.int(rating.width * 0.7 * 0.5));
				rating.antialiasing = true;
				comboSpr.setGraphicSize(Std.int(comboSpr.width * 0.7 * 0.5));
				comboSpr.antialiasing = true;
			}
			else
			{
				rating.setGraphicSize(Std.int(rating.width * daPixelZoom * 0.5 * 0.7));
				comboSpr.setGraphicSize(Std.int(comboSpr.width * daPixelZoom * 0.5 * 0.7));
			}

			comboSpr.updateHitbox();
			rating.updateHitbox();

			comboSpr.cameras = [camHUD];
			rating.cameras = [camHUD];

			var seperatedScore:Array<Int> = [];

			var comboSplit:Array<String> = (combo + "").split('');

			// make sure we have 3 digits to display (looks weird otherwise lol)
			if (comboSplit.length == 1)
			{
				seperatedScore.push(0);
				seperatedScore.push(0);
			}
			else if (comboSplit.length == 2)
				seperatedScore.push(0);

			for (i in 0...comboSplit.length)
			{
				var str:String = comboSplit[i];
				seperatedScore.push(Std.parseInt(str));
			}

			var daLoop:Int = 0;
			for (i in seperatedScore)
			{
				var numScore:FlxSprite = new FlxSprite().loadGraphic(Paths.image(pixelShitPart1 + 'num' + Std.int(i) + pixelShitPart2));
				numScore.screenCenter();
				numScore.x = rating.x + (43 * daLoop * 0.425) - 50;
				numScore.y = rating.y + 100;
				numScore.cameras = [camHUD];

				if (!curStage.startsWith('school'))
				{
					numScore.antialiasing = true;
					numScore.setGraphicSize(Std.int(numScore.width * 0.25));
				}
				else
				{
					numScore.setGraphicSize(Std.int(numScore.width * 0.25 * daPixelZoom));
				}
				numScore.updateHitbox();

				numScore.acceleration.y = FlxG.random.int(200, 300);
				numScore.velocity.y -= FlxG.random.int(140, 160);
				numScore.velocity.x = FlxG.random.float(-5, 5);

				add(numScore);

				FlxTween.tween(numScore, {alpha: 0}, 0.2, {
					onComplete: function(tween:FlxTween)
					{
						numScore.destroy();
					},
					startDelay: Conductor.crochet * 0.002
				});

				daLoop++;
			}
			/* 
				//@notrace(combo);
				//@notrace(seperatedScore);
			 */

			coolText.text = Std.string(seperatedScore);
			// add(coolText);

			FlxTween.tween(rating, {alpha: 0}, 0.2, {
				startDelay: Conductor.crochet * 0.001,
			});


			FlxTween.tween(comboSpr, {alpha: 0}, 0.2, {
				onComplete: function(tween:FlxTween)
				{
					coolText.destroy();
					comboSpr.destroy();
					rating.destroy();
				},
				startDelay: Conductor.crochet * 0.001
			});


			curSection += 1;
		}
	}

	public function NearlyEquals(value1:Float, value2:Float, unimportantDifference:Float = 10):Bool
	{
		return Math.abs(FlxMath.roundDecimal(value1, 1) - FlxMath.roundDecimal(value2, 1)) < unimportantDifference;
	}

	var upHold:Bool = false;
	var downHold:Bool = false;
	var rightHold:Bool = false;
	var leftHold:Bool = false;
	public var isGameStarted:Bool;

	var boundMin:FlxText;
	var boundMax:FlxText;


	private function keyShit():Void // I've invested in emma stocks
	{
		// control arrays, order L D R U
		var holdArray:Array<Bool> = [mcontrols.LEFT, mcontrols.DOWN, mcontrols.UP, mcontrols.RIGHT];
		var pressArray:Array<Bool> = [mcontrols.LEFT_P, mcontrols.DOWN_P, mcontrols.UP_P, mcontrols.RIGHT_P];
		var releaseArray:Array<Bool> = [mcontrols.LEFT_R, mcontrols.DOWN_R, mcontrols.UP_R, mcontrols.RIGHT_R];
		#if windows
		if (luaModchart != null)
		{
			if (mcontrols.LEFT_P)
			{
				luaModchart.executeState('keyPressed', ["left"]);
			};
			if (mcontrols.DOWN_P)
			{
				luaModchart.executeState('keyPressed', ["down"]);
			};
			if (mcontrols.UP_P)
			{
				luaModchart.executeState('keyPressed', ["up"]);
			};
			if (mcontrols.RIGHT_P)
			{
				luaModchart.executeState('keyPressed', ["right"]);
			};
		};
		#end

		// Prevent player input if botplay is on
		if (botPlayShit)
		{
			holdArray = [false, false, false, false];
			pressArray = [false, false, false, false];
			releaseArray = [false, false, false, false];
		}
		// HOLDS, check for sustain notes
		if (holdArray.contains(true) && /*!boyfriend().stunned && */ generatedMusic)
		{
			notes.forEachAlive(function(daNote:Note)
			{
				if (daNote.isSustainNote && daNote.canBeHit && daNote.mustPress && holdArray[daNote.noteData])
					goodNoteHit(daNote);
			});
		}

		// PRESSES, check for note hits
		if (pressArray.contains(true) && /*!boyfriend().stunned && */ generatedMusic)
		{
			if (playAsDad)
			{
				dad().holdTimer = 0;
			}
			else
				boyfriend().holdTimer = 0;

			var possibleNotes:Array<Note> = []; // notes that can be hit
			var directionList:Array<Int> = []; // directions that can be hit
			var dumbNotes:Array<Note> = []; // notes to kill later
			var directionsAccounted:Array<Bool> = [false, false, false, false]; // we don't want to do judgments for more than one presses

			notes.forEachAlive(function(daNote:Note)
			{
				if (daNote.canBeHit && daNote.mustPress && !daNote.tooLate && !daNote.wasGoodHit)
				{
					if (!directionsAccounted[daNote.noteData])
					{
						if (directionList.contains(daNote.noteData))
						{
							directionsAccounted[daNote.noteData] = true;
							for (coolNote in possibleNotes)
							{
								if (coolNote.noteData == daNote.noteData && Math.abs(daNote.strumTime - coolNote.strumTime) < 10)
								{ // if it's the same note twice at < 10ms distance, just delete it
									// EXCEPT u cant delete it in this loop cuz it fucks with the collection lol
									dumbNotes.push(daNote);
									break;
								}
								else if (coolNote.noteData == daNote.noteData && daNote.strumTime < coolNote.strumTime)
								{ // if daNote is earlier than existing note (coolNote), replace
									possibleNotes.remove(coolNote);
									possibleNotes.push(daNote);
									break;
								}
							}
						}
						else
						{
							possibleNotes.push(daNote);
							directionList.push(daNote.noteData);
						}
					}
				}
			});

			// //@notrace('\nCURRENT LINE:\n' + directionsAccounted);

			for (note in dumbNotes)
			{
				FlxG.log.add("killing dumb ass note at " + note.strumTime);
				note.kill();
				notes.remove(note, true);
				note.destroy();
			}

			possibleNotes.sort((a, b) -> Std.int(a.strumTime - b.strumTime));

			var dontCheck = false;

			for (i in 0...pressArray.length)
			{
				if (pressArray[i] && !directionList.contains(i))
					dontCheck = true;
			}

			if (perfectMode)
				goodNoteHit(possibleNotes[0]);
			else if (possibleNotes.length > 0 && !dontCheck)
			{
				if (!FlxG.save.data.ghost)
				{
					for (shit in 0...pressArray.length)
					{ // if a direction is hit that shouldn't be
						if (pressArray[shit] && !directionList.contains(shit))
							noteMiss(shit, null);
					}
				}
				for (coolNote in possibleNotes)
				{
					if (pressArray[coolNote.noteData])
					{
						if (mashViolations != 0)
							mashViolations--;
						scoreTxt.color = FlxColor.WHITE;
						goodNoteHit(coolNote);
					}
				}
			}
			else if (!FlxG.save.data.ghost)
			{
				for (shit in 0...pressArray.length)
					if (pressArray[shit])
						noteMiss(shit, null);
			}

			if (dontCheck && possibleNotes.length > 0 && FlxG.save.data.ghost && !botPlayShit)
			{
				if (mashViolations > 8)
				{
					//@notrace('mash violations ' + mashViolations);
					scoreTxt.color = FlxColor.RED;
					noteMiss(0, null);
				}
				else
					mashViolations++;
			}
		}

		notes.forEachAlive(function(daNote:Note)
		{
			if (FlxG.save.data.downscroll && daNote.y > strumLine.y || !FlxG.save.data.downscroll && daNote.y < strumLine.y)
			{
				// Force good note hit regardless if it's too late to hit it or not as a fail safe
				if (botPlayShit && daNote.canBeHit && daNote.mustPress || botPlayShit && daNote.tooLate && daNote.mustPress)
				{
					goodNoteHit(daNote);
					if (playAsDad)
						dad().holdTimer = daNote.sustainLength;
					else
						boyfriend().holdTimer = daNote.sustainLength;
				}
			}
		});

		if (playAsDad)
		{
			if (dad().holdTimer > Conductor.stepCrochet * 4 * 0.001 && (!holdArray.contains(true) || botPlayShit))
			{
				if (dad().animation.curAnim.name.startsWith('sing')
					&& !dad().animation.curAnim.name.endsWith('miss'))
					// && (boyfriend().animation.curAnim != null && boyfriend().animation.curAnim.finished))
					dad().playAnim('idle'); // .idle();
			}
		}

		else
		{
			if (boyfriend().holdTimer > Conductor.stepCrochet * 4 * 0.001 && (!holdArray.contains(true) || botPlayShit))
			{
				if (boyfriend().animation.curAnim.name.startsWith('sing')
					&& !boyfriend().animation.curAnim.name.endsWith('miss'))
					// && (boyfriend().animation.curAnim != null && boyfriend().animation.curAnim.finished))
					boyfriend().playAnim('idle');//, false, false, 10);
			}
		}

		if (!botPlayShit)
		{
			playerStrums.forEach(function(spr:FlxSprite)
			{
				if (pressArray[spr.ID] && spr.animation.curAnim.name != 'confirm')
					spr.animation.play('pressed');
				if (!holdArray[spr.ID])
					spr.animation.play('static');

				if (spr.animation.curAnim.name == 'confirm' && !curStage.startsWith('school'))
				{
					spr.centerOffsets();
					spr.offset.x -= 13;
					spr.offset.y -= 13;
				}
				else
					spr.centerOffsets();
			});
		}
		else
		{
			// if botplay, fuck you
			playerStrums.forEach(function(spr:FlxSprite)
			{
				if (spr.animation.finished)
				{
					spr.animation.play('static');
					spr.centerOffsets();
				}
			});
		}



	}

	function noteMiss(direction:Int = 1, daNote:Note):Void
	{
		var stunned:Bool = playAsDad ? dad().stunned : boyfriend().stunned;
		if (!stunned)
		{
	
			if (combo > 5 && gf().animOffsets.exists('sad'))
			{
				gf().playAnimForce('sad', 0.5, function()
				{
					gf().playAnim('idle');
				});
			}

			songScore -= 500;
			combo = 0;
			misses ++;
			health -= 0.1;


			popUpRating('fuck');
			popUpHealth('fuck', -0.1);

			// var noteDiff:Float = Math.abs(daNote.strumTime - Conductor.songPosition);
			// var wife:Float = EtternaFunctions.wife3(noteDiff, FlxG.save.data.etternaMode ? 1 : 1.7);

			if (FlxG.save.data.accuracyMod == 1)
				totalNotesHit -= 1;

			if (!isMidSongEvent)
				FlxG.sound.play(Paths.soundRandom('missnote', 1, 3), FlxG.random.float(0.1, 0.2));
		
			// FlxG.sound.play(Paths.sound('missnote1'), 1, false);
			// FlxG.log.add('played imss note');

			songPlayer.playerMissNoteEvent();

			//songPlayer.missNoteEvent(daNote);
			
			if (playAsDad)
			{
				//temp ignore
			}
			else
			{
				switch (direction)
				{
					case 0:
						boyfriend().playAnim('singLEFTmiss', true);
					case 1:
						boyfriend().playAnim('singDOWNmiss', true);
					case 2:
						boyfriend().playAnim('singUPmiss', true);
					case 3:
						boyfriend().playAnim('singRIGHTmiss', true);
				}
			}
			
			#if windows
			if (luaModchart != null)
				luaModchart.executeState('playerOneMiss', [direction, Conductor.songPosition]);
			#end

			updateAccuracy();
		}
	}

	/*function badNoteCheck()
			{
				// just double pasting this shit cuz fuk u
				// REDO THIS SYSTEM!
				var upP = mcontrols.UP_P;
				var rightP = mcontrols.RIGHT_P;
				var downP = mcontrols.DOWN_P;
				var leftP = mcontrols.LEFT_P;

				if (leftP)
					noteMiss(0);
				if (upP)
					noteMiss(2);
				if (rightP)
					noteMiss(3);
				if (downP)
					noteMiss(1);
				updateAccuracy();
			}
	 */
	function updateAccuracy()
	{
		totalPlayed += 1;
		accuracy = Math.max(0, totalNotesHit / totalPlayed * 100);
		accuracyDefault = Math.max(0, totalNotesHitDefault / totalPlayed * 100);
	}

	function getKeyPresses(note:Note):Int
	{
		var possibleNotes:Array<Note> = []; // copypasted but you already know that

		notes.forEachAlive(function(daNote:Note)
		{
			if (daNote.canBeHit && daNote.mustPress && !daNote.tooLate)
			{
				possibleNotes.push(daNote);
				possibleNotes.sort((a, b) -> Std.int(a.strumTime - b.strumTime));
			}
		});
		if (possibleNotes.length == 1)
			return possibleNotes.length + 1;
		return possibleNotes.length;
	}

	var mashing:Int = 0;
	var mashViolations:Int = 0;

	var etternaModeScore:Int = 0;

	function noteCheck(controlArray:Array<Bool>, note:Note):Void // sorry lol
	{
		var noteDiff:Float = Math.abs(note.strumTime - Conductor.songPosition);

		note.rating = Ratings.CalculateRating(noteDiff);

		if (controlArray[note.noteData])
		{
			goodNoteHit(note, (mashing > getKeyPresses(note)));
		}
	}

	function goodNoteHit(note:Note, resetMashViolation = true):Void
	{
		if (mashing != 0)
			mashing = 0;

		var noteDiff:Float = Math.abs(note.strumTime - Conductor.songPosition);

		note.rating = Ratings.CalculateRating(noteDiff);

		// add newest note to front of notesHitArray
		// the oldest notes are at the end and are removed first
		if (!note.isSustainNote)
			notesHitArray.unshift(Date.now());

		if (!resetMashViolation && mashViolations >= 1)
			mashViolations--;

		if (mashViolations < 0)
			mashViolations = 0;

		if (!note.wasGoodHit)
		{
			if (!note.isSustainNote)
			{
				popUpScore(note);
				combo += 1;
			}
			else
				totalNotesHit += 1;

			if (playAsDad)
			{
				switch (note.noteData)
				{
					case 2:
						dad().playAnim('singUP', true);
					case 3:
						dad().playAnim('singRIGHT', true);
					case 1:
						dad().playAnim('singDOWN', true);
					case 0:
						dad().playAnim('singLEFT', true);
				}
			}
			else
			{
				switch (note.noteData)
				{
					case 2:
						boyfriend().playAnim('singUP', true);
					case 3:
						boyfriend().playAnim('singRIGHT', true);
					case 1:
						boyfriend().playAnim('singDOWN', true);
					case 0:
						boyfriend().playAnim('singLEFT', true);
				}
			}
			#if windows
			if (luaModchart != null)
				luaModchart.executeState('playerOneSing', [note.noteData, Conductor.songPosition]);
			#end

			effectStrums.forEach(function(spr:FlxSprite)
			{
				if (Math.abs(note.noteData) == spr.ID && spr.animation.finished)
				{
					spr.alpha = 1;
					spr.animation.play('hit', true);
				}
			});

			playerStrums.forEach(function(spr:FlxSprite)
			{
				if (Math.abs(note.noteData) == spr.ID)
				{
					spr.animation.play('confirm', true);
					if (playAsDad)
					{
						setLastNote(note);
						songPlayer.dadNoteEvent(note);
					}
					else
						songPlayer.bfNoteEvent(note);
				}
				if (spr.animation.curAnim.name == 'confirm' && !curStage.startsWith('school'))
				{
					spr.centerOffsets();
					spr.offset.x -= 13;
					spr.offset.y -= 13;
				}
				else
					spr.centerOffsets();
			});



			note.wasGoodHit = true;
			vocals.volume = 1;

			note.kill();
			notes.remove(note, true);
			note.destroy();

			updateAccuracy();
		}
	}

	var danced:Bool = false;

	override function stepHit()
	{
		super.stepHit();
		songPlayer.midSongStepUpdate();
		
		if (FlxG.sound.music.time > Conductor.songPosition + 20 || FlxG.sound.music.time < Conductor.songPosition - 20)
		{
			resyncVocals();
		}

		#if windows
		if (executeModchart && luaModchart != null)
		{
			luaModchart.setVar('curStep', curStep);
			luaModchart.executeState('stepHit', [curStep]);
		}
		#end

		// yes this updates every step.
		// yes this is bad
		// but i'm doing it to update misses and accuracy
		#if windows
		// Song duration in a float, useful for the time left feature
		songLength = FlxG.sound.music.length;

	

		// Updating Discord Rich Presence (with Time Left)
		DiscordClient.changePresence(detailsText
			+ " "
			+ CURRENT_SONG
			+ " ("
			+ storyDifficultyText
			+ ") "
			+ Ratings.GenerateLetterRank(accuracy),
			"Acc: "
			+ HelperFunctions.truncateFloat(accuracy, 2)
			+ "% | Score: "
			+ songScore
			+ " | Misses: "
			+ misses, iconRPC, true,
			songLength
			- Conductor.songPosition);
		#end
	}

	var lightningStrikeBeat:Int = 0;
	var lightningOffset:Int = 8;

	override function beatHit()
	{
		super.beatHit();

		if (generatedMusic)
		{
			notes.sort(FlxSort.byY, (FlxG.save.data.downscroll ? FlxSort.ASCENDING : FlxSort.DESCENDING));
		}

		#if windows
		if (executeModchart && luaModchart != null)
		{
			luaModchart.setVar('curBeat', curBeat);
			luaModchart.executeState('beatHit', [curBeat]);
		}
		#end

		songPlayer.midSongEventUpdate(curBeat);
		

		if (SONG.notes[Math.floor(curStep / 16)] != null)
		{
			if (SONG.notes[Math.floor(curStep / 16)].changeBPM)
			{
				Conductor.changeBPM(SONG.notes[Math.floor(curStep / 16)].bpm);
				FlxG.log.add('CHANGED BPM!');
			}
			// else
			// Conductor.changeBPM(SONG.bpm);

			// Dad doesnt interupt his own notes
			if (SONG.notes[Math.floor(curStep / 16)].mustHitSection)
			{
				// if (!playAsDad)
					// dad().dance();
			}
		}
		// FlxG.log.add('change bpm' + SONG.notes[Std.int(curStep / 16)].changeBPM);
		wiggleShit.update(Conductor.crochet);

		// HARDCODING FOR MILF ZOOMS!
		if (curSong.toLowerCase() == 'milf' && curBeat >= 168 && curBeat < 200 && camZooming && camGame.zoom < 1.35)
		{
			// camGame.zoom += 0.005;
			camGame.zoom += 0.015;
		}

		if (camZooming && camGame.zoom < 1.25 && curBeat % 4 == 0)
		{
			camGame.zoom += 0.0075;
			// camHUD.zoom += 0.015;
			songPlayer.playBeatEvent();
		}

		iconP1.setGraphicSize(Std.int(iconP1.width + 30));
		iconP2.setGraphicSize(Std.int(iconP2.width + 30));

		iconP1.updateHitbox();
		iconP2.updateHitbox();

		if (playAsDad)
		{
			if (!dad().animation.curAnim.name.startsWith("idle")
				 && dad().animation.curAnim.finished)
			{
				dad().playAnim('idle');
			}
		}	
		else
		{
			if (!boyfriend().animation.curAnim.name.startsWith("idle")
				 && boyfriend().animation.curAnim.finished)
			{
				boyfriend().playAnim('idle');//, false, false, 10);
			}
		}


	}
}