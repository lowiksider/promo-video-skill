# Rebuild — Promo Révision Manip Radio

Comment reconstruire / refaire des variantes de la vidéo promo.
Branche de travail : `claude/youthful-ramanujan-vBIsu`.

## Ce qui est dans git (persistant)
- `index.html` — la composition (montage, timeline, scènes). **C'est le cœur éditable.**
- `vendor/gsap.min.js`, `fonts/lora-*.ttf` — dépendances de rendu.
- `build/` — scripts de régénération (voix, audio, vidéo).
- `../../skills/promo-video/music/` — musiques (dont `inspired-ambient-141686.mp3`).
- `meta.json`, `package.json`.

## Ce qui N'EST PAS dans git (privé / éphémère → à re-fournir)
Exclu par `.gitignore` (médias, art) et **perdu à la fermeture du conteneur** :
- `assets/demo_raw.mp4` — ton enregistrement d'écran (à re-uploader).
- `assets/demo_dense.mp4` — re-encodé via `build/prepare-video.sh`.
- `assets/logo-inline.js` — **l'art du logo** (cartes), injecté en DOM. Privé.
- `../assets/logo_icon.svg` — le SVG source de l'icône (référence de marque).
- `assets/master_audio.mp3` + `assets/vo/final/*.mp3` — voix off + mix.

> 👉 **Garde une copie locale de l'archive de sauvegarde** que je t'ai envoyée
> (`revision-promo-backup.tgz`) : elle contient TOUS ces fichiers privés déjà
> générés. La réextraire évite toute régénération.

## Décisions figées (v5 — version validée)
- **Voix off** : « voix 2 » ElevenLabs `DbbNuBL7lf62XwY7arQb`, modèle **eleven_v3**,
  réglages `stability 0.5 / similarity 0.8 / style 0.3 / speaker_boost on`.
  Hook « 59 UE… » = variante A. Segment « L'app… » = take sans saturation.
- **Musique** : `inspired-ambient-141686.mp3`, volume 0.14, duckée sous la voix.
- **Durée** : 37,6 s (signature « pensé par un manip radio » coupée).
- **Logo** : transforms EXACTS de l'icône, baked en statique dans `logo-inline.js`
  (`translate(490,935)` + cartes `rotate(-12/-1/10) translate(-15/15/45)`).
  L'animation GSAP ne touche qu'un calque interne `.anim` (repos = identité)
  → la pose au repos reste identique à l'icône.
- **Île iPhone** (masque point rouge d'enregistrement) : `left 409 / top 332 / 250×56`.

## Reprendre dans une nouvelle session
1. Démarre une session sur la branche `claude/youthful-ramanujan-vBIsu`.
2. Restaure les fichiers privés : extrais `revision-promo-backup.tgz` dans `video/promo/`
   (ou re-fournis : vidéo d'écran → `assets/demo_raw.mp4`, et recolle le SVG d'icône
   → `../assets/logo_icon.svg`).
3. Vérifie les outils : `ffmpeg`, `rsvg-convert` (sinon `apt-get install -y ffmpeg librsvg2-bin`).
4. Rendu :
   ```bash
   cd video/promo
   npm run check                 # lint + validate
   npm run render -- --output renders/promo.mp4
   ```

## Régénérer depuis zéro (si pas d'archive)
```bash
cd video/promo
bash build/prepare-video.sh            # demo_raw.mp4 → demo_dense.mp4
ELEVENLABS_API_KEY=sk_... node build/generate-voiceover.mjs   # voix → assets/vo/final/
bash build/build-audio.sh              # → assets/master_audio.mp3
# logo-inline.js : repartir de l'archive (privé). Sinon il encode l'icône
#   (cartes + trèfle + barres de texte) avec les transforms ci-dessus.
npm run render -- --output renders/promo.mp4
```
> ⚠️ Eleven v3 est non déterministe : une voix régénérée aura des durées un peu
> différentes. Re-mesure chaque segment (`ffprobe`) puis réajuste les `adelay`
> de `build/build-audio.sh` ET les `data-start`/`data-duration` de `index.html`.

## Faire des variantes
- **Textes / scènes / timing** : éditer `index.html` (chaque scène a ses `data-start`
  / `data-duration` ; la timeline GSAP est en bas du fichier).
- **Voix** : changer `VOICE`/`VS`/textes dans `build/generate-voiceover.mjs`, régénérer,
  recaler le timing.
- **Musique** : remplacer le fichier dans `build/build-audio.sh` + ajuster `volume`.
- **Format** (ex. carré/paysage) : `data-width`/`data-height` du `#root` + repositionner.
