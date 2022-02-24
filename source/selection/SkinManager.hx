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
	
		


		new SkinData
		({
			name: 'aberration',
			cost: 3
		}),

		new SkinData
		({
			name: 'circle-classic',
			cost: 5
		}),
		new SkinData
		({
			name: 'circleglow',
			cost: 3
		}),

		new SkinData
		({
			name: 'ae_dark',
			cost: 5
		}),
		new SkinData
		({
			name: 'ae_freezing',
			cost: 3
		}),

		new SkinData
		({
			name: 'ae_glow_splash',
			cost: 5
		}),
		new SkinData
		({
			name: 'ae_hellbeats',
			cost: 3
		}),

		new SkinData
		({
			name: 'ae_low_contrast',
			cost: 5
		}),
		new SkinData
		({
			name: 'rectangle',
			cost: 3
		}),

		new SkinData
		({
			name: 'ae_shadow',
			cost: 5
		}),
		new SkinData
		({
			name: 'shinning',
			cost: 3
		}),

		new SkinData
		({
			name: 'ae_shinning_metal',
			cost: 5
		}),
		new SkinData
		({
			name: 'sm',
			cost: 3
		}),

		new SkinData
		({
			name: 'soft_bright',
			cost: 5
		}),
	
		
		new SkinData
		({
			name: 'ae_shinning_metal',
			cost: 5
		}),
		new SkinData
		({
			name: 'sm',
			cost: 3
		}),

		new SkinData
		({
			name: 'soft_bright',
			cost: 5
		}),
		

		new SkinData
		({
			name: 'synthwave',
			cost: 5
		}),
		new SkinData
		({
			name: 'ae_transparent',
			cost: 3
		}),

		new SkinData
		({
			name: 'ae_triangle',
			cost: 5
		}),
		
		new SkinData
		({
			name: 'variant',
			cost: 5
		})
		

		
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

			case 'circle-classic':
				skin = new CircleClassicSkin('circle-classic');

			case 'circleglow':
				skin = new CircleGlowSkin('circleglow');

			case 'ae_dark':
				skin = new DarkSkin('ae_dark');

			case 'ae_freezing':
				skin = new AEFreezingSkin('ae_freezing');

			case 'ae_glow_splash':
				skin = new AEGlowSplashSkin('ae_glow_splash');

			case 'ae_hellbeats':
				skin = new AEHellBeatsSkin('ae_hellbeats');

			case 'ae_low_contrast':
				skin = new AELowContrastSkin('ae_low_contrast');

			case 'rectangle':
				skin = new RectangleSkin('rectangle');

			case 'ae_shadow':
				skin = new AEShadowSkin('ae_shadow');

			case 'shinning':
				skin = new ShinningSkin('shinning');

			case 'ae_shinning_metal':
				skin = new AEShinningMetalSkin('ae_shinning_metal');

			case 'sm':
				skin = new SMSkin('sm');

			case 'soft_bright':
				skin = new SoftBrightSkin('soft_bright');

			case 'synthwave':
				skin = new SynthwaveSkin('synthwave');

			case 'ae_transparent':
				skin = new AETransparentSkin('ae_transparent');

			case 'ae_triangle':
				skin = new AETriangleSkin('ae_triangle');

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

			case 'circle_classic':
				skin = new CircleClassicSkin('circle_classic');

			case 'circle':
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

		}

		return skin;
	}

}