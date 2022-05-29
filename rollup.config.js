import typescript from '@rollup/plugin-typescript'
import dts from 'rollup-plugin-dts'
import { babel, getBabelOutputPlugin } from '@rollup/plugin-babel'

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
    plugins: [
      typescript({ tsconfig: './tsconfig.json' }),
      getBabelOutputPlugin({
        presets: ['@babel/preset-env'],
      }),
    ],
  },
  {
    input: 'dist/types/main.d.ts',
    output: [{ file: 'dist/main.d.ts', format: 'es' }],
    plugins: [dts()],
  },
]
