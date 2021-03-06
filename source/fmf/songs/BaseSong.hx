package fmf.songs;

import reactor.*;
import ui.*;
import state.*;
import selection.*;
import fmf.skins.*;
import fmf.vfx.*;

import flixel.group.FlxSpriteGroup;


#if sys
import Sys;
import sys.FileSystem;
#end

import StageData.StageFile;

import flixel.FlxBasic;
import Options.PcOption;
import Options.VFXOption;
import Options.SkinOption;
import Options.DFJKOption;
import flixel.system.debug.interaction.tools.Transform;
import MenuCharacter.CharacterSetting;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.util.FlxTimer;
import flixel.FlxObject;
import flixel.math.FlxPoint;
import fmf.characters.*;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import Song.SwagSong;

// base song hold variable and some helper function
class BaseSong
{

	//i'm fk stupid but idk
	public function gfSection():Bool
		return false;

	//------------------------Brilliant lua code-----------------------------------

	function loadLua()
	{
	}

	function loadMapLua()
	{
		#if LUA_ALLOWED

		var curStage = GameState.SONG.stage;
		var luaToLoad:String = Paths.modFolders('stages/' + curStage + '.lua');
		#if android
		var daFile = curStage + '.lua';
		var daPath = "mods:" + "assets/mods/images/psychengine/" +  SongPlayer.folder;
		FunkinLua.createLuaAndroid(daFile, SongPlayer.luaFolder, 'stages');
		#else

		if (FileSystem.exists(luaToLoad))
		{
			trace('Load map: ' + luaToLoad);
			GameState.createLua(luaToLoad);
			
		}
		#end
		#end
	}

	function loadMapDataLua()
	{
		#if MOD_ALLOWED
		// var stageData:StageFile = StageData.getStageFile(GameState.SONG.stage);
		// if (stageData == null)
		// { // Stage couldn't be found, create a dummy stage for preventing a crash
		// 	stageData = {
		// 		directory: "",
		// 		defaultZoom: 0.9,
		// 		isPixelStage: false,

		// 		boyfriend: [770, 100],
		// 		girlfriend: [400, 130],
		// 		opponent: [100, 100]
		// 	};
		// }

		// GameState.isPixelStage = stageData.isPixelStage;
		// gameState.defaultCamZoom = stageData.defaultZoom;
		// gameState.BF_X = stageData.boyfriend[0];
		// gameState.BF_Y = stageData.boyfriend[1];
		// gameState.GF_X = stageData.girlfriend[0];
		// gameState.GF_Y = stageData.girlfriend[1];
		// gameState.DAD_X = stageData.opponent[0];
		// gameState.DAD_Y = stageData.opponent[1];

		// gameState.boyfriendGroup = new FlxSpriteGroup(gameState.BF_X, gameState.BF_Y);
		// gameState.dadGroup = new FlxSpriteGroup(gameState.DAD_X, gameState.DAD_Y);
		// gameState.gfGroup = new FlxSpriteGroup(gameState.GF_X, gameState.GF_Y);

		#end
	}



	var iconLoaded:String;
	function loadIconLua(name:String)
	{
		//just attemp
		#if LUA_ALLOWED
		var daTexture = FunkinLua.daPath + "images/icons/" + name;
		iconLoaded = Paths.image(daTexture, FunkinLua.daLibrary);
		#end
	}

	//----------------------------------------------------------------------------------


	//---------------------------------------- VARIABLES -----------------------------------------------------
	// skin
	public var mapLoaded:Bool;
	public var skin:Skin;
	public var vfx:VFX;

	// characters shit
	public var bf:Character;
	public var gameState(get, never):GameState;
	public inline function get_gameState()
		return GameState.instance;
	
	public var gf:Character;
	public var dad:Character;

	// dialogue
	public var dialogue:Array<String>;
	public var dialogueBox:DialogueBox;

	// camera position at start
	public var camPos:FlxPoint;

	// start countdown
	var readySprite:FlxSprite;
	var setSprite:FlxSprite;
	var goSprite:FlxSprite;
	var introAlts:Array<String> = ['ready', "set", "go"];

	// label for song, use it in somecase.
	public var songLabel:String;

	public function bfCamFollowYMin()
	{
		return 500;
	}

	public function bfCamFollowYMax()
	{
		return 550;
	}

	public function playBeatEvent():Void{}

	
	//--------------------------------------------------------------------------------------------------------
	//------------------------------------------ INITIALIE ---------------------------------------------------
	// init song with a familar name to identity
	public function new(songLabel:String = 'none')
	{
		this.songLabel = songLabel;
	}

	// initalize function
	public function init():Void
	{
		loadLua();
		loadMapLua();
		loadMap();
		mapLoaded = true;
		loadMapGroup();
		createCharacters();
		createStoryCharacters();
		initVariables();
		

		//add later sprites
		GameState.instance.callOnLuas('addLuaSpriteGroup', [FunkinLua.addLater, true]);
	}

	function createStoryCharacters()
	{
		if (GameState.isStoryMode)
		{
			createStoryBF();
		}
	} 

	function initVariables()
	{
		loadSkin();
		loadVFX();
		loadScroll();
		loadPlayMode();

		camPos = new FlxPoint(dad.x, dad.y);
		// setCamPosition();
	}

	function loadMapGroup()
	{
		gameState.add(gameState.gfGroup);
		gameState.add(gameState.player3Group);
		gameState.add(gameState.dadGroup);
		gameState.add(gameState.boyfriendGroup);
		gameState.add(gameState.frontGroup);

	}

	// what map should we load
	function loadMap():Void
	{
		gameState.defaultCamZoom = 0.9;
		var bg:FlxSprite = new FlxSprite(-600, -200).loadGraphic(Paths.image('stageback'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.9, 0.9);
		bg.active = false;
		gameState.add(bg);

		var stageFront:FlxSprite = new FlxSprite(-650, 600).loadGraphic(Paths.image('stagefront'));
		stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
		stageFront.updateHitbox();
		stageFront.antialiasing = true;
		stageFront.scrollFactor.set(0.9, 0.9);
		stageFront.active = false;
		gameState.add(stageFront);

		var stageCurtains:FlxSprite = new FlxSprite(-500, -300).loadGraphic(Paths.image('stagecurtains'));
		stageCurtains.setGraphicSize(Std.int(stageCurtains.width * 0.9));
		stageCurtains.updateHitbox();
		stageCurtains.antialiasing = true;
		stageCurtains.scrollFactor.set(1.3, 1.3);
		stageCurtains.active = false;

		gameState.add(stageCurtains);
	}

	// what character should we create
	private function createCharacters():Void
	{
		createGF();
		createBF();
		createDad();

		gf.scrollFactor.set(0.95, 0.95);

		gameState.gfGroup.add(gf);
		gameState.dadGroup.add(dad);
		gameState.boyfriendGroup.add(bf);

		bf.characterAddedEvent();

	}

	//---------------------------------------------------------------------------------------------------------
	//--------------------------------------------------- GF --------------------------------------------------
	// get GF skin
	private function getGFTex()
	{
		var tex = Paths.getSparrowAtlas('gf/GF_normal');
		gf.frames = tex;	
		// tex = null;
	}

	// create GF animations
	private function createGFAnimations():Void
	{
		var animation = gf.animation;
		animation.addByPrefix('cheer', 'GF Cheer', 24, false);
		animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
		animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
		animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
		animation.addByPrefix('scared', 'GF FEAR 0', 24);
		animation.addByPrefix('idle', 'GF Dancing Beat0', 24, false);

		gf.animation = animation;
	}

	// create GF animation offsets
	private function createGFAnimationOffsets():Void
	{
		gf.addOffset('cheer');
		gf.addOffset('sad', -2, -20);
		gf.addOffset('scared', -2, -17);
		gf.addOffset('danceRight', 0, -9);
		gf.addOffset('danceLeft', 0, -9);
		gf.addOffset('idle', 0, -9);

		gf.playAnim('danceRight');
		gf.dance();
	}

	// get GF version
	private function getGFVersion():Character
	{
		return new GF(400, 200);
	}

	// create GF
	public function createGF()
	{
		gf = getGFVersion();

		if (!FlxG.save.data.showGF)
		{
			gf.isVisible = false;
			gf.alpha = 0;
			return;
		}
		// detect Psych engine character or not
		var daPE = Type.getClassName(Type.getClass(gf));
		// trace("gfShit: " + daPE);

		var PE = daPE.toLowerCase() == "fmf.characters.characterpe";

		if (!PE)
		{
			getGFTex();
			createGFAnimations();
			createGFAnimationOffsets();
		}
	}

	//--------------------------------------------------------------------------------------------------------
	//------------------------------------------------- DAD --------------------------------------------------
	// get dad skin
	private function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('gf/GF_tutorial');
		dad.frames = tex;
	}

	// create dad animation
	private function createDadAnimations()
	{
		var animation = dad.animation;
		animation.addByPrefix('cheer', 'GF Cheer', 24, false);
		animation.addByPrefix('singLEFT', 'GF left note', 24, false);
		animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
		animation.addByPrefix('singUP', 'GF Up Note', 24, false);
		animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
		animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
		animation.addByIndices('idle', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
		animation.addByIndices('scared', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);

	}

	// create dad animation offsets
	private function createDadAnimationOffsets()
	{
		dad.addOffset('cheer', 0, -3);
		dad.addOffset('sad', -2, -19);
		dad.addOffset('idle', 0, -9);

		dad.addOffset("singUP", 0, 0);
		dad.addOffset("singRIGHT", 0, -17);
		dad.addOffset("singLEFT", 0, -17);
		dad.addOffset("singDOWN", 0, -18);

		dad.playAnim('idle');
		dad.dance();
	}

	// get dad version
	private function getDadVersion():Character
	{
		return new Dad(100, 100);
	}

	// create dad
	public function createDad()
	{
		dad = getDadVersion();
	
		//detect Psych engine character or not
		var daPE = Type.getClassName(Type.getClass(dad));
		var PE =  daPE.toLowerCase() == "fmf.characters.characterpe";

		if (!FlxG.save.data.showDad)
		{
			dad.isVisible = false;
			dad.alpha = 0;
			dad.visible = false;
			return;
		}


		if (!PE) // if psych engine character, just ignore.
		{
			dad.setPosition(400, 250);
			getDadTex();
			createDadAnimations();
			createDadAnimationOffsets();
		}

		
	}

	private function switchDad(song:SongPlayer, createDad:Bool = true, destroyOldDad:Bool = true)
	{
		if (dad != null)
		{
			if (!AnimationState.isActive)
				gameState.dadGroup.remove(dad);
		}
		if (destroyOldDad && dad != null)
			dad.destroy();

		if (createDad)
			song.createDad();

		dad = song.dad;

		if (!AnimationState.isActive)
			gameState.dadGroup.add(dad);

		dad.playAnim(gameState.lastNote, true);

	}

	private function switchBF(pc:Character)
	{
		if (bf != null)
		{
			if (!AnimationState.isActive)
				gameState.boyfriendGroup.remove(bf);

			bf.destroy();
		}

		this.bf = pc;

		if(!AnimationState.isActive)
			gameState.boyfriendGroup.add(bf);
		else
			gameState.add(bf);
	}

	private function changePc(pcName:String)
	{
		var pc = PcManager.getPc(pcName);
		pc.createCharacter();
		switchBF(pc);
	}

	private function changeCharacter(character:Character)
	{
		// switch (type.toLowerCase())
		// {
		// 	case 'dad':
		// 		var pc = character;
		// 		switchDad(character);

		// 	case 'bf' | 'boyfriend':
		// 		var pc = character;
				switchBF(character);

		// }
	
	}

	private function changeDad(fronSong:String)
	{
		switchDad(SongPlayerManager.getCurrentSong(fronSong));
	}

	//--------------------------------------------------------------------------------------------------------
	//-------------------------------------------------- BF --------------------------------------------------
	// bf place here for debug menu support
	// bf skins
	// set BF difference behaviour
	private function getVersion():Character
	{	
		return PcManager.loadPc(this);
	}

	public function getDefaultPc():Character
	{
		return new Boyfriend(700, 425); // override depending on song
	}

	public function getDefaultSkin():Skin
	{
		return new Skin("default");
	}

	public function getDefaultVfx():VFX
	{
		return new VFX("none");
	}

	// create BF
	public function createBF():Void
	{
		bf = getVersion();

		var daPE = Type.getClassName(Type.getClass(bf));
		var PE = daPE.toLowerCase() == "fmf.characters.characterpe";

		if (!PE)
		{
			bf.createCharacter();

			// fuck it, we just want offset
			createBFAnimationOffsets();

			// dumb event call after created playable character
			bf.characterCreatedEvent();
		}

	}

	public function createStoryBF():Void
	{	
		var dx:Float = 0;
		var dy:Float = 0;
		//holy shit
		if (bf != null)
		{
			var x = bf.x;
			var y = bf.y;
			var daVersion = getVersion();
			dx = x - daVersion.x;
			dy = y - daVersion.y;

			daVersion.destroy();
		}
		changePc('bf');
		bf.x += dx;
		bf.y += dy;
	}

	public function add(obj:FlxBasic)
	{
		gameState.add(obj);
	}

	private function createBFAnimationOffsets():Void
	{

	}

	//--------------------------------------------------------------------------------------------------------
	//---------------------------------------------- DIALOGUE ------------------------------------------------
	// dialogue handle
	public function createDialogue(callback:Void->Void):Void
	{
		var path = GameState.CURRENT_SONG + '/' + GameState.CURRENT_SONG + '-dialogue';
		dialogue = CoolUtil.coolTextFile(Paths.txt(GameState.playingSong.folder + path));
		dialogueBox = new DialogueBox(false, dialogue);
		dialogueBox.scrollFactor.set();
		dialogueBox.finishThing = callback;
		dialogueBox.cameras = [gameState.camHUD];
		//@notrace("Create dialogue at path: " + path);
	}

	public function showDialogue():Void
	{
		gameState.add(dialogueBox);
		//@notrace('whee mai dialgue siht!');
	}

	//--------------------------------------------------------------------------------------------------------
	//---------------------------------------------- COUNTDOWN -----------------------------------------------
	// UI Function
	// start countdown
	// show ready, set, go image and sound
	public function startCountdown():Void
	{
		gameState.talking = false;
		gameState.startedCountdown = true;
		Conductor.songPosition = 0;
		Conductor.songPosition -= Conductor.crochet * 5;

		var swagCounter:Int = 0;
		gameState.startTimer = new FlxTimer().start(Conductor.crochet / 1000, function(tmr:FlxTimer)
		{
			dad.dance();
			gf.dance();
			bf.playAnim('idle');
			switch (swagCounter)
			{
				case 0:
					FlxG.sound.play(Paths.sound('intro3' + introType()), 0.6);
				case 1:
					ready();
				case 2:
					set();
				case 3:
					go();
				case 4:
			}

			swagCounter += 1;
		}, 5);
	}

	// get alt suffix for countdown sound
	// current we have default and school suffix
	private function introType():String
	{
		return "";
	}

	// countdown ready
	private function ready()
	{
		readySprite = new FlxSprite().loadGraphic(Paths.image(introAlts[0]));
		readySprite.scrollFactor.set();
		readySprite.updateHitbox();
		readySprite.screenCenter();
		gameState.add(readySprite);
		FlxTween.tween(readySprite, {y: readySprite.y += 100, alpha: 0}, Conductor.crochet / 1000, {
			ease: FlxEase.cubeInOut,
			onComplete: function(twn:FlxTween)
			{
				readySprite.destroy();
			}
		});
		FlxG.sound.play(Paths.sound('intro2' + introType()), 0.6);
	}

	// countdown set
	private function set()
	{
		setSprite = new FlxSprite().loadGraphic(Paths.image(introAlts[1]));
		setSprite.scrollFactor.set();
		setSprite.screenCenter();
		gameState.add(setSprite);
		FlxTween.tween(setSprite, {y: setSprite.y += 100, alpha: 0}, Conductor.crochet / 1000, {
			ease: FlxEase.cubeInOut,
			onComplete: function(twn:FlxTween)
			{
				setSprite.destroy();
			}
		});
		FlxG.sound.play(Paths.sound('intro1' + introType()), 0.6);
	}

	// countdown go
	private function go()
	{
		goSprite = new FlxSprite().loadGraphic(Paths.image(introAlts[2]));
		goSprite.scrollFactor.set();
		goSprite.updateHitbox();
		goSprite.screenCenter();
		gameState.add(goSprite);

		FlxTween.tween(goSprite, {y: goSprite.y += 100, alpha: 0}, Conductor.crochet / 1000, {
			ease: FlxEase.cubeInOut,
			onComplete: function(twn:FlxTween)
			{
				goSprite.destroy();
			}
		});

		FlxG.sound.play(Paths.sound('introGo' + introType()), 0.6);
		gameState.isGameStarted = true;
	}

	//--------------------------------------------------------------------------------------------------------
	//---------------------------------------------- ARROW & NOTE --------------------------------------------
	// set icon bf
	public function getBFIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('bf', [0, 1], 0, false, true);
		icon.animation.play("bf");
	}

	// set icon dad
	public function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image("iconGrid"), true, 150, 150);
		icon.animation.add('dad', [16, 6], 0, false, false);
		icon.animation.play("dad");
	}

	private function loadSkin()
	{	
		if(GameState.isStoryMode)
			skin = getDefaultSkin();
		else
			skin = SkinManager.loadSkin(this);
	}

	private function loadVFX()
	{
		if (GameState.isStoryMode)
			vfx = getDefaultVfx();
		else
			vfx  = VfxManager.loadVfx();
	}

	private function loadScroll()
	{
		ScrollManager.loadScroll();
	}

	private function loadPlayMode()
	{
		PlayModeManager.loadPlayMode();
	}

	// get note skin depending on song
	public function getNoteSkin(note:Note)
	{
		skin.getNoteSkin(note);
	}

	// get arrow skin depending on song
	public function getArrowSkin(i:Int, babyArrow:FlxSprite)
	{
		skin.getArrowSkin(i, babyArrow);
	}

	// get arrow skin depending on song
	public function getVFX(i:Int, fx:FlxSprite)
	{
		vfx.getVFX(i, fx);
	}

	//---------------------------------------------- Mxxxenu Character --------------------------------------------

	public function setBFMenuCharacter(bf:MenuCharacter)
	{
		var frames = Paths.getSparrowAtlas('menucharacter/campaign_menu_UI_characters');
		bf.frames = frames;

		bf.animation.addByPrefix('bf', "BF idle dance white", 24);
		bf.animation.addByPrefix('bfConfirm', 'BF HEY!!', 24, false);

		bf.animation.play('bf');
		setMenuCharacter(bf, new CharacterSetting(0, -30, 0.85, true));
	}

	public function setGFMenuCharacter(gf:MenuCharacter)
	{
		var frames = Paths.getSparrowAtlas('menucharacter/campaign_menu_UI_characters');
		gf.frames = frames;

		gf.animation.addByPrefix('gf', "GF Dancing Beat WHITE", 24);

		gf.animation.play('gf');
		// increase y to move it up
		// increase x to move it to the left
		setMenuCharacter(gf, new CharacterSetting(100, 125, 1, true));
	}

	private function setMenuCharacter(character:MenuCharacter, setting:CharacterSetting)
	{
		character.offset.set(setting.x, setting.y);
		character.setGraphicSize(Std.int(character.width * setting.scale));
		character.flipX = setting.flipped != character.flipped;
	}

	//------------------------------------------------ EVENTS-------------------------------------------------
	// camera follow initalize
	public function applyCamPosition():Void
	{
		gameState.camFollow = new FlxObject(0, 0, 1, 1);
		gameState.setCamFollowPosition(camPos.x, camPos.y);
	}

	//--------------------------------------------------------------------------------------------------------
	//-------------SHIT----------------
	// get vfx depending on selection & song
	private function getArray(from:Int = 0, num:Int):Array<Int>
	{
		var result:Array<Int> = new Array<Int>();
		for (i in from...num)
		{
			result.push(i);
		}
		return result;
	}

	//------------------------------------
}