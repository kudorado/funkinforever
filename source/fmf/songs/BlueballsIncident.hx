package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class BlueballsIncident extends Sadness	
{
	var whiteBG:FlxSprite;

	override function getDadTex()
	{	
		var tex = Paths.getSparrowAtlas('pc/blueballs_incident/trollge', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{

		gamePlayState.defaultCamZoom = 0.9;

		var bg:FlxSprite = new FlxSprite(150, -467).loadGraphic(Paths.image('bg/blueballs_incident/incidenti/BB3', 'mods'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.9, 0.9);
		bg.scale.x = 1.204;
		bg.scale.y = 1.204;

		gamePlayState.add(bg);

		whiteBG = new FlxSprite(-50, -467).makeGraphic(FlxG.width * 2, FlxG.height * 2, FlxColor.WHITE);

		whiteBG.antialiasing = true;
		whiteBG.scrollFactor.set(0.9, 0.9);
		whiteBG.alpha = 0;



		gamePlayState.add(bg);
		gamePlayState.add(whiteBG);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'TrollgeIdle00', 18, false);
		animation.addByPrefix('singUP', 'TrollgeUp00', 24, false);
		animation.addByPrefix('singRIGHT', 'TrollgeRight00', 24, false);
		animation.addByPrefix('singLEFT', 'TrollgeLeft00', 24, false);
		animation.addByPrefix('singDOWN', 'TrollgeDown00', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', 0, 23);

		dad.addOffset('singUP', 66, 29);
		dad.addOffset('singRIGHT', -25, 20);
		dad.addOffset('singLEFT', 83, 22);
		dad.addOffset('singDOWN', 28, -39);
		dad.dance();
		dad.scale.x = 1;
		dad.scale.y = 1;
		dad.x = 400;
		dad.y = 199;
	}

	override function midSongEventUpdate(curBeat:Int)
	{
		switch (curBeat)
		{
			case 1 | 287 | 660:
				gamePlayState.camZooming = true;

				whiteBG.color = FlxColor.BLACK;
				FlxTween.tween(whiteBG, {alpha: 1}, 0.5, {});
				FlxTween.tween(bf, {alpha: 1}, 0.5, {});
				dad.alpha = 0;
				gamePlayState.defaultCamZoom = 1.1;

			case 32 | 353:
				dad.alpha = 1;
				bf.alpha = 1;
				whiteBG.alpha = 0;
				gamePlayState.defaultCamZoom = 0.9;

			case 97:
				FlxTween.tween(whiteBG, {alpha: 1}, 0.5, {});
				FlxTween.tween(dad, {alpha: 1}, 0.5, {});

				bf.alpha = 0;

			case 127:
				bf.alpha = 1;
				whiteBG.alpha = 0;
				dad.alpha = 1;
		}
	}

}
