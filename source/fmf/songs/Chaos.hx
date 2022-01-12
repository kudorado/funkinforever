package fmf.songs;
import state.*;
import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Chaos extends SongPlayer
{

    override function getDadTex()
    {
        var tex = Paths.getSparrowAtlas('pc/sonic/fleetway/Fleetway_Super_Sonic', 'mods');
        dad.frames = tex;
    }


    override function loadMap()
    {
        gamePlayState.defaultCamZoom = 0.7;

        var sky:FlxSprite = new FlxSprite(-98, -264).loadGraphic(Paths.image('bg/sonic/Chamber/Wall_instance_10000', 'mods'));
        sky.antialiasing = true;
        sky.scale.x = 2.2;
        sky.scale.y = 2.2;
        sky.scrollFactor.set(0.95, 0.95);
        gamePlayState.add(sky);

        var floor:FlxSprite = new FlxSprite(-147, 865).loadGraphic(Paths.image('bg/sonic/Chamber/Floor_yellow0000', 'mods'));
        floor.antialiasing = true;
        floor.scale.x = 2.6;
        floor.scale.y = 2.6;
        floor.scrollFactor.set(0.95, 0.95);
        gamePlayState.add(floor);

        var bgyellow:FlxSprite = new FlxSprite(-500, -850).loadGraphic(Paths.image('bg/sonic/Chamber/BGyellow0000', 'mods'));
        bgyellow.antialiasing = true;
        bgyellow.scale.x = 2;
        bgyellow.scale.y = 2;
        bgyellow.scrollFactor.set(0.95, 0.95);
        gamePlayState.add(bgyellow);

        
        EmeraldBeam();
        EmeraldBeamCharged();
        TheEmeralds();

        var thechamber:FlxSprite = new FlxSprite(454, 282).loadGraphic(Paths.image('bg/sonic/Chamber/Chamber_Sonic_Fall0025', 'mods'));
        thechamber.antialiasing = true;
        thechamber.scale.x = 1;
        thechamber.scale.y = 1;
        thechamber.scrollFactor.set(0.95, 0.95);
        gamePlayState.add(thechamber);

        var pebles:FlxSprite = new FlxSprite(-147, -709).loadGraphic(Paths.image('bg/sonic/Chamber/Pebles_1', 'mods'));
        pebles.antialiasing = true;
        pebles.scale.x = 1;
        pebles.scale.y = 1;
        pebles.scrollFactor.set(0.95, 0.95);
        gamePlayState.add(pebles);


        PorkerLewis();
    }

    function PorkerLewis():Void
    {
        var bgAnim = new FlxSprite(0, 0);
        bgAnim.frames = Paths.getSparrowAtlas('bg/sonic/Chamber/PorkerLewis', 'mods');
        bgAnim.animation.addByPrefix('idle', 'Porker', 24, true);
        bgAnim.animation.play('idle');
        bgAnim.antialiasing = true;
        
        bgAnim.scale.x = 2;
        bgAnim.scale.y = 2;

        bgAnim.x = 3900;
        bgAnim.y = -200;

        gamePlayState.add(bgAnim);
    }

    function EmeraldBeam():Void
    {
        var bgAnim1 = new FlxSprite(0, 0);
        bgAnim1.frames = Paths.getSparrowAtlas('bg/sonic/Chamber/Emerald_Beam', 'mods');
        bgAnim1.animation.addByPrefix('idle', 'Emerald Beam instance', 24, true);
        bgAnim1.animation.play('idle');
        bgAnim1.antialiasing = true;
        
        bgAnim1.scale.x = 2;
        bgAnim1.scale.y = 2;

        bgAnim1.x = 919;
        bgAnim1.y = -1175;

        gamePlayState.add(bgAnim1);
    }

    function EmeraldBeamCharged():Void
    {
        var bgAnim1 = new FlxSprite(0, 0);
        bgAnim1.frames = Paths.getSparrowAtlas('bg/sonic/Chamber/Emerald_Beam_Charged', 'mods');
        bgAnim1.animation.addByPrefix('idle', 'Emerald', 24, true);
        bgAnim1.animation.play('idle');
        bgAnim1.antialiasing = true;
        
        bgAnim1.scale.x = 2;
        bgAnim1.scale.y = 2;

        bgAnim1.x = 919;
        bgAnim1.y = -1175;

        gamePlayState.add(bgAnim1);
    }

    function TheEmeralds():Void
    {
        var theEmeralds = new FlxSprite(0, 0);
        theEmeralds.frames = Paths.getSparrowAtlas('bg/sonic/Chamber/Emeralds', 'mods');
        theEmeralds.animation.addByPrefix('idle', 'TheEmeralds', 24, true);
        theEmeralds.animation.play('idle');
        theEmeralds.antialiasing = true;
        
        theEmeralds.scale.x = 2;
        theEmeralds.scale.y = 2;

        theEmeralds.x = 1140;
        theEmeralds.y = -350;

        gamePlayState.add(theEmeralds);
    }

    override function getDefaultSkin():Skin
    {
        return new AgotiSkin();
    }

    override function createDadAnimations():Void
    {
        var animation = dad.animation;
        animation.addByPrefix('idle', 'Fleetway Idle', 24, true);
        animation.addByPrefix('singUP', 'Fleetway Up', 24, false);
        animation.addByPrefix('singRIGHT', 'Fleetway Right', 24, false);
        animation.addByPrefix('singLEFT', 'Fleetway Left', 24, false);
        animation.addByPrefix('singDOWN', 'Fleetway Down', 24, false);
        
        dad.animation = animation;
    }

    override function createDadAnimationOffsets():Void
    {
            
        dad.addOffset('idle', 0, 0);
        dad.addOffset('singUP', 0, 0);
        dad.addOffset('singRIGHT', 0, 0);
        dad.addOffset('singLEFT', 0, 0);
        dad.addOffset('singDOWN', 0, 0);

        dad.scale.x = 1.8;
        dad.scale.y = 1.8;
        dad.x = 767;
        dad.y = -257;
        dad.dance();

    }

    override function createBFAnimationOffsets() 
    {
        bf.x += 2100;
    }

    override function updateCamFollowDad()
    {
        super.updateCamFollowDad();
        gamePlayState.targetCamFollow.y += 150;
        //gamePlayState.defaultCamZoom = 0.7;


    }

    override function updateCamFollowBF()
    {
        super.updateCamFollowDad();
        //gamePlayState.defaultCamZoom = 0.7;
        gamePlayState.targetCamFollow.y -= 150;
        gamePlayState.targetCamFollow.x -= 100;
    }

    override function createGFAnimationOffsets()
    {
        super.createGFAnimationOffsets();
        gf.visible = false;
    }

    public override function getDadIcon(icon:HealthIcon)
    {
        icon.loadGraphic(Paths.image('health_icon/sonic/iconGrid_1', 'mods'), true, 150, 150);
        icon.animation.add('dad', [40, 41], 0, false, false);
        icon.animation.play("dad");
    }
}