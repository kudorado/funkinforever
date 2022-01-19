package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.tweens.FlxTween;
import flixel.effects.FlxFlicker;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class NonsenseGod extends Nonsense
{
	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/nonsensegod/nonsense_god', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
		gamePlayState.defaultCamZoom = 0.6;
		var bg:FlxSprite = new FlxSprite(-800, -375).loadGraphic(Paths.image('bg/nonsense/Outside_Space', 'mods'));
		bg.antialiasing = true;

		bg.scale.x = 1;
		bg.scale.y = 1;

		bg.scrollFactor.set(0.95, 0.95);
		bg.active = false;
		gamePlayState.add(bg);

		var hallowTex = Paths.getSparrowAtlas('bg/nonsense/BACKGROUND_space', 'mods');
		var bg1 = new FlxSprite(-300, -400);
		bg1.frames = hallowTex;
		bg1.animation.addByPrefix('idle', 'Wall Broken anim0', 18);
		bg1.animation.play('idle');
		bg1.antialiasing = true;

		bg1.scale.x = 2.25;
		bg1.scale.y = 2.25;

		bg1.x += 400;
		bg1.y += 250;

		gamePlayState.add(bg1);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Idle god0', 24, false);
		animation.addByPrefix('singUP', 'God up long note0', 24, false);
		animation.addByPrefix('singRIGHT', 'God right0', 24, false);
		animation.addByPrefix('singLEFT', 'Left god0', 24, false);
		animation.addByPrefix('singDOWN', 'God down0', 24, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle');
		dad.addOffset("singUP", -1, 1);
		dad.addOffset("singRIGHT", -1, -1);
		dad.addOffset("singLEFT", -1, -1);
		dad.addOffset("singDOWN", -1, -1);

		dad.dance();
	}

	override function createDad()
	{
		super.createDad();
		dad.y -= 200;
		dad.x -= 115;
	}


	var sillyHotBabe:Bool = true;
	var counter:Float;
	var direction:Float = 1;

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sillyHotBabe)
		{
			dad.y += Math.sin(700) * direction;
			counter += elapsed;
			if (counter >= 0.5)
			{
				direction *= -1;
				counter = 0;
			}
		}
	}


	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid2'), true, 150, 150);
		icon.animation.add('dad', [6, 7], 0, false, false);
		icon.animation.play("dad");
	}
	
}