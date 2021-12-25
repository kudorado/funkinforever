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
		var tex = Paths.getSparrowAtlas('pc/impostor_v4/black_run', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		playState.defaultCamZoom = 0.8;
		var bg:FlxSprite = new FlxSprite(-750, -408).loadGraphic(Paths.image('bg/impostor_v4/runaway', 'mods'));
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

	override function getDadVersion():Character
	{
		return new BlackImpostor();
	}
	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'impostor idle0', 18, true);
		dad.animation = animation;
		dad.animation.play('idle');

	}

	override function createDadAnimationOffsets():Void
	{
			
		dad.addOffset('idle', 0, -0);

		dad.scale.x = 1.6;
		dad.scale.y = 1.6;

		dad.x = -400;
		dad.y = 175;

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
    }

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('health_icon/impostor_v4/icons/icon-black-run', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
}