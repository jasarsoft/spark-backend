module.exports.calc = {
    sabiranje: function(a, b){
        return a + b;
    },

    oduzimanje: function(a, b){
        return a - b;
    },

    mnozenje: function(a, b){
        return a * b;
    },

    djeljenje: function(a, b){
        return b !== 0 ? a / b : 'Djeljenje s nulom nije definisano';
    },

    mod: function(a, b){
        return a % b;
    },

    pow: function(a, b){
        return Math.pow(a, b);
    }
}

