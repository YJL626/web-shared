import typescript from '@rollup/plugin-typescript'
import dts from 'rollup-plugin-dts'

export default [
  {
    input: 'src/main.ts',
    output: [
      {
        file: './dist/main.cjs',
        format: 'cjs',
      },
      {
        file: './dist/main.mjs',
        format: 'esm',
      },
    ],
    plugins: [typescript({ tsconfig: './tsconfig.json' })],
  },
  {
    input: 'dist/types/main.d.ts',
    output: [{ file: 'dist/main.d.ts', format: 'es' }],
    plugins: [dts()],
  },
]
