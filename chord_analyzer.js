// chord_analyzer.js
// Ce script analyse une liste de notes MIDI et détecte :
// - La fondamentale (note la plus basse)
// - L'extension (note la plus haute)
// Sortie : [root, extension]

inlets = 1;  // Entrée : liste de notes MIDI (ex: [60, 64, 67])
outlets = 2; // Sortie : [root, extension]

// Tableau pour convertir les numéros de notes MIDI en noms de notes
var noteNames = [
    "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"
];

function msg_float(n) {
    // Si on reçoit une seule note, on la traite comme une liste
    var notes = [n];
    analyzeNotes(notes);
}

function msg_int(n) {
    // Si on reçoit une seule note, on la traite comme une liste
    var notes = [n];
    analyzeNotes(notes);
}

function list() {
    // Reçoit une liste de notes MIDI (ex: [60, 64, 67])
    var notes = arrayfromargs(arguments);
    analyzeNotes(notes);
}

function analyzeNotes(notes) {
    if (notes.length === 0) {
        // Aucune note : on réinitialise l'affichage
        outlet(0, "-");
        outlet(1, "-");
        return;
    }

    // Trouver la note la plus basse (fondamentale)
    var root = Math.min.apply(null, notes);
    
    // Trouver la note la plus haute (extension)
    var extension = Math.max.apply(null, notes);

    // Convertir les numéros MIDI en noms de notes + octave
    var rootName = midiToNoteName(root);
    var extensionName = midiToNoteName(extension);

    // Envoyer les résultats
    outlet(0, rootName);
    outlet(1, extensionName);
}

// Convertit un numéro MIDI en nom de note (ex: 60 -> "C3")
function midiToNoteName(midiNote) {
    var noteIndex = midiNote % 12;
    var octave = Math.floor(midiNote / 12) - 1; // Octave 0 = C-1, Octave 1 = C0, etc.
    return noteNames[noteIndex] + octave;
}
