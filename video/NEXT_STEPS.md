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
- 🎨 **Le logo SVG** → re-coller, puis régénérer les PNG :
  ```
  rsvg-convert -w 1024 -h 1024 video/assets/logo_open.svg -o video/promo/assets/logo.png
  cp video/promo/assets/logo.png video/promo/assets/logo_cta.png
  ```
- 🔑 **La clé** → variable d'env `ELEVENLABS_API_KEY` (réglages d'environnement, pas le chat).

Le **setup script** (`scripts/web-setup.sh`) réinstalle ffmpeg, librsvg et le Chrome de rendu.

## 🎙️ 3. Voix off (une fois le réseau OK)
- Générer 2-3 voix FR d'audition (snippet) via l'API ElevenLabs.
- Choisir, générer la voix off complète (texte figé dans `SCRIPT.md`).
- Synchroniser : ajuster les `data-start`/`data-duration` des scènes sur le timing réel de la voix.

## 🎬 4. Compo : preview → check → render
```
cd video/promo
npm run check      # lint + validate + inspect (Chrome)
npm run dev        # preview (run_in_background)
npm run render -- --output renders/promo_v1.mp4
```

## 📝 État de la composition v1 (`video/promo/index.html`)
8 scènes, portrait 1080×1920, ~34 s, charte réelle (crème/pétrole/Lora) :
1. Hook « 59 UE… » (fond pétrole)
2. Logo + « Et si réviser devenait enfin facile ? »
3-5. **Bloc démo** : mockup iPhone + ta vidéo (continu 0→18 s) + légendes
6. Catalogue (flashcards / QCM / fiches de synthèse)
7. Signature « Pensé par un manip radio… » (fond pétrole)
8. CTA logo + stores

### À affiner après le 1ᵉʳ rendu (inspect)
- Position/échelle du mockup iPhone et cadrage de la vidéo (object-fit).
- Timing des scènes 3-5 à caler sur la voix off réelle.
- Animation « éventail qui s'ouvre » du logo (v1 = scale/fade ; viser un fan-open par carte).
- Vérifier débordements texte (`npm run check` → inspect).
- Ajouter la voix off (audio) + musique de fond.
