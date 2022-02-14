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

class HighSchoolConflict extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/dokidoki/monika', 'mods');
		dad.frames = tex;
	}

	override  function getGFTex() {
		var text = Paths.getSparrowAtlas('gf_skins/gfPixel/gfPixel', 'mods');
		gf.frames = text;
	}

	override function createGFAnimations()
	{
		gf.animation.addByPrefix("dance", 'GF IDLE00', true);
		gf.playAnim("dance");
	}

	override function loadMap()
	{
		gameState.defaultCamZoom = 0.8;
		var bg:FlxSprite = new FlxSprite(300, 0).loadGraphic(Paths.image('bg/dokidoki/hightschool/weebSky', 'mods'));
		bg.antialiasing = false;

		bg.scale.x = 8;
		bg.scale.y = 8;

		bg.scrollFactor.set(0.95, 0.95);
		gameState.add(bg);


		var bg1:FlxSprite = new FlxSprite(300, 0).loadGraphic(Paths.image('bg/dokidoki/hightschool/weebStreet', 'mods'));
		bg1.antialiasing = false;

		bg1.scale.x = 8;
		bg1.scale.y = 8;

		bg1.scrollFactor.set(0.95, 0.95);
		gameState.add(bg1);

		var bg2:FlxSprite = new FlxSprite(300, 0).loadGraphic(Paths.image('bg/dokidoki/hightschool/weebSchool', 'mods'));
		bg2.antialiasing = false;

		bg2.scale.x = 8;
		bg2.scale.y = 8;

		bg2.scrollFactor.set(0.95, 0.95);
		gameState.add(bg2);
	}

    override function createDadAnimations():Void
    {
        var animation = dad.animation;
        animation.addByPrefix('idle', 'Monika Idle instance 100', 18, false);
        animation.addByPrefix('singUP', 'Monika UP NOTE instance 100', 24, false);
        animation.addByPrefix('singRIGHT', 'Monika RIGHT NOTE instance 100', 24, false);
        animation.addByPrefix('singLEFT', 'Monika LEFT NOTE instance 100', 24, false);
        animation.addByPrefix('singDOWN', 'Monika DOWN NOTE instance 100', 24, false);
        dad.animation = animation;

    }

	override function createDadAnimationOffsets():Void
	{
			
		dad.addOffset('idle',0, 28);
		dad.addOffset('singRIGHT', 0, 36);
		dad.addOffset('singDOWN', 0, 29);
		dad.addOffset('singLEFT', 0, 29);
		dad.addOffset('singUP', 0, 64);
		dad.dance();
		dad.scale.x = 6;
		dad.scale.y = 6;
		dad.x = 12;
		dad.y = 175;

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

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.scale.x = 6;
		gf.scale.y = 6;
	}

    override function updateCamFollowBF()
    {
        super.updateCamFollowBF();
        gameState.targetCamFollow.y -= 300;
    }

    override function updateCamFollowDad()
    {
        super.updateCamFollowDad();
    }

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/impostor_v4/icons/icon-black-run', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
}