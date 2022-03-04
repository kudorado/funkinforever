package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
//This create to filter song
//In case two week have the same song name
//We will create our own filter and this will take business
//Example week Agoti & Entity Origins has same song Parasite
//One of them will name -> ParasiteEntity, and the SongPlayer Manager will execute that
//But the song will load Parasite instead cuz it goes into this filter

class SongFilter
{

	public static function filter(songName:String)
	{
		for (filter in songFilterDatas)
		{
			songName = StringTools.replace(songName.toLowerCase(), filter.key.toLowerCase(), filter.replace.toLowerCase()).toLowerCase();
		}
		return songName.toLowerCase();
	}

	static var songFilterDatas:Array<SongFilterData>  =
	[
		new SongFilterData	
		(
			{
				key: ' ',
				replace: '-'
			}
		),

		new SongFilterData	
		(
			{
				key: '[entity]',
				replace: ''
			}
		),


		new SongFilterData	
		(
			{
				key: 'incident[bi]',
				replace: 'Incident'
			}
		),

		new SongFilterData	
		(
			{
				key: '[trueface]',
				replace: ''
			}
		),

		new SongFilterData	
		(
			{
				key: 'philly-nice',
				replace: 'philly'
			}
		),

		new SongFilterData	
		(
			{
				key: 'dad-battle',
				replace: 'dadbattle'
			}
		),

		new SongFilterData(
			{
				key : 'triple-trouble[sonic]',
				replace: 'triple-trouble'
			}
		),

		new SongFilterData(
			{
				key : 'sunshine[sonic]',
				replace: 'Sunshine'
			}
		),

		new SongFilterData(
			{
				key : 'tutorial[hd]',
				replace: 'Tutorial'
			}
		),
	];

}
