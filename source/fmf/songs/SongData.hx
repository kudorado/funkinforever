package fmf.songs;


class SongData
{
	public var folder:String;
	public var character:String;
	public var songTitle:String;
	public var songList:Array<String>;

	public var bitmapList:Array<BitmapLoader>;

	public var copySongList(get, never):Array<String>;
	public inline function get_copySongList()
	{
		var copySongs:Array<String> = new Array<String>();

		for (song in songList)
		{
			copySongs.push(song);
		}
		return copySongs;
	}

	public var songIndex(get, never):Int;
	public inline function get_songIndex()
	{
		var index:Int = 0;
		for (song in songList)
		{
			if (song == PlayState.CURRENT_SONG)
				break;

			index++;
		}

		return index;
	}
	
	
	public function new(
		data:
		{
			folder:String,
			character:String,
			songTitle:String,
			songList:Array<String>,
			bitmapList:Array<BitmapLoader>,
		})
	{
		this.folder = data.folder + "/";
		this.character = data.character;
		this.songList = data.songList;
		this.songTitle = data.songTitle;
		this.bitmapList = data.bitmapList;
	}
}
