package fmf.songs;
import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class BabSwing extends SongPlayer	
{
  
	var bgAnim:FlxSprite;
	var bgAnim2:FlxSprite;
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/bab/swing/bosip_assets', 'mods');
		dad.frames = tex;
	}

	override  function getGFTex() {
		var text = Paths.getSparrowAtlas('gf_skins/bab/bob_gf', 'mods');
		gf.frames = text;
	}

	override function loadMap()
	{

		gamePlayState.defaultCamZoom = 0.8;

		var bg1:FlxSprite = new FlxSprite(-1200, -500).loadGraphic(Paths.image('bg/bab/sunset/BG1', 'mods'));
		bg1.antialiasing = true;
		bg1.scale.y = 0.5;
		bg1.scale.x = 0.5;
		gamePlayState.add(bg1);

		var bg2:FlxSprite = new FlxSprite(-1200, -500).loadGraphic(Paths.image('bg/bab/sunset/BG2', 'mods'));
		bg2.antialiasing = true;
		bg2.scale.y = 0.5;
		bg2.scale.x = 0.5;
		gamePlayState.add(bg2);

		bgAnim = new FlxSprite(0, 0);
		bgAnim.frames = Paths.getSparrowAtlas('bg/bab/sunset/femboy_and_edgy', 'mods');
		bgAnim.animation.addByPrefix('idle', 'femboy00', 24, true);
		bgAnim.animation.play('idle');
		bgAnim.antialiasing = true;

		bgAnim.scale.x = 0.5;
		bgAnim.scale.y = 0.5;
		bgAnim.x = 870;
		bgAnim.y = 230;

		bgAnim.y += 120;

		if (FlxG.save.data.distractions)
		{
			gamePlayState.add(bgAnim);
		}

		bgAnim2 = new FlxSprite(0, 0);
		bgAnim2.frames = Paths.getSparrowAtlas('bg/bab/sunset/jacob', 'mods');
		bgAnim2.animation.addByPrefix('idle', 'jacob00', 24, true);
		bgAnim2.animation.play('idle');

		bgAnim2.antialiasing = true;

		bgAnim2.scale.x = 0.5;
		bgAnim2.scale.y = 0.5;
		bgAnim2.y += 300;
		bgAnim2.x += 150;

		if (FlxG.save.data.distractions)
		{
			gamePlayState.add(bgAnim2);
		}

		var bg:FlxSprite = new FlxSprite(-560, -140).loadGraphic(Paths.image('bg/bab/sunset/BG3', 'mods'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.9,0.9);
		bg.scale.y = 0.75;
		bg.scale.x = 0.75;
		gamePlayState.add(bg);

		

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Bosip idle', 24, false);
		animation.addByPrefix('singUP', 'Bosip Sing Note UP00', 24, false);
		animation.addByPrefix('singDOWN', 'Bosip Sing Note DOWN00', 24, false);
		animation.addByPrefix('singLEFT', 'Bosip Sing Note LEFT00', 24, false);
		animation.addByPrefix('singRIGHT', 'Bosip Sing Note RIGHT00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', 0, 48);
		dad.addOffset("singUP", 0, 70);
		dad.addOffset("singRIGHT", 0, 28);
		dad.addOffset("singLEFT", 0, 55);
		dad.addOffset("singDOWN", 0, 29);
		dad.dance();

		dad.scale.x = 1;
		dad.scale.y = 1;

		dad.x -= 350;
		dad.y += 50;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.y += 150;
	}

	override function createBFAnimationOffsets()
	{
		bf.y += 200;
		bf.x += 200;
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('bg/bab/iconGrid','mods'), true, 150, 150);
		icon.animation.add('dad', [30,32], 0, false, false);
		icon.animation.play("dad");
	}

	override function updateCamFollowBF()
	{
		gamePlayState.targetCamFollow.x -= 200;
		gamePlayState.targetCamFollow.y -= 100;
	}

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		gamePlayState.targetCamFollow.x += 200;
	}

}