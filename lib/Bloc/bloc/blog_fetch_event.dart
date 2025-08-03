part of 'blog_fetch_bloc.dart';

abstract class BlogFetchEvent extends Equatable {
  const BlogFetchEvent();

  @override
  List<Object?> get props => [];
}

class LoadBlogs extends BlogFetchEvent {}
