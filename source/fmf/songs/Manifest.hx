package fmf.songs;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import fmf.characters.*;
import Song.SwagSong;

class Manifest extends Trueform
{

	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('trueform/sky/GF', 'mods');
		dad.frames = tex;
	}

	override function createDadAnimations()
	{
		super.createDadAnimations();

		dad.animation.addByPrefix('singLEFT-alt', 'GF left note instance 1', 24, false);
		dad.animation.addByPrefix('singRIGHT-alt', 'GF Right Note instance 1', 24, false);
		dad.animation.addByPrefix('singUP-alt', 'GF Up Note instance 1', 24, false);
		dad.animation.addByPrefix('singDOWN-alt', 'GF Down Note instance 1', 24, false);
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();

		dad.addOffset("singRIGHT-alt", 0, -20);
		dad.addOffset("singLEFT-alt", 0, -19);
		dad.addOffset("singDOWN-alt", 0, -20);
	}

	override function loadMap()
	{
		super.loadMap();

		playState.defaultCamZoom = 0.9;

		hole = new FlxSprite(-650, 600);
		hole.loadGraphic(Paths.image('trueform/sky/gfshit', 'mods'), true, 512, 512);
		hole.scrollFactor.set(0.9, 0.9);

		hole.animation.add('shit', getArray(5, 16), 16, true);
		hole.animation.play('shit', true);

		
		var hallowTex = Paths.getSparrowAtlas('trueform/sky/bg', 'mods');
		var bg = new FlxSprite(-200, -200);
		bg.frames = hallowTex;
		bg.animation.addByPrefix('idle', 'Bg_manifest0');
		bg.animation.play('idle');
		bg.antialiasing = true;

		bg.scale.x = 2.25;
		bg.scale.y = 2.25;

		bg.x += 400;

		bg.y += 250;

		playState.add(bg);

	}

	override function createCharacters()
	{
		super.createCharacters();

		bf.alpha = 0.5;
		dad.alpha = 0.5;
	}
}