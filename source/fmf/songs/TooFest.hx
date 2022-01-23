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

class TooFest extends SongPlayer
{

    override function getDadTex()
    {
        var tex = Paths.getSparrowAtlas('pc/sonic/Sanic', 'mods');
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
        gameState.defaultCamZoom = 0.7;

        var sSKY:FlxSprite = new FlxSprite(-552, -137).loadGraphic(Paths.image('bg/sonic/sanicbg', 'mods'));
        sSKY.antialiasing = true;
        sSKY.scrollFactor.set(1, 1);
        sSKY.active = false;
        sSKY.scale.x = 1.4;
        sSKY.scale.y = 1.4;
        gameState.add(sSKY);
    }

    override function getDefaultSkin():Skin
    {
        return new AgotiSkin();
    }

    override function createDadAnimations():Void
    {
        var animation = dad.animation;
        animation.addByPrefix('idle', 'SanicIdle', 24, true);
        animation.addByPrefix('singUP', 'SanicUp', 24, false);
        animation.addByPrefix('singRIGHT', 'SanicRight', 24, false);
        animation.addByPrefix('singLEFT', 'SanicLeft', 24, false);
        animation.addByPrefix('singDOWN', 'SanicDown', 24, false);
        
        dad.animation = animation;
    }

    override function createDadAnimationOffsets():Void
    {
            
        dad.addOffset('idle', 0, 0);
        dad.addOffset('singUP', 0, 0);
        dad.addOffset('singRIGHT', 0, 0);
        dad.addOffset('singLEFT', 0, 0);
        dad.addOffset('singDOWN', 0, 0);

        dad.scale.x = 0.9;
        dad.scale.y = 0.9;
        dad.x = -400;
        dad.y = 65;
        dad.dance();

    }

    override function updateCamFollowdaddy()
    {
        super.updateCamFollowdaddy();
        //gameState.targetCamFollow.y -= 150;
    }

    override function updateCamFollowBF()
    {
        super.updateCamFollowdaddy();
        //gameState.targetCamFollow.y -= 50;
    }

    override function createGFAnimationOffsets()
    {
        super.createGFAnimationOffsets();
        gf.visible = false;
    }

    public override function getDadIcon(icon:Icon)
    {
        icon.loadGraphic(Paths.image('health_icon/sonic/iconGrid_1', 'mods'), true, 150, 150);
        icon.animation.add('dad', [38, 39], 0, false, false);
        icon.animation.play("dad");
    }
}