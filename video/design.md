# Design — Révision Manip Radio (promo verticale)

> Charte pour la vidéo promo HyperFrames. Source de vérité de la marque.
> ✅ Palette mise à jour le 02/06/2026 à partir des couleurs réelles relevées dans la vidéo de démo (`video/assets/demo_raw.mp4`).

## Mood
Calme, éditorial, premium, rassurant. **Pas** iOS bleu standard — identité chaleureuse :
fond crème + vert pétrole profond + titres en serif. Crédibilité médicale, sérénité.
Énergie « étudiant motivé » : dynamique mais posé.

## Format
- Cible : **Portrait 1080 × 1920** (Reels / TikTok / Stories)
- La vidéo d'app source est en 1180×2556, 60 fps → s'insère dans un mockup iPhone.
- Durée : ~30-34 s
- Fond clair (crème) dominant — pas de dark mode.

## Palette (réelle, relevée dans l'app)
| Rôle | Hex | Note |
|------|-----|------|
| Fond crème (clair) | `#F4EEE5` | Fond principal de l'app |
| Fond crème (mid) | `#EEE8DE` | Variante |
| Surface greige / tuiles | `#DED8CF` | Tuiles secondaires (Récap, QCM) |
| Carte blanche | `#FFFFFF` | Cartes de flashcard |
| **Vert pétrole (primaire)** | `#153239` | Boutons, barre de nav active, accents forts |
| Texte principal | `#141515` | Quasi-noir |
| Texte secondaire | `#76706D` | Gris chaud |
| Chip « Réponse » (sauge) | `#E2ECEA` | fond, texte vert foncé |
| Non acquis | bg `#EDDBD2` / texte terracotta `#B5524A` | Bouton rouge doux |
| À revoir | bg `#F1E3CF` / texte ambre `#C08A3E` | Bouton orange doux |
| Acquis | bg `#DDE0D4` / texte vert `#4E7A5F` | Bouton vert doux |

## Typographie
- **Titres** : **serif** type **Lora** (confirmé : l'app utilise Lora). Gras pour les gros titres.
- **Corps** : sans-serif (proche Inter / système).
- Les plans animés doivent reprendre Lora en titres pour matcher l'app.

## Formes
- Coins arrondis généreux (tuiles ~20px, **boutons pill** très arrondis).
- Aplats doux, ombres légères. Pas d'ombres dures, pas de glassmorphism marqué.

## À NE PAS faire
- Pas de dark mode, pas de bleu iOS générique.
- Pas de jargon médical illisible à l'écran (rester lisible en 3 s).
- Pas de promesse médicale (app éducative, pas un dispositif médical).
- Pas de texte plus petit que 28px à l'écran en portrait.
- Ne pas trahir l'aesthetic crème/serif : les scènes animées doivent s'y fondre.

## Logo
- ✅ Reçu (02/06/2026). Identité : **3 cartes en éventail** (bleu pétrole, vert, ocre) sur la
  carte avant le **symbole radioactivité** + lignes de texte — cohérent avec l'icône de l'app.
- Couleurs des cartes : bleu `#1B4F60→#0A2932`, vert `#3D8260→#1F4F37`, ocre `#B89643→#7E5F1F`,
  trèfle/texte crème `#FBF5E2`. (Mêmes familles que la charte.)
- Deux fichiers (gitignorés, privés — non poussés sur le fork public) :
  - `video/promo/assets/logo.svg` — **pose éventail ouverte, statique** : c'est celui que la
    compo référence (rendu déterministe). Chrome rend le SVG directement → **plus besoin de
    rasteriser** (rsvg-convert n'est plus requis pour le logo).
  - `video/assets/logo_open.svg` — **loader animé** original (SMIL, éventail s'ouvre/se ferme),
    gardé comme source de vérité de la marque.
- Dans la compo : le logo apparaît en scène 2 avec une entrée « éventail qui s'ouvre »
  (GSAP : pile serrée + pivotée → déploiement avec dépassement), et en petit en scène 8 (CTA).
