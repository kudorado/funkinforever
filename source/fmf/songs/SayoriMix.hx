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

class SayoriMix extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/dokidoki/sayori/Doki_Sayo_Assets', 'mods');
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
		var bg:FlxSprite = new FlxSprite(-338, -322).loadGraphic(Paths.image('bg/dokidoki/festival/FarBack', 'mods'));
		bg.antialiasing = true;

		bg.scale.x = 1.62;
		bg.scale.y = 1.62;

		bg.scrollFactor.set(0.95, 0.95);
		gameState.add(bg);


        var bg1:FlxSprite = new FlxSprite(-338, -322).loadGraphic(Paths.image('bg/dokidoki/festival/MainBG', 'mods'));
		bg1.antialiasing = true;

		bg1.scale.x = 1.62;
		bg1.scale.y = 1.62;

		bg.scrollFactor.set(0.95, 0.95);
		gameState.add(bg1);

        var bg2:FlxSprite = new FlxSprite(-338, -260).loadGraphic(Paths.image('bg/dokidoki/festival/FestivalBanner', 'mods'));
		bg2.antialiasing = true;

		bg2.scale.x = 1.62;
		bg2.scale.y = 1.62;

		bg2.scrollFactor.set(0.95, 0.95);
		gameState.add(bg2);

        createLight();

		//createSayori();
		createNatsuki();
        createYuri();
        createProtag();
        createMonika();
	}

	function createSayori() {
		var sayori = new FlxSprite(0, 0);
		sayori.frames = Paths.getSparrowAtlas('bg/dokidoki/bgdoki/sayori', 'mods');
		
		sayori.animation.addByPrefix('idle', 'Sayori', 18, true);
		sayori.animation.play('idle');
		sayori.antialiasing = true;

		sayori.scale.x = 0.68;
		sayori.scale.y = 0.68;
		
		sayori.x = -269;
		sayori.y = 75;

		if (FlxG.save.data.distractions)
		{
			gameState.add(sayori);
		}
	}

    function createProtag() {
        var protag = new FlxSprite(0, 0);
        protag.frames = Paths.getSparrowAtlas('bg/dokidoki/bgdoki/protag', 'mods');
        
        protag.animation.addByPrefix('idle', 'Protag-kun', 18, true);
        protag.animation.play('idle');
        protag.antialiasing = true;

        protag.scale.x = 0.68;
        protag.scale.y = 0.68;
        
        protag.x = 136;
        protag.y = -66;

        if (FlxG.save.data.distractions)
        {
            gameState.add(protag);
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
		
		yuri.x = -289;
		yuri.y = -20;

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
		
		monika.x = 937;
		monika.y = -30;

		if (FlxG.save.data.distractions)
		{
			gameState.add(monika);
		}
	}

    override function createCharacters() {
		super.createCharacters();
		addTable();
        createLightBack();
	}

    function addTable(){
		var table:FlxSprite = new FlxSprite(-338, -322).loadGraphic(Paths.image('bg/dokidoki/festival/DesksFestival', 'mods'));
		table.antialiasing = true;
		table.scale.y = 1.62;
		table.scale.x = 1.62;
		gameState.add(table);
	}


    function createLight(){
		var lightback = new FlxSprite(0, 0);
		lightback.frames = Paths.getSparrowAtlas('bg/dokidoki/festival/lights_back', 'mods');
		
		lightback.animation.addByPrefix('idle', 'lights', 24, true);
		lightback.animation.play('idle');
		lightback.antialiasing = true;

		lightback.scale.x = 1.6;
		lightback.scale.y = 1.6;
		
		lightback.x = 238;
		lightback.y = 86;

		if (FlxG.save.data.distractions)
		{
			gameState.add(lightback);
		}
	}

    function createLightBack(){

        var lights_front = new FlxSprite(0, 0);
		lights_front.frames = Paths.getSparrowAtlas('bg/dokidoki/festival/lights_front', 'mods');
		
		lights_front.animation.addByPrefix('idle', 'Lights', 24, true);
		lights_front.animation.play('idle');
		lights_front.antialiasing = true;

		lights_front.scale.x = 3.2;
		lights_front.scale.y = 3.2;
		
		lights_front.x = 390;
		lights_front.y = 571;

		if (FlxG.save.data.distractions)
		{
			gameState.add(lights_front);
		}
	}

    override function createDadAnimations():Void
    {
        var animation = dad.animation;
        animation.addByPrefix('idle', 'Sayo Idle', 18, false);
        animation.addByPrefix('singUP', 'Sayo Sing Note Up', 24, false);
        animation.addByPrefix('singRIGHT', 'Sayo Sing Note Right', 24, false);
        animation.addByPrefix('singLEFT', 'Sayo Sing Note Left', 24, false);
        animation.addByPrefix('singDOWN', 'Sayo Sing Note Down', 24, false);
        dad.animation = animation;

    }

    override function createDadAnimationOffsets():Void
    {
        dad.addOffset('idle',0, 0);
        dad.addOffset('singDOWN', -54, -44);
        dad.addOffset('singRIGHT', -92, -8);
        dad.addOffset('singUP', -31, 43);
        dad.addOffset('singLEFT', -22,-2);
        dad.dance();
        dad.scale.x = 1;
        dad.scale.y = 1;
        dad.x = -91;
        dad.y = 102;
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
		icon.loadGraphic(Paths.image('health_icon/dokidoki/icon-sayori', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}

	override function getDefaultSkin():Skin
	{
		return new DokiSkin();
	}
}