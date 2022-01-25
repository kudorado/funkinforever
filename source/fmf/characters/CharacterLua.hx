package fmf.characters;

import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;
using StringTools;


//the character class holding behaviour of 
// Character  and character PE
class CharacterLua extends CharacterMixes
{
//------------------------------- base character function -------------------------------------------
	override function onCreate(x:Float, y:Float, ?character:String = 'bf', ?isPlayer:Bool = false)
	{
		characterType = Default;
		peOnCreate(x, y, character);
	}

}
