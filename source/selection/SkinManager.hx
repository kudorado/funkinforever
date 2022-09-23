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
		// new SkinData
		// ({
		// 	name: 'aberration',
		// 	cost: 3
		// }),

		// new SkinData
		// ({
		// 	name: 'circle_classic',
		// 	cost: 5
		// }),

		// new SkinData
		// ({
		// 	name: 'circle',
		// 	cost: 5
		// }),
	
		// new SkinData
		// ({
		// 	name: 'dark',
		// 	cost: 5
		// }),
		// new SkinData
		// ({
		// 	name: 'freezing',
		// 	cost: 3
		// }),

		// new SkinData
		// ({
		// 	name: 'glow_splash',
		// 	cost: 5
		// }),
		// new SkinData
		// ({
		// 	name: 'hellbeats',
		// 	cost: 3
		// }),

		// new SkinData
		// ({
		// 	name: 'low_contrast',
		// 	cost: 5
		// }),

		// new SkinData
		// ({
		// 	name: 'shadow',
		// 	cost: 5
		// }),

		// new SkinData
		// ({
		// 	name: 'shinning_metal',
		// 	cost: 5
		// }),

		// new SkinData
		// ({
		// 	name: 'synthwave',
		// 	cost: 5
		// }),
		// new SkinData
		// ({
		// 	name: 'transparent',
		// 	cost: 3
		// }),

		// new SkinData
		// ({
		// 	name: 'triangle',
		// 	cost: 5
		// }),
		
		// new SkinData
		// ({
		// 	name: 'variant',
		// 	cost: 5
		// }),

		// new SkinData
		// ({
		// 	name: 'blood',
		// 	cost: 5
		// }),
		// new SkinData
		// ({
		// 	name: 'bob',
		// 	cost: 3
		// }),

		// new SkinData
		// ({
		// 	name: 'bobonslaught',
		// 	cost: 5
		// }),
		
		// new SkinData
		// ({
		// 	name: 'chasm',
		// 	cost: 5
		// }),
		
		// new SkinData
		// ({
		// 	name: 'garcello',
		// 	cost: 5
		// }),
		
		// new SkinData
		// ({
		// 	name: 'grunt',
		// 	cost: 5
		// }),
		
		// new SkinData
		// ({
		// 	name: 'hellfire',
		// 	cost: 5
		// }),
		
		// new SkinData({
		// 	name: 'matt',
		// 	cost: 5
		// }),

		// new SkinData({
		// 	name: 'ron',
		// 	cost: 5
		// }),

		// new SkinData({
		// 	name: 'whitty',
		// 	cost: 5
		// }),
		
		// new SkinData
		// ({
		// 	name: 'whitty_crazy',
		// 	cost: 5
		// }),
		
		// new SkinData
		// ({
		// 	name: 'ng',
		// 	cost: 5
		// }),

		// new SkinData
		// ({
		// 	name: 'sadness',
		// 	cost: 5
		// }),
			
		// new SkinData
		// ({
		// 	name: 'little smol',
		// 	cost: 5
		// }),
		
		// new SkinData
		// ({
		// 	name: 'tiky angry',
		// 	cost: 5
		// }),

		// new SkinData
		// ({
		// 	name: 'tiky hell',
		// 	cost: 5
		// }),

		// new SkinData
		// ({
		// 	name: 'tiky ex',
		// 	cost: 5
		// }),

	
		// new SkinData
		// ({
		// 	name: 'sussy',
		// 	cost: 5
		// })
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

			case 'aberration':
				skin = new AberrationSkin('aberration');

			case 'circle_classic':
				skin = new CircleClassicSkin('circle_classic');

			case 'circle':
				skin = new CircleSkin('circleglow');

			case 'dark':
				skin = new DarkSkin('dark');

			case 'freezing':
				skin = new AEFreezingSkin('freezing');

			case 'glow_splash':
				skin = new AEGlowSplashSkin('glow_splash');

			case 'hellbeats':
				skin = new AEHellBeatsSkin('hellbeats');

			case 'low_contrast':
				skin = new AELowContrastSkin('low_contrast');

			case 'rectangle':
				skin = new RectangleSkin('rectangle');

			case 'shadow':
				skin = new AEShadowSkin('shadow');

			case 'shinning':
				skin = new ShinningSkin('shinning');

			case 'shinning_metal':
				skin = new AEShinningMetalSkin('shinning_metal');

			case 'sm':
				skin = new SMSkin('sm');

			case 'soft_bright':
				skin = new SoftBrightSkin('soft_bright');

			case 'synthwave':
				skin = new AESynthwaveSkin('synthwave');

			case 'transparent':
				skin = new AETransparentSkin('transparent');

			case 'triangle':
				skin = new AETriangleSkin('triangle');

			case 'variant':
				skin = new VariantSkin('variant');

			case 'blood':
				skin = new BloodSkin('blood');
				
			case 'bob':
				skin = new BobSkin('bob');

			case 'bobonslaught':
				skin = new BobOnslaughtSkin('bobonslaught');

			case 'chasm':
				skin = new ChasmSkin('chasm');

			case 'circle_glow':
				skin = new CircleSkin('circle');

			case 'garcello':
				skin = new GarcelloSkin('garcello');

			case 'grunt':
				skin = new GruntSkin('grunt');
				
				
			case 'hellfire':
				skin = new HellfireSkin('hellfire');
												
			case 'matt':
				skin = new MattSkin('matt');

			case 'ron':
				skin = new RonSkin('ron');

			case 'whitty_crazy':
				skin = new WhittyCrazySkin('whitty_crazy');

			case 'whitty':
				skin = new WhittySkin('whitty');

			case 'pixel':
				skin = new PixelSkin('pixel');

			case 'ng':
				skin = new NGSkin('ng');

			case 'sadness':
				skin = new SadnessSkin();

			case 'little smol':
				skin = new LittleSmolSkin();

			case 'tiky angry':
				skin = new TikyAngrySkin();

			case 'tiky hell':
				skin = new TikyBigSkin();

			case 'tiky ex':
				skin = new TikyBlackSkin();

			case 'sussy':
				skin = new SussySkin();


		
		}

		return skin;
	}

}