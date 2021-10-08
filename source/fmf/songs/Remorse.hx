package fmf.songs;

import flixel.animation.FlxAnimationController;
import flixel.graphics.atlas.FlxAtlas;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Remorse extends Whitty
{	

	var bgRemorse:FlxSprite;
	var gfRemorse:FlxSprite;
	var dadRemorse:FlxSprite;

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('whitty/remorse/updike_assets', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		var bg:FlxSprite = new FlxSprite(-600, -448).loadGraphic(Paths.image('whitty/remorse/wall', 'mods'));
		bg.antialiasing = true;
		bg.scale.x = 1;
		bg.scale.y = 1;
		bg.scrollFactor.set(0.9, 0.9);
		playState.add(bg);

		bgRemorse = new FlxSprite(-600, -448).loadGraphic(Paths.image('whitty/remorse/wall-dark', 'mods'));
		bgRemorse.antialiasing = true;
		bgRemorse.scale.x = 1;
		bgRemorse.scale.y = 1;
		bgRemorse.scrollFactor.set(0.9, 0.9);
		bgRemorse.alpha = 0;
		playState.add(bgRemorse);


	}


	private function turnDadRemorse()
	{
		dad.animation.addByPrefix('idle', 'updingdong idle edgy', 24, false);
		dad.animation.addByPrefix('singUP', 'updingdong up note edgy', 24, false);
		dad.animation.addByPrefix('singRIGHT', 'updingdong right note edgy', 24, false);
		dad.animation.addByPrefix('singLEFT', 'updingdong left note edgy', 24, false);
		dad.animation.addByPrefix('singDOWN', 'updingdong down note edgy', 24, false);

		dad.dance();
	}

	private function turnBGNormal()
	{
		bgRemorse.destroy();
	}

	private function turnBGRemorse()
	{
		bgRemorse.alpha = 1;
	}

	private function turnGFRemorse()
	{
		gf.animation.addByPrefix('danceLeft', 'GF Dancing Beat edgy', 24, false);
		gf.animation.addByPrefix('danceRight', 'GF Dancing Beat edgy', 24, false);
	}

	private function turnDadNormal()
	{
		dad.animation.addByPrefix('idle', 'updingdong idle0', 24, false);
		dad.animation.addByPrefix('singUP', 'updingdong up note0', 24, false);
		dad.animation.addByPrefix('singRIGHT', 'updingdong right note0', 24, false);
		dad.animation.addByPrefix('singLEFT', 'updingdong left note0', 24, false);
		dad.animation.addByPrefix('singDOWN', 'updingdong down note0', 24, false);
		dad.dance();

	}

	private function turnGFNormal()
	{
		gf.animation.addByPrefix('sad', 'Sad', 24, false);
		gf.animation.addByPrefix('danceLeft', 'GF Dancing Beat 0', 24, false);
		gf.animation.addByPrefix('danceRight', 'GF Dancing Beat 0', 24, false);

		gf.dance();
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;

		animation.addByPrefix('idle', 'updingdong idle0', 24, false);
		animation.addByPrefix('singUP', 'updingdong up note0', 24, false);
		animation.addByPrefix('singRIGHT', 'updingdong right note0', 24, false);
		animation.addByPrefix('singLEFT', 'updingdong left note0', 24, false);
		animation.addByPrefix('singDOWN', 'updingdong down note0', 24, false);

	
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -69, 6);
		dad.addOffset('singUP', -69, 5);
		dad.addOffset('singRIGHT', -69, 4);
		dad.addOffset('singLEFT', -71, 5);
		dad.addOffset('singDOWN', -68, -6);

		dad.dance();

	}

	override function getGFTex():Void
	{
		var tex = Paths.getSparrowAtlas('whitty/remorse/gf_but_spicy', 'mods');
		gf.frames = tex;

	}

	override function createGFAnimations()
	{
		var animation = gf.animation;
		animation.addByPrefix('sad', 'Sad', 24, false);
		animation.addByPrefix('danceLeft', 'GF Dancing Beat 0', 24, false);
		animation.addByPrefix('danceRight', 'GF Dancing Beat 0', 24, false);
		gf.animation = animation;
	}

	override function createGFAnimationOffsets()
	{
  
		gf.addOffset('sad', -140, -153);
		gf.addOffset('danceLeft', -140, -153);
		gf.addOffset('danceRight', -140, -153);

		gf.playAnim('danceRight');
		gf.dance();

		gf.x -= 150;
		gf.y -= 100;

	}

	override function midSongEventUpdate(curBeat:Int)
	{
		switch (curBeat)
		{
			case 224:
				turnDadRemorse();
				turnGFRemorse();
				turnBGRemorse();
			case 256:
				turnDadNormal();
				turnGFNormal();
				turnBGNormal();
		}
	}
	
	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('whitty/remorse/updike_icons', 'mods'), true, 172, 126);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}

}