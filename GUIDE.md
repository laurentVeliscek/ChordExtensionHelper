# Guide d'Utilisation - ChordExtensionHelper

Ce guide explique comment **utiliser et modifier** le prototype Max for Live pour analyser les extensions d'accords.

---

## 📥 **Installation et Utilisation**

### 1. **Télécharger le Patch**
- Téléchargez le fichier [`ChordExtensionHelper.maxpat`](ChordExtensionHelper.maxpat) depuis ce dépôt.
- **Option 1** : Double-cliquez sur le fichier pour l'ouvrir dans Max/MSP.
- **Option 2** : Dans Ableton Live, glissez-déposez le fichier dans une **piste MIDI** ou un **rack MIDI**.

---

### 2. **Utilisation dans Ableton Live**
1. **Ouvrez Ableton Live** (version Suite requise pour Max for Live).
2. **Créez une nouvelle piste MIDI** ou utilisez-en une existante.
3. **Glissez-déposez** le fichier `ChordExtensionHelper.maxpat` dans la piste.
4. **Jouez des notes** depuis :
   - Un **contrôleur MIDI** (clavier, pad, etc.).
   - Un **clip MIDI** dans la session.
   - Un **instrument virtuel** (ex: Operator, Analog).

---

### 3. **Interpréter les Résultats**
- **Root (Fondamentale)** : La note la plus basse jouée (ex: `C3`).
- **Extension** : La note la plus haute jouée (ex: `G4`).
- **Tonalité** : La tonalité de référence sélectionnée (ex: `C Major`).

**Exemple** :
- Si vous jouez les notes **C3**, **E3**, **G3**, **B3** (accord de Cmaj7) :
  - **Root** : `C3` (fondamentale).
  - **Extension** : `B3` (7e majeure).

---

## 🛠️ **Modifier le Patch**

### 1. **Ouvrir le Patch dans Max**
- Double-cliquez sur le device dans Ableton Live pour l'ouvrir dans l'éditeur Max.
- Ou ouvrez directement le fichier `.maxpat` avec Max/MSP.

### 2. **Comprendre la Structure**
Le patch est organisé comme suit :

```
Entrée MIDI
    │
    ▼
[route 144] ─────► [stripnote] ─────► [zl join] ─────► [js chord_analyzer.js]
    │                                                                 │
    ▼                                                                 ▼
[route 128] ─────► [stripnote] ─────► [zl sub] ─────────► [zl join]
                                                                     │
                                                                     ▼
                                 [message "Root: $1"] ─────► Affichage
                                 [message "Extension: $1"]
```

- **`midiin`** : Reçoit les messages MIDI.
- **`route 144`** : Filtre les messages "Note On" (144 = note allumée).
- **`route 128`** : Filtre les messages "Note Off" (128 = note éteinte).
- **`stripnote`** : Extrait le numéro de note MIDI (ex: 60 pour C3).
- **`zl join`** : Stocke les notes actives dans une liste.
- **`zl sub`** : Retire les notes relâchées de la liste.
- **`js chord_analyzer.js`** : Analyse la liste des notes pour détecter la fondamentale et l'extension.
- **`message`** : Affiche les résultats sous forme de texte.

---

### 3. **Personnaliser le Patch**

#### **Changer les Noms de Notes**
Le script `chord_analyzer.js` utilise un tableau pour convertir les numéros MIDI en noms de notes :
```javascript
var noteNames = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"];
```
- Vous pouvez modifier ce tableau pour utiliser des noms alternatifs (ex: `"Do"` au lieu de `"C"`).

#### **Ajouter des Fonctionnalités**
- **Détection d'accords complets** : Modifiez `chord_analyzer.js` pour détecter des accords spécifiques (ex: majeur, mineur, 7e).
- **Affichage des intervalles** : Ajoutez un calcul pour afficher l'intervalle entre la fondamentale et l'extension (ex: "7e majeure").
- **Filtrage par tonalité** : Utilisez la tonalité sélectionnée pour valider si les notes font partie de la gamme.

#### **Exemple : Ajouter le Calcul des Intervalles**
Modifiez `chord_analyzer.js` pour inclure :
```javascript
// Tableau des noms d'intervalles
var intervalNames = [
    "Unison", "2e mineure", "2e majeure", "3e mineure", "3e majeure", 
    "4e juste", "4e augmentée", "5e juste", "5e diminuée", 
    "6e mineure", "6e majeure", "7e mineure", "7e majeure"
];

function analyzeNotes(notes) {
    if (notes.length === 0) {
        outlet(0, "-");
        outlet(1, "-");
        outlet(2, "-"); // Nouvelle sortie pour l'intervalle
        return;
    }

    var root = Math.min.apply(null, notes);
    var extension = Math.max.apply(null, notes);
    
    var rootName = midiToNoteName(root);
    var extensionName = midiToNoteName(extension);
    
    // Calculer l'intervalle en demi-tons
    var interval = (extension - root) % 12;
    var intervalName = intervalNames[interval];

    outlet(0, rootName);
    outlet(1, extensionName);
    outlet(2, intervalName); // Envoyer l'intervalle
}
```

---

### 4. **Ajouter des Sorties MIDI**
Pour envoyer les résultats vers d'autres devices :
1. Ajoutez un objet **`midiout`** dans le patch.
2. Connectez-le à la sortie du script JavaScript.
3. Utilisez **`noteout`** pour envoyer des notes MIDI (ex: pour jouer la fondamentale ou l'extension).

---

## 🐛 **Dépannage**

### Problème : Le patch ne s'ouvre pas dans Max
- **Solution** : Assurez-vous que Max/MSP est installé (inclus avec Ableton Live Suite).
- **Solution** : Vérifiez que le fichier `.maxpat` n'est pas corrompu (téléchargez-le à nouveau).

### Problème : Aucune note n'est détectée
- **Solution** : Vérifiez que le device est bien placé sur une **piste MIDI** (pas audio).
- **Solution** : Assurez-vous que le contrôleur MIDI est correctement configuré dans Live.

### Problème : Les notes ne s'affichent pas
- **Solution** : Vérifiez que les objets **`message`** sont bien connectés aux sorties du script JavaScript.
- **Solution** : Ouvrez la **console Max** (View > Max Console) pour voir les erreurs éventuelles.

---

## 📚 **Ressources Utiles**
- [Documentation Max/MSP](https://docs.cycling74.com/max8/)
- [Max for Live Tutorials](https://docs.cycling74.com/max8/maxforlive)
- [Live API Reference](https://docs.cycling74.com/max8/maxforlive/live_api_ref)
- [Forum Cycling '74](https://cycling74.com/forums/)

---

## 🔄 **Prochaines Étapes**
- [ ] Ajouter la détection automatique des accords (ex: Cmaj7, Dm7).
- [ ] Intégrer un affichage visuel (ex: cercle des quintes).
- [ ] Permettre de verrouiller la fondamentale pour forcer une tonalité.
- [ ] Ajouter des présélections d'extensions courantes (7e, 9e, etc.).
