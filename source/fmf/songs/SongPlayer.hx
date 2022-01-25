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
class SongPlayer extends BaseSong
{

//lua shit
//---------------------------------------------------------------

	public static var folder(get, never):String;
	static inline function get_folder()
		return GameState.playingSong.folder;

	public static var luaFolder(get, never):String;
	static inline function get_luaFolder()
	{
		#if ios
		return "assets/assets/mods/images/psychengine/" + folder;
		#else
		return "assets/mods/images/psychengine/" + folder;
		#end
	}


//-------------------------------------------------------------

//----------------------------------- INITIALIZE -------------------------------------------------------

	//which map should be load,if you are not override this, it will load default map.
	private override function loadMap():Void{ super.loadMap();}

	//create characters, basically it will create gf, bf, dad 
	private override function createCharacters():Void{ super.createCharacters();}

//------------------------------------------------------------------------------------------------------

//------------------------------------- EVENTS ---------------------------------------------------------

	// update function
	public function update(elapsed:Float):Void {}

	public function playerMissNoteEvent():Void {}
	// mid song event update
	public function midSongEventUpdate(curBeat:Int):Void{} 
	//step event
	public function midSongStepUpdate():Void{ bf.midSongStepUpdate(); }

	// end song event
	public function endSongEvent(callback:Void->Void):Void{ callback(); } //end song normally

	// trigger when bf note spawn
	public function bfNoteEvent(noteData:Note):Void { bf.noteEventBF(noteData); }

	// event trigger when dad hit a note
	public function dadNoteEvent(noteData:Note):Void{bf.noteEventDad(noteData); }

	//public function missNoteEvent(noteData:Note):Void{bf.noteEventDad(noteData); }

	//public function noteEvent(noteData:Note):Void{bf.noteEventDad(noteData); }
	
	// update camera follow dad depending on song
	public function updateCamFollowDad():Void{}

	// update camera follow bf depending on song
	public function updateCamFollowBF():Void{} 

//------------------------------------------------------------------------------------------------------

//------------------------------------- BF -------------------------------------------------------------

	//get bf version, if you want to create special behaviour for bf, here you go.	
	// private override function getBFVersion(){ return super.getBFVersion(); }
	//get texture of bf and set into bf itself
	//create animations for bf
	//create animation offsets for bf
	private override function createBFAnimationOffsets():Void{ super.createBFAnimationOffsets(); }

//------------------------------------------------------------------------------------------------------

//------------------------------------- DAD ------------------------------------------------------------
	//basically same as BF
	private override function getDadVersion(){ return super.getDadVersion(); }
	private override function getDadTex():Void { super.getDadTex(); };
	private override function createDadAnimations():Void{ super.createDadAnimations();}
	private override function createDadAnimationOffsets():Void{ super.createDadAnimationOffsets();}
//------------------------------------------------------------------------------------------------------

//------------------------------------- GF -------------------------------------------------------------
	// basically same as BF
	private override function getGFVersion(){ return super.getGFVersion(); }
	private override function getGFTex():Void { super.getGFTex(); };
	private override function createGFAnimations():Void{ super.createGFAnimations();}
	private override function createGFAnimationOffsets():Void{ super.createGFAnimationOffsets();}

//-----------------------------------------------------------------------------------------------------


}