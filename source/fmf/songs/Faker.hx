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

class Faker extends SongPlayer
{

    override function getDadTex()
    {
        var tex = Paths.getSparrowAtlas('pc/sonic/Faker_EXE_Assets', 'mods');
        dad.frames = tex;
    }

    override  function getGFTex() {
		var text = Paths.getSparrowAtlas('gf_skins/exe/exe_gf_assets', 'mods');
		gf.frames = text;
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

        var sky:FlxSprite = new FlxSprite(-864, -396).loadGraphic(Paths.image('bg/sonic/fakerBG/sky', 'mods'));
        sky.antialiasing = true;
        sky.scale.x = 1;
        sky.scale.y = 1;
        sky.scrollFactor.set(0.95, 0.95);
        gamePlayState.add(sky);

        var mountains:FlxSprite = new FlxSprite(-864, -396).loadGraphic(Paths.image('bg/sonic/fakerBG/mountains', 'mods'));
        mountains.antialiasing = true;
        mountains.scale.x = 1;
        mountains.scale.y = 1;
        mountains.scrollFactor.set(0.95, 0.95);
        gamePlayState.add(mountains);

        var grass:FlxSprite = new FlxSprite(-864, -396).loadGraphic(Paths.image('bg/sonic/fakerBG/grass', 'mods'));
        grass.antialiasing = true;
        grass.scale.x = 1;
        grass.scale.y = 1;
        grass.scrollFactor.set(0.95, 0.95);
        gamePlayState.add(grass);

        var plant:FlxSprite = new FlxSprite(-864, -396).loadGraphic(Paths.image('bg/sonic/fakerBG/plant', 'mods'));
        plant.antialiasing = true;
        plant.scale.x = 1;
        plant.scale.y = 1;
        plant.scrollFactor.set(0.95, 0.95);
        gamePlayState.add(plant);

        var tree1:FlxSprite = new FlxSprite(-864, -396).loadGraphic(Paths.image('bg/sonic/fakerBG/tree1', 'mods'));
        tree1.antialiasing = true;
        tree1.scale.x = 1;
        tree1.scale.y = 1;
        tree1.scrollFactor.set(0.95, 0.95);
        gamePlayState.add(tree1);

        var tree2:FlxSprite = new FlxSprite(-864, -396).loadGraphic(Paths.image('bg/sonic/fakerBG/tree2', 'mods'));
        tree2.antialiasing = true;
        tree2.scale.x = 1;
        tree2.scale.y = 1;
        tree2.scrollFactor.set(0.95, 0.95);
        gamePlayState.add(tree2);

        var pillar1:FlxSprite = new FlxSprite(-864, -396).loadGraphic(Paths.image('bg/sonic/fakerBG/pillar1', 'mods'));
        pillar1.antialiasing = true;
        pillar1.scale.x = 1;
        pillar1.scale.y = 1;
        pillar1.scrollFactor.set(0.95, 0.95);
        gamePlayState.add(pillar1);

        var pillar2:FlxSprite = new FlxSprite(-864, -396).loadGraphic(Paths.image('bg/sonic/fakerBG/pillar2', 'mods'));
        pillar2.antialiasing = true;
        pillar2.scale.x = 1;
        pillar2.scale.y = 1;
        pillar2.scrollFactor.set(0.95, 0.95);
        gamePlayState.add(pillar2);

        var flower1:FlxSprite = new FlxSprite(-864, -396).loadGraphic(Paths.image('bg/sonic/fakerBG/flower1', 'mods'));
        flower1.antialiasing = true;
        flower1.scale.x = 1;
        flower1.scale.y = 1;
        flower1.scrollFactor.set(0.95, 0.95);
        gamePlayState.add(flower1);

        var flower2:FlxSprite = new FlxSprite(-864, -396).loadGraphic(Paths.image('bg/sonic/fakerBG/flower2', 'mods'));
        flower2.antialiasing = true;
        flower2.scale.x = 1;
        flower2.scale.y = 1;
        flower2.scrollFactor.set(0.95, 0.95);
        gamePlayState.add(flower2);
    }

    override function getDefaultSkin():Skin
    {
        return new AgotiSkin();
    }

    override function createDadAnimations():Void
    {
        var animation = dad.animation;
        animation.addByPrefix('idle', 'FAKER IDLE', 24, true);
        animation.addByPrefix('singUP', 'FAKER UP', 24, false);
        animation.addByPrefix('singRIGHT', 'FAKER RIGHT', 24, false);
        animation.addByPrefix('singLEFT', 'FAKER LEFT', 24, false);
        animation.addByPrefix('singDOWN', 'FAKER DOWN', 24, false);
        
        dad.animation = animation;
    }

    override function createDadAnimationOffsets():Void
    {
            
        dad.addOffset('idle', 0, 26);
        dad.addOffset('singUP', 0, 92);
        dad.addOffset('singRIGHT', 24, 59);
        dad.addOffset('singLEFT', 198, 46);
        dad.addOffset('singDOWN', -124, -23);

        dad.scale.x = 1.3;
        dad.scale.y = 1.3;
        dad.x = -13;
        dad.y = 260;
        dad.dance();

    }

    override function createBFAnimationOffsets() 
    {
        bf.x -= 60;
        bf.y += 40;
    }

    override function updateCamFollowDad()
    {
        super.updateCamFollowDad();
        gamePlayState.targetCamFollow.y -= 50;
    }

    override function updateCamFollowBF()
    {
        super.updateCamFollowDad();
        gamePlayState.targetCamFollow.y -= 150;
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