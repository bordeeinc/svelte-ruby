import nodeResolve from 'rollup-plugin-node-resolve';
import commonjs from 'rollup-plugin-commonjs';
import json from 'rollup-plugin-json';
import buble from 'rollup-plugin-buble';

export default {
	entry: 'src/index.js',
	moduleName: 'svelte',
	targets: [
		{
      dest: '../lib/svelte.js',
      format: 'iife'
    }
	],
	plugins: [
		nodeResolve({ jsnext: true, module: true }),
		commonjs(),
		json(),
		buble({
			include: 'src/**',
			exclude: 'src/shared/**',
			transforms: {
				dangerousTaggedTemplateString: true
			}
		})
	],
	sourceMap: true
};
