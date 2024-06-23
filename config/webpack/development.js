const { environment } = require('@rails/webpacker');

// Definindo a entrada para 'application', que é padrão
environment.entry = {
    application: './app/javascript/packs/application.js'
};

module.exports = environment;
