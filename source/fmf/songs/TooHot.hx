package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class TooHot extends SongPlayer
{

	override function getDadVersion()
	{
		return new CharacterPE("darnelltest");
	}

	override function getGFVersion()
	{
		return new CharacterPE("nene");
	}
    
	override function createStoryBF()
	{
        changePc('pico');
        bf.x = 738;
		bf.y = 382;
    }


	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		gameState.targetCamFollow.x -= 450;
		// gameState.targetCamFollow.y += 50;
    }

	public override function bfNoteEvent(noteData:Note):Void
	{
		super.bfNoteEvent(noteData);
		gameState.lightOff("5");
	}
    

	public override function dadNoteEvent(noteData:Note):Void
	{
		super.dadNoteEvent(noteData);
        gameState.lightOn("5");
	}

        

	override function loadLua()
	{
        //it auto load from SONG.stage file, no need autoload by rice babe
		// get event
		// var flash = SongPlayer.luaFolder + "custom_events/flash.lua";
		// var changeBG = SongPlayer.luaFolder + "custom_events/bg.lua";
		// GameState.createLuas([flash, changeBG]);
	}

    override function loadMap()
    {
        // gameState.defaultCamZoom = 1;
        // var happy = SongPlayer.luaFolder + "stages/happy.lua";

		// GameState.createLua(happy);
        gameState.blammedLightDuration = 0.25;
    }

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/icon_darnell', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
		

}