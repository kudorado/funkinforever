package fmf.characters;

import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;


enum CharacterType
{
    Default;
    PsychEngine;

}
//shit

//abstract class shit fuck you
class BaseCharacter extends FlxSprite
{

	public var characterType:CharacterType;

    //brilliant gooo brrr
    public function new(x:Float = 700, y:Float = 200, ?character:String = 'bf', ?isPlayer:Bool = false)
    {
        super(x, y);
		onCreate(x, y, character, isPlayer);
    }

	function onCreate(x:Float, y:Float, ?character:String = 'bf', ?isPlayer:Bool = false)
	{

	}

	public function onUpdate(elapsed:Float)
	{
    }

    //shit
    override function update(elapsed:Float)
    {
        onUpdate(elapsed);
        super.update(elapsed);
    }



}
