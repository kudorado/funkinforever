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

class PurpleSpecimens extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/impostor_v4/crewmate_Purple', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		gamePlayState.defaultCamZoom = 0.7;
		var bg:FlxSprite = new FlxSprite(-54, -136).loadGraphic(Paths.image('bg/impostor_v4/halloween_bg_low', 'mods'));
		bg.antialiasing = true;

		bg.scale.x = 1.1;
		bg.scale.y = 1.1;

		bg.scrollFactor.set(0.95, 0.95);
		gamePlayState.add(bg);
	}

    override function getDefaultSkin():Skin
    {
        return new AgotiSkin();
    }

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'impostor idle00', 24, false);
		animation.addByPrefix('singUP', 'impostor up20', 24, false);
		animation.addByPrefix('singRIGHT', 'impostor right00', 24, false);
		animation.addByPrefix('singLEFT', 'imposter left00', 24, false);
		animation.addByPrefix('singDOWN', 'impostor down00', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
			
		dad.addOffset('idle', 160, -107);
		dad.addOffset('singUP', 294, 0);
		dad.addOffset('singRIGHT', 210, -113);
		dad.addOffset('singLEFT', 400, -98);
		dad.addOffset('singDOWN', 280, -124);

		dad.scale.x = 1;
		dad.scale.y = 1;
		dad.x = 306;
		dad.y = 385;
		dad.dance();

	}
	
    override function createBF()
    {
        super.createBF();
        bf.y += 50;
        bf.x += 200;
    }

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
        gf.visible = false;
	}

    override function updateCamFollowBF()
    {
        super.updateCamFollowBF();
        gamePlayState.targetCamFollow.y -= 80;
		gamePlayState.targetCamFollow.x += 100;
    }

    override function updateCamFollowDad()
    {
        super.updateCamFollowDad();
        gamePlayState.targetCamFollow.y -= 50;
		gamePlayState.targetCamFollow.x -= 60;
    }

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/impostor_v4/icons/icon-crewmatePurple', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
}