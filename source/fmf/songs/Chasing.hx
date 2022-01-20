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

class Chasing extends SongPlayer
{

    override function getDadTex()
    {
        var tex = Paths.getSparrowAtlas('pc/tailsexe/tails_happy', 'mods');
        dad.frames = tex;
    }

    override function loadMap()
    {
        gameState.defaultCamZoom = 0.8;

        var sky:FlxSprite = new FlxSprite(-348, -64).loadGraphic(Paths.image('bg/tails/happy/SKY', 'mods'));
        sky.antialiasing = true;
        sky.scale.x = 1;
        sky.scale.y = 1;
        sky.scrollFactor.set(0.95, 0.95);
        gameState.add(sky);

        var floor2:FlxSprite = new FlxSprite(-348, -64).loadGraphic(Paths.image('bg/tails/happy/FLOOR2', 'mods'));
        floor2.antialiasing = true;
        floor2.scale.x = 1;
        floor2.scale.y = 1;
        floor2.scrollFactor.set(0.95, 0.95);
        gameState.add(floor2);

        var floor1:FlxSprite = new FlxSprite(-348, -64).loadGraphic(Paths.image('bg/tails/happy/FLOOR1', 'mods'));
        floor1.antialiasing = true;
        floor1.scale.x = 1;
        floor1.scale.y = 1;
        floor1.scrollFactor.set(0.95, 0.95);
        gameState.add(floor1);
    }

    override function getDefaultSkin():Skin
    {
        return new AgotiSkin();
    }

    override function createDadAnimations():Void
    {
        var animation = dad.animation;
        animation.addByPrefix('idle', 'Tails IDLE', 24, true);
        animation.addByPrefix('singUP', 'Tails UP', 24, false);
        animation.addByPrefix('singRIGHT', 'Tails RIGHT', 24, false);
        animation.addByPrefix('singLEFT', 'Tails LEFT', 24, false);
        animation.addByPrefix('singDOWN', 'Tails DOWN', 24, false);
        
        dad.animation = animation;
    }

    override function createDadAnimationOffsets():Void
    {
            
        dad.addOffset('idle', 0, 0);
        dad.addOffset('singUP', 18, 42);
        dad.addOffset('singRIGHT', -76, -17);
        dad.addOffset('singLEFT', 4, -12);
        dad.addOffset('singDOWN', -68, -47);

        dad.scale.x = 1;
        dad.scale.y = 1;
        dad.x = 204;
        dad.y = 479;
        dad.dance();

    }

    override function createBFAnimationOffsets() 
    {
        bf.x += 50;
        bf.y += 60;
    }

    override function updateCamFollowDad()
    {
        super.updateCamFollowDad();
        gameState.targetCamFollow.y -= 50;
    }

    override function updateCamFollowBF()
    {
        super.updateCamFollowDad();
        gameState.targetCamFollow.y -= 50;
        gameState.targetCamFollow.x -= 100;
    }

    override function createGFAnimationOffsets()
    {
        super.createGFAnimationOffsets();
        //gf.visible = false;
    }

    public override function getDadIcon(icon:Icon)
    {
        icon.loadGraphic(Paths.image('health_icon/sonic/iconGrid_1', 'mods'), true, 150, 150);
        icon.animation.add('dad', [34, 35], 0, false, false);
        icon.animation.play("dad");
    }
}