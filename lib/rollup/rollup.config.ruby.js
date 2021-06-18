import fs from 'fs';
import replace from '@rollup/plugin-replace';
import resolve from '@rollup/plugin-node-resolve';
import commonjs from '@rollup/plugin-commonjs';
import json from '@rollup/plugin-json';
import sucrase from '@rollup/plugin-sucrase';
import typescript from '@rollup/plugin-typescript';
import pkg from './package.json';

const is_publish = !!process.env.PUBLISH;

const ts_plugin = is_publish
	? typescript({
		include: 'src/**',
		typescript: require('typescript')
	})
	: sucrase({
		transforms: ['typescript']
	});

const external = id => id.startsWith('svelte/');

fs.writeFileSync(`./compiler.d.ts`, `export { compile, parse, preprocess, walk, VERSION } from './types/compiler/index';`);

export default [
	// ruby
	{
		input: 'src/compiler/index.ts',
		plugins: [
			replace({
				__VERSION__: pkg.version
			}),
			resolve(),
			commonjs({
				include: ['node_modules/**']
			}),
			json(),
			ts_plugin
		],
		output: [
			{
				file: '../lib/svelte.js',
				format: "iife",
				name: 'svelte',
				sourcemap: false,
			},
		]
	}
];
