package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class BabJumpIn extends SongPlayer	
{

	var bgAnim:FlxSprite;
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/bab/bobEX/bobEX', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{

		playState.defaultCamZoom = 0.75;

		var bg1:FlxSprite = new FlxSprite(-200, -300).loadGraphic(Paths.image('bg/bab/day/BG1', 'mods'));
		bg1.antialiasing = true;
		bg1.scale.y = 1.2;
		bg1.scale.x = 1.2;
		playState.add(bg1);

		bgAnim = new FlxSprite(-200, -140);
		bgAnim.frames = Paths.getSparrowAtlas('bg/bab/day/ex_crowd', 'mods');
		bgAnim.animation.addByPrefix('idle', 'bobidlebig instance 100', 24, true);
		bgAnim.animation.play('idle');
		bgAnim.antialiasing = true;
		bgAnim.scrollFactor.set(0.9, 0.9);

		bgAnim.scale.x = 1.1;
		bgAnim.scale.y = 1.1;

		bgAnim.y += 100;

		if (FlxG.save.data.distractions)
		{
			playState.add(bgAnim);
		}

		var bg:FlxSprite = new FlxSprite(-600, -300).loadGraphic(Paths.image('bg/bab/day/BG3', 'mods'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.9,0.9);
		bg.scale.y = 1;
		bg.scale.x = 1;
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
		dad.addOffset('idle', -7, 1);
		dad.addOffset("singUP", -15, 37);
		dad.addOffset("singRIGHT", -6, -27);
		dad.addOffset("singLEFT", -16, -6);
		dad.addOffset("singDOWN", -14, -67);
		dad.dance();

		dad.scale.x = 1;
		dad.scale.y = 1;

		dad.x -= 350;
		
		//dad.flipX = true;
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.y += 80;
		bf.x += 300;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('bg/bab/icons/bobex','mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}

}