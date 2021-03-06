	package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import MenuCharacter.CharacterSetting;
import flixel.FlxSprite;
import fmf.characters.*;

class Matt extends SongPlayer
{

	override function loadMap()
	{
		gameState.defaultCamZoom = 0.8;
		var bg:FlxSprite = new FlxSprite(-600, -200).loadGraphic(Paths.image('bg/matt/swordfight', "mods"));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.9, 0.9);
		bg.active = true;
		gameState.add(bg);
	}

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/matt/matt_assets', "mods");
		dad.frames = tex;
	}

	override function createBF()
	{
		super.createBF();
		bf.x += 848 - 700;
		bf.y += 425 - 400;
		
	}
	override function getGFTex()
	{
		var tex = Paths.getSparrowAtlas("gf_skins/matt/GF_MII_assets", "mods");
		gf.frames = tex;
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', "matt idle", 24);
		animation.addByPrefix('singUP', 'matt up note0', 24, false);
		animation.addByPrefix('singDOWN', 'matt down note0', 24, false);
		animation.addByPrefix('singLEFT', 'matt left note0', 24, false);
		animation.addByPrefix('singRIGHT', 'matt right note0', 24, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset("idle", 0, 0);
		
		dad.addOffset("singUP", -48, 15);
		dad.addOffset("singRIGHT", -6, -23);
		dad.addOffset("singLEFT", 49, -40);
		dad.addOffset("singDOWN", -59, -25);
		
		dad.dance();
	}

	override function createStoryBF()
	{
		changePc('bf boxing');
	}

	override function createCharacters()
	{
		super.createCharacters();

		dad.x = 258;
		dad.y = 352;
		
		gf.y -= 200;

	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('bg/matt/iconGrid', "mods"), true, 150, 132);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
}