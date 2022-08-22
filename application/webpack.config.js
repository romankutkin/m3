const path = require('path');

module.exports = {
    mode: 'development',
    entry: {
        index: './assets/js/index.js',
    },
    output: {
        path: path.resolve(__dirname, 'public/bundles'),
        filename: '[name].bundle.js',
    },
};
