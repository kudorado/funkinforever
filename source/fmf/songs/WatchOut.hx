package fmf.songs;

import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class WatchOut extends SongPlayer
{

    override function getGFTex() {
        var tex = Paths.getSparrowAtlas('gf_skin/impostorV4/gfCar', 'mods');
		dad.frames = tex;
    }

    override function createGFAnimations()
    {
        gf.animation.addByPrefix("idle", "GF Dancing Beat Hair blowing CAR0", 24, true);
    }
    
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/impostorV4/yellow', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		playState.defaultCamZoom = 0.7;
		var bg:FlxSprite = new FlxSprite(-451, -234).loadGraphic(Paths.image('bg/impostorV4/airship', 'mods'));
		bg.antialiasing = true;

		bg.scale.x = 1.35;
		bg.scale.y = 1.35;

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
		animation.addByPrefix('idle', 'impostor idle00', 24, false);
		animation.addByPrefix('singUP', 'impostor up200', 24, false);
		animation.addByPrefix('singRIGHT', 'impostor right00', 24, false);
		animation.addByPrefix('singLEFT', 'imposter left00', 24, false);
		animation.addByPrefix('singDOWN', 'impostor down00', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
			
		dad.addOffset('idle', 0, 0);
		dad.addOffset('singUP', 0, 0);
		dad.addOffset('singRIGHT', 0, 0);
		dad.addOffset('singLEFT', 0, 0);
		dad.addOffset('singDOWN', 0, 0);

		dad.scale.x = 1;
		dad.scale.y = 1;
		dad.x = -57;
		dad.y = 266;
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
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('health_icon/impostorV4/icons/icon-yellow', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
}