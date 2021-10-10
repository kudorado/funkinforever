package fmf.songs;

import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Ballistic extends Whitty
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/whittycrazy/WhittyCrazy', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		playState.defaultCamZoom = 0.9;
		var bgTex =  Paths.getSparrowAtlas('bg/whitty/BallisticBackground', 'mods'); //Paths.getSparrowAtlas('BallisticBackground','week_whitty');
	
		var nwBg:FlxSprite = new FlxSprite(-48, 100);

		nwBg.frames = bgTex;
		nwBg.animation.addByPrefix('start', 'Background Whitty Startup0');
		nwBg.animation.addByPrefix('gameButMove', 'Background Whitty Moving', 16, true);

		nwBg.animation.play('start', false, false, 0);
		nwBg.animation.play("gameButMove");

		nwBg.scale.x = 3.5;
		nwBg.scale.y = 3.5;
		nwBg.scrollFactor.set(0.9, 0.9);

		playState.add(nwBg);


		var stageFront:FlxSprite = new FlxSprite(-650, 600).loadGraphic(Paths.image('bg/whitty/whittyFront', "mods"));
		stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
		stageFront.updateHitbox();
		stageFront.antialiasing = true;
		stageFront.scrollFactor.set(0.9, 0.9);
		stageFront.active = false;
		playState.add(stageFront);

	}

	override function getGFVersion():Character
	{
		return new GFWhitty(375, 275);
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Whitty idle dance', 24, false);
		animation.addByPrefix('singUP', 'Whitty Sing Note UP', 24, false);
		animation.addByPrefix('singRIGHT', 'whitty sing note right', 24, false);
		animation.addByPrefix('singLEFT', 'Whitty Sing Note LEFT', 24, false);
		animation.addByPrefix('singDOWN', 'Whitty Sing Note DOWN', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -14, 68);
		dad.addOffset("singUP", 10, 166);
		dad.addOffset("singRIGHT", 150, -25);
		dad.addOffset("singLEFT", 90, 85);
		dad.addOffset("singDOWN", 73, -76);

		dad.x -= 100;
		dad.dance();

	}

	override function createCharacters()
	{
		super.createCharacters();
	}


	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [42, 43], 0, false, false);
		icon.animation.play("dad");
	}

}