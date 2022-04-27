import typescript from '@rollup/plugin-typescript'

export default {
  input: 'src/main.ts',
  output: [
    {
      file: './dist/index.mjs',
      format: 'cjs',
    },
    {
      file: './dist/index.cjs',
      format: 'esm',
    },
  ],
  plugins: [typescript({ tsconfig: './tsconfig.json' })],
}
