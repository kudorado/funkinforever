package fmf.songs;

import js.html.rtc.PeerConnectionIceEvent;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class BabSplit extends SongPlayer	
{

    var bgAnim:FlxSprite;
	var bgAnim2:FlxSprite;
	var pc:FlxSprite;
	var pixcelthing:FlxSprite;

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/bab/split/amor', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{

		playState.defaultCamZoom = 0.3;

		var bg1:FlxSprite = new FlxSprite(-1200, -500).loadGraphic(Paths.image('bg/bab/night/BG1', 'mods'));
		bg1.antialiasing = true;
		bg1.scale.y = 1;
		bg1.scale.x = 1;
		
		playState.add(bg1);

		// var bg2:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('bg/bab/night/BG2', 'mods'));
		// bg2.antialiasing = true;
		// bg2.scale.y = 0.5;
		// bg2.scale.x = 0.5;
		// bg2.x = -1080;
		// bg2.y -= 540;
		// playState.add(bg2);

		// bgAnim = new FlxSprite(0, 0);
		// bgAnim.frames = Paths.getSparrowAtlas('bg/bab/night/bobsip', 'mods');
		// bgAnim.animation.addByPrefix('idle', 'mini00', 24, true);
		// bgAnim.animation.play('idle');
		// bgAnim.antialiasing = true;

		// bgAnim.scale.x = 0.5;
		// bgAnim.scale.y = 0.5;
		// bgAnim.x = 870;
		// bgAnim.y = 230;

		// bgAnim.y += 100;

		// if (FlxG.save.data.distractions)
		// {
		// 	playState.add(bgAnim);
		// }

		

		// var bg:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('bg/bab/night/BG3', 'mods'));
		// bg.antialiasing = true;
		// //bg.scrollFactor.set(0.9,0.9);
		// bg.scale.y = 0.75;
		// bg.scale.x = 0.75;
		// bg.y -= 540;
		// playState.add(bg);

		// var bg4:FlxSprite = new FlxSprite(-580, -200).loadGraphic(Paths.image('bg/bab/night/BG4', 'mods'));
		// bg4.antialiasing = true;
		// //bg4.scrollFactor.set(0.9,0.9);
		// bg4.scale.y = 0.5;
		// bg4.scale.x = 0.5;
		// playState.add(bg4);

		// pc = new FlxSprite(0, 0);
		// pc.frames = Paths.getSparrowAtlas('bg/bab/night/pc', 'mods');
		// pc.animation.addByPrefix('idle', 'bluskystv00', 24, true);
		// pc.animation.play('idle');
		// pc.antialiasing = true;

		// pc.scale.x = 0.5;
		// pc.scale.y = 0.5;
		// pc.y += 300;

		// if (FlxG.save.data.distractions)
		// {
		// 	playState.add(pc);
		// }

		// pixcelthing = new FlxSprite(0, 0);
		// pixcelthing.frames = Paths.getSparrowAtlas('bg/bab/night/pixelthing', 'mods');
		// pixcelthing.animation.addByPrefix('idle', 'pixelthing00', 24, true);
		// pixcelthing.animation.play('idle');
		// pixcelthing.antialiasing = true;

		// pixcelthing.scale.x = 0.5;
		// pixcelthing.scale.y = 0.5;
		// pixcelthing.y += 300;

		// if (FlxG.save.data.distractions)
		// {
		// 	playState.add(pixcelthing);
		// }
		
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Amor idle dance00', 24, false);
		animation.addByPrefix('singUP', 'Amor Sing Note UP00', 24, false);
		animation.addByPrefix('singDOWN', 'Amor Sing Note DOWN00', 24, false);
		animation.addByPrefix('singLEFT', 'Amor Sing Note LEFT00', 24, false);
		animation.addByPrefix('singRIGHT', 'Amor Sing Note RIGHT00', 24, false);
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

		
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.y += 80;
		bf.x -= 100;
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('bg/bab/iconGrid','mods'), true, 150, 150);
		icon.animation.add('dad', [30,32], 0, false, false);
		icon.animation.play("dad");
	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		playState.camFollow.x =0;
	}

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		playState.camFollow.x =0;
	}
}