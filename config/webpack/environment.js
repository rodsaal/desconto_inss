const { environment } = require('@rails/webpacker')

environment.entry = {
    application: './path/to/your/main/javascript/file.js'
};

module.exports = environment