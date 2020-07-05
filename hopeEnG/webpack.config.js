var path = require('path');

module.exports = {
		context: path.resolve(__dirname, 'src/main/jsx'),
		entry: {
			main: './BraaPage.jsx',
			
		},
		devtool: 'sourcemaps',
		cache:true,
		output: {
			path: __dirname,
			filename: './src/main/webapp/js/react/[name].bundle.js'
		},
		mode: 'none',
		module: {
			rules: [{
				test: /\.(js|jsx)$/,
				exclude: /(node_modules)/,
				use: {
					loader: 'babel-loader',
					options: {
						presets: [ '@babel/preset-env', '@babel/preset-react']
					}
				}
			},{
				test: /\.css$/,
				use: [ 'style-loader', 'css-loader']
			}]
		}
};