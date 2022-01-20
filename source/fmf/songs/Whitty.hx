	package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Whitty extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/whitty/WhittySprites', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		var bg:FlxSprite = new FlxSprite(-48, -448).loadGraphic(Paths.image('bg/whitty/whittyBack', 'mods'));
		bg.antialiasing = true;
		// bg.active = false;
		bg.scale.x = 1.3;
		bg.scale.y = 1.3;
		bg.scrollFactor.set(0.9, 0.9);
		gameState.add(bg);

		var stageFront:FlxSprite = new FlxSprite(-650, 600).loadGraphic(Paths.image('bg/whitty/whittyFront', "mods"));
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
		animation.addByPrefix('idle', 'Idle', 24, false);
		animation.addByPrefix('singUP', 'Sing Up', 24, false);
		animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
		animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
		animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -63, 1);
		dad.addOffset('singUP', 13, 48);
		dad.addOffset('singRIGHT', -81, 37);
		dad.addOffset('singLEFT', -46, -20);
		dad.addOffset('singDOWN', -80, -40);

		dad.dance();

	}

	override function getGFTex():Void
	{
		var tex = Paths.getSparrowAtlas('gf_skins/whitty/GF_Standing_Sway', 'mods');
		gf.frames = tex;

	}

	override function createGFAnimations()
	{
		var animation = gf.animation;
		
		animation.addByPrefix('sad', 'Sad', 24, false);
		animation.addByPrefix('danceLeft', 'Idle Left', 24, false);
		animation.addByPrefix('danceRight', 'Idle Right', 24, false);
		animation.addByPrefix('scared', 'Scared', 24, false);
		gf.animation = animation;
	}

	override function createGFAnimationOffsets()
	{
  
		gf.addOffset('sad', -140, -153);
		gf.addOffset('danceLeft', -140, -153);
		gf.addOffset('danceRight', -140, -153);
		gf.addOffset('scared', -140, -110);

		gf.playAnim('danceRight');
		gf.dance();

		gf.x -= 150;
		gf.y -= 100;

	}

	override function createDad()
	{
        dad = new Dad(0, 125);
		getDadTex();
		createDadAnimations();
		createDadAnimationOffsets();
		dad.dance();

    }

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [40, 41], 0, false, false);
		icon.animation.play("dad");
	}

}