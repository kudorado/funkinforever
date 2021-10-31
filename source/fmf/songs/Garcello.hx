package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Garcello extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/garcello/garcello', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		playState.defaultCamZoom = 0.85;
		
		var bg:FlxSprite = new FlxSprite(-400, -200).loadGraphic(Paths.image('bg/garcello/garStagebg', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1;
		bg.scale.x = 1;
		playState.add(bg);

		var stageFront:FlxSprite = new FlxSprite(-400, -400).loadGraphic(Paths.image('bg/garcello/garStage', 'mods'));
		stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
		stageFront.updateHitbox();
		stageFront.antialiasing = true;
		playState.add(stageFront);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Garcello idle dance0', 24, false);
		animation.addByPrefix('singUP', 'Garcello Sing Note UP0', 24, false);
		animation.addByPrefix('singRIGHT', 'Garcello Sing Note RIGHT0', 24, false);
		animation.addByPrefix('singLEFT', 'Garcello Sing Note LEFT0', 24, false);
		animation.addByPrefix('singDOWN', 'Garcello Sing Note DOWN0', 24, false);
		dad.animation = animation;
	}

	override function getDadVersion():Character
	{
		return new Dad(0, 125);
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle',-2, -38);
		dad.addOffset('singUP', -4, -38);
		dad.addOffset('singRIGHT', -10 , -38);
		dad.addOffset('singLEFT',33, -41);
		dad.addOffset('singDOWN', -11, -42);
		dad.dance();
	}

	public override function createCharacters()
	{
		super.createCharacters();
		
		bf.y += 40;

		dad.y -= 50;
		dad.x -= 200;
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [26, 27], 0, false, false);
		icon.animation.play("dad");
	}
}