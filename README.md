# ChordExtensionHelper - Max for Live Plugin

**Un plugin Max for Live pour assister la composition et le choix des accords.**

---

## 🎯 **Objectif**
Ce plugin **analyse en temps réel les notes MIDI** jouées dans Ableton Live et aide à comprendre les **extensions d'accords** en affichant :
- **La fondamentale** (note la plus basse jouée).
- **L'extension visée** (note la plus haute jouée).

Idéal pour les compositeurs, producteurs et musiciens qui veulent **explorer les harmonies** et **comprendre les structures d'accords** directement dans leur workflow Live.

---

## ✨ **Fonctionnalités**
- **Analyse MIDI en temps réel** : Détecte les notes jouées depuis un clip, un contrôleur MIDI ou un instrument.
- **Détection automatique** :
  - La **note la plus basse** = **fondamentale** (root).
  - La **note la plus haute** = **extension** (ex: 7e, 9e, 11e, etc.).
- **Affichage clair** : Affiche la fondamentale et l'extension sous forme de texte (ex: `Root: C | Extension: E`).
- **Sélection de tonalité** : Permet de définir une tonalité de référence (root + mode : majeur/mineur) pour contextualiser l'analyse.

---

## 📥 **Installation**
1. **Prérequis** :
   - Ableton Live **Suite** (inclut Max for Live).
   - Max/MSP (inclus avec Live Suite).

2. **Installer le plugin** :
   - Télécharger le fichier `.maxpat` depuis ce dépôt.
   - Glisser-déposer le fichier dans un **rack MIDI** ou une **piste MIDI** dans Ableton Live.

---

## 🎛️ **Utilisation**
1. **Ajouter le device** à une piste MIDI ou un rack.
2. **Jouer des notes** depuis un contrôleur MIDI, un clip ou un instrument virtuel.
3. **Observer l'affichage** :
   - La fondamentale et l'extension s'affichent en temps réel.
   - Si une seule note est jouée, seul la fondamentale est affichée.

---

## 🔧 **Exemple d'Utilisation**
- **Entrée MIDI** : Jouez les notes `C3`, `E3`, `G3`, `B3` (accord de Cmaj7).
- **Sortie** :
  - `Root: C3` (fondamentale).
  - `Extension: B3` (7e majeure).

---

## 🛠️ **Développement**
### Structure du Projet
```
ChordExtensionHelper/
├── README.md               # Documentation
├── ChordExtensionHelper.maxpat  # Patch Max for Live principal
├── /docs/                  # Documentation technique (à venir)
└── /examples/              # Exemples de patches (à venir)
```

### Outils Utilisés
- **Max/MSP** : Environnement de développement visuel.
- **JavaScript dans Max** : Pour la logique d'analyse des accords.
- **Live API** : Intégration avec Ableton Live.

---

## 🤝 **Contribuer**
Les contributions sont les bienvenues ! Ouvrez une **issue** ou soumettez une **pull request** pour :
- Ajouter des fonctionnalités (ex: détection d'accords complets).
- Améliorer l'interface utilisateur.
- Corriger des bugs.

---

## 📜 **Licence**
Ce projet est sous licence **MIT**. Voir [LICENCE](LICENCE) pour plus de détails.

---

## 📞 **Contact**
Pour toute question ou suggestion, contactez-moi via [GitHub](https://github.com/laurentVeliscek/ChordExtensionHelper).
