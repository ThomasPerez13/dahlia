const path    = require("path")
const webpack = require("webpack")
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

module.exports = {
  mode: "production",
  devtool: "source-map",
  entry: {
    application: "./app/javascript/application.js"
  },
  output: {
    filename: "[name].js",
    sourceMapFilename: "[file].map",
    path: path.resolve(__dirname, "app/assets/builds"),
  },  module: {
    rules: [
      {
        test: /\.css$/i,
        use: ["css-loader"],
      },
    ],
  },
  plugins: [
    new webpack.optimize.LimitChunkCountPlugin({
      maxChunks: 1
    })
  ],
  entry: {
    application: "./app/javascript/application.js"
  },
  output: {
      path: path.resolve(__dirname, "app/assets/builds"),
      filename: 'tuiCalendar.bundle.js'
  },
  plugins: [
      new MiniCssExtractPlugin(
          {
              filename: 'tuiCalendar.css'
          })
  ],
  module: {
      rules: [
          {
              test: /\.css$/i,
              use: [MiniCssExtractPlugin.loader, 'css-loader'],
          },
      ]
  }
}
