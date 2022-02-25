package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
//import js.html.Client;
////import js.html.AbortController;
import flixel.addons.display.shapes.FlxShapeLightning.LightningStyle;
import lime.math.BGRA;
//import js.html.rtc.PeerConnectionIceEvent;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Ejected extends SongPlayer	
{
    var speedLines1 : FlxSprite;
    var speedLines2 : FlxSprite;
    var building1: FlxSprite;
    var building2: FlxSprite;

    var buildingB1: FlxSprite;
    var buildingB2: FlxSprite;

    var cloud: FlxSprite;

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/sus/parasite', 'mods');
		dad.frames = tex;
	}

	override function createStoryBF()
	{
		changePc('bf fly');
	}

    override  function getGFTex() {
		var text = Paths.getSparrowAtlas('gf_skins/parachute/gf_parachute', 'mods');
		gf.frames = text;
	}

	override function loadMap()
	{

		gameState.defaultCamZoom = 0.7;

		var bg1:FlxSprite = new FlxSprite(-1000, -1600).loadGraphic(Paths.image('bg/sus/ejected/sky', 'mods'));
		bg1.antialiasing = true;
		bg1.scale.y = 1;
		bg1.scale.x = 1;
		gameState.add(bg1);

        var fgClouds:FlxSprite = new FlxSprite(-1150, 500).loadGraphic(Paths.image('bg/sus/ejected/fgClouds', 'mods'));
		fgClouds.antialiasing = true;
		fgClouds.scale.y = 1;
		fgClouds.scale.x = 1;
		gameState.add(fgClouds);

        speedLines1 = new FlxSprite(-200, 0).loadGraphic(Paths.image('bg/sus/ejected/speedLines', 'mods'));
		speedLines1.antialiasing = true;
		speedLines1.scale.y = 2;
		speedLines1.scale.x = 2;
		gameState.add(speedLines1);

        speedLines2 = new FlxSprite(-200, 1000).loadGraphic(Paths.image('bg/sus/ejected/speedLines', 'mods'));
		speedLines2.antialiasing = true;
		speedLines2.scale.y = 2;
		speedLines2.scale.x = 2;
		gameState.add(speedLines2);
        
        building1 = new FlxSprite(280, -3500).loadGraphic(Paths.image('bg/sus/ejected/buildingA', 'mods'));
        building1.antialiasing = true;
        building1.scale.x = 1;
        building1.scale.y = 1;
        gameState.add(building1);

        building2 = new FlxSprite(350, 100).loadGraphic(Paths.image('bg/sus/ejected/buildingA2', 'mods'));
        building2.antialiasing = true;
        building2.scale.x = 1.28;
        building2.scale.y = 1.28;
        gameState.add(building2);

        buildingB1 = new FlxSprite(-800, -500).loadGraphic(Paths.image('bg/sus/ejected/buildingB', 'mods'));
        buildingB1.antialiasing = true;
        buildingB1.scale.x = 0.6;
        buildingB1.scale.y = 0.6;
        gameState.add(buildingB1);

        buildingB2 = new FlxSprite(1000, 100).loadGraphic(Paths.image('bg/sus/ejected/buildingB2', 'mods'));
        buildingB2.antialiasing = true;
        buildingB2.scale.x = 1.3;
        buildingB2.scale.y = 1.3;
        gameState.add(buildingB2);

        cloud = new FlxSprite(0, 0);
		cloud.frames = Paths.getSparrowAtlas('bg/sus/ejected/scrollingClouds', 'mods');
		cloud.animation.addByPrefix('idle', 'Cloud', 18, true);
		cloud.animation.play('idle');
		cloud.antialiasing = true;

		cloud.scale.x = 1.3;
		cloud.scale.y = 1.3;
		cloud.x = -250;
		cloud.y = 230;

		if (FlxG.save.data.distractions)
		{
			gameState.add(cloud);
		}

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Mungus idle00', 18, false);
		animation.addByPrefix('singUP', 'Parasite up new00', 24, false);
		animation.addByPrefix('singDOWN', 'Paracite down00', 24, false);
		animation.addByPrefix('singLEFT', 'Parasite left00', 24, false);
		animation.addByPrefix('singRIGHT', 'Parasite right new00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -0, -0);
		dad.addOffset("singUP", 0, 0);
		dad.addOffset("singRIGHT", -0, -0);
		dad.addOffset("singLEFT", 0, -0);
		dad.addOffset("singDOWN", 0, -0);
		dad.dance();

		dad.scale.x = 2;
		dad.scale.y = 2;
		dad.x -= 500;
		dad.y += 425;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.scale.x = 1;
        gf.scale.y = 1;
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.x += 150;
        bf.y += 350;
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('bg/impostor/red/iconGrid','mods'), true, 150, 150);
		icon.animation.add('dad', [26, 27], 0, false, false);
		icon.animation.play("dad");
	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		gameState.targetCamFollow.x = bf.getMidpoint().x - 240;
		gameState.targetCamFollow.y = bf.getMidpoint().y - 150;
	}

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		gameState.targetCamFollow.x = bf.getMidpoint().x - 500;
		gameState.targetCamFollow.y = bf.getMidpoint().y - 150;
	}

    var dir:Int = -1; 
	var checkBeat = 96;
	var speed = 10000;

    override function update(elapsed:Float)
    {
        speedLines1.y += speed * dir * elapsed;

        speedLines2.y += speed * dir * elapsed;

        building1.y += speed * dir *elapsed;
        building2.y += speed * dir *elapsed;

        buildingB1.y += speed * dir * elapsed;
        buildingB2.y += speed * dir * elapsed;
		cloud.y += speed * dir * elapsed;

        if(speedLines1.y <-1000)
        {
            speedLines1.y = 1000;
        }

        if(speedLines2.y <-1000)
        {
            speedLines2.y = 1000;
        }


        if(building1.y <-3500)
        {
            building1.y = 3500;
        }
        if(building2.y <-3500)
        {
            building2.y = 3500;
        }

        if(buildingB1.y <-3500){
            buildingB1.y = 3500;
        }

        if(buildingB2.y <-3500){
            buildingB2.y = 3500;
        }

		if(cloud.y < -3500){
			cloud.y = 3500;
		}

        super.update(elapsed);
    }

}