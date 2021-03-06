package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class TrickyHell extends TrickyMask
{

	override function getGFTex()
	{
		var tex = Paths.getSparrowAtlas('pc_updated/gf_phase_3', 'mods');
		gf.frames = tex;
	}
	
    override function getDadTex()
	{
		var frames = Paths.getSparrowAtlas('pc/tricky/tiky', 'mods');
		dad.frames = frames;
	}

	override function loadMap()
	{
		gameState.defaultCamZoom = 0.5;
		var bg:FlxSprite = new FlxSprite(-400, -200).loadGraphic(Paths.image('bg/clown/red', 'mods'));
		bg.antialiasing = true;


		bg.scale.y = 2.5;
		bg.scale.x = 2.5;
		gameState.add(bg);
		
		var stageFront:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('bg/clown/hellclown/island_but_red', 'mods'));

		stageFront.x -= 500;
		stageFront.y = 200; 

		stageFront.scale.x = 3;
		stageFront.scale.y = 3;
		gameState.add(stageFront);

		clown = new HellClown();
		clown.createStaticBG();


	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Idle', 24, false);
		animation.addByPrefix('singUP', 'Proper Up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Proper Right0', 24, false);
		animation.addByPrefix('singLEFT', 'Proper Left0', 24, false);
		animation.addByPrefix('singDOWN', 'Proper Down0', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', 0, 0);
		dad.addOffset('singUP', 151, -253);
		dad.addOffset('singRIGHT', 30, -20);
		dad.addOffset('singLEFT', 60, 0);
		dad.addOffset('singDOWN', 70, 10);

		dad.dance();

		dad.scale.x = 4;
		dad.scale.y = 4;


		dad.x = -272;
		dad.y = 100;
	}

	override function createStoryBF()
	{
		changePc('bf tiky');
	}

	override function createBFAnimationOffsets()
	{
		bf.x += 100;
		bf.y += 50;

		super.createBFAnimationOffsets();
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [56, 57], 0, false, false);
		icon.animation.play("dad");
	}

	override function updateCamFollowDad()
	{
		gameState.targetCamFollow.y = dad.getMidpoint().y + 250;
		gameState.targetCamFollow.x = dad.getMidpoint().x;
	}

	override function dadNoteEvent(noteData:Note)
	{
		if (FlxG.random.bool(20) && !clown.spookyRendered && !noteData.isSustainNote) // create spooky text :flushed:
			clown.noteEvent(noteData, dad.x + 500, dad.y + 100);
	
		super.dadNoteEvent(noteData);
	}

	
}