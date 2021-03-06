package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Zavodila extends SongPlayer	
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/sarv/sarv', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{

		gameState.defaultCamZoom = 0.75;

		var bg:FlxSprite = new FlxSprite(-400, -300).loadGraphic(Paths.image('bg/bob/happysky', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 2;
		bg.scale.x = 2;
		gameState.add(bg);


		var stageFront:FlxSprite = new FlxSprite(-650, -600).loadGraphic(Paths.image('bg/bob/nothappy_ground', 'mods'));
		stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
		stageFront.updateHitbox();
		stageFront.antialiasing = true;
		stageFront.scrollFactor.set(0.9, 0.9);
		stageFront.active = false;
		gameState.add(stageFront);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'BF idle dance00', 18, false);
		animation.addByPrefix('singUP', 'BF NOTE UP00', 24, false);
		animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT00', 24, false);
		animation.addByPrefix('singLEFT', 'BF NOTE LEFT00', 24, false);
		animation.addByPrefix('singDOWN', 'BF NOTE DOWN00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -7, -2);
		dad.addOffset("singUP", -15, 4);
		dad.addOffset("singRIGHT", -6, -1);
		dad.addOffset("singLEFT", -16, -3);
		dad.addOffset("singDOWN", -14, -8);
		dad.dance();


		dad.scale.x = 0.75;
		dad.scale.y = 0.75;

		dad.x -= 300;
		dad.y += 0;
	
	}
	
	override function dadNoteEvent(noteData:Note)
	{
		gameState.shakeNormal();
		GameState.songPlayer.gf.playAnimForce("scared", 0.5);
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.y -= 150;
		bf.x += 300;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.y -= 150;
	}

	override function updateCamFollowBF()
	{
		gameState.targetCamFollow.y = bf.getGraphicMidpoint().y - 200;
		gameState.targetCamFollow.x = bf.getGraphicMidpoint().x - 250;

	}

	override function updateCamFollowDad()
	{

		gameState.targetCamFollow.y = dad.getGraphicMidpoint().y - 200;
		gameState.targetCamFollow.x = dad.getGraphicMidpoint().x + 350;

	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}

}