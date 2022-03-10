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

class ParentHD extends SongPlayerHD
{
	var upperBoppers:FlxSprite;
	var bottomBoppers:FlxSprite;
	var santa:FlxSprite;


	override function loadMap()
	{
		gameState.defaultCamZoom = 0.80;

		var bg:FlxSprite = new FlxSprite(-1000, -500).loadGraphic(Paths.image('bg/week_hd/week5/chrismas/bgWalls', 'mods'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.2, 0.2);
		bg.active = false;
		bg.setGraphicSize(Std.int(bg.width * 0.8));
		bg.updateHitbox();
		gameState.add(bg);

		upperBoppers = new FlxSprite(-240, -90);
		upperBoppers.frames = Paths.getSparrowAtlas('bg/week_hd/week5/chrismas/upperBop', 'mods');
		upperBoppers.animation.addByPrefix('bop', "Upper Crowd Bob", 24, false);
		upperBoppers.antialiasing = true;
		upperBoppers.scrollFactor.set(0.33, 0.33);
		upperBoppers.setGraphicSize(Std.int(upperBoppers.width * 0.85));
		upperBoppers.updateHitbox();
		if (FlxG.save.data.distractions)
		{
			gameState.add(upperBoppers);
		}

		var bgEscalator:FlxSprite = new FlxSprite(-1100, -600).loadGraphic(Paths.image('bg/week_hd/week5/chrismas/bgEscalator', 'mods'));
		bgEscalator.antialiasing = true;
		bgEscalator.scrollFactor.set(0.3, 0.3);
		bgEscalator.active = false;
		bgEscalator.setGraphicSize(Std.int(bgEscalator.width * 0.9));
		bgEscalator.updateHitbox();
		gameState.add(bgEscalator);

		var tree:FlxSprite = new FlxSprite(370, -250).loadGraphic(Paths.image('bg/week_hd/week5/chrismas/christmasTree', 'mods'));
		tree.antialiasing = true;
		tree.scrollFactor.set(0.40, 0.40);
		gameState.add(tree);

		bottomBoppers = new FlxSprite(-300, 140);
		bottomBoppers.frames = Paths.getSparrowAtlas('bg/week_hd/week5/chrismas/bottomBop', 'mods');
		bottomBoppers.animation.addByPrefix('bop', 'Bottom Level Boppers', 24, false);
		bottomBoppers.antialiasing = true;
		bottomBoppers.scrollFactor.set(0.9, 0.9);
		bottomBoppers.setGraphicSize(Std.int(bottomBoppers.width * 1));
		bottomBoppers.updateHitbox();
		if (FlxG.save.data.distractions)
		{
			gameState.add(bottomBoppers);
		}

		var fgSnow:FlxSprite = new FlxSprite(-600, 700).loadGraphic(Paths.image('bg/week_hd/week5/chrismas/fgSnow', 'mods'));
		fgSnow.active = false;
		fgSnow.antialiasing = true;
		fgSnow.scale.x = 1.25;
		gameState.add(fgSnow);

		santa = new FlxSprite(1300, 150);
		santa.frames = Paths.getSparrowAtlas('bg/week_hd/week5/chrismas/santa', 'mods');
		santa.animation.addByPrefix('idle', 'santa idle in fear', 24, false);
		santa.antialiasing = true;
		santa.flipX = true;

		santa.scale.x = 0.5;
		santa.scale.y = 0.5;

		santa.y += 100;

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

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [17, 18], 0, false, false);
		icon.animation.play("dad");
	}

}