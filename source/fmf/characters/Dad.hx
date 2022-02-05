package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Dad extends Character
{
    override function debugName():String
    {
        return "dad";
    }

	override function update(elapsed:Float)
	{
		onUpdate(elapsed);
		if (GameState.playAsDad)
		{
			bfBehaviour(elapsed);
		}
		else
		{
			dadBehaviour(elapsed);
		}
		super.update(elapsed);
	}

    private override function bfBehaviour(elapsed:Float)
    {
        if (animation == null || animation.curAnim == null || animation.curAnim.name == null)
            return;
        
        if (animation.curAnim.name.startsWith('sing'))
        {
            holdTimer += elapsed;
        }
        else
            holdTimer = 0;

        if (animation.curAnim.name.endsWith('miss') && animation.curAnim.finished && !debugMode)
        {
            playAnim('idle');
        }

    }

	private override function dadBehaviour(elapsed:Float)
    {
        if (animation == null || animation.curAnim == null || animation.curAnim.name == null)
            return;

        if (animation.curAnim.name.startsWith('sing'))
        {
            holdTimer += elapsed;
        }
        else 
            holdTimer = 0;

        var dadVar:Float = 6.1;

        if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001 && !debugMode)
        {
            dance();
            holdTimer = 0;
        }
    }


}

