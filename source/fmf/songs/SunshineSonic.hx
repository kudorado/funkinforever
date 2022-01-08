package fmf.songs;

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
        //var tex = Paths.getSparrowAtlas('pc/sonic/Tails_Doll', 'mods');
        var tex = Paths.getSparrowAtlas('pc/sonic/SSBF_Assets', 'mods');
        dad.frames = tex;
    }


    override function loadMap()
    {
        playState.defaultCamZoom = 0.8;

        var sky:FlxSprite = new FlxSprite(-147, -153).loadGraphic(Paths.image('bg/sonic/TailsBG', 'mods'));
        sky.antialiasing = true;
        sky.scale.x = 1;
        sky.scale.y = 1;
        sky.scrollFactor.set(0.95, 0.95);
        playState.add(sky);
    }

    override function getDefaultSkin():Skin
    {
        return new AgotiSkin();
    }

    override function createDadAnimations():Void
    {
        var animation = dad.animation;
        // animation.addByPrefix('idle', 'TailsDoll IDLE', 24, true);
        // animation.addByPrefix('singUP', 'TailsDoll UP', 24, false);
        // animation.addByPrefix('singRIGHT', 'TailsDoll RIGHT', 24, false);
        // animation.addByPrefix('singLEFT', 'TailsDoll LEFT', 24, false);
        // animation.addByPrefix('singDOWN', 'TailsDoll DOWN', 24, false);

        //for test
        animation.addByPrefix('idle', 'SSBF IDLE instance 100', 24, false);
		animation.addByPrefix('singUP', 'SSBF UP instance', 24, false);
		animation.addByPrefix('singRIGHT', 'SSBF RIGHT instance', 24, false);
		animation.addByPrefix('singLEFT', 'SSBF LEFT instance 100', 24, false);
		animation.addByPrefix('singDOWN', 'SSBF DOWN instance', 24, false);

        // animation.addByPrefix('idle', 'SSBF IDLE instance 100', 24, false);
		// animation.addByPrefix('singUP', 'SSBF UPmiss instance', 1, false);
		// animation.addByPrefix('singRIGHT', 'SSBF RIGHTmiss instance', 1, false);
		// animation.addByPrefix('singLEFT', 'SSBF LEFTmiss instance', 1, false);
		// animation.addByPrefix('singDOWN', 'SSBF DOWNmiss instance', 1, false);
        
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
        dad.x = 442;
        dad.y = 303;
        dad.dance();

    }

    override function createStoryBF()
    {
        changePc('sonic_ssbf');
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
        icon.animation.add('dad', [33, 33], 0, false, false);
        icon.animation.play("dad");
    }
}