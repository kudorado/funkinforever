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
				songList: ['Tutorial']
			}
		),

//-------------------------DADDY DEAREST---------------------
		new SongData
		(
			{
				folder: 'week_es',
				character: 'es',
				songTitle: 'Everyone Sings',
				songList: ['ES-Nerves', "ES-Manifest", "ES-Animal"]
			}
		),

		new SongData
		(
			{
				folder: 'week_nonsense',
				character: 'nonsense',
				songTitle: 'V.S Nonsense',
				songList: ['Common-sense', 'Highlights', 'Context', "Nonsensical"]
			}
		),


		new SongData
		(
			{
				folder: 'week_tabi',
				character: 'tabi',
				songTitle: 'V.S Ex',
				songList: ['My-battle', 'Last-chance', 'Genocide']
			}
		),
		
		new SongData
		(
			{
				folder: 'week_garcello',
				character: 'garcello',
				songTitle: 'SMOKE EM\' OUT STRUGGLE',
				songList: ['Headache', 'Nerves', 'Release', 'Fading']
			}
		),

		new SongData
		(
			{
				folder: 'week_whitty',
				character: 'whitty',
				songTitle: 'V.S Whitty',
				songList: ['Lo-fight', 'Overhead', 'Ballistic', 'Remorse']
			}
		),

		new SongData
		(
			{
				folder: 'week_agoti',
				character: 'agoti',
				songTitle: 'V.S Agoti',
				songList: ['Screenplay', 'Parasite', 'AGOTI', 'Guns', 'Godrays']
			}
		),
		
		new SongData
		(
			{
				folder: 'week_tricky',
				character: 'tricky',
				songTitle: 'V.S Clown',
				songList: ['Improbable-outset', 'Madness', 'Hellclown', 'Expurgation', 'Reality-bender']
			}
		),
		
		new SongData
		(
			{
				folder: 'week_trueform',
				character: 'trueform',
				songTitle: 'T.R.U.E.F.A.C.E',
				songList: ['Eeeaaaooo', 'Practice', 'Fool', 'Trap', 'Incident', 'Run']
			}
		),

		new SongData
		(
			{
				folder: 'week_kapi',
				character: 'kapi',
				songTitle: 'Showdown Arcane',
				songList: ['Wocky', 'Beathoven', 'Nyaw', 'Flatzone']
			}
		),

		new SongData
		(
			{
				folder: 'week_matt',
				character: 'matt',
				songTitle: 'V.S Matt',
				songList: ['Light-it-up', 'Ruckus', 'Target-practice']
			}
		),

		new SongData
		(
			{
				folder: 'week_miku',
				character: 'miku',
				songTitle: 'V.S Miku',
				songList: ['Popipo', "Aishite", 'Siu', "Disappearance", 'Chug']
			}
		),


		new SongData
		(
			{
				folder: 'week_bob',
				character: 'bob',
				songTitle: 'V.S Bob',
				songList: ['Sunshine', 'Withered', 'Run', "Ron", "Trouble", "Onslaught", "Little-man"]
			}
		),

		new SongData
		(
			{
				folder: 'week_hex',
				character: 'hex',
				songTitle: 'V.S Hex',
				songList: ['Dunk', 'Ram', 'Hello-world', 'Glitcher', 'Encore']
			}
		),

		new SongData
		(
			{
				folder: 'week_mfm',
				character: 'mfm',
				songTitle: 'Mid-Fight Masses',
				songList: ['Parish', 'Worship', "Zavodila", 'Gospel', 'Casanova']
			}
		),

		new SongData
		(
			{
				folder: 'week_impostor',
				character: 'red',
				songTitle: 'V.S Red Impostor',
				songList: ['Sussus-moogus', 'Sabotage', 'Meltdown']
			}
		),

		new SongData
		(
			{
				folder: 'week_impostor',
				character: 'green',
				songTitle: 'V.S Green Impostor',
				songList: ['Sussus-toogus', 'Lights-down', 'Reactor', 'Ejected']
			}
		),

	
		new SongData
		(
			{
				folder: 'week_bab',
				character: 'bab',
				songTitle: 'Bop & Bosip',
				songList: ['Jump-in', 'Swing', 'Split', 'Ronald-McDonald-Slide', 'Jump-out']
			}
		),


		new SongData
		(
			{
				folder: 'week_entity',
				character: 'daidem',
				songTitle: 'Entity Origins',
				songList: ['Experimental-Phase', 'Perfection']
			}
		),

		new SongData	
		(
			{
				folder: 'week_sky',
				character: 'sky',
				songTitle: 'V.S Sky',
				songList: ['Wife-forever', 'Sky', 'Manifest']
			}
		),

		new SongData	
		(
			{
				folder: 'week_qt',
				character: 'qt',
				songTitle: 'V.S QT',
				songList: ['Carefree', 'Careless', 'Censory-overload','Termination']
			}
		),

		new SongData	
		(
			{
				folder: 'week_date',
				character: 'the_date',
				songTitle: 'The Date',
				songList: ['Whitroll', 'Perfume', 'Heartbass']
			}
		),

		new SongData	
		(
			{
				folder: 'week_zardy',
				character: 'zardy',
				songTitle: 'V.S Zardy',
				songList: ['Bushwhack', 'Foolhardy']
			}
		),

		new SongData	
		(
			{
				folder: 'week_sonic',
				character: 'sonic',
				songTitle: 'V.S Sonic.exe',
				songList: ['Too-Slow', 'Endless', 'Execution']
			}
		),

		new SongData	
		(
			{
				folder: 'week_eteled',
				character: 'eteled',
				songTitle: 'V.S Eteled',
				songList: ['dream-of-peace', 'diagraphephobia', 'post-mortal', 'plaything', 'system-failure']
			}
		),

		new SongData	
		(
			{
				folder: 'week_annie',
				character: 'annie',
				songTitle: 'V.S Annie',
				songList: ['Good-enough', 'Lover', 'Tug-of-war', 'Animal']
			}
		)

		// new SongData	
		// (
		// 	{
		// 		folder: 'week_entity_origins',
		// 		character: 'entityorigins',
		// 		songTitle: 'V.S Entity Origins',
		// 		songList: ['Experimental-Phase', 'Perfection']
		// 	}
		// ),
	];
//-----------------------------------------------------------

}