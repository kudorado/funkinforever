package fmf.songs;
import reactor.*;
import ui.*;

import state.*;

import fmf.songs.ExClown;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class TrickyEx extends TrickyMask
{

    override function getDadTex()
	{
		var frames = Paths.getSparrowAtlas('pc/trickyex/extiky', 'mods');
		dad.frames = frames;
	}


	override function loadMap()
	{
		gameState.defaultCamZoom = 0.8;

		var bg:FlxSprite = new FlxSprite(-400, -200).loadGraphic(Paths.image('bg/clown/fourth/bg', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 3;
		bg.scale.x = 3;
		gameState.add(bg);

		var fg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('bg/clown/fourth/daBackground', 'mods'));
		fg.antialiasing = true;
		fg.x = -900;
		fg.y = -175;
		fg.scale.y = 1;
		fg.scale.x = 1;
		gameState.add(fg);


		clown = new ExClown();
		clown.createStaticBG();

	}

	override function getGFVersion()
	{
		return new GFTricky(400, 250);
	}

	override function getGFTex()
	{
		var tex = Paths.getSparrowAtlas('gf_skins/tricky/GF_tricky', 'mods');
		gf.frames = tex;
	}

	override function createGFAnimations()
	{
		gf.animation.addByPrefix('danceRight', 'GF Ex Tricky', 24, true);
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.addOffset('danceRight', 0, 0);
		gf.playAnim('danceRight');

		gf.y += 50;
		gf.scrollFactor.set(0.95, 0.95);
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Idle', 18, false);
		animation.addByPrefix('singUP', 'Sing Up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Sing Right0', 24, false);
		animation.addByPrefix('singLEFT', 'Sing Left0', 24, false);
		animation.addByPrefix('singDOWN', 'Sing Down0', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -10, 0);
		dad.addOffset('singUP', -83, 19);
		dad.addOffset('singRIGHT', -278, 10);
		dad.addOffset('singLEFT', -124, -10);
		dad.addOffset('singDOWN', -169, -10);

		dad.dance();
		
		dad.scale.x = 1.25;
		dad.scale.y = 1.25;

		dad.x -= 500;
		dad.y += 35;
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.x -= 150;
	}

	public override function createCharacters()
	{

		createGF();
		createBF();
		createDad();


		gameState.add(gf);
		gameState.add(bf);
		

		var hole = new FlxSprite(0, 0).loadGraphic(Paths.image('bg/clown/fourth/Spawnhole_Ground_BACK', 'mods'));
		hole.antialiasing = true;
		hole.x = dad.x;
		hole.y = dad.y + 500;
		hole.scale.y = 1.5;
		hole.scale.x = 1;
		gameState.add(hole);
		gameState.add(dad);

	}

	public override function dadNoteEvent(daNote:Note)
	{
		if (FlxG.random.bool(60) && !clown.spookyRendered && !daNote.isSustainNote) // create spooky text :flushed:
		{
			clown.noteEvent(daNote, dad.x - 100, dad.y - 50);
		}

		super.dadNoteEvent(daNote);
	}


	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [58, 59], 0, false, false);
		icon.animation.play("dad");
	}

}