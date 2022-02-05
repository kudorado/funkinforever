package fmf.songs;
import reactor.*;
import ui.*;

import state.*;


//this class with manager songs data
class SongManager
{


	static public var songs:Array<SongData> = 
	[
//-------------------------TUTORIAL--------------------------
		
		new SongData
		(
			{
				folder: 'week_tutorial',
				character: 'gf',
				songTitle: 'How to Funk',
				songList: ['Tutorial']
			}
		),

		new SongData	
		(
			{
				folder: 'week_huggywuggy',
				character: 'huggy',
				songTitle: 'V.S Huggy Wuggy',
				songList: ['Playtime']
			}
		),

		new SongData
		(
			{
				folder: 'week_tails',
				character: 'tails',
				songTitle: 'V.S Tails EXE',
				songList: ['Chasing', 'Darkness', 'Sidekick', 'Octane']
			}
		),

		new SongData
		(
			{
				folder: 'week_hank',
				character: 'hank',
				songTitle: 'V.S Hank',
				songList: ['Accelerant']
			}
		),
	];
//-----------------------------------------------------------

}