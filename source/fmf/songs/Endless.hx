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

class Endless extends SongPlayer
{
    public var FII_BG:FlxSprite;

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/sonic/SonicFunAssets', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		gameState.defaultCamZoom = 0.7;
		var sky:FlxSprite = new FlxSprite(-286, -42).loadGraphic(Paths.image('bg/sonic/FunInfiniteStage_1/sonicFUNsky', 'mods'));
		sky.antialiasing = true;
		sky.scale.x = 1.35;
		sky.scale.y = 1.35;
		sky.scrollFactor.set(0.95, 0.95);
		gameState.add(sky);

        var floor2:FlxSprite = new FlxSprite(-324, -92).loadGraphic(Paths.image('bg/sonic/FunInfiniteStage_1/sonicFUNfloor', 'mods'));
		floor2.antialiasing = true;
		floor2.scale.x = 1;
		floor2.scale.y = 1;
		floor2.scrollFactor.set(0.95, 0.95);
		gameState.add(floor2);

        var sonicFUNpillars3:FlxSprite = new FlxSprite(-575, -320).loadGraphic(Paths.image('bg/sonic/FunInfiniteStage_1/sonicFUNpillars3', 'mods'));
		sonicFUNpillars3.antialiasing = true;
		sonicFUNpillars3.scale.x = 1;
		sonicFUNpillars3.scale.y = 1;
		sonicFUNpillars3.scrollFactor.set(0.7, 0.7);
		gameState.add(sonicFUNpillars3);

        var sonicFUNpillars2:FlxSprite = new FlxSprite(-391, -323).loadGraphic(Paths.image('bg/sonic/FunInfiniteStage_1/sonicFUNpillars2', 'mods'));
		sonicFUNpillars2.antialiasing = true;
		sonicFUNpillars2.scale.x = 1;
		sonicFUNpillars2.scale.y = 1;
		sonicFUNpillars2.scrollFactor.set(0.8, 0.8);
		gameState.add(sonicFUNpillars2);

        var sonicFUNpillars1:FlxSprite = new FlxSprite(-895, -503).loadGraphic(Paths.image('bg/sonic/FunInfiniteStage_1/sonicFUNpillars1', 'mods'));
		sonicFUNpillars1.antialiasing = true;
		sonicFUNpillars1.scale.x = 1;
		sonicFUNpillars1.scale.y = 1;
		sonicFUNpillars1.scrollFactor.set(0.8, 0.8);
		gameState.add(sonicFUNpillars1);

        createFII_BG();

	}

    function createFII_BG()
    {
        FII_BG = new FlxSprite(0, 0);
        FII_BG.frames = Paths.getSparrowAtlas('bg/sonic/FunInfiniteStage_1/FII_BG', 'mods');
        FII_BG.animation.addByPrefix('idle', 'Sonicboppers00', 24, true);
        FII_BG.animation.play('idle');
        FII_BG.antialiasing = true;
        FII_BG.scale.x = 1;
        FII_BG.scale.y = 1;
        FII_BG.x = -372;
        FII_BG.y = -127;
        gameState.add(FII_BG);

    }

    override function getDefaultSkin():Skin
    {
        return new AgotiSkin();
    }

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'SONICFUNIDLE00', 24, true);
		animation.addByPrefix('singUP', 'SONICFUNUP00', 24, false);
		animation.addByPrefix('singRIGHT', 'SONICFUNRIGHT00', 24, false);
		animation.addByPrefix('singLEFT', 'SONICFUNLEFT00', 24, false);
		animation.addByPrefix('singDOWN', 'SONICFUNDOWN00', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
			
		dad.addOffset('idle', 0, 14);
		dad.addOffset('singUP', 122, 14);
		dad.addOffset('singRIGHT', 123, 4);
		dad.addOffset('singLEFT', 80, 10);
		dad.addOffset('singDOWN', 70, -8);

		dad.scale.x = 2;
		dad.scale.y = 2;
		dad.x = -17;
		dad.y = 369;
		dad.dance();

	}
	
    override function createBF()
    {
        super.createBF();
        bf.y += 84;
        bf.x += 121;
    }

	override function createGFAnimationOffsets()
    {
        super.createGFAnimationOffsets();
        gf.visible = false;
    }

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/sonic/iconGrid', 'mods'), true, 150, 150);
		icon.animation.add('dad', [26, 27], 0, false, false);
		icon.animation.play("dad");
	}
}