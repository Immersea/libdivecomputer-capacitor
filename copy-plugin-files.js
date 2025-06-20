const path = require('path');
const fse = require('fs-extra');

const pluginRoot = path.resolve(__dirname, 'android/src/main');
const appRoot = path.resolve(__dirname, '../../android/app/src/main');

const pathsToCopy = [
  { from: 'java/it/immersea/libdivecomputerplugin', to: 'java/it/immersea/libdivecomputerplugin' },
  { from: 'cpp', to: 'cpp' },
  { from: 'jniLibs', to: 'jniLibs' },
  { from: 'assets', to: 'assets' },
  { from: 'res', to: 'res' }, // opzionale: solo se presente nel plugin
];

pathsToCopy.forEach(({ from, to }) => {
  const src = path.join(pluginRoot, from);
  const dest = path.join(appRoot, to);
  if (fse.existsSync(src)) {
    fse.copy(src, dest, { overwrite: true }, (err) => {
      if (err) {
        console.error(`Errore durante la copia da ${from}:`, err);
      } else {
        console.log(`✔️  Copiato ${from} → ${to}`);
      }
    });
  } else {
    console.log(`ℹ️  Salto ${from} (non esiste nel plugin)`);
  }
});
