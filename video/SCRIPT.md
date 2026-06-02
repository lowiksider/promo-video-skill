# Script vidéo promo — Fiche Manip Radio

**Format :** Portrait 1080×1920 · **Durée cible :** ~30 s · **Narration :** *The Transformation* (Avant → Après → Comment → Preuve → CTA)
**Cible :** étudiants MERM (Manipulateurs en Électroradiologie Médicale), 18-25 ans, en IFMEM.
**Ton voix off :** français, jeune adulte, chaleureux et complice, rythme dynamique.

---

## Découpage scène par scène

| # | Durée | Visuel | Type | Voix off (FR) |
|---|-------|--------|------|----------------|
| 1 — Hook (le problème) | 0–4 s | Plan animé : pile de polycopiés / texte « 57 UE. 3 ans. Des milliers de notions. » qui s'écroule. Ambiance un peu stressante. | Animé (HyperFrames) | « 57 UE. Trois ans. Des milliers de notions à retenir… » |
| 2 — Bascule | 4–7 s | Transition douce vers le clair. Logo Fiche Manip Radio qui apparaît. | Animé | « Et si réviser devenait enfin simple ? » |
| 3 — L'app (démo 1) | 7–13 s | **CLIP RÉEL** : mockup iPhone, navigation bibliothèque → UE → flashcard. | Clip + cadre iPhone | « Fiche Manip Radio, c'est tout le programme MERM dans ta poche. » |
| 4 — Démo 2 (le geste clé) | 13–19 s | **CLIP RÉEL** : flip de carte 3D, puis auto-évaluation Non acquis / À revoir / Acquis. | Clip + cadre iPhone | « Tu révises avec des flashcards intelligentes, et tu t'auto-évalues d'un geste. » |
| 5 — Le « comment » (FSRS) | 19–24 s | **CLIP RÉEL** : session de révision intelligente + petite incrustation animée « Répétition espacée » / flamme streak. | Clip + overlay animé | « L'app te fait réviser au bon moment, juste avant d'oublier. » |
| 6 — Preuve / valeur | 24–27 s | Plan animé : 3 puces qui apparaissent — « Hors-ligne », « Suivi de progression », « Conçu par un formateur MERM ». | Animé | « Pensée par un formateur, pour les étudiants. » |
| 7 — CTA | 27–30 s | Logo + texte « Bientôt sur l'App Store » + couronne premium discrète. | Animé | « Fiche Manip Radio. Révise comme un pro. » |

---

## Texte voix off complet (à enregistrer / TTS)

> 57 UE. Trois ans. Des milliers de notions à retenir…
> Et si réviser devenait enfin simple ?
> Fiche Manip Radio, c'est tout le programme MERM dans ta poche.
> Tu révises avec des flashcards intelligentes, et tu t'auto-évalues d'un geste.
> L'app te fait réviser au bon moment, juste avant d'oublier.
> Pensée par un formateur, pour les étudiants.
> Fiche Manip Radio. Révise comme un pro.

**Durée parlée estimée :** ~26–28 s (laisse respirer la musique au début et à la fin).

---

## Presets émotionnels voix off (par scène)
- Scène 1 : *neutre/tendu* (poser le problème)
- Scène 2 : *intime / question* (« et si… »)
- Scènes 3-5 : *confiant / enthousiaste* (démo)
- Scène 6 : *chaleureux* (preuve sociale)
- Scène 7 : *affirmé* (CTA)

---

## Ce qu'il me faut de Lowik
1. **3 clips d'écran** (simulateur iOS ou iPhone), 3-5 s chacun :
   - a) navigation bibliothèque → UE → chapitre → flashcard
   - b) flip de carte + barre d'auto-évaluation (rouge/orange/vert)
   - c) une session de révision intelligente (timer / streak visible)
   → format vertical, heure 9:41, données de démo propres.
2. **Logo** (PNG transparent ou SVG) → `video/assets/logo.png`
3. **Couleurs réelles** de l'app (les hex de `app_colors.dart`) pour corriger `design.md`
4. **Clé ElevenLabs** (`export ELEVENLABS_API_KEY="sk_..."`) pour générer la voix off FR
5. Validation du **texte voix off** ci-dessus (mots exacts, ton)

## Notes
- Musique : `skills/promo-video/music/motivational-day-112790.mp3` (uplifting) conviendrait — à valider.
- Disclaimer : aucune allégation médicale ; app éducative.
