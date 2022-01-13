package fmf.songs;
import state.*;
import flixel.addons.effects.FlxTrail;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Parish extends SongPlayer	
{
	var trail:FlxTrail;
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/sarv/sarv', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
		
		gamePlayState.defaultCamZoom = 0.75;

		var bg:FlxSprite = new FlxSprite(-200, -700).loadGraphic(Paths.image('bg/sacredmass/church1/base', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1.3;
		bg.scale.x = 1.3;
		gamePlayState.add(bg);

	}

	private function createTrail()
	{
		if (FlxG.save.data.distractions)
		{
			trail = new FlxTrail(dad, null, 4, 24, 0.3, 0.1);
			trail.color = FlxColor.WHITE;

			gamePlayState.add(trail);
			trail.visible = false;
		}
	}

	override function dadNoteEvent(noteData:Note)
	{
		if (FlxG.save.data.distractions)
		{
			if (FlxG.save.data.distractions)
			{
				trail.visible = true;
			}
		}
	}

	override function bfNoteEvent(noteData:Note)
	{
		if (FlxG.save.data.distractions)
			trail.visible = false;
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'BF idle dance00', 6, false);
		animation.addByPrefix('singUP', 'BF NOTE UP00', 24, false);
		animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT00', 24, false);
		animation.addByPrefix('singLEFT', 'BF NOTE LEFT00', 24, false);
		animation.addByPrefix('singDOWN', 'BF NOTE DOWN00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -7, -2);
		dad.addOffset("singUP", -15, 4);
		dad.addOffset("singRIGHT", -6, -1);
		dad.addOffset("singLEFT", -16, -3);
		dad.addOffset("singDOWN", -14, -8);
		dad.dance();

		dad.scale.x = 1;
		dad.scale.y = 1;

		dad.x -= 350;
		dad.y += 0;
		
		dad.flipX = true;
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
		icon.animation.add('dad', [30, 31], 0, false, false);
		icon.animation.play("dad");
	}

}