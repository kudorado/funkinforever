package fmf.songs;

import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class BlackSun extends SongPlayer
{

    override function getDadTex()
    {
        var tex = Paths.getSparrowAtlas('pc/sonic/Exe_Assets', 'mods');
        dad.frames = tex;
    }

    override  function getGFTex() {
		var text = Paths.getSparrowAtlas('gf_skins/exe/exe_gf_assets', 'mods');
		gf.frames = text;
	}

    override function createGFAnimations()
    {
        gf.animation.addByPrefix("idle", 'Gf dance00', true);
        gf.animation.addByPrefix('sad', 'Gf miss00');
        gf.playAnim("idle");
    }

    override function loadMap()
    {
        gamePlayState.defaultCamZoom = 0.7;

        var sSKY:FlxSprite = new FlxSprite(-414, -240.8).loadGraphic(Paths.image('bg/sonic/exeBg/sky', 'mods'));
        sSKY.antialiasing = true;
        sSKY.scrollFactor.set(1, 1);
        sSKY.active = false;
        sSKY.scale.x = 1.2;
        sSKY.scale.y = 1.2;
        gamePlayState.add(sSKY);

        var trees:FlxSprite = new FlxSprite(-290.55, -298.3).loadGraphic(Paths.image('bg/sonic/exeBg/backtrees', 'mods'));
        trees.antialiasing = true;
        trees.scrollFactor.set(1.1, 1);
        trees.active = false;
        trees.scale.x = 1.2;
        trees.scale.y = 1.2;
        gamePlayState.add(trees);

        var bg2:FlxSprite = new FlxSprite(-306, -334.65).loadGraphic(Paths.image('bg/sonic/exeBg/trees', 'mods'));
        bg2.updateHitbox();
        bg2.antialiasing = true;
        bg2.scrollFactor.set(1.2, 1);
        bg2.active = false;
        bg2.scale.x = 1.2;
        bg2.scale.y = 1.2;
        gamePlayState.add(bg2);

        var bg:FlxSprite = new FlxSprite(-309.95, -240.2).loadGraphic(Paths.image('bg/sonic/exeBg/ground', 'mods'));
        bg.antialiasing = true;
        bg.scrollFactor.set(1.3, 1);
        bg.active = false;
        bg.scale.x = 1.2;
        bg.scale.y = 1.2;
        gamePlayState.add(bg);

        var treething:FlxSprite = new FlxSprite(-409.95, -340.2);
        treething.frames = Paths.getSparrowAtlas('bg/sonic/exeBg/ExeAnimatedBG_Assets', 'mods');
        treething.animation.addByPrefix('idle', 'ExeBGAnim00', 24, true);
        treething.animation.play('idle');
        treething.antialiasing = true;
        treething.scrollFactor.set(1, 1);
        gamePlayState.add(treething);

        var tails:FlxSprite = new FlxSprite(700, 500).loadGraphic(Paths.image('bg/sonic/exeBg/TailsCorpse', 'mods'));
        tails.antialiasing = true;
        tails.scrollFactor.set(1, 1);
        gamePlayState.add(tails);
    }

    function AnimateBG():Void
    {
        var bgAnim = new FlxSprite(0, 0);
        bgAnim.frames = Paths.getSparrowAtlas('bg/sonic/exeBg/ExeAnimatedBG_Assets', 'mods');
        bgAnim.animation.addByPrefix('idle', 'ExeBGAnim00', 24, true);
        bgAnim.animation.play('idle');
        bgAnim.antialiasing = true;
        
        bgAnim.scale.x = 2;
        bgAnim.scale.y = 2;

        bgAnim.x = 3900;
        bgAnim.y = -200;

        gamePlayState.add(bgAnim);
    }

    override function getDefaultSkin():Skin
    {
        return new AgotiSkin();
    }

    override function createDadAnimations():Void
    {   
        var animation = dad.animation;
        animation.addByPrefix('idle', 'Exe Idle00', 24, true);
        animation.addByPrefix('singUP', 'Exe Up00', 24, false);
        animation.addByPrefix('singRIGHT', 'Exe Right00', 24, false);
        animation.addByPrefix('singLEFT', 'Exe left00', 24, false);
        animation.addByPrefix('singDOWN', 'Exe Down00', 24, false);
        
        dad.animation = animation;
    }

    override function createDadAnimationOffsets():Void
    {
            
        dad.addOffset('idle', 0, 273);
        dad.addOffset('singUP', 38, 330);
        dad.addOffset('singRIGHT', 0, 263);
        dad.addOffset('singLEFT', 189, 291);
        dad.addOffset('singDOWN', 178, 76);

        dad.scale.x = 2.2;
        dad.scale.y = 2.2;
        dad.x = 499;
        dad.y = 385;
        dad.dance();

    }

    override function createBFAnimationOffsets() 
    {
        bf.x += (1114 - 700);
        bf.y += (557 - 425);
    }

    override function updateCamFollowDad()
    {
        super.updateCamFollowDad();
        gamePlayState.targetCamFollow.y -= 150;
    }

    override function updateCamFollowBF()
    {
        super.updateCamFollowDad();
        gamePlayState.targetCamFollow.y -= 50;
    }

    override function createGFAnimationOffsets()
    {
        super.createGFAnimationOffsets();
        //gf.visible = false;
        gf.x += 457;
        gf.y += 105;
    }

    public override function getDadIcon(icon:HealthIcon)
    {
        icon.loadGraphic(Paths.image('health_icon/sonic/iconGrid_1', 'mods'), true, 150, 150);
        icon.animation.add('dad', [36, 37], 0, false, false);
        icon.animation.play("dad");
    }
}