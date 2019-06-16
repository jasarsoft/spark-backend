module.exports.osoba = {
    imeOsobe : "",
    prezimeOsobe : '',
    datumRodjenjaOsobe: '',
    gradOsobe: '',

    set ime(value){
        this.imeOsobe = value;
    },
    set prezime(value){
        this.prezimeOsobe = value;
    },
    set datumRodjenja(value){
        this.datumRodjenjaOsobe = value;
    },
    set grad(value){
        this.gradOsobe = value;
    },

    get ime(){
        return this.imeOsobe;
    },
    get prezime(){
        return this.prezimeOsobe;
    },
    get datumRodjenja(){
        return this.datumRodjenjaOsobe;
    },
    get grad(){
        return this.gradOsobe;
    },

    godinaStarosti(){
        let d = new Date();
        let g = new Date(this.datumRodjenjaOsobe);
        return d.getFullYear() - g.getFullYear();
    }

}