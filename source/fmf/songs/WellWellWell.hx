package fmf.songs;
import reactor.*;
import ui.*;
import fmf.characters.*;

import state.*;
import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;

class WellWellWell extends SongPlayer
{	
	var lookAtSussyMemeGuy:Bool;
	var eduardo:CharacterPE;

	override function loadLua()
	{

	}
	override function loadMap()
	{
		gameState.defaultCamZoom = 0.66;
		eduardo = new CharacterPE('Eduardo');
		gameState.add(eduardo);
	}

	override function createBF()
	{
		super.createBF();
		bf.x += (2154-750);
		bf.y -= 25;
	}

	override function createGF()
	{
		super.createGF();
		gf.x = 1719;	
		gf.y = 145;
		gf.scale.x = 1.051;
		gf.scale.y = 1.051;

	}

	// trigger when bf note spawn
	public override function gfNoteEvent(noteData:Note):Void
	{
		super.gfNoteEvent(noteData);
		wellwellwell(noteData);
	}


	override function playAnimation(anim:String)
	{
		eduardo.playAnim(anim, true);
	}

	override function updateCamFollowDad()
	{
		if (lookAtSussyMemeGuy)
		{
			gameState.setCamFollowPosition(eduardo.getMidpoint().x + 150, eduardo.getMidpoint().y - 100);
			return;
		}

		if (gameState.curBeat > 250)
		{
			gameState.defaultCamZoom = 0.65;
		}

		super.updateCamFollowDad();
	}

	override function updateCamFollowBF()
	{
		if (lookAtSussyMemeGuy)
		{
			gameState.setCamFollowPosition(eduardo.getMidpoint().x + 150, eduardo.getMidpoint().y - 100);
			return;
		}

		if (gameState.curBeat > 250)
		{
			gameState.defaultCamZoom = 0.65;
		}

		super.updateCamFollowBF();
	}

		
	override function midSongEventUpdate(curBeat:Int)
	{
		if (curBeat >= 230 && curBeat <= 245)
		{
			lookAtSussyMemeGuy = true;
			gameState.setCamFollowPosition(eduardo.getMidpoint().x + 150, eduardo.getMidpoint().y - 100);
		}
		else
		{
			lookAtSussyMemeGuy = false;
		}
	}

	function wellwellwell(noteData:Note)
	{
		if (noteData == null)
			return;

		var lastNote = '';
		switch (noteData.noteData)
		{
			case 6 | 2:
				lastNote = "singUP";

			case 7 | 3:
				lastNote = "singRIGHT";

			case 5 | 1:
				lastNote = "singDOWN";

			case 4 | 0:
				lastNote = "singLEFT";

			default:
				lastNote = 'idle';
		}

		eduardo.playAnim(lastNote, true);
	
	}

	override function updateCamFollowGF()
	{
		gameState.setCamFollowPosition(eduardo.getMidpoint().x + 150, eduardo.getMidpoint().y - 100);
		if (gameState.curBeat > 250)
		{
			gameState.defaultCamZoom = 0.9;
		}

	}
		
	override function getDadVersion()
	{
		return new CharacterPE('edd');
	}


	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/hank/icon-edd', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}

		

  
}