package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Diagraphephobia extends DreamOfPeace
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/eteled/eteled2_assets', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		gameState.defaultCamZoom = 0.7;
		var bg:FlxSprite = new FlxSprite(-451, -234).loadGraphic(Paths.image('bg/eteled/corruptback', 'mods'));
		bg.antialiasing = true;

		bg.scale.x = 1.35;
		bg.scale.y = 1.35;

		bg.scrollFactor.set(0.95, 0.95);
		gameState.add(bg);



	}

	function addClocks()
	{

        var bg1:FlxSprite = new FlxSprite(-1113, 65);
		bg1.frames = Paths.fromGenericXML("bg/eteled/Glitchmiibuttons", 'mods');

		bg1.animation.addByPrefix('idle', 'Stagecurtains0', 24, true);
		bg1.antialiasing = true;
		bg1.scale.y = 1.6;
		bg1.scale.x = 1.6;
		bg1.scrollFactor.set(0.95, 0.95);
		bg1.animation.play('idle');
		gameState.add(bg1);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'eteled idle dance00', 24, false);
		animation.addByPrefix('singUP', 'eteled Sing Note UP00', 24, false);
		animation.addByPrefix('singRIGHT', 'eteled Sing Note RIGHT00', 24, false);
		animation.addByPrefix('singLEFT', 'eteled Sing Note LEFT00', 24, false);
		animation.addByPrefix('singDOWN', 'eteled Sing Note DOWN00', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
			
		dad.addOffset('idle', 0, 0);
		dad.addOffset('singUP', 0, 72);
		dad.addOffset('singRIGHT', -20, -60);
		dad.addOffset('singLEFT', 234, 19);
		dad.addOffset('singDOWN', -9, -91);

		dad.scale.x = 1;
		dad.scale.y = 1;
		dad.x = -57;
		dad.y = 266;
		dad.dance();

	}

	override function createCharacters()
	{
		super.createCharacters();
		addClocks();
	}
	
	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/eteled/icons/icon-eteled2', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 2], 0, false, false);
		icon.animation.play("dad");
	}

}