package fmf.songs;

import Options.PcOption;
import Options.VFXOption;
import Options.SkinOption;
import Options.DFJKOption;
import flixel.system.debug.interaction.tools.Transform;
import fmf.skins.*;
import fmf.vfx.*;
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
	//---------------------------------------- VARIABLES -----------------------------------------------------
	// skin
	public var skin:Skin;
	public var vfx:VFX;

	// characters shit
	public var bf:PlayableCharacter;
	public var playState(get, never):PlayState;
	public inline function get_playState()
		return PlayState.instance;
	
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
		loadMap();
		createCharacters();
		initVariables();
	}

	function initVariables()
	{
		loadSkin();
		loadVFX();
		loadScroll();

		camPos = new FlxPoint(dad.x, dad.y);
		// setCamPosition();
	}

	// what map should we load
	function loadMap():Void
	{
		playState.defaultCamZoom = 0.9;
		var bg:FlxSprite = new FlxSprite(-600, -200).loadGraphic(Paths.image('stageback'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.9, 0.9);
		bg.active = false;
		playState.add(bg);

		var stageFront:FlxSprite = new FlxSprite(-650, 600).loadGraphic(Paths.image('stagefront'));
		stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
		stageFront.updateHitbox();
		stageFront.antialiasing = true;
		stageFront.scrollFactor.set(0.9, 0.9);
		stageFront.active = false;
		playState.add(stageFront);

		var stageCurtains:FlxSprite = new FlxSprite(-500, -300).loadGraphic(Paths.image('stagecurtains'));
		stageCurtains.setGraphicSize(Std.int(stageCurtains.width * 0.9));
		stageCurtains.updateHitbox();
		stageCurtains.antialiasing = true;
		stageCurtains.scrollFactor.set(1.3, 1.3);
		stageCurtains.active = false;

		playState.add(stageCurtains);
	}

	// what character should we create
	private function createCharacters():Void
	{
		createGF();
		createBF();
		createDad();

		gf.scrollFactor.set(0.95, 0.95);

		playState.add(gf);
		playState.add(dad);
		playState.add(bf);

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
		animation.addByPrefix('singLEFT', 'GF left note', 24, false);
		animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
		animation.addByPrefix('singUP', 'GF Up Note', 24, false);
		animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
		animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
		animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
		animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
		animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
		animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
		animation.addByPrefix('scared', 'GF FEAR 0', 24);

		gf.animation = animation;
	}

	// create GF animation offsets
	private function createGFAnimationOffsets():Void
	{
		gf.addOffset('cheer');
		gf.addOffset('sad', -2, -2);
		gf.addOffset('danceLeft', 0, -9);
		gf.addOffset('danceRight', 0, -9);

		gf.addOffset("singUP", 0, 4);
		gf.addOffset("singRIGHT", 0, -20);
		gf.addOffset("singLEFT", 0, -19);
		gf.addOffset("singDOWN", 0, -20);
		gf.addOffset('hairBlow', 45, -8);
		gf.addOffset('hairFall', 0, -9);

		gf.addOffset('scared', -2, -17);

		gf.playAnim('danceRight');
		gf.dance();
	}

	// get GF version
	private function getGFVersion():Character
	{
		return new GF(400, 200);
	}

	// create GF
	private function createGF()
	{
		gf = getGFVersion();

		if (!FlxG.save.data.showGF)
		{
			gf.isVisible = false;
			gf.alpha = 0;
			return;
		}

		getGFTex();
		createGFAnimations();
		createGFAnimationOffsets();
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
		animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
		animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
		animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
		animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
		animation.addByPrefix('scared', 'GF FEAR', 24);
		dad.animation = animation;
	}

	// create dad animation offsets
	private function createDadAnimationOffsets()
	{
		dad.addOffset('cheer');
		dad.addOffset('sad', -2, -2);
		dad.addOffset('danceLeft', 0, -9);
		dad.addOffset('danceRight', 0, -9);

		dad.addOffset("singUP", 0, 4);
		dad.addOffset("singRIGHT", 0, -20);
		dad.addOffset("singLEFT", 0, -19);
		dad.addOffset("singDOWN", 0, -20);
		dad.addOffset('hairBlow', 45, -8);
		dad.addOffset('hairFall', 0, -9);

		dad.addOffset('scared', -2, -17);

		dad.playAnim('danceRight');
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
		dad.setPosition(400, 250);

		if (!FlxG.save.data.showDad)
		{
			dad.isVisible = false;
			dad.alpha = 0;
			dad.visible = false;
			return;
		}

		getDadTex();
		createDadAnimations();
		createDadAnimationOffsets();
	}

	private function switchDad(song:SongPlayer)
	{
		playState.remove(dad);
		dad.destroy();//alloc for fun

		song.createDad();
		dad = song.dad;
		
		
		playState.add(dad);
		dad.playAnim(playState.lastNote, true);

	}

	private function switchBF(pc:PlayableCharacter)
	{
		playState.remove(bf);
		bf.destroy();

		this.bf = pc;
		playState.add(bf);
	}

	private function changePc(pcName:String)
	{
		var pc = PcManager.getPc(pcName);
		pc.createCharacter();
		switchBF(pc);
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
	private function getVersion():PlayableCharacter
	{	
		return PcManager.loadPc(this);
	}

	public function getDefaultPc():PlayableCharacter
	{
		return new Boyfriend(700, 425); // override depending on song
	}

	public function getDefaultSkin():Skin
	{
		return new Skin("default");
	}

	// create BF
	public function createBF():Void
	{
		bf = getVersion();
		bf.createCharacter();

		//fuck it, we just want offset
		createBFAnimationOffsets();

		//dumb event call after created playable character
		bf.characterCreatedEvent();


	}

	private function createCustomBF():Void
	{
		bf = getDefaultPc();

		getBFTex();
		createBFAnimations();
		createBFAnimationOffsets();

		bf.characterCreatedEvent();


		bf.scrollFactor.set(0.95, 0.95);
	}

	// get texture of bf and set into bf itself
	private function getBFTex():Void
	{
	}

	// create animations for bf
	private function createBFAnimations():Void
	{
	}

	// create animation offsets for bf
	private function createBFAnimationOffsets():Void
	{
	}

	//--------------------------------------------------------------------------------------------------------
	//---------------------------------------------- DIALOGUE ------------------------------------------------
	// dialogue handle
	public function createDialogue(callback:Void->Void):Void
	{
		var path = PlayState.CURRENT_SONG + '/' + PlayState.CURRENT_SONG + '-dialogue';
		dialogue = CoolUtil.coolTextFile(Paths.txt(PlayState.playingSong.folder + path));
		dialogueBox = new DialogueBox(false, dialogue);
		dialogueBox.scrollFactor.set();
		dialogueBox.finishThing = callback;
		dialogueBox.cameras = [playState.camHUD];
		trace("Create dialogue at path: " + path);
	}

	public function showDialogue():Void
	{
		playState.add(dialogueBox);
		trace('whee mai dialgue siht!');
	}

	//--------------------------------------------------------------------------------------------------------
	//---------------------------------------------- COUNTDOWN -----------------------------------------------
	// UI Function
	// start countdown
	// show ready, set, go image and sound
	public function startCountdown():Void
	{
		playState.talking = false;
		playState.startedCountdown = true;
		Conductor.songPosition = 0;
		Conductor.songPosition -= Conductor.crochet * 5;

		var swagCounter:Int = 0;
		playState.startTimer = new FlxTimer().start(Conductor.crochet / 1000, function(tmr:FlxTimer)
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
		playState.add(readySprite);
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
		playState.add(setSprite);
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
		playState.add(goSprite);

		FlxTween.tween(goSprite, {y: goSprite.y += 100, alpha: 0}, Conductor.crochet / 1000, {
			ease: FlxEase.cubeInOut,
			onComplete: function(twn:FlxTween)
			{
				goSprite.destroy();
			}
		});

		FlxG.sound.play(Paths.sound('introGo' + introType()), 0.6);
		playState.isGameStarted = true;
	}

	//--------------------------------------------------------------------------------------------------------
	//---------------------------------------------- ARROW & NOTE --------------------------------------------
	// set icon bf
	public function getBFIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('bf', [0, 1], 0, false, true);
		icon.animation.play("bf");
	}

	// set icon dad
	public function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [16, 6], 0, false, false);
		icon.animation.play("dad");
	}

	private function loadSkin()
	{	
		skin = SkinManager.loadSkin(this);
	}

	private function loadVFX()
	{
		vfx = VfxManager.loadVfx();	
	}

	private function loadScroll()
	{
		ScrollManager.loadScroll();
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

	public function setDadMenuCharacter(dad:MenuCharacter)
	{
		dad.visible = false; // temporary disable it

		//---------------- Template ----------------

		// var frames = Paths.getSparrowAtlas();
		// dad.frames = frames;

		// dad.animation.addByPrefix('dad', "Dad idle dance BLACK LINE", 24);
		// dad.animation.play('dad');
		// setMenuCharacter(dad, new CharacterSetting(-15, 230, 0.45));
		// //set active it

		//------------------------------------------
	}

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
		playState.camFollow = new FlxObject(0, 0, 1, 1);
		playState.camFollow.setPosition(camPos.x, camPos.y);
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