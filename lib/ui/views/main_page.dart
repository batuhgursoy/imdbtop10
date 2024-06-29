import 'package:flutter/material.dart';
import 'package:imdb_top_10/data/entity/movies.dart';
import 'package:imdb_top_10/ui/views/detail_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<List<Movies>> uploadMovies() async {
    var myMovies = <Movies>[];
    var m1 = Movies(
        name: "1. The Shawshank Redemption",
        director: "Frank Darabont",
        description:
            "Wrongly convicted of a banking crime, Andy Dufresne fights for survival in Shawshank Prison, where he discovers the power of friendship. An epic tale of human hope and the quest for freedom.",
        year: 1994,
        image: "movie_pic/1.jpg");
    var m2 = Movies(
        name: "2. The Godfather",
        director: "Francis Ford Coppola",
        description:
            "A powerful crime family saga, 'The Godfather' explores the intricacies of loyalty, power, and betrayal within the Corleone dynasty. Set against the backdrop of post-war America, it's a timeless tale of ambition and family honor.",
        year: 1972,
        image: "movie_pic/2.jpg");
    var m3 = Movies(
        name: "3. The Dark Knight",
        director: "Christopher Nolan",
        description:
            "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
        year: 2008,
        image: "movie_pic/3.jpg");
    var m4 = Movies(
        name: "4. The Godfather Part II",
        director: "Francis Ford Coppola",
        description:
            "The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.",
        year: 1974,
        image: "movie_pic/4.jpg");
    var m5 = Movies(
        name: "5. 12 Angry Men",
        director: "Sidney Lumet",
        description:
            "The jury in a New York City murder trial is frustrated by a single member whose skeptical caution forces them to more carefully consider the evidence before jumping to a hasty verdict.",
        year: 1957,
        image: "movie_pic/5.jpg");
    var m6 = Movies(
        name: "6. Schindler's List",
        director: "Steven Spielberg",
        description:
            "In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.",
        year: 1993,
        image: "movie_pic/6.jpg");
    var m7 = Movies(
        name: "7. The Lord of the Rings: The Return of the King",
        director: "Peter Jackson",
        description:
            "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.",
        year: 2003,
        image: "movie_pic/7.jpg");
    var m8 = Movies(
        name: "8. Pulp Fiction",
        director: "Quentin Tarantino",
        description:
            "The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.",
        year: 1994,
        image: "movie_pic/8.jpg");
    var m9 = Movies(
        name: "9. The Lord of the Rings: The Fellowship of the Ring",
        director: "Peter Jackson",
        description:
            "A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.",
        year: 2001,
        image: "movie_pic/9.jpg");
    var m10 = Movies(
        name: "10. The Good, the Bad and the Ugly",
        director: "Sergio Leone",
        description:
            "A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery.",
        year: 1966,
        image: "movie_pic/10.jpg");
    myMovies.add(m1);
    myMovies.add(m2);
    myMovies.add(m3);
    myMovies.add(m4);
    myMovies.add(m5);
    myMovies.add(m6);
    myMovies.add(m7);
    myMovies.add(m8);
    myMovies.add(m9);
    myMovies.add(m10);
    return myMovies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IMDB Top 10 List"),
      ),
      body: FutureBuilder<List<Movies>>(
        future: uploadMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var myMovies = snapshot.data;
            return ListView.builder(
              itemCount: myMovies!.length,
              itemBuilder: (context, index) {
                var movie = myMovies[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(movie: movie)));
                  },
                  child: Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.asset("${movie.image}")),
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${movie.name}"),
                            SizedBox(height: 5),
                            Text(
                              "${movie.year.toString()}",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
