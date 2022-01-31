package fmf.characters;
import reactor.*;
import ui.*;

import state.*;
import MenuCharacter.CharacterSetting;
import flixel.FlxSprite;
import fmf.characters.*;

using StringTools;

class PlayableCharacter extends Character
{
    override function debugName():String
    {
        return "boyfriend";
    }
    //should pa heyable!
    private var heyable:Bool;

    public var gameState(get, never):GameState;

    public inline function get_gameState()
        return GameState.instance;

	override function onCreate(x:Float, y:Float, ?character:String = 'bf', ?isPlayer:Bool = false)
	{
        super.onCreate(x, y, character, isPlayer);
        daBF = true;
	}

    public function getTex():Void
    {
        var tex = Paths.getSparrowAtlas('pc/bf/BoyFriend_Assets', 'mods');
        frames = tex;
    }

    // create animation for BF
    public function createAnimations():Void
    {
        animation.addByPrefix('idle', 'BF idle dance', 24, false);
        animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
        animation.addByPrefix('singRIGHT', 'BF NOTE LEFT0', 24, false);
        animation.addByPrefix('singLEFT', 'BF NOTE RIGHT0', 24, false);
        animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
        animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
        animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
        animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
        animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
        animation.addByPrefix('hey', 'BF HEY', 24, false);
        animation.addByPrefix('scared', 'BF idle shaking', 24);
        animation.addByPrefix('hurt', 'BF hit0', 24);
        animation.addByPrefix('dodge', 'Boyfriend dodge0', 24);

        //custom event for bf, only have in some mods 
        //nosense shit
        // animation.addByPrefix('bruh', 'BF bruh0', 24);
        // animation.addByPrefix('dab', 'BF dab0', 24);
        // animation.addByPrefix('gun', 'BF gun away0', 24);
        // animation.addByPrefix('idle-derp', 'BF idle Derp0', 24);


    }

    public function hey()
    {
        if(heyable)
            playAnimForce('hey', 0.35);
    }

    //note event shit for BF
    public function noteEventBF(noteData:Note){}
    public function noteEventDad(noteData:Note){}
    public function midSongStepUpdate(){}
    public function characterCreatedEvent(){}
    public function characterAddedEvent(){}



    override function update(elapsed:Float)
    {
    
        if (GameState.playAsDad)
        {
            dadBehaviour(elapsed);
        }
        else
        {
            bfBehaviour(elapsed);
        }
        super.update(elapsed);
    }


    private function bfBehaviour(elapsed:Float)
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
            playAnim('idle'); //, true, false, 10);
        }

    }

    private function dadBehaviour(elapsed:Float)
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

        if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
        {
            dance();
            holdTimer = 0;
        }
    }

    // create animation offset for BF
    public function createAnimationOffsets():Void
    {
        addOffset('idle', -6, -1);
        addOffset("singUP", -56, 30);
        addOffset("singRIGHT", -51, -8);
        addOffset("singLEFT", 1, -7);
        addOffset("singDOWN", -17, -53);

        addOffset("singUPmiss", -48, 29);
        addOffset("singRIGHTmiss", -8, 24);
        addOffset("singLEFTmiss", -48, -18);
        addOffset("singDOWNmiss", -13, -27);
        addOffset("hey", -6, 4);
        addOffset('scared', -7, 0);

        playAnim('idle');
        flipX = false;
    
    }

    // create BF
    public function createCharacter():Void
    {
        getTex();
        createAnimations();
        createAnimationOffsets();
    }
}
