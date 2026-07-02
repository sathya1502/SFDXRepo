import { LightningElement, api} from 'lwc';

export default class MovieTile extends LightningElement {
    @api movie =[];
    @api selectedMovieId;

    handleClick(event){
        console.log("Movie Tile Clicked", this.movie.imdbID);

        //child to parent comms using customEvents & Dispatch
        const evt =  new CustomEvent('selectedmovie',{
            detail: this.movie.imdbID
        });

        this.dispatchEvent(evt);
    }

    get tileSelection(){
        return this.selectedMovieId === this.movie.imdbID
        ? 'tile selected': 'tile';
        
       
    }
}