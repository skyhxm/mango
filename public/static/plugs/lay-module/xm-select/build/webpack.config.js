const pkg = require('../package.json');
const path = require('path');
const webpack = require('webpack');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const VueLoaderPlugin = require('vue-loader/lib/plugin');
const {
	CleanWebpackPlugin
} = require('clean-webpack-plugin');

const isProd = process.env.NODE_ENV === 'prod';

const banner =
`@Title: ${pkg.name}
@Version: ${pkg.version}
@Description：基于layui的多选解决方案
@Site: https://gitee.com/maplemei/xm-select
@Author: maplemei
@License：Apache License 2.0`;

const webpackConfig = {
	entry: {
		'xm-select': "./src/main.js",
		'static/docs': "./docs/entry.js",
	},
	output: {
		path: path.resolve(__dirname, isProd ? '../dist/' : '../docs/dist/'),
		filename: '[name].js',
		publicPath: './',
		chunkFilename: path.posix.join('./', 'static/[name].js'),
	},
	module: {
		rules: [{
			test: /\.css$/,
			loader: 'style-loader!css-loader'
		}, {
			test: /\.less$/,
			exclude: /node_modules/,
			loader: 'style-loader!css-loader!less-loader'
		}, {
			test: /\.m?js$/,
			exclude: /(node_modules|bower_components)/,
			use: {
				loader: 'babel-loader',
				options: {
					presets: ['@babel/preset-env']
				}
			}
		}, {
			test: /\.vue$/,
			loader: 'vue-loader',
			options: {
				compilerOptions: {
					preserveWhitespace: false
				}
			}
		}, {
			test: /\.md$/,
			use: [{
				loader: 'vue-loader',
				options: {
					compilerOptions: {
						preserveWhitespace: false
					}
				}
			}, {
				loader: path.resolve(__dirname, './md-loader/index.js')
			}]
		}, {
			test: /\.(svg|otf|ttf|woff2?|eot|gif|png|jpe?g)(\?\S*)?$/,
			loader: 'url-loader',
			// todo: 这种写法有待调整
			query: {
				limit: 10000,
				name: path.posix.join('static', '[name].[hash:7].[ext]')
			}
		}]
	},
	resolve: {
		alias: {
			'@': path.resolve(__dirname, "../src"),
			'components': path.resolve(__dirname, "../src/components"),
			'style': path.resolve(__dirname, "../src/style"),
		}
	},
	plugins: [
		new HtmlWebpackPlugin({
			template: './docs/index.ejs',
			filename: 'index.html',
			// favicon: './examples/favicon.ico',
			minify: {
				collapseWhitespace: true
			}
		}),
		new webpack.BannerPlugin(banner),
		new VueLoaderPlugin(),
	],
	devServer: {
		host: '0.0.0.0',
		port: 9001,
		publicPath: '/',
		hot: true
	},
};

if (isProd) {
	webpackConfig.plugins.push(
		new CleanWebpackPlugin(),
	)
}


module.exports = webpackConfig;
