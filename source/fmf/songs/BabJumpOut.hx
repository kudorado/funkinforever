package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class BabJumpOut extends SongPlayer	
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/bab/jump-out/STUPID_GLOOP_MAN', 'mods');
		dad.frames = tex;
	}

	override  function getGFTex() {
		var text = Paths.getSparrowAtlas('gf_skins/ron/GF_RON', 'mods');
		gf.frames = text;
	}

	override function loadMap()
	{

		playState.defaultCamZoom = 0.8;

		var bg1:FlxSprite = new FlxSprite(-1200, -500).loadGraphic(Paths.image('bg/bab/day/happy/happy_sky', 'mods'));
		bg1.antialiasing = true;
		bg1.scale.y = 0.5;
		bg1.scale.x = 0.5;
		//bg1.scrollFactor.set(0.9,0.9);
		
		playState.add(bg1);

		var bg2:FlxSprite = new FlxSprite(-1200, -500).loadGraphic(Paths.image('bg/bab/day/happy/happy_back', 'mods'));
		bg2.antialiasing = true;
		bg2.scale.y = 0.5;
		bg2.scale.x = 0.5;
		//bg2.scrollFactor.set(0.9,0.9);
		playState.add(bg2);

		var bg:FlxSprite = new FlxSprite(-560, -140).loadGraphic(Paths.image('bg/bab/day/happy/happy_front', 'mods'));
		bg.antialiasing = true;
		//bg.scrollFactor.set(0.9,0.9);
		bg.scale.y = 0.75;
		bg.scale.x = 0.75;
		playState.add(bg);
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'bob_idle00', 24, false);
		animation.addByPrefix('singUP', 'bob_up00', 24, false);
		animation.addByPrefix('singDOWN', 'bob_down00', 24, false);
		animation.addByPrefix('singLEFT', 'bob_left00', 24, false);
		animation.addByPrefix('singRIGHT', 'bob_right00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', 0, 0);
		dad.addOffset("singUP", 0, 0);
		dad.addOffset("singRIGHT", 0, 0);
		dad.addOffset("singLEFT", 0, 0);
		dad.addOffset("singDOWN", 0, 0);
		dad.dance();

		dad.scale.x = 1;
		dad.scale.y = 1;

		dad.x -= 350;
		dad.y += 280;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.scale.x = 1.7;
		gf.scale.y = 1.7;
		gf.y -= 180;
		gf.x -= 250;
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.y += 160;
		bf.x += 250;
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('bg/bab/gloopy','mods'), true, 150, 150);
		icon.animation.add('dad', [2, 1], 0, false, false);
		icon.animation.play("dad");
	}

	override function updateCamFollowBF()
	{
		playState.camFollow.x -=  200;
		playState.camFollow.y -= 60;
	}

	override function updateCamFollowDad()
	{
		playState.camFollow.x += 100;
		playState.camFollow.y -= 60;
	}

}