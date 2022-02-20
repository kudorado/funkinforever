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

class WatchOut extends SongPlayer
{

    override function getGFTex() {
        var tex = Paths.getSparrowAtlas('gf_skins/impostor_v4/gfCar', 'mods');
		gf.frames = tex;
    }

    override function createGFAnimations()
    {
        gf.animation.addByPrefix("idle", "GF Dancing Beat Hair blowing CAR0", 24, true);
    }
    
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/impostor_v4/yellow', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		gameState.defaultCamZoom = 0.7;
		var bg:FlxSprite = new FlxSprite(-596, -350).loadGraphic(Paths.image('bg/impostor_v4/airship', 'mods'));
		bg.antialiasing = true;

		bg.scale.x = 1.35;
		bg.scale.y = 1.35;

		bg.scrollFactor.set(0.95, 0.95);
		gameState.add(bg);
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
			
		dad.addOffset('idle', 40, 0);
		dad.addOffset('singUP', 55, 9);
		dad.addOffset('singRIGHT', 88, -18);
		dad.addOffset('singLEFT', 31, 9);
		dad.addOffset('singDOWN', 146, -27);

		dad.scale.x = 1;
		dad.scale.y = 1;
		dad.x = 131;
		dad.y = 397;
		dad.dance();

	}
	
    override function createBF()
    {
        super.createBF();
        bf.y += 110;
        bf.x += 150;
    }

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
        gf.playAnim('idle');
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/impostor_v4/icons/icon-yellow', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
}