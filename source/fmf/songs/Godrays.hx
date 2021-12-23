package fmf.songs;

import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Godrays extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/solazar/solazar', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		playState.defaultCamZoom = 0.5;
		var bg:FlxSprite = new FlxSprite(-1482, -622).loadGraphic(Paths.image('bg/entity/BG_Sol_1', 'mods'));
		bg.antialiasing = true;

		bg.scale.x = 0.6;
		bg.scale.y = 0.6;

		bg.scrollFactor.set(0.5, 0.5);
		playState.add(bg);

		var bg1:FlxSprite = new FlxSprite(-547, -886).loadGraphic(Paths.image('bg/entity/BG_Sol_2', 'mods'));
		bg1.antialiasing = true;

		bg1.scale.x = 1.2;
		bg1.scale.y = 1.2;

		bg1.scrollFactor.set(0.75, 0.75);
		playState.add(bg1);

		var stageFront:FlxSprite = new FlxSprite(-867, -714).loadGraphic(Paths.image('bg/entity/BG_Sol_3', 'mods'));
		
		stageFront.scale.x = 1.063;
		stageFront.scale.y = 1.063;

		stageFront.updateHitbox();
		stageFront.antialiasing = true;
		stageFront.scrollFactor.set(0.95, 0.95);
		playState.add(stageFront);

	


	}

	function createAldryx()
	{
		var bgAnim = new FlxSprite(0, 0);
		bgAnim.frames = Paths.getSparrowAtlas('bg/entity/Aldryx_Beat_Glow', 'mods');
		bgAnim.animation.addByPrefix('idle', 'Aldryx_Bop0', 24, true);
		bgAnim.animation.play('idle');
		bgAnim.antialiasing = true;
		
		bgAnim.scale.x = 0.75;
		bgAnim.scale.y = 0.75;

		bgAnim.x = 1271;
		bgAnim.y = 210;

		playState.add(bgAnim);
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
		dad.x = -89;
		dad.y = 490;

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

	override function createCharacters()
	{
		createGF();
		createBF();
		createDad();

		gf.scrollFactor.set(0.95, 0.95);

		playState.add(gf);
		createAldryx();
		playState.add(dad);
		playState.add(bf);

		bf.characterAddedEvent();

	}

	override function createGFAnimationOffsets()
	{
		gf.playAnim('idle');
		gf.scale.x = 1.5;
		gf.scale.y = 1.5;
		gf.x = 843;
		gf.y = 580;
		
	}

	override function createDad()
	{
        dad = new Dad(0, 125);
		getDadTex();
		createDadAnimations();
		createDadAnimationOffsets();
		dad.dance();


    }

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		playState.defaultCamZoom = 0.75;
		playState.targetCamFollow.y += 500;
	}

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		playState.defaultCamZoom = 0.5;
	}

		

	override function createBF()
	{
		super.createBF();
		bf.y += 550;
		bf.x += 150;
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('bg/solazar/iconGrid', 'mods'), true, 150, 150);
		icon.animation.add('dad', [3, 5], 0, false, false);
		icon.animation.play("dad");
	}

}