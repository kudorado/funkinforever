package fmf.songs;
import state.*;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import fmf.characters.*;
import Song.SwagSong;

class SkyMad extends SongPlayer
{
	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/skymad/sky_mad_assets', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
		super.loadMap();

		gamePlayState.defaultCamZoom = 0.9;


		var hallowTex = Paths.getSparrowAtlas('bg/sky/bg', 'mods');
		var bg = new FlxSprite(-200, -200);
		bg.frames = hallowTex;
		bg.animation.addByPrefix('idle', 'Bg_manifest0');
		bg.animation.play('idle');
		bg.antialiasing = true;

		bg.scale.x = 2.25;
		bg.scale.y = 2.25;

		bg.x += 400;

		bg.y += 300;

		gamePlayState.add(bg);
	}


	override function createDadAnimations()
	{
		super.createDadAnimations();

		dad.animation.addByPrefix('idle', 'Sky mad idle', 24, false);

		dad.animation.addByPrefix('singUP', 'Sky mad up0', 24, false);
		dad.animation.addByPrefix('singRIGHT', 'Sky mad right0', 24, false);
		dad.animation.addByPrefix('singDOWN', 'Sky mad down0', 24, false);
		dad.animation.addByPrefix('singLEFT', 'Sky mad left0', 24, false);

		dad.animation.addByPrefix('singUP-alt', 'Sky mad up0', 24, false);
		dad.animation.addByPrefix('singRIGHT-alt', 'Sky mad right0', 24, false);
		dad.animation.addByPrefix('singDOWN-alt', 'Sky mad down0', 24, false);
		dad.animation.addByPrefix('singLEFT-alt', 'Sky mad left0', 24, false);
	}

	override function createDadAnimationOffsets()
	{
		super.createDadAnimationOffsets();
		dad.addOffset('idle', 0, 0);

		dad.addOffset("singUP", 0, 0);
		dad.addOffset("singRIGHT", 0, 0);
		dad.addOffset("singLEFT", 0, 0);
		dad.addOffset("singDOWN", 0, 0);

		dad.addOffset("singUP-alt", 0, 0);
		dad.addOffset("singRIGHT-alt", 0, 0);
		dad.addOffset("singLEFT-alt", 0, 0);
		dad.addOffset("singDOWN-alt", 0, 0);

		dad.x -= 250;
		dad.y += 85;

		dad.scale.x = 1.25;
		dad.scale.y = 1.25;
	}

	override function getGFTex()
	{
		var tex = Paths.getSparrowAtlas('gf_skins/manifest/gf', "mods");
		gf.frames = tex;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.x -= 175;
		gf.y -= 200;
	}

	override function createGFAnimations()
	{
		gf.animation.addByPrefix("idle", 'GF idle0');
		gf.animation.addByPrefix('sad', 'GF miss0');
	}

	override function getGFVersion():Character
	{
		return new GFIdle();
	}

	override function createBF()
	{
		super.createBF();

		bf.x += 200;
		bf.y += 25;
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid2'), true, 150, 150);
		icon.animation.add('dad', [2, 3], 0, false, false);
		icon.animation.play("dad");
	}

}