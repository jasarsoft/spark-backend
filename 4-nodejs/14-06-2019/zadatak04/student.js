const s = {
    ime: "Edin",
    prezime: 'Jasarevic',
    fakultet: 'MF',
    starost: 14,

    ispis: function(){
        console.log(this.ime + ' ' + this.prezime);
    }
};

module.exports.student = s;