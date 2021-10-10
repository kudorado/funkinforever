package fmf.songs;

import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class GarcelloDead extends Garcello
{
	private var smoke:FlxSprite;



	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/garcellodead/garcello_dead', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
		playState.defaultCamZoom = 0.85;

		var bg:FlxSprite = new FlxSprite(-400, -200).loadGraphic(Paths.image('bg/garcello/garStagebgAlt', 'mods'));
		bg.antialiasing = true;
		// bg.active = false;
		bg.scale.y = 1;
		bg.scale.x = 1;
		playState.add(bg);

		var stageFront:FlxSprite = new FlxSprite(-400, -400).loadGraphic(Paths.image('bg/garcello/garStagealt', 'mods'));
		stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
		stageFront.updateHitbox();
		stageFront.antialiasing = true;
		// stageFront.active = false;
		playState.add(stageFront);

		createDeadBody();
		createSmoke();
		
	}

	private function addSmoke()
	{
		playState.add(smoke);
	}

	private function createDeadBody()
	{
		var garcelloDead:FlxSprite = new FlxSprite(-150, 525).loadGraphic(Paths.image('bg/garcello/gardead', 'mods'));
		garcelloDead.setGraphicSize(Std.int(garcelloDead.width));
		garcelloDead.updateHitbox();
		garcelloDead.antialiasing = true;
		playState.add(garcelloDead);

	}

	private function createSmoke()
	{

		smoke = new FlxSprite();
		var tex =  Paths.getSparrowAtlas('bg/garcello/garSmoke', 'mods'); //.loadGraphic(Paths.image('garcello/garSmoke'));
		smoke.frames = tex;
		smoke.animation.addByPrefix('init', 'Smokey instance', 18, true);
		smoke.animation.play('init');
		smoke.y = -250;
		smoke.x = -600;

		smoke.scale.x = 4;
		smoke.scale.y = 4;

		smoke.updateHitbox();
		smoke.antialiasing = true;
	}


	override function createDadAnimations():Void
	{
		dad.animation.addByPrefix('coolGuy', 'Garcello coolguy', 15, false);
		super.createDadAnimations();
	}


	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('coolGuy',-2, -38);
		dad.addOffset('idle',-2, -38);
		dad.addOffset('singUP', -4, -38);
		dad.addOffset('singRIGHT', -10 , -43);
		dad.addOffset('singLEFT', 9, -34);
		dad.addOffset('singDOWN', -5, -29);

		dad.dance();
	}

	override function createCharacters()
	{
		super.createCharacters();
		addSmoke();
	}


	override function midSongEventUpdate(curBeat:Int)
	{
		switch (curBeat)
		{
			case 209:
				new FlxTimer().start(0.25, function(tm:FlxTimer)
				{
					playState.defaultCamZoom = 1.3;
					dad.playAnim('coolGuy', true);
					dad.lockAnim(1, function()
					{
						dad.dance();
						playState.defaultCamZoom = 0.85;

					});
				});
		}
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [28, 29], 0, false, false);
		icon.animation.play("dad");
	}

}