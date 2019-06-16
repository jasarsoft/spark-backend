module.exports.today = function() {
    return new Date().toISOString().slice(0,10);
}

module.exports.day = function() {
    return new Date().toLocaleString('en-us', {  weekday: 'long' });
}