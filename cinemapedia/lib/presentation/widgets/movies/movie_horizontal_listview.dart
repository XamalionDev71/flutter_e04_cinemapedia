import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:cinemapedia/domain/entities/movies.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListview extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListview({
    super.key,
    required this.movies,
    this.title,
    this.subTitle,
    this.loadNextPage
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if(title != null || subTitle != null)
            _Title(title: title,subTitle: subTitle),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index){
                return _Slide(movie:movies[index]);
              }),
            ),
        ],
      ),
    );
  }
}

class _Slide extends StatefulWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  State<_Slide> createState() => _SlideState();
}

class _SlideState extends State<_Slide> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Container(
      child: Column(
        children: [
          //Imagen
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                widget.movie.posterPath,
                width: 150,
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const _Title({
    this.title,
    this.subTitle
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: EdgeInsets.only(top:10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if(title!=null)
            Text(title!,style: titleStyle),
          Spacer(),
          if(subTitle!=null)
            FilledButton.tonal(
              onPressed: (){},
              child: Text(subTitle!),
            ),
        ],
      ),
    );
  }
}