var path = require('path')

module.exports = {
    context: __dirname + "/apps",
    entry: {
        bluetooth: "./bluetooth",
        calendar: "./calendar",
        exercise: "./exercise",
        jumptest: "./jumptest",
        workout: "./workout.js",
        workoutcreator: "./workoutcreator.js"

    },
    output: {
        path: __dirname + "/public/js/",
        filename: "[name].js"
    },
    module: {
        loaders: [
            {
                test: /\.js$/,
                loader: "babel-loader",
                exclude: path.resolve(__dirname, "node_modules"),
                query:{
                    presets: ['es2015']
                }
            },
            {
                test: /\.tag$/,
                loader: "tag",
                exclude: path.resolve(__dirname, "node_modules")
            }
        ]
    },
    resolve: {
        root: [
            path.resolve('./node_modules')
        ],
        modulesDirectories: [__dirname + "node_modules/"]
    }
};
