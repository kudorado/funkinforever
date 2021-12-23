package fmf.songs;

import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class ShotgunShell extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/entity/aldryx/ALDRYX', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		playState.defaultCamZoom = 0.5;
		playState.camFollowSpeed = 1;

		var bg:FlxSprite = new FlxSprite(-702, -113).loadGraphic(Paths.image('bg/entity/aldryx/AldryxBG', 'mods'));
		bg.antialiasing = true;

		bg.scrollFactor.set(0.95, 0.95);
		playState.add(bg);

	}

	override function getDefaultSkin():Skin
	{
		return new AgotiSkin();
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'ALDRYX_IDLE0', 24, false);
		animation.addByPrefix('singUP', 'Up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Right0', 24, false);
		animation.addByPrefix('singLEFT', 'Left0', 24, false);
		animation.addByPrefix('singDOWN', 'Down0', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
			
		dad.addOffset('idle', 0, 0);
		dad.addOffset('singUP', 118, 0);
		dad.addOffset('singRIGHT', 112, 0);
		dad.addOffset('singLEFT', 111, 0);
		dad.addOffset('singDOWN', 194, 0);

		dad.x = 64;
		dad.y = 102;
		dad.dance();

	}
	
	override function getGFTex()
	{
		var tex = Paths.getSparrowAtlas('gf_skins/aldryx/GF_B', "mods");
		gf.frames = tex;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.x = 1288;
		gf.y = 661;
	}

	override function createGFAnimations()
	{
		gf.animation.addByPrefix("idle", 'GF Dancing Beat  0');
		gf.animation.addByPrefix('sad', 'gf sad0');
	}

	override function getGFVersion():Character
	{
		return new GFIdle();
	}


	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		playState.targetCamFollow.y += 50;
		playState.defaultCamZoom = 0.55;

	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		playState.targetCamFollow.y += 225;
		playState.defaultCamZoom = 0.7;

	}

	override function createBF()
	{
		super.createBF();
		bf.x += 287;
		bf.y += 370;
	
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('bg/entity/icons/icon-niku', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 2], 0, false, false);
		icon.animation.play("dad");
	}

}