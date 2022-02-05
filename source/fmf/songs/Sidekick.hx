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

class Sidekick extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/tailsexe/Beast', 'mods');
        dad.frames = tex;
	}

    override  function getGFTex() {
		var text = Paths.getSparrowAtlas('gf_skins/tailsexe/GF_dark', 'mods');
		gf.frames = text;
	}

    override function createGFAnimations()
    {
		gf.animation.addByPrefix("idle", 'GF Dancing Beat00', true);
		gf.animation.addByPrefix('sad', 'Gf sad00');
		gf.playAnim("idle");
    }

	override function loadLua()
	{
		//no need load by rice
		
		// get event
		// var flash = SongPlayer.luaFolder + "custom_events/flash.lua";
		// GameState.createLua(flash);
	}


	override function loadMap()
	{
		gameState.defaultCamZoom = 0.85;

        createFII_BG();

        var sky:FlxSprite = new FlxSprite(-500, -203).loadGraphic(Paths.image('bg/tails/SonicP3/ground', 'mods'));
		sky.antialiasing = true;
		sky.scale.x = 1.1;
		sky.scale.y = 1.1;
		sky.scrollFactor.set(0.95, 0.95);
		gameState.add(sky);

	}

    function createFII_BG()
    {
        var FII_BG = new FlxSprite(0, 0);
        FII_BG.frames = Paths.getSparrowAtlas('bg/tails/SonicP3/staticBACKGROUND2', 'mods');
        FII_BG.animation.addByPrefix('idle', 'MenuSTATICNEW', 24, true);
        FII_BG.animation.play('idle');
        FII_BG.antialiasing = true;
        FII_BG.scale.x = 3.5;
        FII_BG.scale.y = 3.5;
        FII_BG.x = 225;
        FII_BG.y = 100;
        gameState.add(FII_BG);

    }

    override function getDefaultSkin():Skin
    {
        return new AgotiSkin();
    }

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
        animation.addByPrefix('idle', 'Beast_IDLE0', 24, true);
        animation.addByPrefix('singUP', 'Beast_UP0', 24, false);
        animation.addByPrefix('singRIGHT', 'Beast_RIGHT0', 24, false);
        animation.addByPrefix('singLEFT', 'Beast_LEFT0', 24, false);
        animation.addByPrefix('singDOWN', 'Beast_DOWN0', 24, false);
        dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
			
		dad.addOffset('idle', 0, 0);
        dad.addOffset('singUP', 0, 80);
        dad.addOffset('singRIGHT', -202, -63);
        dad.addOffset('singLEFT', 93, -87);
        dad.addOffset('singDOWN', 24, -86);

        dad.scale.x = 2;
		dad.scale.y = 2;
		dad.x = 70;
		dad.y = 30;

        dad.dance();

	}

    override function createStoryBF()
    {
        changePc('bf_dark');
        bf.x -= 88;
        bf.y -= 100;

    }
	
    override function createBF()
    {
        super.createBF();
        bf.x -= 88;
        bf.y -= 100;

    }

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();

		if (GameState.instance.player3 == null || (!GameState.instance.player3.visible))
		{
			// oh shit lazy recording
			if (GameState.instance.curBeat < 253)
				gameState.targetCamFollow.y += 125;
			else
				gameState.targetCamFollow.y -= 25;
		}

		if (GameState.instance.player3 != null && GameState.instance.player3.visible)
			gameState.targetCamFollow.y -= 150;

        gameState.defaultCamZoom = 0.8;

	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowDad();
        gameState.defaultCamZoom = 0.85;
        gameState.targetCamFollow.y -= 100;

	}

	override function createGFAnimationOffsets()
	{
        gf.addOffset('idle', 0, 0);
        gf.addOffset('sad', 0, -12);
        gf.scale.x = 2;
        gf.scale.y = 2;
        gf.playAnim('idle');
	}

	public override function getDadIcon(icon:Icon)
	{
        icon.loadGraphic(Paths.image('health_icon/tails/icons/icon-sonic', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
}