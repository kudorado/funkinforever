package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Whitroll extends SongPlayer	
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/date/carol_assets', 'mods');
		dad.frames = tex;
	}

    override function getBFTex() {
        var tex = Paths.getSparrowAtlas('pc/date/whitty_assets', 'mods');
		bf.frames = tex;
    }

	override function loadMap()
	{
        playState.defaultCamZoom = 0.85;
		var bg:FlxSprite = new FlxSprite(157, 0).loadGraphic(Paths.image('bg/date/citycolor', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1.2;
		bg.scale.x = 1.2;
		playState.add(bg);

        var skyscrapers:FlxSprite = new FlxSprite(227, 134).loadGraphic(Paths.image('bg/date/skyscrapers', 'mods'));
		skyscrapers.antialiasing = true;
		skyscrapers.scale.y = 1.2;
		skyscrapers.scale.x = 1.2;
		playState.add(skyscrapers);

        var light:FlxSprite = new FlxSprite(497, -1000).loadGraphic(Paths.image('bg/date/light', 'mods'));
		light.antialiasing = true;
		light.scale.y = 1.2;
		light.scale.x = 1.2;
		playState.add(light);

        var deco:FlxSprite = new FlxSprite(157, 0).loadGraphic(Paths.image('bg/date/deco', 'mods'));
		deco.antialiasing = true;
		deco.scale.y = 1.2;
		deco.scale.x = 1.2;
		playState.add(deco);

        var balc:FlxSprite = new FlxSprite(105, 400).loadGraphic(Paths.image('bg/date/balc', 'mods'));
		balc.antialiasing = true;
		balc.scale.y = 1.2;
		balc.scale.x = 1.2;
		playState.add(balc);


		var balc:FlxSprite = new FlxSprite(731, 558).loadGraphic(Paths.image('bg/date/table', 'mods'));
		balc.antialiasing = true;
		balc.scale.y = 1;
		balc.scale.x = 1;
		playState.add(balc);

        
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Carol idle00', 18, false);
		animation.addByPrefix('singUP', 'Carol up00', 24, false);
		animation.addByPrefix('singRIGHT', 'Carol right00', 24, false);
		animation.addByPrefix('singLEFT', 'Carol left00', 24, false);
		animation.addByPrefix('singDOWN', 'Carol down00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{

        dad.addOffset('idle',0, 23);

		dad.addOffset('singUP', 1, 23);
		dad.addOffset('singRIGHT', 1, 23);
		dad.addOffset('singLEFT', 1, 23);
		dad.addOffset('singDOWN', 1, 23);
		dad.dance();
        dad.scale.x = 2;
        dad.scale.y = 2;
		dad.x = 601;
		dad.y = 303;
	
	}

    override function createBFAnimations()
    {
        var animation = bf.animation;

        animation.addByPrefix('idle', 'Whitty idle00', 24, false);
        animation.addByPrefix('singUP', 'Whitty up00', 24, false);
        animation.addByPrefix('singLEFT', 'Whitty left00', 24, false);
        animation.addByPrefix('singRIGHT', 'Whitty right00', 24, false);
        animation.addByPrefix('singDOWN', 'Whitty down00', 24, false);
        animation.addByPrefix('singUPmiss', 'Whitty miss up00', 24, false);
        animation.addByPrefix('singLEFTmiss', 'Whitty miss left00', 24, false);
        animation.addByPrefix('singRIGHTmiss', 'Whitty miss right00', 24, false);
        animation.addByPrefix('singDOWNmiss', 'Whitty miss down00', 24, false);

        bf.animation = animation;
    }

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.x += 431;
		bf.y -= 150;

	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.y = 176;
        gf.x = 863;
		gf.visible = false;
	}


}
