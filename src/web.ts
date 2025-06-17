import { WebPlugin } from '@capacitor/core';

import type { libdcPlugin } from './definitions';

export class libdcWeb extends WebPlugin implements libdcPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
