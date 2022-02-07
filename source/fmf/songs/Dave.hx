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

class Dave extends SongPlayerPE
{	


	override function createBF()
	{
		super.createBF();
		bf.x += 100;
		bf.y += 25;
	}
	override function createStoryBF()
	{
		
	}
	
	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		gameState.targetCamFollow.x -= 200;
	}
		
	override function getDadVersion()
	{
		return new CharacterPE('dave');
	}

	public override function getDadIcon(icon:Icon)
	{
		icon.loadGraphic(Paths.image('psychengine/week_dab/images/icons/icon-dave', 'mods'), true, 150, 150);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
	}
	
}