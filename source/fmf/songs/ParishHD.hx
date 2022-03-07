package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.addons.effects.FlxTrail;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class ParishHD extends SongPlayerHD	
{
	var trail:FlxTrail;
	override function loadMap()
	{
		
		gameState.defaultCamZoom = 0.75;

		var bg:FlxSprite = new FlxSprite(-200, -700).loadGraphic(Paths.image('bg/sacredmass/church1/base', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1.3;
		bg.scale.x = 1.3;
		gameState.add(bg);

	}

	override function createCharacters()
	{
		super.createCharacters();
		createTrail();
	}

	private function createTrail()
	{
		if (FlxG.save.data.distractions)
		{
			trail = new FlxTrail(dad, null, 4, 24, 0.3, 0.1);
			trail.color = FlxColor.WHITE;

			gameState.add(trail);
			trail.visible = false;
		}
	}

	override function getGFVersion()
	{
		return new CharacterPE('gf-hd');
	}
	override function getDadVersion()
	{
		return new CharacterPE('sarvente_happy');
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

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [30, 31], 0, false, false);
		icon.animation.play("dad");
	}

}