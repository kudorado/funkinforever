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

class ParentEggnogHD extends SongPlayerHD
{
	var upperBoppers:FlxSprite;
	var bottomBoppers:FlxSprite;
	var santa:FlxSprite;
    var bgEscalator:FlxSprite;


	override function loadMap()
	{
		gameState.defaultCamZoom = 0.8;

		var bg:FlxSprite = new FlxSprite(-1200, -538).loadGraphic(Paths.image('bg/week_hd/week5/christmas/bgWalls', 'mods'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.2, 0.2);
		bg.active = false;
		bg.setGraphicSize(Std.int(bg.width * 0.8));
		bg.updateHitbox();
		gameState.add(bg);

		upperBoppers = new FlxSprite(-984, -465);
		upperBoppers.frames = Paths.getSparrowAtlas('bg/week_hd/week5/christmas/upperBop-eggnog', 'mods');
		upperBoppers.animation.addByPrefix('bop', "Upper Crowd Bob", 24, false);
		upperBoppers.antialiasing = true;
		upperBoppers.scrollFactor.set(0.33, 0.33);
		upperBoppers.setGraphicSize(Std.int(upperBoppers.width * 1));
		upperBoppers.updateHitbox();
		if (FlxG.save.data.distractions)
		{
			gameState.add(upperBoppers);
		}

		var bgEscalator:FlxSprite = new FlxSprite(-1045, -404);
        bgEscalator.frames = Paths.getSparrowAtlas('bg/week_hd/week5/christmas/bgEscalator-eggnog', 'mods');
        bgEscalator.animation.addByPrefix('idle', 'Esc', 24, false);
		bgEscalator.antialiasing = true;
		bgEscalator.scrollFactor.set(0.3, 0.3);
		bgEscalator.setGraphicSize(Std.int(bgEscalator.width * 1));
		gameState.add(bgEscalator);

		var tree:FlxSprite = new FlxSprite(5, -367).loadGraphic(Paths.image('bg/week_hd/week5/christmas/christmasTree', 'mods'));
		tree.antialiasing = true;
        tree.scale.x = 1.1;
        tree.scale.y = 1.1;
		tree.scrollFactor.set(0.40, 0.40);
		gameState.add(tree);

		bottomBoppers = new FlxSprite(-650, -121);
		bottomBoppers.frames = Paths.getSparrowAtlas('bg/week_hd/week5/christmas/bottomBop', 'mods');
		bottomBoppers.animation.addByPrefix('bop', 'Bottom Level Boppers', 24, false);
		bottomBoppers.antialiasing = true;
		bottomBoppers.scrollFactor.set(0.9, 0.9);
		bottomBoppers.setGraphicSize(Std.int(bottomBoppers.width * 1));
		bottomBoppers.updateHitbox();
		if (FlxG.save.data.distractions)
		{
			gameState.add(bottomBoppers);
		}

		var fgSnow:FlxSprite = new FlxSprite(-600, 680).loadGraphic(Paths.image('bg/week_hd/week5/christmas/fgSnow', 'mods'));
		fgSnow.active = false;
		fgSnow.antialiasing = true;
		fgSnow.scale.x = 2;
        fgSnow.scale.y = 3;
		gameState.add(fgSnow);

		santa = new FlxSprite(-1260, 0);
		santa.frames = Paths.getSparrowAtlas('bg/week_hd/week5/christmas/santa', 'mods');
		santa.animation.addByPrefix('idle', 'santa idle in fear', 24, false);
		santa.antialiasing = true;
		santa.flipX = false;

		santa.scale.x = 1;
		santa.scale.y = 1;

		

		if (FlxG.save.data.distractions)
		{
			gameState.add(santa);
		}
	}

	override function getDadVersion()
	{
		return new CharacterPE('parent');
	}
	private override function getVersion():Character
	{
		return new CharacterPE('bf-christmas');
	}

	override function getGFVersion()
	{
		return new CharacterPE('gf-christmas');
	}

	override function createStoryBF()
	{ 
		var newPc = new CharacterPE('bf-christmas');
		changeCharacter(newPc);
	}

	override function midSongEventUpdate(curBeat:Int):Void
	{
		if (gameState.gfStep())
		{
			switch (GameState.CURRENT_SONG)
			{
				case 'cocoa':
					cocoaMidSongEvent(curBeat);

				case 'eggnog':
					eggnogMidSongEvent(curBeat);
			}
		}

		if (FlxG.save.data.distractions)
		{
			upperBoppers.animation.play('bop', true);
			bottomBoppers.animation.play('bop', true);
			santa.animation.play('idle', true);
		}
	}

	function cocoaMidSongEvent(curBeat:Int)
	{
		if (curBeat < 170)
			if (curBeat < 65 || curBeat > 130 && curBeat < 145)
				if (curBeat % 16 == 15)
					gf.playAnimForce('cheer', 0.5);
	}

	function eggnogMidSongEvent(curBeat:Int)
	{
		if (curBeat > 10 && curBeat != 111 && curBeat < 220)
			if (curBeat % 8 == 7)
				gf.playAnimForce('cheer', 0.5);
	}

    override function updateCamFollowDad()
    {
        super.updateCamFollowDad();
        gameState.targetCamFollow.y -= 300;

    }

    override function updateCamFollowBF()
    {
        super.updateCamFollowBF();
        gameState.targetCamFollow.y -= 300;
    }

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/week_hd/icons/icon-parents', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}

}