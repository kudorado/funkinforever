package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class AgotiCrazy extends Agoti
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/agoticrazy/Alt_Agoti_Sprites_B', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		var dumbShit = new FlxSprite(-1000, -300).makeGraphic(Std.int(FlxG.width * 3), Std.int(FlxG.height * 3), FlxColor.WHITE);
		dumbShit.scrollFactor.set(1, 1);
		dumbShit.cameras = [gameState.camGame];
		gameState.add(dumbShit);

		gameState.defaultCamZoom = 0.6;
		
		var bg:FlxSprite = new FlxSprite(-400, -200).loadGraphic(Paths.image('bg/agoti/Pillar_1', 'mods'));
		bg.antialiasing = true;

		var fx = bg.width / 2;
		bg.x -= fx;
		bg.y += -400;
		
		bg.antialiasing = true;
		bg.y += 500;
		bg.x += 650;

		bg.scrollFactor.set(0.9, 0.9);

		bg.x -= 150;
		bg.y += 0;
		gameState.add(bg);

		var bg1:FlxSprite = new FlxSprite();
		var tex1 =  Paths.getSparrowAtlas('bg/agoti/Pillar_BG_Stage', 'mods');

		bg1.frames = tex1;
		bg1.animation.addByPrefix('init', 'Pillar_BG_Stage', 15, true);
		bg1.animation.play('init');


		var fx = bg1.width / 2;
		bg1.x -= fx;
		bg1.y += -400;
		
		bg1.antialiasing = true;
		bg1.y += 500;
		bg1.x += 650;

		bg1.scale.x = 4;
		bg1.scale.y = 4;

		bg1.scrollFactor.set(0.9, 0.9);

		gameState.add(bg1);

		var stageFront:FlxSprite = new FlxSprite(0, 0);

		var tex2 =  Paths.getSparrowAtlas('bg/agoti/LoudSpeaker_Moving', 'mods');
		stageFront.frames = tex2;

		stageFront.animation.addByPrefix('init', 'StereoMoving', 15, true);
		stageFront.animation.play('init');
		stageFront.x -= 100;
		stageFront.y += 950;
		
		stageFront.scale.x = 2;
		stageFront.scale.y = 2;
		stageFront.scrollFactor.set(0.9, 0.9);

		gameState.add(stageFront);


	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Angry_Agoti_Idle', 24, false);
		animation.addByPrefix('singUP', 'Angry_Agoti_Up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Angry_Agoti_Right0', 24, false);
		animation.addByPrefix('singLEFT', 'Angry_Agoti_Left0', 24, false);
		animation.addByPrefix('singDOWN', 'Angry_Agoti_Down0', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
	
		dad.addOffset('idle',0, 0);
		dad.addOffset('singUP', 40, 0);
		dad.addOffset('singRIGHT', 120, 0);
		dad.addOffset('singLEFT', 40, 0);
		dad.addOffset('singDOWN', 0, 0);

		dad.dance();
		dad.scale.x = 2;
		dad.scale.y = 2;
		dad.y += 160;
		
	}

	override function getGFVersion()
	{
		return new GFAgotiCrazy(400, 0);
	}

	override function createDad()
	{
        dad = new Dad(0, 125);
		getDadTex();
		createDadAnimations();
		createDadAnimationOffsets();
		dad.dance();

    }

	override function createCharacters()
	{
		super.createCharacters();
		gf.y -= 200;
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [52, 53], 0, false, false);
		icon.animation.play("dad");
	}

}