package fmf.characters;

import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;




//the character class holding behaviour 
class Character extends BaseCharacter
{
	// public CharacterType characterType;

    public var animOffsets:Map<String, Array<Dynamic>>;
    public var debugMode:Bool = false;
    public var holdTimer:Float = 0;
    public var stunned:Bool;

    public var isVisible:Bool = true;

    public var daBF = false;
    public var label:String;

	override function onCreate(x:Float, y:Float, ?character:String = 'bf', ?isPlayer:Bool = false)
	{
		defaultOnCreate(x, y, character);
	}

	override function onUpdate(elapsed:Float)
	{
        defaultOnUpdate(elapsed);
    }


//-------------------------------------------------------------------------------------

	function defaultOnCreate(x:Float = 700, y:Float = 200, label:String = 'none')
	{
        characterType = PsychEngine;
        this.label = label;
		animOffsets = new Map<String, Array<Dynamic>>();
		antialiasing = true;
	}

	function defaultOnUpdate(elapsed:Float)
	{
        //nothing shit
    }

	function defaultDance()
	{
		if (isLockAnim)
			return;

		playAnim('idle');
	}
    
	function defaultPlayAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0)
	{
		if (isLockAnim)
			return;

		if (!isVisible)
			return;

		if (daBF && AnimName.contains("-alt")) // ah shit fuck you
		{
			var daString:String = AnimName;
			if (animation.getByName(AnimName) == null)
			{
				daString = daString.replace('-alt', '');
				AnimName = (daString);
			}
		}

		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);
	}

	function defaultAddOffset(name:String, x:Float = 0, y:Float = 0)
	{
        if (!isVisible)
            return;
        
        animOffsets[name] = [x, y];
	}

        
//-------------------------------------------------------------------------------------

    private var danced:Bool = false;
    private var isLockAnim:Bool;

	public function dance():Void
	{
        defaultDance();
	}

    public function playAnimForce(anim:String, lockDuration:Float, callback:Void->Void = null)
    {

        if(isLockAnim) return;

        if (!isVisible)
            return;
        
		if (callback == null)
		{
            //create default callback
			callback = function()
			{
                playAnim('idle', true);
            };
        }


        playAnim(anim, true);
        lockAnim(lockDuration, callback);
    }

    public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
    {
       defaultPlayAnim(AnimName, Force, Reversed, Frame);
    }

    public function addOffset(name:String, x:Float = 0, y:Float = 0)
    {
		defaultAddOffset(name, x, y);
    }


	public function bindAnim()
	{
		isLockAnim = true;
	}

	public function lockAnim(duration:Float, callback:Void->Void = null)
	{
		if (isLockAnim)
			return;

		isLockAnim = true;
		new FlxTimer().start(duration, function(tmr:FlxTimer)
		{
			isLockAnim = false;

			if (callback != null)
				callback();
		});
	}


}
