package fmf.characters;

import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;
using StringTools;


//the character class holding behaviour of 
// Character  and character PE
class CharacterMixes extends CharacterPE
{

//------------------------------- base character function -------------------------------------------

	override function onCreate(x:Float, y:Float, ?character:String = 'bf', ?isPlayer:Bool = false)
	{
		switch (characterType)
		{   
            case PsychEngine:
                peOnCreate(x, y, character, isPlayer);

            default:
				defaultOnCreate(x, y, character);
        }
	}

	override function onUpdate(elapsed:Float)
	{
		switch (characterType)
		{
			case PsychEngine:
				peOnUpdate(elapsed);

			default:
				defaultOnUpdate(elapsed);
		}  
    }

//---------------------------------------------------------------------------------------------------  
	
	override function dance()
	{
		switch (characterType)
		{
			case PsychEngine:
				peDance();

			default:
				defaultDance();
		}
	}

	override function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0)
	{
		switch (characterType)
		{
			case PsychEngine:
				pePlayAnim(AnimName,Force, Reversed, Frame);

			default:
				defaultPlayAnim(AnimName,Force, Reversed, Frame);
		}
	}


	override function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		switch (characterType)
		{
			case PsychEngine:
				peAddOffset(name, x, y);

			default:
				defaultAddOffset(name, x, y);
		}
	}

    //its ok babe you are best
//---------------------------------------------------------------------------------------------------  


}
