package fmf.songs;
import reactor.*;
import ui.*;
import fmf.characters.*;

import state.*;
import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;

class Bambi extends SongPlayerPE
{	

	public override function bfCamFollowYMin()
	{
		return 700;
	}

	public override function bfCamFollowYMax()
	{
		return 750;
	}
	
	override function createStoryBF()
	{
	}

	override function createGF()
	{
		super.createGF();
		gf.x = 502;
		gf.y = 404;
	}

	

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		gameState.targetCamFollow.x -= 200;
	}
	

	override function createBF()
	{
		super.createBF();
		bf.x += 250;
		bf.y += 250;
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('psychengine/week_dab/images/icons/icon-bambi', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
	
	override function getDadVersion()
	{
		return new CharacterPE('bambi');
	}


}