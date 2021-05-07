const { environment } = require('@rails/webpacker');
const jquery = require('./plugins/jquery')
const webpack = require('webpack');
environment.plugins.append('Provide', new webpack.ProvidePlugin({
   $: 'jquery',
@@ -9,4 +10,5 @@ const config = environment.toWebpackConfig();
config.resolve.alias = {
   jquery: 'jquery/src/jquery'
};
environment.plugins.prepend('jquery', jquery)
module.exports = environment; 