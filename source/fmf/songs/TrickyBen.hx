package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class TrickyBen extends TrickyHell
{

    override function getDadTex()
	{
		var frames = Paths.getSparrowAtlas('pc/trickyben/tikyben', 'mods');
		dad.frames = frames;
	}

	override function loadMap()
	{
		playState.defaultCamZoom = 0.25;
		var bg:FlxSprite = new FlxSprite(-400, -200).loadGraphic(Paths.image('bg/clown/red', 'mods'));
		bg.antialiasing = true;

		bg.scale.y = 3.5;
		bg.scale.x = 3.5;

		bg.x -= 250;

		playState.add(bg);

		var stageFront:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('bg/clown/rb/island_but_red', 'mods'));

		stageFront.x -= 500;
		stageFront.y = 200;

		stageFront.scale.x = 3;
		stageFront.scale.y = 3;
		playState.add(stageFront);


		clown = new BenClown();
		clown.createStaticBG();

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Phase 3 Tricky Idle', 18, false);
		animation.addByPrefix('singUP', 'Proper Up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Proper Right0', 24, false);
		animation.addByPrefix('singLEFT', 'Proper Left0', 24, false);
		animation.addByPrefix('singDOWN', 'Proper Down0', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', 0, 296);
		dad.addOffset('singUP', 148, -277);
		dad.addOffset('singRIGHT', 392, 176);
		dad.addOffset('singLEFT', -70, 199);
		dad.addOffset('singDOWN', 460, 250);

		dad.dance();

		dad.scale.x = 4;
		dad.scale.y = 4;

		dad.y -= 150;
		dad.x -= 1000;

	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('bg/clown/ben', 'mods'), true, 172, 126);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
		icon.scale.x = 0.5;
		icon.scale.y = 0.5;
		icon.y -= 25;
	}

	override function dadNoteEvent(noteData:Note)
	{
		if (FlxG.random.bool(65) && !clown.spookyRendered && !noteData.isSustainNote) // create spooky text :flushed:
			clown.noteEvent(noteData, dad.x + 500, dad.y + 100);

		super.dadNoteEvent(noteData);
	}

}
