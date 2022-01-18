package fmf.songs;
import state.*;
import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class SunshineSonic extends SongPlayer
{

    override function getDadTex()
    {
        var tex = Paths.getSparrowAtlas('pc/sonic/Tails_Doll', 'mods');
        dad.frames = tex;
    }


    override function loadMap()
    {
        gamePlayState.defaultCamZoom = 0.8;

        var sky:FlxSprite = new FlxSprite(-147, -153).loadGraphic(Paths.image('bg/sonic/TailsBG', 'mods'));
        sky.antialiasing = true;
        sky.scale.x = 1;
        sky.scale.y = 1;
        sky.scrollFactor.set(0.95, 0.95);
        gamePlayState.add(sky);
    }

    override function getDefaultSkin():Skin
    {
        return new AgotiSkin();
    }

    override function createDadAnimations():Void
    {
        var animation = dad.animation;
        animation.addByPrefix('idle', 'TailsDoll IDLE', 24, true);
        animation.addByPrefix('singUP', 'TailsDoll UP', 24, false);
        animation.addByPrefix('singRIGHT', 'TailsDoll RIGHT', 24, false);
        animation.addByPrefix('singLEFT', 'TailsDoll LEFT', 24, false);
        animation.addByPrefix('singDOWN', 'TailsDoll DOWN', 24, false);
        
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
        dad.x = 360;
        dad.y = 303;
        dad.dance();

    }

    override function createStoryBF()
    {
        changePc('sonic_ssbf');
        bf.x += 350;
    }

    override function createBFAnimationOffsets() 
    {
        bf.x += 352;
    }

    override function updateCamFollowDad()
    {
        super.updateCamFollowDad();
        gamePlayState.targetCamFollow.y += 150;
        gamePlayState.defaultCamZoom = 0.9;


    }

    override function dadNoteEvent(noteData:Note)
    {
        super.dadNoteEvent(noteData);
        if (noteData.noteData == 2)
        {
            gf.playAnimForce("scared", 0.5);
        }
    }

    override function updateCamFollowBF()
    {
        super.updateCamFollowDad();
        gamePlayState.defaultCamZoom = 1;
    }

    override function createGFAnimationOffsets()
    {
        super.createGFAnimationOffsets();
        gf.visible = false;
    }

    public override function getDadIcon(icon:HealthIcon)
    {
        icon.loadGraphic(Paths.image('health_icon/sonic/iconGrid_1', 'mods'), true, 150, 150);
        icon.animation.add('dad', [33, 33], 0, false, false);
        icon.animation.play("dad");
    }
}