const path = require('path');

module.exports = {
    mode: 'development',
    entry: {
        index: './assets/js/index.js',
    },
    module: {
        rules: [
            {
                test: /\.(js|jsx)$/i,
                exclude: /node_modules/,
                use: {
                    loader: "babel-loader",
                    options: {
                        presets: [
                            "@babel/preset-env",
                            "@babel/preset-react"
                        ]
                    }
                }
            },
        ],
    },
    output: {
        path: path.resolve(__dirname, 'public/bundles'),
        filename: '[name].bundle.js',
    },
};
