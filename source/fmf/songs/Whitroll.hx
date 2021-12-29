 package fmf.songs;

import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Whitroll extends SongPlayer	
{
	private var heartsThings:FlxSpriteGroup;

	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/date/carol_assets', 'mods');
		dad.frames = tex;
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Carol idle0', 18, false);
		animation.addByPrefix('idle-alt', 'Carol alt idle0', 18, false);

		animation.addByPrefix('singUP', 'Carol up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Carol right0', 24, false);
		animation.addByPrefix('singLEFT', 'Carol left0', 24, false);
		animation.addByPrefix('singDOWN', 'Carol down0', 24, false);

		animation.addByPrefix('singUP-alt', 'Carol alt up0', 24, false);
		animation.addByPrefix('singRIGHT-alt', 'Carol alt right0', 24, false);
		animation.addByPrefix('singLEFT-alt', 'Carol alt left0', 24, false);
		animation.addByPrefix('singDOWN-alt', 'Carol alt down0', 24, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.dance();
		dad.scale.x = 1.07;
		dad.scale.y = 1.07;

		dad.x = 632;
		dad.y = 233;
	}	

	function createCityBG()
	{
        playState.defaultCamZoom = 1;
		var bg:FlxSprite = new FlxSprite(227, -262).loadGraphic(Paths.image('bg/date/sky_bg', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1.2;
		bg.scale.x = 1.2;
		playState.add(bg);
	}

	override function createCharacters()
	{
		super.createCharacters();
		createLights();  
	}

	function createLights()
	{
		var light:FlxSprite = new FlxSprite(459, -434).loadGraphic(Paths.image('bg/date/light', 'mods'));
		light.antialiasing = true;
		light.scale.y = 1;
		light.scale.x = 1;
		playState.add(light);
	}

	function createSky()
	{
		var skyscrapers:FlxSprite = new FlxSprite(227, 134).loadGraphic(Paths.image('bg/date/skyscrapers', 'mods'));
		skyscrapers.antialiasing = true;
		skyscrapers.scale.y = 1.2;
		skyscrapers.scale.x = 1.2;
		playState.add(skyscrapers);
	}
	override function loadMap()
	{
		createCityBG();
		createSky();
		createDeco();
		createHeartThings();//heart vfx
		createBalc();
		createTable();
	}

	function createHeartThings()
	{
		heartsThings = new FlxSpriteGroup();
		playState.add(heartsThings);
	}
	function createDeco()
	{

        var deco:FlxSprite = new FlxSprite(157, 0).loadGraphic(Paths.image('bg/date/deco', 'mods'));
		deco.antialiasing = true;
		deco.scale.y = 1.2;
		deco.scale.x = 1.2;
		playState.add(deco);

	}

	function createBalc()
	{
        var balc:FlxSprite = new FlxSprite(80, 400).loadGraphic(Paths.image('bg/date/balc', 'mods'));
		balc.antialiasing = true;
		balc.scale.y = 1;
		balc.scale.x = 1;
		playState.add(balc);

	}

	function createTable()
	{
		var balc:FlxSprite = new FlxSprite(733, 557).loadGraphic(Paths.image('bg/date/table', 'mods'));
		balc.antialiasing = true;
		balc.scale.y = 1;
		balc.scale.x = 1;
		playState.add(balc);
	}

	override function createStoryBF() 
	{
		changePc("whitty simp");
		bf.scale.x = 1.047;
		bf.scale.y = 1.047;

		bf.x += 140;
		bf.y -= 70;


	}

	//dont remove it cuz for other chars run properly
	// not just whitty
	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.x += 243;
		bf.y += 65;

	}

	override function midSongEventUpdate(curBeat:Int)
	{
		if (curBeat > 135)
		{
			if (FlxG.save.data.distractions)
				heartsThings.add(new HeartThingy(FlxG.random.int(0, 1280), 700, FlxG.random.float(1.3, 1.5)));
		}
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.visible = false;
		gf.y = 230;
		gf.x = 	750;
	}

	override function getBFIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('health_icon/cw_icon', 'mods'), true, 150, 150);
		icon.animation.add('dad', [5, 6], 0, false, false);
		icon.animation.play("dad");
	
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('health_icon/cw_icon', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}


}
