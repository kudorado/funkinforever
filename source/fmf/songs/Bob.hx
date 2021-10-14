package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Bob extends SongPlayer	
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/bob/bob_asset', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{

		playState.defaultCamZoom = 0.75;

		var bg:FlxSprite = new FlxSprite(-400, -200).loadGraphic(Paths.image('bg/bob/happysky', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1.7;
		bg.scale.x = 1.7;
		playState.add(bg);


		var stageFront:FlxSprite = new FlxSprite(-500, -400).loadGraphic(Paths.image('bg/bob/happyground', 'mods'));
		stageFront.setGraphicSize(Std.int(stageFront.width * 1));
		stageFront.updateHitbox();
		stageFront.antialiasing = true;
		stageFront.scrollFactor.set(0.9, 0.9);
		stageFront.active = false;
		playState.add(stageFront);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'idle', 18, false);
		animation.addByPrefix('singUP', 'bob_UP00', 24, false);
		animation.addByPrefix('singRIGHT', 'bob_RIGHT0', 24, false);
		animation.addByPrefix('singLEFT', 'bob_LEFT0', 24, false);
		animation.addByPrefix('singDOWN', 'bob_DOWN0', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', 0, 0);
		dad.addOffset("singUP", 0, 0);
		dad.addOffset("singRIGHT", -6, -1);
		dad.addOffset("singLEFT", -16, -3);
		dad.addOffset("singDOWN", -14, -8);
		dad.dance();

		dad.x -= 300;
		dad.y += 100;
		dad.flipX = true;
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}

}