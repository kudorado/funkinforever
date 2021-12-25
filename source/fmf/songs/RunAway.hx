package fmf.songs;

import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class RunAway extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.fromGenericXML('pc/impostorv4/black', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		playState.defaultCamZoom = 0.7;
		var bg:FlxSprite = new FlxSprite(-874, -408).loadGraphic(Paths.image('bg/impostorv4/runaway', 'mods'));
		bg.antialiasing = true;

		bg.scale.x = 1.1;
		bg.scale.y = 1.1;

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
		animation.addByPrefix('idle', 'Sus idle00', 24, false);
		animation.addByPrefix('singUP', 'iDerecha00', 24, false);
		animation.addByPrefix('singRIGHT', 'SCREAM0', 24, false);
		animation.addByPrefix('singLEFT', 'Izquierda0', 24, false);
		animation.addByPrefix('singDOWN', 'DOWN00', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
			
		dad.addOffset('idle', 0, -0);
		dad.addOffset('singUP', 0, 0);
		dad.addOffset('singRIGHT', 0, -0);
		dad.addOffset('singLEFT', 0, -0);
		dad.addOffset('singDOWN', 0, -0);

		dad.scale.x = 1;
		dad.scale.y = 1;
		dad.x = 0;
		dad.y = 87;
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

    override function updateCamFollowBF()
    {
        super.updateCamFollowBF();
        playState.targetCamFollow.y -= 100;
    }

    override function updateCamFollowDad()
    {
        super.updateCamFollowDad();
        playState.targetCamFollow.y += 350;
    }

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('health_icon/impostorv4/icons/icon-black-run', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
}