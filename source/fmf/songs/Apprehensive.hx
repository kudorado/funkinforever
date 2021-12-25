package fmf.songs;

import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Apprehensive extends SongPlayer
{

    override function getGFTex() {
        var tex = Paths.getSparrowAtlas('gf_skins/impostorv4/gfCar', 'mods');
		gf.frames = tex;
    }

    override function createGFAnimations()
    {
        gf.animation.addByPrefix("idle", "GF Dancing Beat Hair blowing CAR0", 24, true);
    }

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/impostorv4/white', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		playState.defaultCamZoom = 0.7;
		var bg:FlxSprite = new FlxSprite(-596, -88).loadGraphic(Paths.image('bg/impostorv4/stageback', 'mods'));
		bg.antialiasing = true;

		bg.scale.x = 1;
		bg.scale.y = 1;

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
		animation.addByPrefix('idle', 'impostor idle00', 24, true);
		animation.addByPrefix('singUP', 'impostor up200', 24, false);
		animation.addByPrefix('singRIGHT', 'impostor right00', 24, false);
		animation.addByPrefix('singLEFT', 'imposter left00', 24, false);
		animation.addByPrefix('singDOWN', 'impostor down00', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
			
		dad.addOffset('idle', 0, 0);
		dad.addOffset('singUP', -38, 54);
		dad.addOffset('singRIGHT', -117, 1);
		dad.addOffset('singLEFT', -36, -11);
		dad.addOffset('singDOWN', -10, -30);

		dad.scale.x = 1;
		dad.scale.y = 1;
		dad.x = 39;
		dad.y = 561;
		dad.dance();

	}
	
    override function createBF()
    {
        super.createBF();
        bf.y += 110;
        bf.x += 120;
    }

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
        gf.playAnim('idle');
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('health_icon/impostorv4/icons/icon-white', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
}