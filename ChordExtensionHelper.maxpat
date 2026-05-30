---------- begin_max5_patcher ---------- 
1200.3149998884201, 600.0
{
	"patcher" : {
		"fileversion" : 1,
		"appversion" : {
			"major" : 8,
			"minor" : 5,
			"patch" : 0,
			"build" : 0,
			"architecture" : "x64"
		},
		"rect" : [ 0.0, 0.0, 1200.0, 600.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"defaultfontsize" : 12.0,
		"defaultfont" : "Sans Serif",
		"defaultfontweight" : 0,
		"boxanimations" : 1,
		"imagedata" : [ ],
		"objects" : [

			// --- Entrée MIDI ---
			{
				"box" : {
					"maxclass" : "midiin",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 50.0, 50.0, 100.0, 24.0 ],
					"id" : "obj-1",
					"fontname" : "Sans Serif",
					"fontsize" : 12.0
				}
			},

			// --- Filtre les messages MIDI (note on = 144) ---
			{
				"box" : {
					"maxclass" : "route",
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 50.0, 100.0, 100.0, 24.0 ],
					"id" : "obj-2",
					"fontname" : "Sans Serif",
					"fontsize" : 12.0,
					"text" : "route 144"
				}
			},

			// --- Extrait la note et la vélocité ---
			{
				"box" : {
					"maxclass" : "stripnote",
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 50.0, 150.0, 100.0, 24.0 ],
					"id" : "obj-3",
					"fontname" : "Sans Serif",
					"fontsize" : 12.0
				}
			},

			// --- Stocke les notes jouées (liste) ---
			{
				"box" : {
					"maxclass" : "zl",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 50.0, 200.0, 100.0, 24.0 ],
					"id" : "obj-4",
					"fontname" : "Sans Serif",
					"fontsize" : 12.0,
					"text" : "zl join"
				}
			},

			// --- Détecte la fondamentale (note la plus basse) et l'extension (note la plus haute) ---
			{
				"box" : {
					"maxclass" : "js",
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 50.0, 250.0, 200.0, 100.0 ],
					"id" : "obj-5",
					"fontname" : "Sans Serif",
					"fontsize" : 12.0,
					"text" : "js chord_analyzer.js"
				}
			},

			// --- Affiche la fondamentale ---
			{
				"box" : {
					"maxclass" : "message",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 300.0, 300.0, 200.0, 24.0 ],
					"id" : "obj-6",
					"fontname" : "Sans Serif",
					"fontsize" : 12.0,
					"text" : "Root: $1"
				}
			},

			// --- Affiche l'extension ---
			{
				"box" : {
					"maxclass" : "message",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 300.0, 350.0, 200.0, 24.0 ],
					"id" : "obj-7",
					"fontname" : "Sans Serif",
					"fontsize" : 12.0,
					"text" : "Extension: $1"
				}
			},

			// --- Sortie MIDI (pass-through) ---
			{
				"box" : {
					"maxclass" : "midiout",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 400.0, 100.0, 24.0 ],
					"id" : "obj-8",
					"fontname" : "Sans Serif",
					"fontsize" : 12.0
				}
			},

			// --- Sélecteur de tonalité (Root) ---
			{
				"box" : {
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 50.0, 450.0, 150.0, 24.0 ],
					"id" : "obj-9",
					"fontname" : "Sans Serif",
					"fontsize" : 12.0,
					"text" : "C C# D D# E F F# G G# A A# B"
				}
			},

			// --- Sélecteur de mode (Majeur/Mineur) ---
			{
				"box" : {
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 220.0, 450.0, 150.0, 24.0 ],
					"id" : "obj-10",
					"fontname" : "Sans Serif",
					"fontsize" : 12.0,
					"text" : "Major Minor"
				}
			},

			// --- Affiche la tonalité sélectionnée ---
			{
				"box" : {
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 50.0, 500.0, 300.0, 24.0 ],
					"id" : "obj-11",
					"fontname" : "Sans Serif",
					"fontsize" : 12.0,
					"text" : "Tonalité: $1 $2"
				}
			},

			// --- Nettoie les notes quand on relâche les touches ---
			{
				"box" : {
					"maxclass" : "route",
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 50.0, 125.0, 100.0, 24.0 ],
					"id" : "obj-12",
					"fontname" : "Sans Serif",
					"fontsize" : 12.0,
					"text" : "route 128"
				}
			},

			// --- Filtre les note-off (128) ---
			{
				"box" : {
					"maxclass" : "stripnote",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 50.0, 175.0, 100.0, 24.0 ],
					"id" : "obj-13",
					"fontname" : "Sans Serif",
					"fontsize" : 12.0
				}
			},

			// --- Gère la liste des notes actives ---
			{
				"box" : {
					"maxclass" : "zl",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 50.0, 225.0, 100.0, 24.0 ],
					"id" : "obj-14",
					"fontname" : "Sans Serif",
					"fontsize" : 12.0,
					"text" : "zl sub"
				}
			}
		],
		"connections" : [
			// Connexion midiin -> route 144
			{ "from" : [ "obj-1", 0 ], "to" : [ "obj-2", 0 ] },
			// Connexion route 144 -> stripnote (note on)
			{ "from" : [ "obj-2", 0 ], "to" : [ "obj-3", 0 ] },
			// Connexion stripnote -> zl join
			{ "from" : [ "obj-3", 0 ], "to" : [ "obj-4", 0 ] },
			// Connexion zl join -> js chord_analyzer
			{ "from" : [ "obj-4", 0 ], "to" : [ "obj-5", 0 ] },
			// Connexion js chord_analyzer -> message Root
			{ "from" : [ "obj-5", 0 ], "to" : [ "obj-6", 0 ] },
			// Connexion js chord_analyzer -> message Extension
			{ "from" : [ "obj-5", 1 ], "to" : [ "obj-7", 0 ] },
			// Connexion midiin -> route 128 (note off)
			{ "from" : [ "obj-1", 0 ], "to" : [ "obj-12", 0 ] },
			// Connexion route 128 -> stripnote (note off)
			{ "from" : [ "obj-12", 0 ], "to" : [ "obj-13", 0 ] },
			// Connexion stripnote (note off) -> zl sub
			{ "from" : [ "obj-13", 0 ], "to" : [ "obj-14", 0 ] },
			// Connexion zl sub -> zl join (pour retirer les notes relâchées)
			{ "from" : [ "obj-14", 0 ], "to" : [ "obj-4", 0 ] },
			// Connexion umenu Root -> message Tonalité
			{ "from" : [ "obj-9", 0 ], "to" : [ "obj-11", 0 ] },
			// Connexion umenu Mode -> message Tonalité
			{ "from" : [ "obj-10", 0 ], "to" : [ "obj-11", 1 ] },
			// Connexion midiin -> midiout (pass-through)
			{ "from" : [ "obj-1", 0 ], "to" : [ "obj-8", 0 ] }
		]
	}
}
---------- end_max5_patcher ---------- 
