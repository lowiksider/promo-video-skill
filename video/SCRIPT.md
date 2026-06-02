# Script vidéo promo — Révision Manip Radio

**Format :** Portrait 1080×1920 · **Durée cible :** ~32 s · **Narration :** *The Transformation* (Avant → Après → Comment → Preuve → CTA)
**Cible :** étudiants MERM (Manipulateurs en Électroradiologie Médicale), 18-25 ans, en IFMEM.
**Ton voix off :** français, jeune adulte, chaleureux et complice, rythme dynamique.

---

## Découpage scène par scène

| # | Durée | Visuel | Type | Voix off (FR) |
|---|-------|--------|------|----------------|
| 1 — Hook (le problème) | 0–4 s | Plan animé : texte « 57 UE. 3 ans. Des milliers de notions. » qui s'empile/s'écroule. Ambiance un peu stressante. | Animé (HyperFrames) | « 57 UE. Trois ans. Des milliers de notions à retenir… » |
| 2 — Bascule | 4–7 s | Transition douce vers le clair. Logo Révision Manip Radio qui apparaît. | Animé | « Et si réviser devenait enfin simple ? » |
| 3 — Démo : trouver & lancer | 7–14 s | **CLIP RÉEL (1ʳᵉ partie)** : mockup iPhone — bibliothèque → on entre dans une UE → un chapitre → tap sur **« Réviser ce chapitre »** → la session se lance. | Clip + cadre iPhone | « Révision Manip Radio, c'est tout le programme MERM dans ta poche. Tu choisis ton chapitre, et tu lances ta session. » |
| 4 — Démo : la flashcard | 14–21 s | **CLIP RÉEL (suite continue)** : une carte apparaît → flip 3D (question→réponse) → barre d'auto-évaluation Non acquis / À revoir / Acquis. | Clip + cadre iPhone | « Tu révises avec des flashcards intelligentes, et tu t'auto-évalues d'un geste. » |
| 5 — Le « comment » (FSRS) | 21–25 s | **CLIP RÉEL (fin)** ou overlay : petite incrustation animée « Répétition espacée » + flamme streak par-dessus la session. | Clip + overlay animé | « L'app te fait réviser au bon moment, juste avant d'oublier. » |
| 6 — Et aussi… (autres features) | 25–28 s | Flash rapide : 2-3 étiquettes/mini-cartes animées qui apparaissent — **« QCM »**, **« Fiches récap »** (optionnel : « Recherche »). Rapide, punchy. | Animé (overlay ou mini-mockups) | « Avec aussi des QCM et des fiches de révision pour tout maîtriser. » |
| 7 — Preuve / valeur | 28–31 s | Plan animé : 2-3 puces — « Hors-ligne », « Suivi de progression », « Conçu par un formateur MERM ». | Animé | « Pensée par un formateur, pour les étudiants. » |
| 8 — CTA | 31–33 s | Logo + texte « Bientôt sur l'App Store » + couronne premium discrète. | Animé | « Révision Manip Radio. Révise comme un pro. » |

---

## Texte voix off complet (à enregistrer / TTS)

> 57 UE. Trois ans. Des milliers de notions à retenir…
> Et si réviser devenait enfin simple ?
> Révision Manip Radio, c'est tout le programme MERM dans ta poche. Tu choisis ton chapitre, et tu lances ta session.
> Tu révises avec des flashcards intelligentes, et tu t'auto-évalues d'un geste.
> L'app te fait réviser au bon moment, juste avant d'oublier.
> Avec aussi des QCM et des fiches de révision pour tout maîtriser.
> Pensée par un formateur, pour les étudiants.
> Révision Manip Radio. Révise comme un pro.

**Durée parlée estimée :** ~30 s (laisse respirer la musique au début et à la fin).

---

## Presets émotionnels voix off (par scène)
- Scène 1 : *neutre/tendu* (poser le problème)
- Scène 2 : *intime / question* (« et si… »)
- Scènes 3-5 : *confiant / enthousiaste* (démo)
- Scène 6 : *enjoué / rapide* (les bonus)
- Scène 7 : *chaleureux* (preuve)
- Scène 8 : *affirmé* (CTA)

---

## Ce qu'il me faut de Lowik
1. **Clips d'écran** (simulateur iOS ou iPhone), format vertical, heure 9:41, données de démo propres :
   - **Clip principal CONTINU (~12-14 s)** : bibliothèque → entrer dans une UE → un chapitre → tap « Réviser ce chapitre » → session lancée → une carte → flip question/réponse → barre d'auto-évaluation. *(C'est le cœur de la vidéo, en un seul enregistrement fluide.)*
   - **Bonus (optionnel, court)** : un aperçu d'un **QCM** et d'une **fiche récap** (peuvent même être des captures fixes si pas de clip).
2. **Logo** (PNG transparent ou SVG) → `video/assets/logo.png`
3. **Couleurs réelles** de l'app (les hex de `app_colors.dart`) pour corriger `design.md`
4. **Clé ElevenLabs** (`export ELEVENLABS_API_KEY="sk_..."`) pour générer la voix off FR
5. Validation du **texte voix off** ci-dessus (mots exacts, ton)

## Notes
- Musique : `skills/promo-video/music/motivational-day-112790.mp3` (uplifting) conviendrait — à valider.
- Disclaimer : aucune allégation médicale ; app éducative.
- Scène 6 (« et aussi ») : si tu n'as pas de clips QCM/récap, on la fait 100% animée avec des mini-cartes stylisées — discret et rapide.
