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

class Epiphany extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/dokidoki/bigmonika/big_monikia_base', 'mods');
		dad.frames = tex;
	}

	// override  function getGFTex() {
	// 	var text = Paths.getSparrowAtlas('gf_skins/gfPixel/gfPixel', 'mods');
	// 	gf.frames = text;
	// }

	// override function createGFAnimations()
	// {
	// 	gf.animation.addByPrefix("dance", 'GF IDLE00', true);
	// 	gf.playAnim("dance");
	// }

	override function loadMap()
	{
		gameState.defaultCamZoom = 0.8;
		var bg:FlxSprite = new FlxSprite(-63, -150).loadGraphic(Paths.image('bg/dokidoki/bigmonika/Sky', 'mods'));
		bg.antialiasing = false;

		bg.scale.x = 1;
		bg.scale.y = 1;

		bg.scrollFactor.set(0.95, 0.95);
		gameState.add(bg);


		var bg1:FlxSprite = new FlxSprite(-63, -150).loadGraphic(Paths.image('bg/dokidoki/bigmonika/BG', 'mods'));
		bg1.antialiasing = false;

		bg1.scale.x = 1;
		bg1.scale.y = 1;

		bg1.scrollFactor.set(0.95, 0.95);
		gameState.add(bg1);

		var bg2:FlxSprite = new FlxSprite(-63, -81).loadGraphic(Paths.image('bg/dokidoki/bigmonika/FG', 'mods'));
		bg2.antialiasing = false;

		bg2.scale.x = 1;
		bg2.scale.y = 1;

		bg2.scrollFactor.set(0.95, 0.95);
		gameState.add(bg2);
	}

    override function createDadAnimations():Void
    {
        var animation = dad.animation;
        animation.addByPrefix('idle', 'Big Monika Idle00', 18, false);
        animation.addByPrefix('singUP', 'Big Monika Up00', 24, false);
        animation.addByPrefix('singRIGHT', 'Big Monika Right00', 24, false);
        animation.addByPrefix('singLEFT', 'Big Monika Left00', 24, false);
        animation.addByPrefix('singDOWN', 'Big Monika Down0', 24, false);
        dad.animation = animation;

    }

	override function createDadAnimationOffsets():Void
	{
			
		dad.addOffset('idle',0, 11);
		dad.addOffset('singRIGHT', 0, 9);
		dad.addOffset('singDOWN', 0, -39);
		dad.addOffset('singLEFT', 0, -5);
		dad.addOffset('singUP', 0, 25);
		dad.dance();
		dad.scale.x = 2;
		dad.scale.y = 2;
		dad.x = 372;
		dad.y = 111;

	}
	
	override function createStoryBF()
	{
		changePc('bf_pixel');
		bf.x += 150;
		bf.y -= 50;
	}

    override function createBF()
    {
        super.createBF();
        bf.x -= 20;
		bf.y -= 236;
    }

	override function createCharacters() {
		super.createCharacters();
		bf.visible = false;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.visible = false;
	}

    override function updateCamFollowBF()
    {
        //super.updateCamFollowBF();
        //gameState.targetCamFollow.y -= 300;
    }

    override function updateCamFollowDad()
    {
        super.updateCamFollowDad();
		gameState.targetCamFollow.y += 150;
    }

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/dokidoki/icon-bigmonika', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
}