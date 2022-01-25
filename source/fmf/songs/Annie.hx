package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Annie extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/annie/annie', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		gameState.defaultCamZoom = 0.85;
		
		var bg:FlxSprite = new FlxSprite(-400, -200).loadGraphic(Paths.image('garcello/garStagebg', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1;
		bg.scale.x = 1;
		gameState.add(bg);

		var stageFront:FlxSprite = new FlxSprite(-400, -400).loadGraphic(Paths.image('garcello/garStage', 'mods'));
		stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
		stageFront.updateHitbox();
		stageFront.antialiasing = true;
		gameState.add(stageFront);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'BF idle dance0', 24, false);
		animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
		animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
		animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
		animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
		dad.animation = animation;

		
	}

	override function getDadVersion()
	{
		return new Dad(0, 125);
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -2, -38);

		dad.addOffset('singUP', 0, -22);
		dad.addOffset('singRIGHT', 15 , -44);
		dad.addOffset('singLEFT', -94, -44);
		dad.addOffset('singDOWN', -61, -69);

		dad.flipX = true;

		dad.playAnim('idle');
		
	}

	public override function createCharacters()
	{
		super.createCharacters();
		
		bf.y += 40;

		dad.y -= 50;
		dad.x -= 200;
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [26, 27], 0, false, false);
		icon.animation.play("dad");
	}
}