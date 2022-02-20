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

class Darkness extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/tailsexe/Tails', 'mods');
        dad.frames = tex;
	}


	override function loadMap()
	{
		gameState.defaultCamZoom = 0.85;

        var sky:FlxSprite = new FlxSprite(-324, -92).loadGraphic(Paths.image('bg/sonic/SonicP2/sky', 'mods'));
		sky.antialiasing = true;
		sky.scale.x = 1;
		sky.scale.y = 1;
		sky.scrollFactor.set(0.95, 0.95);
		gameState.add(sky);

        var backtrees:FlxSprite = new FlxSprite(-324, -92).loadGraphic(Paths.image('bg/sonic/SonicP2/backtrees', 'mods'));
		backtrees.antialiasing = true;
		backtrees.scale.x = 1;
		backtrees.scale.y = 1;
		backtrees.scrollFactor.set(0.95, 0.95);
		gameState.add(backtrees);

        var trees:FlxSprite = new FlxSprite(-324, -92).loadGraphic(Paths.image('bg/sonic/SonicP2/trees', 'mods'));
		trees.antialiasing = true;
		trees.scale.x = 1;
		trees.scale.y = 1;
		trees.scrollFactor.set(0.95, 0.95);
		gameState.add(trees);

        var ground:FlxSprite = new FlxSprite(-324, -92).loadGraphic(Paths.image('bg/sonic/SonicP2/ground', 'mods'));
		ground.antialiasing = true;
		ground.scale.x = 1;
		ground.scale.y = 1;
		ground.scrollFactor.set(0.95, 0.95);
		gameState.add(ground);

	}

    override function getDefaultSkin():Skin
    {
        return new AgotiSkin();
    }

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
        animation.addByPrefix('idle', 'Tails IDLE', 24, true);
        animation.addByPrefix('singUP', 'Tails UP00', 24, false);
        animation.addByPrefix('singRIGHT', 'Tails RIGHT00', 24, false);
        animation.addByPrefix('singLEFT', 'Tails LEFT00', 24, false);
        animation.addByPrefix('singDOWN', 'Tails DOWN000', 24, false);
        dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
			
		dad.addOffset('idle', 0, 0);
        dad.addOffset('singUP', 23, 39);
        dad.addOffset('singRIGHT', -66, -15);
        dad.addOffset('singLEFT', 6, -12);
        dad.addOffset('singDOWN', -50, -51);

        dad.scale.x = 1;
		dad.scale.y = 1;
		dad.x = 311;
		dad.y = 444;

        dad.dance();

	}
	
    override function createBF()
    {
        super.createBF();
        bf.x += 75;
        bf.y += 25;

    }

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		//gameState.targetCamFollow.y += 150
	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowDad();
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
        gf.playAnim('idle');
	}

	public override function getDadIcon(icon:Icon)
	{
        icon.loadGraphic(Paths.image('health_icon/tails/icons/icon-tails', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
}