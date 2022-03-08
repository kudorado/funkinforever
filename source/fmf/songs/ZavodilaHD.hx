package fmf.songs;
import fmf.songs.SongPlayerHD;
import fmf.songs.ParishHD;
import fmf.songs.SongPlayerHD;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class ZavodilaHD extends SongPlayerHD	
{

	override function getDadVersion()
	{
		return new CharacterPE('ruv');		
	}

	override function dadNoteEvent(noteData:Note)
	{
		gameState.shakeNormal();
		GameState.songPlayer.gf.playAnimForce("scared", 0.5);
	}

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		gameState.targetCamFollow.x -= 275;
		gameState.targetCamFollow.y -= 300;
		gameState.defaultCamZoom = 0.95;
	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowDad();
		gameState.targetCamFollow.x += 75;
		gameState.targetCamFollow.y -= 150;
		gameState.defaultCamZoom = 1;
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [30, 31], 0, false, false);
		icon.animation.play("dad");
	}
	

}