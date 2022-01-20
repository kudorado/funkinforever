package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Foolhardy extends SongPlayer	
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/zardy/Zardy', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
		var bgAnim = new FlxSprite(0, 0);
		bgAnim.frames = Paths.getSparrowAtlas('bg/zardy/five-minute-song/Maze', 'mods');
		bgAnim.animation.addByPrefix('idle', 'Stage00', 24, true);
		bgAnim.animation.play('idle');
		bgAnim.antialiasing = true;
        bgAnim.scale.x = 1.65;
        bgAnim.scale.y = 1.65;
		bgAnim.x = 0;
		bgAnim.y = 111;
        gameState.add(bgAnim);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Idle00', 18, false);
		animation.addByPrefix('singUP', 'Sing Up00', 24, false);
		animation.addByPrefix('singRIGHT', 'Sing Right00', 24, false);
		animation.addByPrefix('singLEFT', 'Sing Left00', 24, false);
		animation.addByPrefix('singDOWN', 'Sing Down00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -7, 6);
		dad.addOffset("singUP", -119, 37);
		dad.addOffset("singRIGHT", -65, 9);
		dad.addOffset("singLEFT", 108, 26);
		dad.addOffset("singDOWN", 8, 7);
		dad.dance();


		dad.scale.x = 1;
		dad.scale.y = 1;

		dad.x = -114;
		dad.y = 170;
	
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.y = 500;
		bf.x = 784;
	}

    override function createGFAnimationOffsets()
    {
        super.createGFAnimationOffsets();
    }

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('health_icon/zardy/shit', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}

}
