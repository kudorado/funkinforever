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
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class TalentlessFox extends SongPlayer
{
	var cameraTwn:FlxTween;
	var bg: FlxSprite;
	override function loadLua()
	{
	}

	override function loadMap()
	{	
        gameState.defaultCamZoom = 1;

		bg = new FlxSprite(0, 0);
		bg.frames = Paths.getSparrowAtlas('bg/week_hd/week2/halloween_bg', 'mods');
		
		bg.animation.addByPrefix('lightning', 'Halloweem bg lightning strike00', 18, false);
		bg.animation.addByPrefix('idle', 'Halloweem bg0000', 18, false);
		bg.animation.play('idle');
		bg.antialiasing = true;

		bg.scale.x = 3.6;
		bg.scale.y = 3.6;
		
		bg.x = 236;
		bg.y = 143;

		if (FlxG.save.data.distractions)
		{
			gameState.add(bg);
		}
	}

	override function midSongEventUpdate(curBeat:Int):Void
	{
		updateBG(curBeat);
	}

	function updateBG(curBeat:Int)
	{
		if (curBeat % 32 == 0)
		{
			bg.animation.play('lightning');
		}
	}

	function createOverlay()
	{
		var stageFront:FlxSprite = new FlxSprite(-400, 569).loadGraphic(Paths.image('bg/week_hd/week2/overlay', 'mods'));
		stageFront.antialiasing = true;
		stageFront.scale.x = 3;
		stageFront.scale.y = 3;
		gameState.add(stageFront);
	}

	override function createCharacters() {
		super.createCharacters();
		createOverlay();
	}

    private override function getVersion():Character
    {
        return new CharacterPE('bf');
    }

    override function getGFVersion()
    {
        return new CharacterPE('gf');
    }

    override function createStoryBF()
    { 
        var newPc = new CharacterPE('bf');
        changeCharacter(newPc);
    }


    override function getDadVersion()
    {
        return new CharacterPE('tails');
    }

	override function createDad()
	{
		super.createDad();
	}


	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		gameState.targetCamFollow.x -= 100;
		gameState.defaultCamZoom = 1;

		gameState.targetCamFollow.y -= 100;

		

	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		gameState.targetCamFollow.x += 100;
		gameState.defaultCamZoom = 1.35;
		gameState.targetCamFollow.y -= 200;

	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/week_hd/icons/icon-spooky', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
}
