package fmf.songs;

import reactor.*;
import ui.*;
import fmf.characters.*;
import state.*;
import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class TalentlessFoxFF extends SongPlayer
{
	override function getGFTex()
	{
		var tex = Paths.getSparrowAtlas('psychengine/week_ffmix/images/characters/minusGF_ass_sets', 'mods');
		gf.frames = tex;
	}

	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('psychengine/week_ffmix/images/characters/tails', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
		gameState.defaultCamZoom = 0.75;
		var bg:FlxSprite = new FlxSprite(-600, -200).loadGraphic(Paths.image('psychengine/week_ffmix/images/chapter1/images/sky', 'mods'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.9, 0.9);
		bg.active = false;
		gameState.add(bg);

		var stageFront:FlxSprite = new FlxSprite(-650, 600).loadGraphic(Paths.image('psychengine/week_ffmix/images/chapter1/images/grass', 'mods'));
		stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
		stageFront.updateHitbox();
		stageFront.antialiasing = true;
		stageFront.scrollFactor.set(0.9, 0.9);
		stageFront.active = false;
		gameState.add(stageFront);


		var stageCurtains:FlxSprite = new FlxSprite(-500, -300).loadGraphic(Paths.image('psychengine/week_ffmix/images/chapter1/images/foreground', 'mods'));
		stageCurtains.setGraphicSize(Std.int(stageCurtains.width * 0.9));
		stageCurtains.updateHitbox();
		stageCurtains.antialiasing = true;
		stageCurtains.scrollFactor.set(1.3, 1.3);
		stageCurtains.active = false;

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;

		animation.addByPrefix('idle', 'idle0', 24, false);
		animation.addByPrefix('singUP', 'up0', 24, false);
		animation.addByPrefix('singRIGHT', 'right0', 24, false);
		animation.addByPrefix('singLEFT', 'left0', 24, false);
		animation.addByPrefix('singDOWN', 'down0', 24, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', 0, 0);
		dad.addOffset('singUP', -64	, 11);
		dad.addOffset('singRIGHT', 3, -53);
		dad.addOffset('singLEFT', -10, -11);
		dad.addOffset('singDOWN', -35, -19);
		dad.dance();
	}


	override function createStoryBF()
	{
		changePc('bf trollff');
		bf.x = 854;
		bf.y = 578;
	}


	override function createGF()
	{
		super.createGF();
		gf.x = 400;
		gf.y = 200;
	}

	override function createDad()
	{
		super.createDad();
		dad.x = 2;
		dad.y = 56;
	}

	override function createBF()
	{
		super.createBF();
	}

	override function getVersion()
	{
		return new BFTrollFF();
	}



	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/icon-tails', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}

}
