package fmf.songs;

import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class TripleTroubleSonic extends SongPlayer
{

    override function getDadTex()
    {
        var tex = Paths.getSparrowAtlas('pc/sonic/Tails', 'mods');
        dad.frames = tex;
    }


    override function loadMap()
    {
        playState.defaultCamZoom = 0.85;

        var sky:FlxSprite = new FlxSprite(-324, -92).loadGraphic(Paths.image('bg/sonic/Phase3/Glitch', 'mods'));
        sky.antialiasing = true;
        sky.scale.x = 1;
        sky.scale.y = 1;
        sky.scrollFactor.set(0.95, 0.95);
        playState.add(sky);

        var backtrees:FlxSprite = new FlxSprite(-168, -141).loadGraphic(Paths.image('bg/sonic/Phase3/Trees2', 'mods'));
        backtrees.antialiasing = true;
        backtrees.scale.x = 1;
        backtrees.scale.y = 1;
        backtrees.scrollFactor.set(0.95, 0.95);
        playState.add(backtrees);

        var trees:FlxSprite = new FlxSprite(-324, -150).loadGraphic(Paths.image('bg/sonic/Phase3/Trees', 'mods'));
        trees.antialiasing = true;
        trees.scale.x = 1;
        trees.scale.y = 1;
        trees.scrollFactor.set(0.95, 0.95);
        playState.add(trees);

        var Grass:FlxSprite = new FlxSprite(-324, -150).loadGraphic(Paths.image('bg/sonic/Phase3/Grass', 'mods'));
        Grass.antialiasing = true;
        Grass.scale.x = 1;
        Grass.scale.y = 1;
        Grass.scrollFactor.set(0.95, 0.95);
        playState.add(Grass);

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
        dad.addOffset('singUP', 20, 39);
        dad.addOffset('singRIGHT', 20, -11);
        dad.addOffset('singLEFT', 78, -8);
        dad.addOffset('singDOWN', 42, 47);

        dad.scale.x = 1.7;
		dad.scale.y = 1.7;
		dad.x = 311;
		dad.y = 323;

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
        icon.animation.add('dad', [48, 49], 0, false, false);
        icon.animation.play("dad");
    }
}