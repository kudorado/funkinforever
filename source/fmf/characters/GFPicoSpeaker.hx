package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;
import Section.SwagSection;
import flixel.util.FlxSort;
import Song.SwagSong;
import fmf.songs.SongPlayer;

using StringTools;

class GFPicoSpeaker extends Character
{
	override function debugName():String
	{
		return "gf";
	}

	override function createAnimationOffsets()
	{
		super.createAnimationOffsets();
	}

	override function dance():Void
	{
		playAnim('shoot1');
	}

	override function defaultOnUpdate(elapsed:Float)
	{
		if (animationNotes != null)
		{
			if (animationNotes.length > 0 && Conductor.songPosition > animationNotes[0][0])
			{
				var noteData:Int = 1;
				if (animationNotes[0][1] > 2)
					noteData = 3;

				noteData += FlxG.random.int(0, 1);
				playAnim('shoot' + noteData, true);
				animationNotes.shift();
			}
			if (animation.curAnim != null && animation.curAnim.finished)
				playAnim(animation.curAnim.name, false, false, animation.curAnim.frames.length - 3);
		}
	}



	public override function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		super.playAnim(AnimName, Force, Reversed, Frame);
	}

	public function loadMappedAnims():Void
	{
		var noteData:Array<SwagSection> = loadDataFile('picospeaker').notes;
		for (section in noteData)
		{
			for (songNotes in section.sectionNotes)
			{
				animationNotes.push(songNotes);
			}
		}
		TankmenBG.animationNotes = animationNotes;
		animationNotes.sort(sortAnims);

		// trace("FUCKYOUUUU: " + noteData.length);
	}

	public static function loadDataFile(songName:String, forceRestartScene:Bool = true):SwagSong
	{
		var daDirectory = '';
		var daSong = songName;
		var songLowercase = songName;

		#if android
		return loadDataFileAndroid(songName, forceRestartScene);
		//holy shit android suck.	
		#end

		#if ios
		daDirectory = "assets/assets/data/" + SongPlayer.folder + songLowercase;
		#else
		daDirectory = "assets/data/" + SongPlayer.folder + songLowercase;
		#end


		var song = Song.loadFromJson(daSong, GameState.playingSong.folder + songLowercase);
		return song;
	}

	public static function loadDataFileAndroid(songName:String):SwagSong
	{
		var daDirectory = '';
		var daSong = songName;
		var songLowercase = songName;
		var file = '';


		daDirectory = "assets/data/" + SongPlayer.folder + songLowercase;
		file = daDirectory + '/' + daSong + '.json';

		var song = Song.loadFromJson(daSong, GameState.playingSong.folder + songLowercase);
		return song;
	}

	
	function sortAnims(Obj1:Array<Dynamic>, Obj2:Array<Dynamic>):Int
	{
		return FlxSort.byValues(FlxSort.ASCENDING, Obj1[0], Obj2[0]);
	}

}
