package fmf.songs;
import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class SenpaiGhosty	 extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/senpaighosty/senpaighosty_assets', 'mods');
		dad.frames = tex;
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'garcello idle dance', 18, false);
		animation.addByPrefix('singUP', 'garcello Sing Note UP0', 24, false);
		animation.addByPrefix('singRIGHT', 'garcello Sing Note RIGHT0', 24, false);
		animation.addByPrefix('singLEFT', 'garcello Sing Note LEFT0', 24, false);
		animation.addByPrefix('singDOWN', 'garcello Sing Note DOWN0', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{

		dad.addOffset('idle');
		dad.addOffset("singUP", 0, 0);
		dad.addOffset("singRIGHT", 0, 0);
		dad.addOffset("singLEFT", 0, 0);
		dad.addOffset("singDOWN", 0, 0);

		dad.dance();

	}

	override function createDad()
	{
        dad = new Dad(0, 125);
		getDadTex();
		createDadAnimations();
		createDadAnimationOffsets();
		dad.dance();

		dad.x += 125;
		dad.y += 185;

		dad.scale.x = 0.65;
		dad.scale.y = 0.65;

		dad.scrollFactor.set(0.95, 0.95);
    }

	override function createBFAnimationOffsets()
	{

		bf.x += 100;
		bf.y += 50;

		bf.scale.x *= 0.75;
		bf.scale.y *= 0.75;

		super.createBFAnimationOffsets();
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('kapi/iconGrid', 'mods'), true, 150, 150);
		icon.animation.add('dad', [12, 13], 0, false, false);
		icon.animation.play("dad");
	}

}