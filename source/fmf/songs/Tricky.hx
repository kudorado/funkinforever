package fmf.songs;
import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Tricky extends TrickyMask
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/tricky/tikyangry', 'mods');
		dad.frames = tex;
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
		dad.addOffset('idle', 0, 4);
		dad.addOffset('singUP', 65, -1);
		dad.addOffset('singRIGHT', 27, -65); 
		dad.addOffset('singLEFT', 101, 0);
		dad.addOffset('singDOWN', 15, -15);

		dad.playAnim('idle');

		dad.x -= 125;
		dad.y += 325;

		dad.scale.x = 2;
		dad.scale.y = 2;
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [46, 47], 0, false, false);
		icon.animation.play("dad");
	}

	public override function dadNoteEvent(daNote:Note)
	{
		if (FlxG.random.bool(20) && !clown.spookyRendered && !daNote.isSustainNote) // create spooky text :flushed:
		{
			clown.noteEvent(daNote, dad.x - 100, dad.y - 200);	
		}

		super.dadNoteEvent(daNote);
	}

		
}