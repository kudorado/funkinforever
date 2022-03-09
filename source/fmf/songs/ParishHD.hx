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
		gameState.defaultCamZoom = 1;
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

			gameState.dadGroup.remove(dad);
			gameState.dadGroup.add(trail);
			gameState.dadGroup.add(dad);

			trail.visible = false;
		}
	}

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		gameState.targetCamFollow.x -= 275;
		gameState.targetCamFollow.y -= 300;
		gameState.defaultCamZoom = 0.925;


	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		gameState.targetCamFollow.x += 75;
		gameState.targetCamFollow.y -= 150;
		gameState.defaultCamZoom = 1;
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
		super.dadNoteEvent(noteData);
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
		super.bfNoteEvent(noteData);

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