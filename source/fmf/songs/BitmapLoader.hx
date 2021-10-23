package fmf.songs;



class BitmapLoader
{
	public var pc:Array<String>;
	public var bg:Array<String>;
	public var gf:Array<String>;
	

	public function new(
		data:
		{
			pc:Array<String>,
			bg:Array<String>,
			gf:Array<String>,
		})
	{
		this.pc = data.pc;
		this.bg = data.bg;
		this.gf = data.gf;
	}
}
