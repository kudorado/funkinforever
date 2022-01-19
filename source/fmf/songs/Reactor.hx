package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
//import js.html.rtc.PeerConnectionIceEvent;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Reactor extends SongPlayer	
{
    var yellow_sus:FlxSprite;
    var brown_sus:FlxSprite;
    var white_sus:FlxSprite;
    var blue_sus:FlxSprite;
    

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/sus/impostorR', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
		gamePlayState.defaultCamZoom = 0.55;

        var mainbg:FlxSprite = new FlxSprite(-733, -757).loadGraphic(Paths.image('bg/sus/reactor_resize/reactor_background', 'mods'));
		mainbg.antialiasing = true;
		mainbg.scale.y = 1.2;
		mainbg.scale.x = 1.2;
		gamePlayState.add(mainbg);

		// var bg1:FlxSprite = new FlxSprite(-2200, -1600).loadGraphic(Paths.image('bg/sus/reactor/reference', 'mods'));
		// bg1.antialiasing = true;
		// bg1.scale.y = 0.6;
		// bg1.scale.x = 0.6;
		// gamePlayState.add(bg1);

        // var yellow_sus:FlxSprite = new FlxSprite(-150, 190).loadGraphic(Paths.image('bg/sus/reactor/yellow_sus', 'mods'));
		// yellow_sus.antialiasing = true;
		// yellow_sus.scale.y = 0.6;
		// yellow_sus.scale.x = 0.6;
		// gamePlayState.add(yellow_sus);

        yellow_sus = new FlxSprite(-150, 190);
		yellow_sus.frames = Paths.getSparrowAtlas('bg/sus/reactor/susBoppers', 'mods');
		yellow_sus.animation.addByPrefix('idle', 'yellow sus00', 18, true);
		yellow_sus.animation.play('idle');
		yellow_sus.antialiasing = true;
		yellow_sus.scale.x = 0.6;
		yellow_sus.scale.y = 0.6;

		if (FlxG.save.data.distractions)
		{
			gamePlayState.add(yellow_sus);
		}

        var pillar1:FlxSprite = new FlxSprite(-733, -757).loadGraphic(Paths.image('bg/sus/reactor_resize/back_pillars', 'mods'));
		pillar1.antialiasing = true;
		pillar1.scale.y = 1.2;
		pillar1.scale.x = 1.2;
		gamePlayState.add(pillar1);

        // var blue_sus:FlxSprite = new FlxSprite(1350, 180).loadGraphic(Paths.image('bg/sus/reactor/blue_sus', 'mods'));
		// blue_sus.antialiasing = true;
		// blue_sus.scale.y = 0.6;
		// blue_sus.scale.x = 0.6;
		// gamePlayState.add(blue_sus);

        blue_sus = new FlxSprite(1350, 180);
		blue_sus.frames = Paths.getSparrowAtlas('bg/sus/reactor/susBoppers', 'mods');
		blue_sus.animation.addByPrefix('idle', 'blue sus00', 18, true);
		blue_sus.animation.play('idle');
		blue_sus.antialiasing = true;
		blue_sus.scale.x = 0.6;
		blue_sus.scale.y = 0.6;

		if (FlxG.save.data.distractions)
		{
			gamePlayState.add(blue_sus);
		}

        var pillar2:FlxSprite = new FlxSprite(-733, -757).loadGraphic(Paths.image('bg/sus/reactor_resize/middle_pillars', 'mods'));
		pillar2.antialiasing = true;
		pillar2.scale.y = 1.2;
		pillar2.scale.x = 1.2;
		gamePlayState.add(pillar2);

        // var brown_sus:FlxSprite = new FlxSprite(-560, 150).loadGraphic(Paths.image('bg/sus/reactor/brown_sus', 'mods'));
		// brown_sus.antialiasing = true;
		// brown_sus.scale.y = 0.6;
		// brown_sus.scale.x = 0.6;
		// gamePlayState.add(brown_sus);

        // var white_sus:FlxSprite = new FlxSprite(1620, 280).loadGraphic(Paths.image('bg/sus/reactor/white_sus', 'mods'));
		// white_sus.antialiasing = true;
		// white_sus.scale.y = 0.6;
		// white_sus.scale.x = 0.6;
		// gamePlayState.add(white_sus);

        brown_sus = new FlxSprite(-560, 170);
		brown_sus.frames = Paths.getSparrowAtlas('bg/sus/reactor/susBoppers', 'mods');
		brown_sus.animation.addByPrefix('idle', 'brown sus00', 18, true);
		brown_sus.animation.play('idle');
		brown_sus.antialiasing = true;
		brown_sus.scale.x = 0.6;
		brown_sus.scale.y = 0.6;

		if (FlxG.save.data.distractions)
		{
			gamePlayState.add(brown_sus);
		}

        white_sus = new FlxSprite(1620, 280);
		white_sus.frames = Paths.getSparrowAtlas('bg/sus/reactor/susBoppers', 'mods');
		white_sus.animation.addByPrefix('idle', 'white sus00', 18, true);
		white_sus.animation.play('idle');
		white_sus.antialiasing = true;
		white_sus.scale.x = 0.6;
		white_sus.scale.y = 0.6;

		if (FlxG.save.data.distractions)
		{
			gamePlayState.add(white_sus);
		}

        var pillar3:FlxSprite = new FlxSprite(-733, -757).loadGraphic(Paths.image('bg/sus/reactor_resize/front_pillars', 'mods'));
		pillar3.antialiasing = true;
		pillar3.scale.y = 1.2;
		pillar3.scale.x = 1.2;
		gamePlayState.add(pillar3);

        var ball:FlxSprite = new FlxSprite(-400, -1200).loadGraphic(Paths.image('bg/sus/reactor/ball_of_big_ol_energy', 'mods'));
		ball.antialiasing = true;
		ball.scale.y = 0.6;
		ball.scale.x = 0.6;
		gamePlayState.add(ball);

        var ball:FlxSprite = new FlxSprite(-680, -1250).loadGraphic(Paths.image('bg/sus/reactor/upper_cranes', 'mods'));
		ball.antialiasing = true;
		ball.scale.y = 0.6;
		ball.scale.x = 0.6;
		gamePlayState.add(ball);

        var center_console:FlxSprite = new FlxSprite(-165, 173).loadGraphic(Paths.image('bg/sus/reactor/center_console', 'mods'));
		center_console.antialiasing = true;
		center_console.scale.y = 0.6;
		center_console.scale.x = 0.6;
		gamePlayState.add(center_console);

        var side_console:FlxSprite = new FlxSprite(-1070, 425).loadGraphic(Paths.image('bg/sus/reactor/side_console', 'mods'));
		side_console.antialiasing = true;
		side_console.scale.y = 0.6;
		side_console.scale.x = 0.6;
		gamePlayState.add(side_console);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'impostor idle00', 18, false);
		animation.addByPrefix('singUP', 'impostor up20', 24, false);
		animation.addByPrefix('singDOWN', 'impostor down00', 24, false);
		animation.addByPrefix('singLEFT', 'imposter left00', 24, false);
		animation.addByPrefix('singRIGHT', 'impostor right00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -83, -27);
		dad.addOffset("singUP", 127, 54);
		dad.addOffset("singRIGHT", -180, -40);
		dad.addOffset("singLEFT", -20, -11);
		dad.addOffset("singDOWN", -174, -49);
		dad.dance();

		dad.scale.x = 0.9;
		dad.scale.y = 0.9;
		dad.x -= 400;
		dad.y += 225;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		
		bf.x += 150;
        bf.y += 50;
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
		gamePlayState.targetCamFollow.x = bf.getMidpoint().x - 240;
		gamePlayState.targetCamFollow.y = bf.getMidpoint().y - 250;
	}

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		gamePlayState.targetCamFollow.x = bf.getMidpoint().x - 500;
		gamePlayState.targetCamFollow.y = bf.getMidpoint().y - 250;
	}

}