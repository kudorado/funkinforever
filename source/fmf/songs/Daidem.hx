package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Daidem extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/daidem/daidem', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
		playState.defaultCamZoom = 0.7;

		var bg = new FlxSprite(-400, -200).loadGraphic(Paths.image('bg/entity_origins/Stage_LayerTop', 'mods'));
		bg.antialiasing = true;

		bg.scale.x = 1.4;
		bg.scale.y = 1.4;

		bg.scrollFactor.set(0.99, 0.99);

		playState.add(bg);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Idke', 24, false);
		animation.addByPrefix('singUP', 'Up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Right0', 24, false);
		animation.addByPrefix('singDOWN', 'Down0', 24, false);
		animation.addByPrefix('singLEFT', 'Left0', 24, false);
		dad.animation = animation;
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('bg/entity_origins/icons/icon-daidem', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
		

	override function createDadAnimationOffsets():Void
	{

		dad.addOffset('idle');
		dad.addOffset("singUP", 0, 0);
		dad.addOffset("singRIGHT", 0, 0);
		dad.addOffset("singLEFT", 0, 0);
		dad.addOffset("singDOWN", 0, 0);

		dad.dance();

		dad.scale.x = 1.25;
		dad.scale.y = 1.25;
	
	}

	override function updateCamFollowDad()
	{
		playState.camFollow.y = dad.getMidpoint().y - 100;
	}

	override function updateCamFollowBF()
	{
		playState.camFollow.y = bf.getMidpoint().y - 300;
	}

	override function createDad()
	{
		super.createDad();
		dad.x -= 725;
		dad.y -= 50;
	}

	override function createBF()
	{
		super.createBF();
		bf.x -= 25;
		bf.y += 125;
	}
	override function createGF()
	{
		super.createGF();
		gf.visible = false;
		gf.alpha = 0;
	}

}