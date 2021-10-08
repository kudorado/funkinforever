package fmf.songs;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import fmf.characters.*;
import Song.SwagSong;

class Trueform extends Tutorial
{

	var hole:FlxSprite;

	override function loadMap()
	{
		var dumbShit = new FlxSprite(-1000, -300).makeGraphic(Std.int(FlxG.width * 3), Std.int(FlxG.height * 3), FlxColor.BLACK);
		dumbShit.scrollFactor.set(1, 1);
		dumbShit.cameras = [playState.camGame];
		playState.add(dumbShit);
	}

	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('trueform/GF', 'mods');
		dad.frames = tex;
	}

	private override function createDadAnimations()
	{
		var animation = dad.animation;
		animation.addByPrefix('singLEFT', 'GF left note instance 1', 24, false);
		animation.addByPrefix('singRIGHT', 'GF Right Note instance 1', 24, false);
		animation.addByPrefix('singUP', 'GF Up Note instance 1', 24, false);
		animation.addByPrefix('singDOWN', 'GF Down Note instance 1', 24, false);
		animation.addByIndices('danceLeft', 'GF Dancing Beat instance 1', [6], "", 1, false);
		animation.addByIndices('danceRight', 'GF Dancing Beat instance 1', [6], "", 1, false);
		animation.addByPrefix('scared', 'ikNode_10', 24, false);
		dad.animation = animation;
	}

	// create dad animation offsets
	private override function createDadAnimationOffsets()
	{
		dad.addOffset('danceLeft', -1, -11);
		dad.addOffset('danceRight', -1, -11);

		dad.addOffset("singUP", -10, 0);
		dad.addOffset("singRIGHT", -2, -22);
		dad.addOffset("singLEFT", 0, -21);
		dad.addOffset("singDOWN", -12, -18);

		dad.addOffset('scared', -11, -23);

		dad.playAnim('danceRight');
		dad.dance();
	}


	// what character should we create
	private override function createCharacters():Void
	{
		createGF();
		createBF();
		createDad();

		gf.scrollFactor.set(0.95, 0.95);

		bf.y -= 50;

		dad.y -= 100;
		dad.x -= 100;


		hole.x = dad.getGraphicMidpoint().x - 275;
		hole.y = dad.getGraphicMidpoint().y - 100;

		hole.setGraphicSize(Std.int(hole.width * 1.25));

		playState.add(dad);
		playState.add(hole);

		dad.y -= 100;
		hole.y -= 225;

		playState.add(bf);


		gf.alpha = 0;
        dad.scrollFactor.set(0.95, 0.95);
	}




}