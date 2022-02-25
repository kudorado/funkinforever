package selection;

import fmf.songs.BaseSong;
import flixel.FlxSubState;
import flixel.FlxG;
import fmf.songs.BaseSong;
import fmf.characters.*;


class PcManager
{
	static public var pcList:Array<PcData> = 
	[
		new PcData
		({
			name: 'boyfriend',
			cost: 0
		}),
		
		new PcData
		({
			name: 'pico',
			cost: 0
		}),

		new PcData
		({
			name: 'spooky',
			cost: 0
		}),
		
		new PcData
		({
			name: 'mom',
			cost: 1
		}),
		
		new PcData
		({
			name: 'dad',
			cost: 1
		}),

		new PcData
		({
			name: 'little man',
			cost: 1
		}),
		
		new PcData
		({
			name: 'iimarky',
			cost: 1
		}),

		new PcData
		({
			name: 'kaique',
			cost: 1
		}),

		new PcData
		({
			name: 'garcello',
			cost: 1
		}),

		new PcData
		({
			name: 'garcello tired',
			cost: 1
		}),

		new PcData
		({
			name: 'garcello dead',
			cost: 1
		}),

		new PcData
		({
			name: 'garcello ghosty',
			cost: 1
		}),

		new PcData
		({
			name: 'tricky mask',
			cost: 1
		}),

		new PcData
		({
			name: 'tricky', 
			cost: 1
		}),

		new PcData
		({
			name: 'tricky hell',
			cost: 1
		}),

		new PcData
		({
			name: 'tricky ex',
			cost: 1
		}),

		new PcData
		({
			name: 'tricky ben',
			cost: 1
		}),

		new PcData
		({
			name: 'agoti',
			cost: 1
		}),

		new PcData
		({
			name: 'agoti crazy',
			cost: 1
		}),

		new PcData
		({
			name: 'whitty',
			cost: 1
		}),

		new PcData
		({
			name: 'whitty crazy',
			cost: 1
		}),


		new PcData
		({
			name: 'gs boyfriend',
			cost: 1
		}),

		new PcData
		({
			name: 'kaity',
			cost: 1
		}),

		new PcData
		({
			name: 'gs pico',
			cost: 1
		}),

		new PcData
		({
			name: 'dad angel',
			cost: 1
		}),

		new PcData
		({
			name: 'mom angel',
			cost: 1
		}),

		new PcData
		({
			name: 'corrupted lemon',
			cost: 1
		}),


		new PcData
		({
			name: 'mom christmas',
			cost: 1
		}),
		
		new PcData
		({
			name: 'dad christmas',
			cost: 1
		}),

		new PcData
		({
			name: 'tabi',
			cost: 1
		}),

		new PcData
		({
			name: 'tabi mad',
			cost: 1
		}),

		new PcData
		({
			name: 'sarvente',
			cost: 1
		}),

		new PcData
		({
			name: 'ruv',
			cost: 1
		}),

		new PcData
		({
			name: 'luci sarv',
			cost: 1
		}),

		new PcData
		({
			name: 'selever',
			cost: 1
		}),

		new PcData
		({
			name: 'playable gf',
			cost: 1
		}),

		new PcData
		({
			name: 'mad gf',
			cost: 1
		}),

		new PcData
		({
			name: 'ex gf',
			cost: 1
		}),

		
		new PcData
		({
			name: 'nene',
			cost: 1
		}),

		new PcData
		({
			name: 'liz',
			cost: 1
		}),

		new PcData
		({
			name: 'tankman',
			cost: 1
		}),

		new PcData
		({
			name: 'annie',
			cost: 1
		}),

		new PcData
		({
			name: 'drunk annie',
			cost: 1
		}),

		new PcData
		({
			name: 'tom',
			cost: 1
		}),

		new PcData
		({
			name: 'tord',
			cost: 1
		}),

		new PcData
		({
			name: 'miku',
			cost: 1
		}),

		new PcData
		({
			name: 'miku mad',
			cost: 1
		}),

		new PcData
		({
			name: 'sky',
			cost: 1
		}),


		new PcData
		({
			name: 'sky tired',
			cost: 1
		}),


		new PcData
		({
			name: 'sky angry',
			cost: 1
		}),

		new PcData
		({
			name: 'sky mad',
			cost: 1
		}),

		new PcData
		({
			name: 'monika',
			cost: 1
		}),

		new PcData
		({
			name: 'hd senpai',
			cost: 1
		}),
		
		new PcData
		({
			name: 'senpai ghosty',
			cost: 1
		}),

		new PcData
		({
			name: 'common',
			cost: 1
		}),

		new PcData
		({
			name: 'tired',
			cost: 1
		}),

		new PcData({
			name: 'angry',
			cost: 1
		}),

		new PcData({
			name: 'mad',
			cost: 1
		}),

		new PcData({
			name: 'nonsense',
			cost: 1
		}),

		new PcData
		({
			name: 'carol',
			cost: 1
		}),

		new PcData
		({
			name: 'sunday',
			cost: 1
		}),

		new PcData
		({
			name: 'gura amelia',
			cost: 1
		}),

		new PcData
		({
			name: 'botan',
			cost: 1
		}),

		new PcData
		({
			name: 'pompom',
			cost: 1
		}),

		new PcData
		({
			name: 'roro',
			cost: 1
		}),

				
		new PcData
		({
			name: 'anchor',
			cost: 1
		}),

		new PcData
		({
			name: 'kapi',
			cost: 1
		}),

		new PcData
		({
			name: 'hex',
			cost: 1
		}),
		
		new PcData
		({
			name: 'blantad',
			cost: 1
		}),
		
		new PcData
		({
			name: 'lila',
			cost: 1
		}),

		new PcData
		({
			name: 'brother',
			cost: 1
		}),

		new PcData
		({
			name: 'monster',
			cost: 1
		}),


		new PcData
		({
			name: 'frisk',
			cost: 1
		}),

		new PcData
		({
			name: 'matt',
			cost: 1
		}),

		new PcData
		({
			name: 'chara',
			cost: 1
		}),

		new PcData
		({
			name: 'sans',
			cost: 1
		}),


		new PcData
		({
			name: 'bf pibby',
			cost: 1
		}),



	];

	public static function getPc(pcName:String):PlayableCharacter
	{
		switch (pcName.toLowerCase())
		{
			case "pico":
				return new Pico(750, 400);

			case "mom":
				return new Mommy();

			case "mom angel":
				return new MomAngel(800, 125);

			case 'mom christmas':
			return new MomChristmas(700, 415);

			case 'dad christmas':
				return new DadChristmas(625, 375);

			case 'corrupted lemon':
				return new CorruptedLemon(750, 400);

			case "dad":
				return new Daddy(700, 150);

			case "dad angel":
				return new DadAngel(750, 120);

			case "iimarky":
				return new IIMarky(700, 425);

			case "kaique":
				return new Kaique(700, 510);

			case 'little man':
				return new Littleman(800, 725);

			case 'ruv':
				return new RuvSus(675, 150, 'ruv');

			case 'sarvente':
				return new Sarv(650, 175);

			case 'lazy cat':
				return new Lazycat(700, 750);

			case 'tabi':
				return new TabiSus(650, 255);
			
			case 'tabi mad':
				return new TabiMadSus(775, 135);

			case 'garcello':
				return new GarcelloSus(750, 175);

			case 'garcello tired':
				return new GarcelloTiredSus(750, 175);

			case 'garcello dead':
				return new GarcelloDeadSus(750, 175);
				
			case 'garcello ghosty':
				return new GarcelloGhostySus(750, 175);

			case 'tricky mask':
				return new TikyMask(675, 360);

			case 'tricky':
				return new Tiky(750, 525);

			case 'tricky hell':
				return new TikyHell(1000, 0);

			case 'tricky ex':
				return new TikyEx(650, 290);

			case 'tricky ben':
				return new TikyBen(900, -230);

			case 'agoti':
				return new AgotiSus(800, 460);

			case 'agoti crazy':
				return new AgotiCrazySus(750, 260);

			case 'whitty':
				return new WhittySus(700, 115);

			case 'whitty crazy':
				return new WhittyCrazySus(700, 175);

			case 'gs boyfriend': 
				return new GSBoyfriend(700, 450);

			case 'gs pico': 
				return new GSPico(700, 360);

			case 'kaity':
				return new Kaity(750, 400);

			case 'playable gf':
				return new GFSus(700, 425);

			case 'tord':
				return new TordSus(700, 375);
			
			case 'botan':
				return new Botan(800, 375);
					
			case 'blantad':
				return new Blantad(775, 200);
			
			case 'ex gf':
				return new ExGF(700, 325);

			case 'hex':
				return new Hex(750, 200);
			
			case 'nene':
				return new NeneSus(700, 350);

			case 'liz':
				return new LizSus(700, 425);

			case 'tankman':
				return new Tankman(700, 300);

			case 'spooky':
				return new SpookySus(700, 375);

			case 'lila':
				return new LilaSus();

			case 'annie':
				return new AnnieSus(675, 375);

			case 'tom':
				return new TomSus();

			case 'miku':
				return new MikuSus();

			case 'sky':
				return new SkySus(650, 300);

			case 'sky tired':
				return new SkyTiredSus(700, 300);

			case 'sky angry':
				return new SkyAngrySus(700, 300);

			case 'sky mad':
				return new SkyMadSus(700, 300);

			case 'hd senpai':
				return new HDSenpaiMadSus();
			
			case 'senpai ghosty':
				return new SenpaiGhostySus();

			case 'brother':
				return new BrotherSus(700, 150);

			case 'carol':
				return new CarolSus(700, 350);
			
			case 'chara':
				return new CharaSus(675, 400);

			case 'drunk annie':
				return new DrunkAnnieSus(625, 250);

			case 'gura amelia':
				return new GuraAmeliaSus(625, 275);

			case 'pompom':
				return new PompomSus(800, 325);
			
			case 'roro':
				return new RoroSus();

			case 'monika':
				return new MonikaSus(850, 550);

			case 'selever':
				return new SeleverSus();

			case 'sunday':
				return new SundaySus(650, 85);

			case 'miku mad':
				return new MikuMadSus(700, 150);

			case 'sans':
				return new SansSus(515, 150);

			case 'anchor':
				return new Anchor();

			case 'kapi':
				return new KapiSus(700, 350);

			case 'mad gf':
				return new GFMadSus(700, 300);

			case 'luci sarv':
				return new LuciSarvSus(700, 0);

			case 'matt':
				return new MattSus(800, 400);

			case 'monster':
				return new MonsterSus(700, 250);

			case 'frisk':
				return new FriskSus(700, 500);

			case 'common':
				return new NonsenseSus();

			case 'tired':
				return new NonsenseTiredSus();

			case 'angry':
				return new NonsenseAngrySus();

			case 'mad':
				return new NonsenseMadSus();

			case 'nonsense':
				return new NonsenseGodSus(700, 0);

			case 'glitchhallway':
				return new Glitchhallway(700, 0);

			case 'whitty simp':
				return new WhittySimp();

			case 'bf trollge':
				return new BFTrollge();

			case 'whittysimp dance':
				return new WhittySimpDance();

			case 'sonic_ssbf':
				return new SSBF(700, 425);

			case 'bf_dark':
				return new BF_Dark(700, 425);

			case 'bf pibby':
				return new BFPibby(700, 425);

			case 'bf_pixel':
				return new BfPixel(700, 425);
				
			case 'bf_ddlc':
				return new DDLCBoyFriend(700, 425);

			case 'bf tabi':
				return new BFTabi(812, 449);

			case 'bf tabimad':
				return new BFTabiMad(486, 449);

			case 'bf glow':
				return new BFGlow(914, 989);

			case 'bf simp':
				return new BFSimp(700 + 879, 425 + 364);

			case 'bf boxing':
				return new BFBoxing(848, 401);

			case 'bf ram':
				return new BFRam(760, 274);

			case 'bf night':
				return new	 BFNight(760, 274);
		
			case 'bf glitcher':
				return new BFGlitcher(760, 274);

			case 'bf tiky':
				return new BFTiky(800, 475);

			case 'bf tikyben':
				return new BFTikyBen(815, 510);

			case 'bf ghost':
				return new BFGhost(796, 473);

			case 'bf origin':
				return new BFOrigin(547, 526);

			case 'bf r':
				return new BFR(850, 475);

			case 'bf fly':
				return new BFFly(850, 425 + 350);

			case 'bfgf':
				return new BFGF(700 + 913, 425 - 112);
		
			case 'bfgf rgb':
				return new BFGFRGB(700 + 913, 425 - 112);
	

		}

		return new Boyfriend(700, 425); 

	}

	public static function loadPc(song:BaseSong):Character
	{
		var pcName:String = PcManager.pcList[FlxG.save.data.pcId].name;

		var pc = getPc(pcName);
        var defaultPc = Type.getClassName(Type.getClass(pc));

		//@notrace("pc: " + defaultPc);

		return defaultPc.toLowerCase() != "fmf.characters.boyfriend" ? pc : song.getDefaultPc();

	}

}
