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

class BreakingPointHD extends SongPlayerHD
{
	override function loadMap()
	{
		gameState.defaultCamZoom = 0.8;

        var bg = new FlxSprite(-1421, -895);
		bg.frames = Paths.getSparrowAtlas('bg/week_hd/weekdate/date_night', 'mods');
		bg.animation.addByPrefix('idle', 'MarblePawns', 18, false);
		bg.antialiasing = true;
		// bg.scrollFactor.set(0.9, 0.9);
		bg.setGraphicSize(Std.int(bg.width * 2));
		bg.updateHitbox();
		if (FlxG.save.data.distractions)
		{
			gameState.add(bg);
		}
	}

	// override function getDadVersion()
	// {
	// 	return new CharacterPE('monster-christmas');
	// }
	private override function getVersion():Character
	{
		return new CharacterPE('bf-date');
	}

    override  function createDad(){
        super.createDad();
        dad.visible = false;
    }

	override function getGFVersion()
	{
		return new CharacterPE('gf-date');
	}

	override function createStoryBF()
	{ 
		var newPc = new CharacterPE('bf-date');
		changeCharacter(newPc);
	}

    override function updateCamFollowDad()
    {
        super.updateCamFollowDad();
        gameState.targetCamFollow.y += 200;
        gameState.targetCamFollow.x += 250;
    }

    override function updateCamFollowBF()
    {
        super.updateCamFollowBF();
        gameState.targetCamFollow.y -= 300;
        gameState.targetCamFollow.x -= 150;
    }

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [17, 18], 0, false, false);
		icon.animation.play("dad");
	}

}