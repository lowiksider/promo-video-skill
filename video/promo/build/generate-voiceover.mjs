#!/usr/bin/env node
/**
 * Régénère les 7 segments de voix off (ElevenLabs) dans assets/vo/final/.
 * Voix retenue : « voix 2 » (DbbNuBL7lf62XwY7arQb), modèle Eleven v3, variante A.
 *
 *   ELEVENLABS_API_KEY=sk_... node build/generate-voiceover.mjs
 *
 * ⚠️ Eleven v3 est NON déterministe : chaque génération varie légèrement
 *    (durées ± 0.3s, intonations). Après régénération, re-mesure les durées
 *    et réajuste les `adelay` de build-audio.sh + les data-start de index.html
 *    (cf. REBUILD.md). Pour reproduire À L'IDENTIQUE, réutilise plutôt
 *    l'archive de sauvegarde (assets déjà générés) au lieu de régénérer.
 */
import { writeFileSync, mkdirSync } from "node:fs";
import { execSync } from "node:child_process";

const key = process.env.ELEVENLABS_API_KEY;
if (!key) { console.error("ELEVENLABS_API_KEY manquante"); process.exit(1); }

const VOICE = "DbbNuBL7lf62XwY7arQb";       // voix 2
const MODEL = "eleven_v3";
const VS = { stability: 0.5, similarity_boost: 0.8, style: 0.3, use_speaker_boost: true };

const sections = [
  { id: "1", text: "59 UE. Trois ans. Des milliers de notions à retenir…" },
  { id: "2", text: "Et si réviser devenait enfin facile ?" },
  { id: "3", text: "Révision Manip Radio, c'est une solution de révision efficace, directement dans ta poche. Tu choisis ton chapitre, et tu lances ta session." },
  { id: "4", text: "Tu révises avec des flashcards intelligentes, et tu t'auto-évalues d'un geste." },
  { id: "5", text: "L'app te fait réviser au bon moment, grâce à un algorithme de répétition espacée." },
  { id: "6", text: "Des milliers de flashcards, des QCM et des fiches de synthèse : tout ce qu'il te faut pour booster tes révisions !" },
  { id: "8", text: "Révision Manip Radio : dispo sur l'App Store et le Play Store." },
];

mkdirSync("assets/vo/final", { recursive: true });
const dur = (f) => parseFloat(execSync(`ffprobe -v error -show_entries format=duration -of csv=p=0 "${f}"`).toString().trim());

for (const s of sections) {
  const res = await fetch(`https://api.elevenlabs.io/v1/text-to-speech/${VOICE}`, {
    method: "POST",
    headers: { "xi-api-key": key, "Content-Type": "application/json" },
    body: JSON.stringify({ text: s.text, model_id: MODEL, voice_settings: VS }),
  });
  if (!res.ok) { console.error("FAIL", s.id, res.status, (await res.text()).slice(0, 200)); process.exit(1); }
  const f = `assets/vo/final/s${s.id}.mp3`;
  writeFileSync(f, Buffer.from(await res.arrayBuffer()));
  console.log(`section ${s.id}: ${dur(f).toFixed(2)}s`);
}
console.log("OK → assets/vo/final/  (puis : bash build/build-audio.sh)");
