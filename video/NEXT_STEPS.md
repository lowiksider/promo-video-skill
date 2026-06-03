# Étapes suivantes — production vidéo Révision Manip Radio

## 🌐 1. Élargir la politique réseau (à faire par Lowik)
Réglages d'environnement (icône cloud → engrenage) → **Network access** → **Custom** :
```
api.elevenlabs.io
cdn.jsdelivr.net
```
☑ Cocher « Also include default list of common package managers ».

> Changer les hôtes réseau **reconstruit l'environnement** → nouveau conteneur au prochain démarrage.

## 🔁 2. Après le redémarrage (conteneur neuf)
Ce qui a survécu (commité) : le script, le design/palette, **la composition `video/promo/`**,
GSAP vendorisé, **les polices Lora**, le setup script.

Ce qui est à re-fournir (volontairement non poussé sur le fork public) :
- 📱 **La vidéo** → re-uploader, puis : `cp <upload> video/promo/assets/demo_raw.mp4`
- 🎨 **Le logo** → ✅ **fait** (02/06) : la compo référence directement `video/promo/assets/logo.svg`
  (pose éventail ouverte, statique). Chrome rend le SVG tel quel → **plus de rasterisation PNG**,
  rsvg-convert n'est plus nécessaire pour le logo. Source animée gardée dans `video/assets/logo_open.svg`.
  > ⚠️ Ces fichiers sont gitignorés (`*.svg`, `video/assets/`, `video/promo/assets/`) : ils ne
  > survivent PAS à un nouveau conteneur. À re-coller/re-déposer après un rebuild d'environnement.
- 🔑 **La clé** → variable d'env `ELEVENLABS_API_KEY` (réglages d'environnement, pas le chat).

Le **setup script** (`scripts/web-setup.sh`) réinstalle ffmpeg, librsvg et le Chrome de rendu.

## 🎙️ 3. Voix off — ✅ FAIT (02/06)
- Voix choisie : **Augustin** (`kKgyAHjGAbeWHCNd7qoC`, FR, jeune, conversationnel).
- 8 segments générés via ElevenLabs (`eleven_multilingual_v2`), émotions par scène,
  mesurés à l'`ffprobe` → **la voix est devenue l'horloge maître** (durée finale **42 s**).
- Piste master `assets/master_audio.mp3` = voix + musique `motivational-day` **duckée**
  (sidechaincompress) + `loudnorm` broadcast (mean -17 dB / max -5 dB).
- Régénérer si besoin : `node /tmp/gen_vo.mjs` puis le mix ffmpeg (voir historique), ou
  adapter `skills/promo-video/scripts/generate-voiceover.ts`.
- ⚠️ Audio gitignoré (`*.mp3`) : à régénérer après un rebuild de conteneur.

## 🎬 4. Compo : preview → check → render — ✅ rendue
```
cd video/promo
npm run check      # lint 0/0 ; validate 0 erreur (warnings de contraste = faux positifs)
npm run render -- --output renders/promo_v1.mp4   # 1080×1920, 42s, ~4.7 Mo
```
Rendu v1 validé visuellement (frames OK sur les 8 scènes, démo non figée, audio synchro).

## 📝 État de la composition v1 (`video/promo/index.html`)
8 scènes, portrait 1080×1920, **42 s** (calée sur la voix), charte réelle (crème/pétrole/Lora) :
1. Hook « 59 UE… » (fond pétrole)
2. Logo + « Et si réviser devenait enfin facile ? »
3-5. **Bloc démo** : mockup iPhone + ta vidéo (clip continu unique ~19 s) + légendes
6. Catalogue (flashcards / QCM / fiches de synthèse)
7. Signature « Pensé par un manip radio… » (fond pétrole)
8. CTA logo + stores

### Pistes de polish v2 (optionnel)
- **Re-encoder la vidéo source** avec des keyframes denses pour fiabiliser le seek (le rendu v1
  est OK mais HyperFrames a averti — `ffmpeg -i demo_raw.mp4 -c:v libx264 -r 30 -g 30
  -keyint_min 30 -movflags +faststart -an demo_dense.mp4`).
- **Vrai fan-open carte par carte** du logo : nécessite d'inliner le SVG dans `index.html`
  → publierait l'art (SVG gitignoré exprès). À décider (privacy vs. finition).
- Caler le cadrage `object-position` de la vidéo si l'app change (status bar 11:50 visible).
- Affiner le ducking musique / ajouter un léger whoosh sur les bascules de scène.
- Sous-titres burn-in optionnels (accessibilité / autoplay muet sur les réseaux).
