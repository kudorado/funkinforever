package fmf.songs;



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
				songList: ['Tutorial'],
				bitmapList: []
			}
		),

//-------------------------DADDY DEAREST---------------------
		new SongData
		(
			{
				folder: 'week_es',
				character: 'es',
				songTitle: 'Everyone Sings',
				songList: ['ES-Nerves', "ES-Manifest", "ES-Animal"],
				bitmapList: 
				[
					new BitmapLoader(
					{
						pc: 
						[
							'pc/garcellotired', 'pc/annie', 'pc/playablegf',
							'pc/dad', 'pc/dadangel', 'pc/mom', 'pc/momangel',
							'pc/tricky', 'pc/uganda', 'pc/lila', 'pc/spooky',
							'pc/tom', 'pc/tord', 'pc/guraamelia', 'pc/botan', 'pc/tabi',
							'pc/blantad', 'pc/exgf', 'pc/miku', 'pc/hex', 'pc/pico',
							'pc/nene', 'pc/whitty', 'pc/agoti', 'pc/kapi', 'pc/liz', 'pc/sky',
							'pc/hdsenpai','pc/tankman', 'pc/senpaighosty'
						
						],

						bg: ['bg/annie'],
						gf: []
						
					})
				]
			}
		),

		new SongData
		(
			{
				folder: 'week_nonsense',
				character: 'nonsense',
				songTitle: 'V.S Nonsense',
				songList: ['Common-sense', 'Highlights', 'Context', "Nonsensical"],
				bitmapList: 
				[
					new BitmapLoader
					(
						{
							pc: ['pc/nonsense/nonsense'],
							bg: ['bg/nonsense/Outside', 'bg/nonsense/BACKGROUND'],
							gf: []
						}
					)//,

					// new BitmapLoader
					// {
					// 	pc: ['pc/nonsensetired'],
					// 	bg: ['bg/nonsense'],
					// 	gf: []
					// },

					// new BitmapLoader
					// {
					// 	pc: ['pc/nonsenseangry', 'pc/nonsensemad'],
					// 	bg: ['bg/nonsense'],
					// 	gf: []
					// },

					// new BitmapLoader
					// {
					// 	pc: ['pc/nonsensegod'],
					// 	bg: ['bg/nonsense'],
					// 	gf: []
					// }
				]
			}
		),


		new SongData
		(
			{
				folder: 'week_tabi',
				character: 'tabi',
				songTitle: 'V.S Ex',
				songList: ['My-battle', 'Last-chance', 'Genocide'],
				bitmapList: []
			}
		),
		
		new SongData
		(
			{
				folder: 'week_garcello',
				character: 'garcello',
				songTitle: 'SMOKE EM\' OUT STRUGGLE',
				songList: ['Headache', 'Nerves', 'Release', 'Fading'],
				bitmapList: []

			}
		),

		new SongData
		(
			{
				folder: 'week_whitty',
				character: 'whitty',
				songTitle: 'V.S Whitty',
				songList: ['Lo-fight', 'Overhead', 'Ballistic', 'Remorse'],
				bitmapList: []

			}
		),

		new SongData
		(
			{
				folder: 'week_agoti',
				character: 'agoti',
				songTitle: 'V.S Agoti',
				songList: ['Screenplay', 'Parasite', 'AGOTI', 'Guns', 'Godrays'],
				bitmapList: []

			}
		),
		
		new SongData
		(
			{
				folder: 'week_tricky',
				character: 'tricky',
				songTitle: 'V.S Clown',
				songList: ['Improbable-outset', 'Madness', 'Hellclown', 'Expurgation', 'Reality-bender'],
				bitmapList: []

			}
		),
		
		new SongData
		(
			{
				folder: 'week_trueform',
				character: 'trueform',
				songTitle: 'T.R.U.E.F.A.C.E',
				songList: ['Eeeaaaooo', 'Practice', 'Fool', 'Trap', 'Incident', 'Run'],
				bitmapList: []

			}
		),

		new SongData
		(
			{
				folder: 'week_kapi',
				character: 'kapi',
				songTitle: 'Showdown Arcane',
				songList: ['Wocky', 'Beathoven', 'Nyaw', 'Flatzone'],
				bitmapList: []

			}
		),

		new SongData
		(
			{
				folder: 'week_matt',
				character: 'matt',
				songTitle: 'V.S Matt',
				songList: ['Light-it-up', 'Ruckus', 'Target-practice'],
				bitmapList: []

			}
		),

		new SongData
		(
			{
				folder: 'week_miku',
				character: 'miku',
				songTitle: 'V.S Miku',
				songList: ['Popipo', "Aishite", 'Siu', "Disappearance", 'Chug'],
				bitmapList: []

			}
		),


		new SongData
		(
			{
				folder: 'week_bob',
				character: 'bob',
				songTitle: 'V.S Bob',
				songList: ['Sunshine', 'Withered', 'Run', "Ron", "Trouble", "Onslaught", "Little-man"],
				bitmapList: []

			}
		),

		new SongData
		(
			{
				folder: 'week_hex',
				character: 'hex',
				songTitle: 'V.S Hex',
				songList: ['Dunk', 'Ram', 'Hello-world', 'Glitcher', 'Encore'],
				bitmapList: []

			}
		),

		new SongData
		(
			{
				folder: 'week_mfm',
				character: 'mfm',
				songTitle: 'Mid-Fight Masses',
				songList: ['Parish', 'Worship', "Zavodila", 'Gospel', 'Casanova'],
				bitmapList: []

			}
		),

		new SongData
		(
			{
				folder: 'week_impostor',
				character: 'red',
				songTitle: 'V.S Red Impostor',
				songList: ['Sussus-moogus', 'Sabotage', 'Meltdown'],
				bitmapList: []

			}
		),

		new SongData
		(
			{
				folder: 'week_impostor',
				character: 'green',
				songTitle: 'V.S Green Impostor',
				songList: ['Sussus-toogus', 'Lights-down', 'Reactor', 'Ejected'],
				bitmapList: []

			}
		),

	
		new SongData
		(
			{
				folder: 'week_bab',
				character: 'bab',
				songTitle: 'Bop & Bosip',
				songList: ['Jump-in', 'Swing', 'Split', 'Ronald-McDonal-Slide', 'Jump-out'],
				bitmapList: []

			}
		),


		new SongData
		(
			{
				folder: 'week_entity',
				character: 'daidem',
				songTitle: 'Entity Origins',
				songList: ['Experimental-Phase', 'Perfection'],
				bitmapList: []

			}
		),

		new SongData	
		(
			{
				folder: 'week_sky',
				character: 'sky',
				songTitle: 'V.S Sky',
				songList: ['Wife-forever', 'Sky', 'Manifest'],
				bitmapList: []

			}
		),

	];
//-----------------------------------------------------------

}