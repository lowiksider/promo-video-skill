#!/usr/bin/env bash
# =============================================================================
# Setup script pour Claude Code on the web — projet vidéo promo Révision Manip Radio
# À configurer dans : réglages d'environnement → champ "Setup script" :
#     bash scripts/web-setup.sh
#
# Réinstalle les outils nécessaires au pipeline vidéo dans un conteneur neuf
# (les installs mid-session ne sont pas conservées entre conteneurs).
#
# Prérequis réseau (politique "Custom" avec defaults cochés) :
#   - api.elevenlabs.io   (voix off)
#   - cdn.jsdelivr.net    (secours ; GSAP est aussi vendorisé en local)
#   - + defaults (npm, apt/ubuntu, google fonts, stockage Chrome)
# =============================================================================
set -uo pipefail

echo "▶ [setup] Mise à jour apt + outils média (ffmpeg, librsvg)"
apt-get update -qq || true
apt-get install -y ffmpeg librsvg2-bin >/dev/null 2>&1 || echo "⚠ apt: ffmpeg/librsvg non installés (réseau ?)"

echo "▶ [setup] Vérif Node"
node --version || echo "⚠ Node introuvable"

# Pré-télécharger le Chrome de rendu HyperFrames (sinon fait au premier render)
echo "▶ [setup] Chrome HyperFrames (rendu headless)"
( cd video/promo 2>/dev/null && npx --yes hyperframes@0.6.69 browser install >/dev/null 2>&1 ) \
  || echo "⚠ Chrome HyperFrames non pré-installé (sera tenté au render)"

echo "▶ [setup] Récap outils"
which ffmpeg ffprobe rsvg-convert 2>/dev/null || true

echo "✅ [setup] Terminé."
echo "   Pense à re-fournir : la vidéo (video/assets/demo_raw.mp4),"
echo "   le logo SVG, et la clé ELEVENLABS_API_KEY (variable d'env)."
