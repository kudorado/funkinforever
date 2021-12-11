package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class InvertedAscension extends SongPlayer	
{

	var abel:FlxSprite;
	var max: FlxSprite;

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/starlingmayhem/cj_assets', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
        playState.defaultCamZoom = 0.6;
		var bg:FlxSprite = new FlxSprite(0, -396).loadGraphic(Paths.image('bg/starlingmayhem/morning/bg', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1;
		bg.scale.x = 1;
		playState.add(bg);

        var light0:FlxSprite = new FlxSprite(0, -469).loadGraphic(Paths.image('bg/starlingmayhem/light0', 'mods'));
		light0.antialiasing = true;
		light0.scale.y = 1;
		light0.scale.x = 1;
		playState.add(light0);

        var bg1:FlxSprite = new FlxSprite(0, -469).loadGraphic(Paths.image('bg/starlingmayhem/stage', 'mods'));
		bg1.antialiasing = true;
		bg1.scale.y = 1;
		bg1.scale.x = 1;
		playState.add(bg1);

        var headlight = new FlxSprite(0, 0);
		headlight.frames = Paths.getSparrowAtlas('bg/starlingmayhem/headlightsRGB', 'mods');
		headlight.animation.addByPrefix('idle', 'Lightsrepeated00', 24, true);
		headlight.animation.play('idle');
		headlight.antialiasing = true;
        headlight.scale.x = 2;
        headlight.scale.y = 2;
		headlight.x = 657;
		headlight.y = -128;
        playState.add(headlight);

        var headlight = new FlxSprite(0, 0);
		headlight.frames = Paths.getSparrowAtlas('bg/starlingmayhem/frontboppers', 'mods');
		headlight.animation.addByPrefix('idle', 'frontboppers000', 24, true);
		headlight.animation.play('idle');
		headlight.antialiasing = true;
        headlight.scale.x = 1;
        headlight.scale.y = 1;
		headlight.x = 0;
		headlight.y = 753;
        playState.add(headlight);

		createAbel();
		createMax();
	}

	function createAbel() {
		abel = new FlxSprite(0, 0);
		abel.frames = Paths.getSparrowAtlas('pc/starlingmayhem/Abel', 'mods');
		
		abel.animation.addByPrefix('idle', 'ABELIDLE00', 24, false);
		abel.animation.addByPrefix('singUP', 'ABELUP00', 24, false);
		abel.animation.addByPrefix('singDOWN', 'ABELDOWN00', 24, false);
		abel.animation.addByPrefix('singLEFT', 'ABELLEFT00', 24, false);
		abel.animation.addByPrefix('singRIGHT', 'ABELRIGHT00', 24, false);
		abel.animation.play('idle');
		abel.antialiasing = true;

		abel.scale.x = 0.8;
		abel.scale.y = 0.8;
		
		abel.x = 494;
		abel.y = 32;

		if (FlxG.save.data.distractions)
		{
			playState.add(abel);
		}
	}

	function createMax() {
		max = new FlxSprite(0, 0);
		max.frames = Paths.getSparrowAtlas('pc/starlingmayhem/Max', 'mods');
		
		max.animation.addByPrefix('idle', 'MAXIDLE00', 24, false);
		max.animation.addByPrefix('singUP', 'MAXUP00', 24, false);
		max.animation.addByPrefix('singDOWN', 'MAXDOWN00', 24, false);
		max.animation.addByPrefix('singLEFT', 'MAXLEFT00', 24, false);
		max.animation.addByPrefix('singRIGHT', 'MAXRIGHT00', 24, false);
		max.animation.play('idle');
		max.antialiasing = true;

		max.scale.x = 0.9;
		max.scale.y = 0.9;
		
		max.x = 1659;
		max.y = -33;

		if (FlxG.save.data.distractions)
		{
			playState.add(max);
		}
	}



	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Cj idle dance00', 18, false);
		animation.addByPrefix('singUP', 'Cj Sing Note UP00', 24, false);
		animation.addByPrefix('singRIGHT', 'Cj Sing Note RIGHT00', 24, false);
		animation.addByPrefix('singLEFT', 'Cj Sing Note LEFT00', 24, false);
		animation.addByPrefix('singDOWN', 'Cj Sing Note DOWN00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{

        dad.addOffset('idle',0, 0);

		dad.addOffset('singUP', 0, 0);
		dad.addOffset('singRIGHT', 0 , 0);
		dad.addOffset('singLEFT', 0, 0);
		dad.addOffset('singDOWN', 0, 0);
        dad.scale.x = 1.9;
        dad.scale.y = 1.9;
		dad.x = 809;
		dad.y = 66;
	
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.y = 313;
		bf.x = 1613;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.y = 43;
        gf.x = 972;
	}

	override function updateCamFollowBF()
	{
		playState.camFollow.x = gf.getGraphicMidpoint().x + 120;
		playState.camFollow.y = 360;

	}

	override function updateCamFollowDad()
	{
		playState.camFollow.x = gf.getGraphicMidpoint().x - 120;
		playState.camFollow.y = 360;

	}

	override function dadNoteEvent(noteData:Note)
	{
		super.dadNoteEvent(noteData);
		var lastNote = playState.lastNote;
		//abel.animation.play(lastNote);
		max.animation.play(lastNote);
	}

	override function bfNoteEvent(noteData:Note)
	{
		super.bfNoteEvent(noteData);
		var lastNote = playState.lastNote;
		//abel.animation.play(lastNote);
		max.animation.play(lastNote);
	}
	
}
