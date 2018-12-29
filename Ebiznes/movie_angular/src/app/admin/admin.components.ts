import {Component, OnDestroy, OnInit} from '@angular/core';
import {ActivatedRoute, Data, Params, Router} from '@angular/router';
import {CookieService} from "angular2-cookie/core";
import {AdminService} from "./admin.service";
import {forEach} from "@angular/router/src/utils/collection";
import {Movie} from "../movies/movie";
import {MoviesService} from "../movies/movies.service";
import {Location} from "@angular/common";


@Component({
  selector: 'app-admin',
  templateUrl: './admin.html',
  providers: [AdminService]
})
export class AdminComponent implements OnInit, OnDestroy {

  movie: Movie = new Movie();
  idUser: string;

  constructor(private adminService: AdminService, private cookieService: CookieService, private activatedRoute: ActivatedRoute,
              private location:Location, private router: Router) { }

  ngOnInit(): void {
    this.idUser = this.cookieService.get("userAuth");
    console.log(this.idUser != 'undefined');
    if(typeof this.idUser === 'undefined') {
      this.location.replaceState('/');
      this.router.navigate(['']);
    }
    this.movie.id = 0;
    this.movie.title = "";
    this.movie.description = "";
    this.movie.poster = "";
    this.movie.releaseDate = "";
    this.movie.genre = "";
    this.movie.price = 0;
  }

  ngOnDestroy(): void { }

  clickID(event){
    // this.movie.id = 1;
    if ((event && event.target.value && Number(event.target.value)) || Number(event.target.value) == 0) {
      this.movie.id = Number(event.target.value);

      console.log("admin id");
      if(this.movie.id > 0) {
        this.adminService.getMovie(this.movie.id.toString()).subscribe(json => {
          this.movie = json;
          this.movie = this.movie[0];
          console.log(this.movie);
        });
      }
    }
  }
  clickTitle(event){
    if (event && event.target.value && event.target.value.length > 0) {
      this.movie.title = event.target.value;
    }
  }
  clickPoster(event){
    if (event && event.target.value && event.target.value.length > 0) {
      this.movie.poster = event.target.value;
    }
  }
  clickPrice(event){
    if (event && event.target.value && event.target.value.length > 0) {
      this.movie.price = Number(event.target.value);
    }
  }
  clickGenre(event){
    if (event && event.target.value && event.target.value.length > 0) {
      this.movie.genre = event.target.value;
    }
  }
  clickMark(event){
    if (event && event.target.value && event.target.value.length > 0) {
      this.movie.mark = Number(event.target.value);
    }
  }
  clickLength(event){
    if (event && event.target.value && event.target.value.length > 0) {
      this.movie.length = Number(event.target.value);
    }
  }
  clickDate(event){
    if (event && event.target.value && event.target.value.length > 0) {
      this.movie.releaseDate = event.target.value;
    }
  }
  clickDescription(event){
    if (event && event.target.value && event.target.value.length > 0) {
      this.movie.description = event.target.value;
    }
  }

  click() {
    if(this.movie.id == 0) {
      this.adminService.newMovie(this.movie);
    } else {
      this.adminService.updateMovie(this.movie);
    }
  }
}
