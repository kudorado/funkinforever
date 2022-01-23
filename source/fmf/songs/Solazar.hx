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

class Solazar extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/solazar/solazar', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		gameState.defaultCamZoom = 0.6;
		var bg:FlxSprite = new FlxSprite(391, -274).loadGraphic(Paths.image('bg/solazar/The_void', 'mods'));
		bg.antialiasing = true;

		bg.scale.x = 1;
		bg.scale.y = 1;

		bg.scrollFactor.set(0.1, 0.1);
		bg.active = false;
		gameState.add(bg);

		var stageFront:FlxSprite = new FlxSprite(-900, -600).loadGraphic(Paths.image('bg/solazar/Void_Front', 'mods'));
		
		stageFront.scale.x = 1.25;
		stageFront.scale.y = 1.25;

		stageFront.updateHitbox();
		stageFront.antialiasing = true;
		stageFront.scrollFactor.set(0.95, 0.95);
		stageFront.active = false;
		gameState.add(stageFront);
	}

	override function getDefaultSkin():Skin
	{
		return new AgotiSkin();
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Sol_Idle_20', 24, false);
		animation.addByPrefix('singUP', 'Sol_Up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Sol_Right0', 24, false);
		animation.addByPrefix('singLEFT', 'Sol_Left0', 24, false);
		animation.addByPrefix('singDOWN', 'Sol_Down0', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
			
		dad.addOffset('idle', 0, 0);
		dad.addOffset('singUP', 0, 0);
		dad.addOffset('singRIGHT', 0, 0);
		dad.addOffset('singLEFT', 0, 0);
		dad.addOffset('singDOWN', 0, 0);

		dad.scale.x = 1.25;
		dad.scale.y = 1.25;

		dad.dance();

	}
	
	override function getGFTex():Void
	{
		var tex = Paths.getSparrowAtlas('gf_skins/solazar/GF_solazar', 'mods');
		gf.frames = tex;
	}

	override function getGFVersion():Character
	{
		return  new GFIdle();
	}

	override function createGFAnimations()
	{
		gf.animation.addByPrefix("idle", "GF Dancing Beat0", 24, false);
	}

	override function createGFAnimationOffsets()
	{
		gf.playAnim('idle');
		gf.scale.x = 1.5;
		gf.scale.y = 1.5;
		gf.x += 650;
		gf.y += 250;	

	}

	override function createDad()
	{
        dad = new Dad(0, 125);
		getDadTex();
		createDadAnimations();
		createDadAnimationOffsets();
		dad.dance();

		dad.y += 450;

    }

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		gameState.targetCamFollow.y += 500;
	}

	override function updateCamFollowdaddy()
	{
		super.updateCamFollowdaddy();
	}
	
		
		

	override function createBF()
	{
		super.createBF();
		bf.y += 550;
		bf.x += 150;
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('bg/solazar/iconGrid', 'mods'), true, 150, 150);
		icon.animation.add('dad', [3, 5], 0, false, false);
		icon.animation.play("dad");
	}

}