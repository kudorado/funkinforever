package fmf.songs;
import reactor.*;
import ui.*;


import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Milk extends SongPlayer
{

    override function getDadTex()
    {
        var tex = Paths.getSparrowAtlas('pc/sonic/Sunky', 'mods');
        dad.frames = tex;
    }

    override function createGFAnimations()
    {
        gf.animation.addByPrefix("dance", 'Gf dance00', true);
        gf.animation.addByPrefix('sad', 'Gf miss00');
        gf.playAnim("dance");
    }

    override function loadMap()
    {
        gamePlayState.defaultCamZoom = 0.7;

        var sSKY:FlxSprite = new FlxSprite(-751, -408).loadGraphic(Paths.image('bg/sonic/SunkBG', 'mods'));
        sSKY.antialiasing = true;
        sSKY.scrollFactor.set(1, 1);
        sSKY.active = false;
        sSKY.scale.x = 1.2;
        sSKY.scale.y = 1.2;
        gamePlayState.add(sSKY);
    }

    override function getDefaultSkin():Skin
    {
        return new AgotiSkin();
    }

    override function createDadAnimations():Void
    {
        var animation = dad.animation;
        animation.addByPrefix('idle', 'SunkyIDLE', 24, true);
        animation.addByPrefix('singUP', 'SunkyUP', 24, false);
        animation.addByPrefix('singRIGHT', 'SunkyRIGHT', 24, false);
        animation.addByPrefix('singLEFT', 'SunkyLEFT', 24, false);
        animation.addByPrefix('singDOWN', 'SunkyDOWN', 24, false);
        
        dad.animation = animation;
    }

    override function createDadAnimationOffsets():Void
    {
            
        dad.addOffset('idle', 0, 0);
        dad.addOffset('singUP', 0, 0);
        dad.addOffset('singRIGHT', 0, 0);
        dad.addOffset('singLEFT', 0, 0);
        dad.addOffset('singDOWN', 0, 0);

        dad.scale.x = 2;
        dad.scale.y = 2;
        dad.x = -14;
        dad.y = 385;
        dad.dance();

    }

    override function updateCamFollowDad()
    {
        super.updateCamFollowDad();
        //gamePlayState.targetCamFollow.y -= 150;
    }

    override function updateCamFollowBF()
    {
        super.updateCamFollowDad();
        //gamePlayState.targetCamFollow.y -= 50;
    }

    override function createGFAnimationOffsets()
    {
        super.createGFAnimationOffsets();
        gf.visible = false;
    }

    public override function getDadIcon(icon:Icon)
    {
        icon.loadGraphic(Paths.image('health_icon/sonic/iconGrid_1', 'mods'), true, 150, 150);
        icon.animation.add('dad', [30, 31], 0, false, false);
        icon.animation.play("dad");
    }
}