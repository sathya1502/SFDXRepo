import { LightningElement } from 'lwc';
const DELAY = 300;
export default class MovieSearch extends LightningElement {
    selectedType = "";
    loading=false;
    search;
    pageNo = "1";
    delayTimeOut; 
    searchResult =[];
    selectedMovie="";

    get avlOptions(){
        return [
             { label: 'All', value: '' },
            { label: 'Movie', value: 'movie'},
            { label: 'Series', value: 'series'},
            { label: 'Episode', value: 'episode'},
        ];
    }

    handleChange(event){
        let {name,value} = event.target;
        this.loading = true;
        if(name==="type"){
            this.selectedType = value;
        }
        else if(name === 'search'){
            this.search=value;
        }
        else if(name === 'page'){
            this.pageNo = value;
        }
        clearTimeout(this.delayTimeOut);
        this.delayTimeOut = setTimeout(()=>{
            this.searchMovies();
        },DELAY)
    }

    //initiates the API call to fetch the movie details
    async searchMovies(){

    try{        
    const url = `https://www.omdbapi.com/?s=${this.search}&type=${this.selectedType}&page=${this.pageNo}&apikey=78b85072`;
    const res = await fetch(url);
    const data = await res.json();
    console.log("Movie Search Result:", data);
    if(data.Response === "True"){
        console.log('Movie 2', data.Search)
        this.searchResult = data.Search;
    }
    }catch(error){
        console.error("API Error:", error);
    }finally{
        this.loading = false;
    }
}

get displayStatus(){
    return this.searchResult.length > 0 ? true: false;
}

movieSelectedHandler(event){
    this.selectedMovie = event.detail;
    console.log('SelectedMovie:',this.selectedMovie);
}

}