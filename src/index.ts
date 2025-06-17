import { registerPlugin } from '@capacitor/core';

import type { libdcPlugin } from './definitions';

const libdc = registerPlugin<libdcPlugin>('libdc', {
  web: () => import('./web').then((m) => new m.libdcWeb()),
});

export * from './definitions';
export { libdc };
