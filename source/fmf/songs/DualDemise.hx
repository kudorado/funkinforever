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

class DualDemise extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/dokidoki/Monika_Finale', 'mods');
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
		var bg:FlxSprite = new FlxSprite(209, -161).loadGraphic(Paths.image('bg/dokidoki/monika/FinaleBG_1', 'mods'));
		bg.antialiasing = false;

		bg.scale.x = 2;
		bg.scale.y = 2;

		bg.scrollFactor.set(0.95, 0.95);
		gameState.add(bg);


		var bg1:FlxSprite = new FlxSprite(209, -161).loadGraphic(Paths.image('bg/dokidoki/monika/FinaleBG_2', 'mods'));
		bg1.antialiasing = false;

		bg1.scale.x = 2;
		bg1.scale.y = 2;

		bg1.scrollFactor.set(0.95, 0.95);
		gameState.add(bg1);

		var bg2:FlxSprite = new FlxSprite(-70, -153).loadGraphic(Paths.image('bg/dokidoki/monika/FinaleFG', 'mods'));
		bg2.antialiasing = false;

		bg2.scale.x = 1.54;
		bg2.scale.y = 1.54;

		bg2.scrollFactor.set(0.95, 0.95);
		gameState.add(bg2);
	}

    override function createDadAnimations():Void
    {
        var animation = dad.animation;
        animation.addByPrefix('idle', 'MONIKA IDLE00', 18, false);
        animation.addByPrefix('singUP', 'MONIKA UP NOTE00', 24, false);
        animation.addByPrefix('singRIGHT', 'MONIKA RIGHT NOTE', 24, false);
        animation.addByPrefix('singLEFT', 'MONIKA LEFT NOTE00', 24, false);
        animation.addByPrefix('singDOWN', 'MONIKA DOWN NOTE0', 24, false);
        dad.animation = animation;

    }

	override function createDadAnimationOffsets():Void
	{
			
		dad.addOffset('idle',0, 0);
		dad.addOffset('singRIGHT', 0, 0);
		dad.addOffset('singDOWN', 0, 0);
		dad.addOffset('singLEFT', 0, 0);
		dad.addOffset('singUP', 0, 0);
		dad.dance();
		dad.scale.x = 6;
		dad.scale.y = 6;
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

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.visible = false;
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