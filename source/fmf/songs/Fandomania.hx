package fmf.songs;
import reactor.*;
import ui.*;
import fmf.characters.*;

import state.*;
import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;

class Fandomania extends SongPlayer
{	

	override function getGFTex()
	{
		var tex = Paths.getSparrowAtlas('psychengine/week_204/images/characters/GF_assets', 'mods');
		gf.frames = tex;
	}

	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('psychengine/week_204/images/characters/Nikku_Updated', 'mods');
		dad.frames = tex;
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;

		animation.addByPrefix('idle', 'Idle0', 24, false);
		animation.addByPrefix('singUP', 'Ip0', 24, false);
		animation.addByPrefix('singRIGHT', 'Right0', 24, false);
		animation.addByPrefix('singLEFT', 'Left0', 24, false);
		animation.addByPrefix('singDOWN', 'Down0', 24, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', 0, 0);
		dad.addOffset('singUP', 0, 0);
		dad.addOffset('singRIGHT', 0, 0);
		dad.addOffset('singLEFT', 0, 0);
		dad.addOffset('singDOWN', 0, 0);
		dad.dance();
	}

	override function loadMap()
	{

		gameState.defaultCamZoom = 0.6;

		var bg:FlxSprite = new FlxSprite(-86, -96).loadGraphic(Paths.image('psychengine/week_204/images/h24/images/hallway/bg', 'mods'));
		bg.antialiasing = true;
		bg.scale.x = 1.702;
		bg.scale.y = 1.702;
		bg.scrollFactor.set(1, 1);
		gameState.add(bg);

		var stageCurtains:FlxSprite = new FlxSprite(-84, -86).loadGraphic(Paths.image('psychengine/week_204/images/h24/images/hallway/grad', 'mods'));
		stageCurtains.antialiasing = true;
		stageCurtains.scrollFactor.set(1, 1);
		stageCurtains.scale.x = 1.702;
		stageCurtains.scale.y = 1.702;
		stageCurtains.alpha = 0.25;
		gameState.frontGroup.add(stageCurtains);
		
	}



	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();

	}

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
	}


	override function createStoryBF()
	{
		changePc('bf 204');
		bf.x = 1306;
		bf.y = 702;
	}
		
	override function createDad()
	{
		super.createDad();
		dad.x = -162;
		dad.y = 98;
	}


	override function createGF()
	{
		super.createGF();
		gf.x = 224;
		gf.y = -44;
	}

	override function createBF()
	{
		super.createBF();
	}

	var sillyHotBabe:Bool = true;
	var counter:Float;
	var direction:Float = 1;

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sillyHotBabe)
		{
			dad.y += Math.sin(100) * direction;
			counter += elapsed;
			if (counter >= 2.5)
			{
				direction *= -1;
				counter = 0;
			}
		}
	}
	

}