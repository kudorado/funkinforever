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

class DoubleTrouble extends SongPlayer
{

    

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/impostor_v4/impostors', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		gamePlayState.defaultCamZoom = 0.7;
		var bg:FlxSprite = new FlxSprite(-1244, -510).loadGraphic(Paths.image('bg/impostor_v4/bgWalls', 'mods'));
		bg.antialiasing = true;

		bg.scale.x = 1;
		bg.scale.y = 1;

		bg.scrollFactor.set(0.8, 0.8);
		gamePlayState.add(bg);

		var bg2:FlxSprite = new FlxSprite(-306, 206).loadGraphic(Paths.image('bg/impostor_v4/bottomBop', 'mods'));
		bg2.antialiasing = true;

		bg2.scale.x = 1;
		bg2.scale.y = 1;

		//bg2.scrollFactor.set(0.95, 0.95);
		gamePlayState.add(bg2);
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
			
		dad.addOffset('idle', 70, -47);
		dad.addOffset('singUP', 104, -0);
		dad.addOffset('singRIGHT', 0, -53);
		dad.addOffset('singLEFT', 210, -58);
		dad.addOffset('singDOWN', 90, -4);

		dad.scale.x = 1;
		dad.scale.y = 1;
		dad.x = -57;
		dad.y = 490;
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

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/impostor_v4/icons/icon-impostors', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
}