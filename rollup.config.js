import buble from 'rollup-plugin-buble'
import eslint from 'rollup-plugin-eslint'

const pkg = require('./package.json')

const external = pkg.dependencies ? Object.keys(pkg.dependencies) : []

export default {
  entry: 'src/index.js',
  external,
  plugins: [
    eslint(),
    buble(),
  ],
  targets: [
    {
      dest: pkg.dist,
      format: 'cjs',
      sourceMap: true,
    },
  ],
}
