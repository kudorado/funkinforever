package fmf.songs;

import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Cycles extends SongPlayer
{

    override function getDadTex()
    {
        var tex = Paths.getSparrowAtlas('pc/sonic/SONIC_X', 'mods');
        dad.frames = tex;
    }


    override function loadMap()
    {
        playState.defaultCamZoom = 0.8;

        var sky:FlxSprite = new FlxSprite(-320, -400).loadGraphic(Paths.image('bg/sonic/LordXStage_1/sky', 'mods'));
        sky.antialiasing = true;
        sky.scale.x = 1;
        sky.scale.y = 1;
        sky.scrollFactor.set(0.95, 0.95);
        playState.add(sky);

        var hills1:FlxSprite = new FlxSprite(-149, -117).loadGraphic(Paths.image('bg/sonic/LordXStage_1/hills1', 'mods'));
        hills1.antialiasing = true;
        hills1.scale.x = 1;
        hills1.scale.y = 1;
        hills1.scrollFactor.set(0.95, 0.95);
        playState.add(hills1);

        var floor:FlxSprite = new FlxSprite(-149, -117).loadGraphic(Paths.image('bg/sonic/LordXStage_1/floor', 'mods'));
        floor.antialiasing = true;
        floor.scale.x = 1;
        floor.scale.y = 1;
        floor.scrollFactor.set(0.95, 0.95);
        playState.add(floor);

        AddNotKnuckles_Assets();
        //TreeAnimatedMoment();
        WeirdAssFlower_Assets();

        var tree:FlxSprite = new FlxSprite(-149, -117).loadGraphic(Paths.image('bg/sonic/LordXStage_1/tree', 'mods'));
        tree.antialiasing = true;
        tree.scale.x = 1;
        tree.scale.y = 1;
        tree.scrollFactor.set(0.95, 0.95);
        playState.add(tree);


        var smallflower:FlxSprite = new FlxSprite(-149, -117).loadGraphic(Paths.image('bg/sonic/LordXStage_1/smallflower', 'mods'));
        smallflower.antialiasing = true;
        smallflower.scale.x = 1;
        smallflower.scale.y = 1;
        smallflower.scrollFactor.set(0.95, 0.95);
        playState.add(smallflower);

        var smallflower1:FlxSprite = new FlxSprite(-149, -117).loadGraphic(Paths.image('bg/sonic/LordXStage_1/smallflower', 'mods'));
        smallflower1.antialiasing = true;
        smallflower1.scale.x = 1;
        smallflower1.scale.y = 1;
        smallflower1.scrollFactor.set(0.95, 0.95);
        smallflower1.flipX = true;
        playState.add(smallflower1);

        var smallflowe2:FlxSprite = new FlxSprite(-149, -117).loadGraphic(Paths.image('bg/sonic/LordXStage_1/smallflowe2', 'mods'));
        smallflowe2.antialiasing = true;
        smallflowe2.scale.x = 1;
        smallflowe2.scale.y = 1;
        smallflowe2.scrollFactor.set(0.95, 0.95);
        playState.add(smallflowe2);
    }

    function AddNotKnuckles_Assets()
    {
        var bgAnim = new FlxSprite(0, 0);
        bgAnim.frames = Paths.getSparrowAtlas('bg/sonic/LordXStage_1/NotKnuckles_Assets', 'mods');
        bgAnim.animation.addByPrefix('idle', 'Notknuckles00', 24, true);
        bgAnim.animation.play('idle');
        bgAnim.antialiasing = true;
        
        bgAnim.scale.x = 0.7;
        bgAnim.scale.y = 0.7;

        bgAnim.x = 467;
        bgAnim.y = -75;

        playState.add(bgAnim);
    }

    function TreeAnimatedMoment()
    {
        var treeAnimatedMoment = new FlxSprite(0, 0);
        treeAnimatedMoment.frames = Paths.getSparrowAtlas('bg/sonic/LordXStage_1/TreeAnimatedMoment', 'mods');
        treeAnimatedMoment.animation.addByPrefix('idle', 'TreeAnimated00', 24, true);
        treeAnimatedMoment.animation.play('idle');
        treeAnimatedMoment.antialiasing = true;
        
        treeAnimatedMoment.scale.x = 0.7;
        treeAnimatedMoment.scale.y = 0.7;

        treeAnimatedMoment.x = 271;
        treeAnimatedMoment.y = -40;

        playState.add(treeAnimatedMoment);
    }

    function WeirdAssFlower_Assets()
    {
        var weirdAssFlower_Assets = new FlxSprite(0, 0);
        weirdAssFlower_Assets.frames = Paths.getSparrowAtlas('bg/sonic/LordXStage_1/WeirdAssFlower_Assets', 'mods');
        weirdAssFlower_Assets.animation.addByPrefix('idle', 'flower00', 24, true);
        weirdAssFlower_Assets.animation.play('idle');
        weirdAssFlower_Assets.antialiasing = true;
        
        weirdAssFlower_Assets.scale.x = 0.7;
        weirdAssFlower_Assets.scale.y = 0.7;

        weirdAssFlower_Assets.x = 57;
        weirdAssFlower_Assets.y = -34;

        playState.add(weirdAssFlower_Assets);
    }

    override function getDefaultSkin():Skin
    {
        return new AgotiSkin();
    }

    override function createDadAnimations():Void
    {
        var animation = dad.animation;
        animation.addByPrefix('idle', 'X_Idle', 24, true);
        animation.addByPrefix('singUP', 'X_Up', 24, false);
        animation.addByPrefix('singRIGHT', 'X_Right', 24, false);
        animation.addByPrefix('singLEFT', 'X_Left', 24, false);
        animation.addByPrefix('singDOWN', 'X_Down', 24, false);
        dad.animation = animation;
    }

    override function createDadAnimationOffsets():Void
    {
            
        dad.addOffset('idle', 0, -18);
        dad.addOffset('singUP', 35, 82);
        dad.addOffset('singRIGHT', -1, 16);
        dad.addOffset('singLEFT', 17, 0);
        dad.addOffset('singDOWN', 78, -36);

        dad.scale.x = 2;
        dad.scale.y = 2;
        dad.x = 442;
        dad.y = 303;
        dad.dance();

    }
    
    override function createBF()
    {
        super.createBF();
        bf.x += 200;
    }

    override function updateCamFollowDad()
    {
        super.updateCamFollowDad();
        playState.targetCamFollow.y += 150;
        playState.defaultCamZoom = 0.9;


    }

    override function dadNoteEvent(noteData:Note)
    {
        super.dadNoteEvent(noteData);
        if (noteData.noteData == 2)
        {
            gf.playAnimForce("scared", 0.35);
        }
    }

    override function updateCamFollowBF()
    {
        super.updateCamFollowDad();
        playState.defaultCamZoom = 1;
    }

    override function createGFAnimationOffsets()
    {
        super.createGFAnimationOffsets();
        gf.visible = false;
    }

    public override function getDadIcon(icon:HealthIcon)
    {
        icon.loadGraphic(Paths.image('health_icon/sonic/iconGrid_1', 'mods'), true, 150, 150);
        icon.animation.add('dad', [28, 29], 0, false, false);
        icon.animation.play("dad");
    }
}