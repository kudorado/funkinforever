package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Nonsense extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc_updated/nonsense/nonsense', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		gameState.defaultCamZoom = 0.6;
		var bg:FlxSprite = new FlxSprite(-800, 0).loadGraphic(Paths.image('bg/nonsense/Outside', 'mods'));
		bg.antialiasing = true;

		bg.scale.x = 1;
		bg.scale.y = 1;

		bg.scrollFactor.set(0.95, 0.95);
		bg.active = false;
		gameState.add(bg);

		var stageFront:FlxSprite = new FlxSprite(-1000, -475).loadGraphic(Paths.image('bg/nonsense/BACKGROUND', 'mods'));
		
		stageFront.scale.x = 1;
		stageFront.scale.y = 1;

		stageFront.updateHitbox();
		stageFront.antialiasing = true;
		stageFront.scrollFactor.set(0.95, 0.95);
		stageFront.active = false;
		gameState.add(stageFront);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Idle0', 18, false);
		animation.addByPrefix('singUP', 'NoteUp0', 24, false);
		animation.addByPrefix('singRIGHT', 'NoteRight0', 24, false);
		animation.addByPrefix('singLEFT', 'NoteLeft0', 24, false);
		animation.addByPrefix('singDOWN', 'NoteDown0', 24, false);
		animation.addByPrefix('ohno', 'Oh no0', 12, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{

		dad.addOffset('idle');
		dad.addOffset("singUP", 22, 10);
		dad.addOffset("singRIGHT", 25, -12);
		dad.addOffset("singLEFT", 8, -20);
		dad.addOffset("singDOWN", 0, -54);

		dad.dance();

	}

	override function createBF()
	{
		super.createBF();
		bf.x += 125;
		bf.y -= 25;
	}

	override function createGF()
	{
		super.createGF();
		gf.x -= 100;
		gf.y -= 75;
	}

	override function createDad()
	{
        dad = new Dad(0, 125);
		getDadTex();
		createDadAnimations();
		createDadAnimationOffsets();

		dad.y += 50;
		dad.x -= 50;
		dad.scrollFactor.set(0.95, 0.95);
    }

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid2'), true, 150, 150);
		icon.animation.add('dad', [4, 5], 0, false, false);
		icon.animation.play("dad");
	}

}