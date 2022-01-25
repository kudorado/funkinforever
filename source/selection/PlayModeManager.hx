package selection;
import state.*;
import flixel.FlxG;
import fmf.songs.BaseSong;
import fmf.characters.*;


class PlayModeManager
{
	static public var playModeList:Array<PlayModeData> = 
	[
		new PlayModeData
		({
			name: 'player side',
			cost: 0
		}),
		
		new PlayModeData
		({
			name: 'enemy side',
			cost: 5
		}),

		new PlayModeData
		({
			name: 'auto play',
			cost: 5
		}),

		new PlayModeData
		({
			name: 'music listening',
			cost: 5
		}),
		
	];

	public static function loadPlayMode()
	{
		//@notrace("load playmode: " + FlxG.save.data.playModeId);

		switch (FlxG.save.data.playModeId)
		{
			case 0:
				FlxG.save.data.musicListening = false;
				FlxG.save.data.botplay = false;
				GameState.playAsDad = false;

			case 1:
				FlxG.save.data.musicListening = false;
				FlxG.save.data.botplay = false;
				GameState.playAsDad = true;

			case 2:
				FlxG.save.data.musicListening = false;
				FlxG.save.data.botplay = true;
				GameState.playAsDad = false;

			case 3:
				FlxG.save.data.botplay = true;
				FlxG.save.data.musicListening = true;
				GameState.playAsDad = false;

		}

	}

}