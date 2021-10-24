package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class BabJumpIn extends SongPlayer	
{

	var bgAnim:FlxSprite;
	var bgAnim2:FlxSprite;
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/bab/jump-in/bob_assets', 'mods');
		dad.frames = tex;
	}

	override  function getGFTex() {
		var text = Paths.getSparrowAtlas('pc/bab/gf/bobsip_gf', 'mods');
		gf.frames = text;
	}

	override function loadMap()
	{

		playState.defaultCamZoom = 0.8;

		var bg1:FlxSprite = new FlxSprite(-1200, -500).loadGraphic(Paths.image('bg/bab/day/BG1', 'mods'));
		bg1.antialiasing = true;
		bg1.scale.y = 0.5;
		bg1.scale.x = 0.5;
		playState.add(bg1);

		var bg2:FlxSprite = new FlxSprite(-1200, -500).loadGraphic(Paths.image('bg/bab/day/BG2', 'mods'));
		bg2.antialiasing = true;
		bg2.scale.y = 0.5;
		bg2.scale.x = 0.5;
		playState.add(bg2);

		bgAnim = new FlxSprite(0, 0);
		bgAnim.frames = Paths.getSparrowAtlas('bg/bab/day/mini', 'mods');
		bgAnim.animation.addByPrefix('idle', 'mini00', 24, true);
		bgAnim.animation.play('idle');
		bgAnim.antialiasing = true;

		bgAnim.scale.x = 0.5;
		bgAnim.scale.y = 0.5;
		bgAnim.x = 870;
		bgAnim.y = 230;

		bgAnim.y += 100;

		if (FlxG.save.data.distractions)
		{
			playState.add(bgAnim);
		}

		bgAnim2 = new FlxSprite(0, 0);
		bgAnim2.frames = Paths.getSparrowAtlas('bg/bab/day/bluskystv', 'mods');
		bgAnim2.animation.addByPrefix('idle', 'bluskystv00', 24, true);
		bgAnim2.animation.play('idle');
		bgAnim2.antialiasing = true;

		bgAnim2.scale.x = 0.5;
		bgAnim2.scale.y = 0.5;
		bgAnim2.y += 300;

		if (FlxG.save.data.distractions)
		{
			playState.add(bgAnim2);
		}

		var bg:FlxSprite = new FlxSprite(-580, -200).loadGraphic(Paths.image('bg/bab/day/BG3', 'mods'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.9,0.9);
		bg.scale.y = 0.75;
		bg.scale.x = 0.75;
		playState.add(bg);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'BOB idle', 24, false);
		animation.addByPrefix('singUP', 'BOB Sing Note UP00', 24, false);
		animation.addByPrefix('singDOWN', 'BOB Sing Note DOWN00', 24, false);
		animation.addByPrefix('singLEFT', 'BOB Sing Note LEFT00', 24, false);
		animation.addByPrefix('singRIGHT', 'BOB Sing Note RIGHT00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -7, 0);
		dad.addOffset("singUP", -15, 63);
		dad.addOffset("singRIGHT", -6, 33);
		dad.addOffset("singLEFT", -16, 17);
		dad.addOffset("singDOWN", -14, 3);
		dad.dance();

		dad.scale.x = 1;
		dad.scale.y = 1;

		dad.x -= 350;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.y += 50;
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.y += 100;
		bf.x += 200;
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('bg/bab/icons/bobex','mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}

	override function updateCamFollowBF()
	{
		//playState.camFollow.y = bf.getGraphicMidpoint().y - 200;
		playState.camFollow.x = bf.getGraphicMidpoint().x - 300;

	}

	override function updateCamFollowDad()
	{

		//playState.camFollow.y = dad.getGraphicMidpoint().y - 200;
		playState.camFollow.x = dad.getGraphicMidpoint().x + 350;
	}

}