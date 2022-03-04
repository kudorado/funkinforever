package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import fmf.songs.*;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.util.FlxTimer;
import flixel.FlxObject;
import flixel.math.FlxPoint;
import fmf.characters.*;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import Song.SwagSong;


// base class execute song data
class SongPlayerHD extends SongPlayer
{
    // public override function getDefaultPc():Character
    // {
    //     var newPc = new CharacterPE('bf');
    //     newPc.flipX = false;
    //     changeCharacter(newPc);
    // }

    override function createStoryBF()
    { 
        var newPc = new CharacterPE('bf');
        newPc.flipX = false;
        newPc.x += 450;
        changeCharacter(newPc);
        
    }
}
