package selection;
import state.*;
import flixel.FlxG;
import fmf.songs.BaseSong;
import fmf.skins.*;


class SkinManager
{
	static public var skinList:Array<SkinData> = 
	[
		new SkinData
		({
			name: 'default',
			cost: 0
		}),

		new SkinData
		({
			name: 'square',
			cost: 1
		}),

		new SkinData
		({
			name: 'ddr',
			cost: 2
		}),

		new SkinData
		({
			name: 'dfjk',
			cost: 2
		}),

		new SkinData
		({
			name: 'text',
			cost: 2
		}),
		
		new SkinData
		({
			name: 'sharp',
			cost: 2
		}),

		new SkinData
		({
			name: 'tabi',
			cost: 3
		}),

		new SkinData
		({
			name: 'trollge',
			cost: 3
		}),

		new SkinData
		({
			name: 'agoti',
			cost: 5
		}),
		
	];

	
	public static function loadSkin(song:BaseSong):Skin
	{
		// load skin
		var skinName:String = SkinManager.skinList[FlxG.save.data.skinId].name;
		var skin:Skin = song.getDefaultSkin();

		switch (skinName.toLowerCase())
		{
			case "agoti":
				skin = new AgotiSkin("agoti");
			case "trollge":
				skin = new TrollgeSkin("trollge");
			case "tabi":
				skin = new TabiSkin("tabi");
			case "gf":
				skin = new GFSkin("gf");
			case "sarv":
				skin = new SarvSkin("sarv");
			case "dark-sarv":
				skin = new DarkSarvSkin("dark-sarv");
			case "ruv":
				skin = new RuvSkin("ruv");
			case "luci-sarv":
				skin = new LuciSarvSkin("luci-sarv");
			case "selever":
				skin = new SeleverSkin("selever");
			case "text":
				skin = new TextSkin('text');
			case "square":
				skin = new SquareSkin('square');
			case "sharp":
				skin = new SharpSkin('sharp');
			case "dfjk":
				skin = new DFJKSkin('dfjk');
			case "ddr":
				skin = new DDRSkin('ddr');

		}

		return new Skin('default');
	}

}