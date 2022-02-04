package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class TrickyMask extends SongPlayer
{
	public var clown:Clown;

	public override function getDadTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/trickymask/tikymask', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
		gameState.defaultCamZoom = 0.85;
		var bg:FlxSprite = new FlxSprite(-400, -200).loadGraphic(Paths.image('bg/clown/red', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1;
		bg.scale.x = 1;
		gameState.add(bg);

		var fg:FlxSprite = new FlxSprite();
		fg.frames =  Paths.getSparrowAtlas('bg/clown/tricky_floor', 'mods');
		fg.animation.addByPrefix('idle', 'Symbol 1');
		fg.antialiasing = true;

		fg.y = 600;
		fg.x = 150;
		fg.scale.y = 1.75;
		fg.scale.x = 1.75;
		gameState.add(fg);

		clown = new Clown();
		clown.createStaticBG();

	}

	


	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Idle instance 10', 24, false);

		animation.addByPrefix('singUP', 'Sing Up instance 10', 24, false);
		animation.addByPrefix('singRIGHT', 'Sing Right instance 10', 24, false);
		animation.addByPrefix('singLEFT', 'Sing Left instance 10', 24, false);
		animation.addByPrefix('singDOWN', 'Sing Down instance 10', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
	
		dad.addOffset('idle', 0, 0);
		dad.addOffset('singUP', 60, 17);
		dad.addOffset('singRIGHT', 22, -48); 
		dad.addOffset('singLEFT', 150, 25);
		dad.addOffset('singDOWN', 33, -35);

		dad.playAnim('idle');

		dad.y += 150;
		dad.x -= 250;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		clown.update(elapsed);

	}
	
	override function playerMissNoteEvent()
	{
		if (FlxG.random.bool(4) && !clown.spookyRendered)
			clown.createMissText(dad.x, dad.y);
	}
		
	override function midSongStepUpdate()
	{
		super.midSongStepUpdate();
		clown.midSongStepUpdate();
	}

	override function dadNoteEvent(noteData:Note)
	{
		if (FlxG.random.bool(10) && !clown.spookyRendered && !noteData.isSustainNote) // create spooky text :flushed:
			clown.noteEvent(noteData, dad.x, dad.y);

		super.dadNoteEvent(noteData);
	}


	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.x += 100;
		bf.y += 50;
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [44, 45], 0, false, false);
		icon.animation.play("dad");
	}

}