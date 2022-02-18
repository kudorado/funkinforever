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

class Reconciliation extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/dokidoki/Doki_MonikaNonPixel_Assets', 'mods');
		dad.frames = tex;
	}

    override  function getGFTex() {
		var text = Paths.getSparrowAtlas('gf_skins/dokidoki/DDLCGF_ass_sets', 'mods');
		gf.frames = text;
	}

    override function createGFAnimations()
    {
        gf.animation.addByPrefix("idle", 'GF Dancing Beat', true);
        gf.animation.addByPrefix('sad', 'Gf sad00');
        gf.playAnim("idle");
    }


	override function loadMap()
	{
		gameState.defaultCamZoom = 0.8;
		var bg:FlxSprite = new FlxSprite(-338, -322).loadGraphic(Paths.image('bg/dokidoki/sayori/DDLCfarbg', 'mods'));
		bg.antialiasing = true;

		bg.scale.x = 1.62;
		bg.scale.y = 1.62;

		bg.scrollFactor.set(0.95, 0.95);
		gameState.add(bg);


        var bg1:FlxSprite = new FlxSprite(-338, -322).loadGraphic(Paths.image('bg/dokidoki/sayori/DDLCbg', 'mods'));
		bg1.antialiasing = true;

		bg1.scale.x = 1.62;
		bg1.scale.y = 1.62;

		bg.scrollFactor.set(0.95, 0.95);
		gameState.add(bg1);

		createSayori();
		createNatsuki();
        createYuri();
	}

	function createSayori() {
		var sayori = new FlxSprite(0, 0);
		sayori.frames = Paths.getSparrowAtlas('bg/dokidoki/bgdoki/sayori', 'mods');
		
		sayori.animation.addByPrefix('idle', 'Sayori', 18, true);
		sayori.animation.play('idle');
		sayori.antialiasing = true;

		sayori.scale.x = 0.68;
		sayori.scale.y = 0.68;
		
		sayori.x = -60;
		sayori.y = 45;

		if (FlxG.save.data.distractions)
		{
			gameState.add(sayori);
		}
	}

	function createYuri() {
		var yuri = new FlxSprite(0, 0);
		yuri.frames = Paths.getSparrowAtlas('bg/dokidoki/bgdoki/yuri', 'mods');
		
		yuri.animation.addByPrefix('idle', 'Yuri BG00', 18, true);
		yuri.animation.play('idle');
		yuri.antialiasing = true;

		yuri.scale.x = 0.68;
		yuri.scale.y = 0.68;
		
		yuri.x = -322;
		yuri.y = -19;

		if (FlxG.save.data.distractions)
		{
			gameState.add(yuri);
		}
	}

    function createNatsuki() {
		var natsuki = new FlxSprite(0, 0);
		natsuki.frames = Paths.getSparrowAtlas('bg/dokidoki/bgdoki/natsuki', 'mods');
		
		natsuki.animation.addByPrefix('idle', 'Natsu BG00', 18, true);
		natsuki.animation.play('idle');
		natsuki.antialiasing = true;

		natsuki.scale.x = 0.68;
		natsuki.scale.y = 0.68;
		
		natsuki.x = 825;
		natsuki.y = 110;

		if (FlxG.save.data.distractions)
		{
			gameState.add(natsuki);
		}
	}

    function createMonika() {
		var monika = new FlxSprite(0, 0);
		monika.frames = Paths.getSparrowAtlas('bg/dokidoki/bgdoki/monika', 'mods');
		
		monika.animation.addByPrefix('idle', 'Moni BG00', 18, true);
		monika.animation.play('idle');
		monika.antialiasing = true;

		monika.scale.x = 0.68;
		monika.scale.y = 0.68;
		
		monika.x = 892;
		monika.y = 100;

		if (FlxG.save.data.distractions)
		{
			gameState.add(monika);
		}
	}

    override function createCharacters() {
		super.createCharacters();
		addTable();
	}

    function addTable(){
		var table:FlxSprite = new FlxSprite(-338, -322).loadGraphic(Paths.image('bg/dokidoki/sayori/DesksFront', 'mods'));
		table.antialiasing = true;
		table.scale.y = 1.62;
		table.scale.x = 1.62;
		gameState.add(table);
	}

    override function createDadAnimations():Void
    {
        var animation = dad.animation;
        animation.addByPrefix('idle', 'Monika Returns Idle', 18, false);
        animation.addByPrefix('singUP', 'Monika Returns Up', 24, false);
        animation.addByPrefix('singRIGHT', 'Monika Returns Right', 24, false);
        animation.addByPrefix('singLEFT', 'Monika Returns Left', 24, false);
        animation.addByPrefix('singDOWN', 'Monika Returns Down', 24, false);
        dad.animation = animation;

    }

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle',0, 0);
        dad.addOffset('singUP', -103, 17);
        dad.addOffset('singRIGHT', -35, -10);
        dad.addOffset('singLEFT', -22, 42);
		dad.addOffset('singDOWN', -23, -57);
		dad.dance();
		dad.scale.x = 1;
		dad.scale.y = 1;
		dad.x = -9;
		dad.y = 54;

	}

	override function createStoryBF()
	{
		changePc('bf_ddlc');
		bf.y -= 93;
        bf.x -= 110;
	}
	
    override function createBF()
    {
        super.createBF();
        bf.y -= 93;
        bf.x -= 110;
    }

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.scale.x = 2;
		gf.scale.y = 2;
	}

    override function updateCamFollowBF()
    {
        super.updateCamFollowBF();
        gameState.targetCamFollow.y -= 100;
    }

    override function updateCamFollowDad()
    {
        super.updateCamFollowDad();
    }

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/dokidoki/icon-monika-real', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
}