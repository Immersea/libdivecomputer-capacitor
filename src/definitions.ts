export interface libdcPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
