package fmf.songs;



class SongFilterData
{
	public var key:String;
	public var replace:String;

	public function new(
		filter:
		{
			key:String,
			replace:String,
		})
	{
		this.key = filter.key;
		this.replace = filter.replace;
	}
}
