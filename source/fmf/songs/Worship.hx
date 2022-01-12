package fmf.songs;
import state.*;
import flixel.addons.effects.FlxTrail;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Worship extends SongPlayer	
{
	var trail:FlxTrail;
	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/sarv_dark/sarvente_dark_1', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{

		gamePlayState.defaultCamZoom = 0.75;

		var bg:FlxSprite = new FlxSprite(-200, -700).loadGraphic(Paths.image('bg/sacredmass/church1/base-dark', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1.3;
		bg.scale.x = 1.3;
		gamePlayState.add(bg);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'SarvDarkIdle00', 18, false);
		animation.addByPrefix('singUP', 'SarvDarkUp00', 24, false);
		animation.addByPrefix('singRIGHT', 'SarvDarkRight00', 24, false);
		animation.addByPrefix('singLEFT', 'SarvDarkLeft00', 24, false);
		animation.addByPrefix('singDOWN', 'SarvDarkDown00', 24, false);
		dad.animation = animation;

	}

	override function dadNoteEvent(noteData:Note)
	{
		if (FlxG.save.data.distractions)
		{
			if (gamePlayState.curBeat % 6 == 0)
			{
				if (FlxG.save.data.distractions)
				{
					trail.visible = true;
				}
			}
			else if (gamePlayState.curBeat % 16 == 0)
			{
				if (FlxG.save.data.distractions)
					trail.visible = false;
			}
		}
	}

	override function bfNoteEvent(noteData:Note)
	{
		if (FlxG.save.data.distractions)
			trail.visible = false;
	}

	private function createTrail()
	{
		if (FlxG.save.data.distractions)
		{
			trail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069);
			trail.color = FlxColor.PINK;

			gamePlayState.add(trail);
			trail.visible = false;
		}
	}
		
	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -7, 18);
		dad.addOffset("singUP", -15, 87);
		dad.addOffset("singRIGHT", -6, 29);
		dad.addOffset("singLEFT", -16, 9);
		dad.addOffset("singDOWN", -14, -41);
		dad.dance();
		
		dad.scale.x = 1;
		dad.scale.y = 1;

		dad.x -= 350;
		dad.y -= 50;

		createTrail();
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.y += 120;
		bf.x += 300;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [24, 25], 0, false, false);
		icon.animation.play("dad");
	}

}