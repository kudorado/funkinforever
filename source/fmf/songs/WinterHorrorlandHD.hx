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

class WinterHorrorlandHD extends SongPlayerHD
{
	override function loadMap()
	{
		gameState.defaultCamZoom = 0.8;

        var bg:FlxSprite = new FlxSprite(-400, -299).loadGraphic(Paths.image('bg/week_hd/week5/christmas/evilBG', 'mods'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.2, 0.2);
		bg.active = false;
		bg.setGraphicSize(Std.int(bg.width * 0.8));
		bg.updateHitbox();
		gameState.add(bg);

		var evilTree:FlxSprite = new FlxSprite(300, -300).loadGraphic(Paths.image('bg/week_hd/week5/christmas/evilTree', 'mods'));
		evilTree.antialiasing = true;
		evilTree.scrollFactor.set(0.2, 0.2);
		gameState.add(evilTree);

		var evilSnow:FlxSprite = new FlxSprite(-200, 610).loadGraphic(Paths.image('bg/week_hd/week5/christmas/evilSnow', 'mods'));
		evilSnow.antialiasing = true;
		evilSnow.scale.x = 2.5;
        evilSnow.scale.y = 2.5;
		gameState.add(evilSnow);
	}

	override function getDadVersion()
	{
		return new CharacterPE('monster-christmas');
	}
	private override function getVersion():Character
	{
		return new CharacterPE('bf-depressed');
	}

	override function getGFVersion()
	{
		return new CharacterPE('gf-christmas-dead');
	}

	override function createStoryBF()
	{ 
		var newPc = new CharacterPE('bf-depressed');
		changeCharacter(newPc);
	}

    override function updateCamFollowDad()
    {
        super.updateCamFollowDad();
        gameState.targetCamFollow.y -= 100;

    }

    override function updateCamFollowBF()
    {
        super.updateCamFollowBF();
        gameState.targetCamFollow.y -= 300;
    }

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [17, 18], 0, false, false);
		icon.animation.play("dad");
	}

}