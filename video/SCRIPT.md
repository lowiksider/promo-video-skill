# Script vidéo promo — Révision Manip Radio

**Format :** Portrait 1080×1920 · **Durée cible :** ~34 s · **Narration :** *The Transformation* (Avant → Après → Comment → Preuve → CTA)
**Cible :** étudiants MERM (Manipulateurs en Électroradiologie Médicale), 18-25 ans, en IFMEM.
**Ton voix off :** français, jeune adulte, chaleureux et complice, rythme dynamique.

---

## Découpage scène par scène

| # | Durée | Visuel | Type | Voix off (FR) |
|---|-------|--------|------|----------------|
| 1 — Hook (le problème) | 0–4 s | Plan animé : texte « 59 UE. 3 ans. Des milliers de notions. » qui s'empile/s'écroule. Ambiance un peu stressante. | Animé (HyperFrames) | « 59 UE. Trois ans. Des milliers de notions à retenir… » |
| 2 — Bascule | 4–7 s | Transition douce vers le clair. Logo Révision Manip Radio qui apparaît. | Animé | « Et si réviser devenait enfin facile ? » |
| 3 — Démo : trouver & lancer | 7–14 s | **CLIP RÉEL (1ʳᵉ partie)** : mockup iPhone — bibliothèque → on entre dans une UE → un chapitre → tap sur **« Réviser ce chapitre »** → la session se lance. | Clip + cadre iPhone | « Révision Manip Radio, c'est une solution de révision efficace, directement dans ta poche. Tu choisis ton chapitre, et tu lances ta session. » |
| 4 — Démo : la flashcard | 14–21 s | **CLIP RÉEL (suite continue)** : une carte apparaît → flip 3D (question→réponse) → barre d'auto-évaluation Non acquis / À revoir / Acquis. | Clip + cadre iPhone | « Tu révises avec des flashcards intelligentes, et tu t'auto-évalues d'un geste. » |
| 5 — Le « comment » (FSRS) | 21–25 s | **CLIP RÉEL (fin)** ou overlay : petite incrustation animée « Répétition espacée » + flamme streak par-dessus la session. | Clip + overlay animé | « L'app te fait réviser au bon moment, grâce à un algorithme de répétition espacée. » |
| 6 — Le catalogue | 25–29 s | Flash rapide : mini-cartes/étiquettes animées — **« Flashcards »**, **« QCM »**, **« Fiches de synthèse »**. Rapide, punchy. | Animé (overlay ou mini-mockups) | « Des milliers de flashcards, des QCM et des fiches de synthèse : tout ce qu'il te faut pour booster tes révisions ! » |
| 7 — Signature | 29–31 s | Plan animé épuré : texte « Pensé par un manip radio, pour les manips radio. » | Animé | « Pensé par un manip radio, pour les manips radio. » |
| 8 — CTA | 31–34 s | Logo + texte « Dispo sur l'App Store et le Play Store » + badges stores + couronne premium discrète. | Animé | « Révision Manip Radio : dispo sur l'App Store et le Play Store. » |

---

## Texte voix off complet (à enregistrer / TTS)

> 59 UE. Trois ans. Des milliers de notions à retenir…
> Et si réviser devenait enfin facile ?
> Révision Manip Radio, c'est une solution de révision efficace, directement dans ta poche. Tu choisis ton chapitre, et tu lances ta session.
> Tu révises avec des flashcards intelligentes, et tu t'auto-évalues d'un geste.
> L'app te fait réviser au bon moment, grâce à un algorithme de répétition espacée.
> Des milliers de flashcards, des QCM et des fiches de synthèse : tout ce qu'il te faut pour booster tes révisions !
> Pensé par un manip radio, pour les manips radio.
> Révision Manip Radio : dispo sur l'App Store et le Play Store.

**Durée parlée estimée :** ~33 s (laisse respirer la musique au début et à la fin).

---

## Presets émotionnels voix off (par scène)
- Scène 1 : *neutre/tendu* (poser le problème)
- Scène 2 : *intime / question* (« et si… »)
- Scènes 3-5 : *confiant / enthousiaste* (démo)
- Scène 6 : *enjoué / rapide* (le catalogue)
- Scène 7 : *chaleureux / fier* (signature)
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
- Scène 6 (« le catalogue ») : si tu n'as pas de clips QCM/synthèse, on la fait 100% animée avec des mini-cartes stylisées — discret et rapide.
