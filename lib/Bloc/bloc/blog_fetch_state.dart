part of 'blog_fetch_bloc.dart';

abstract class BlogFetchState extends Equatable {
  const BlogFetchState();

  @override
  List<Object?> get props => [];
}

class BlogFetchInitial extends BlogFetchState {}

class BlogFetchLoading extends BlogFetchState {}

class BlogFetchLoaded extends BlogFetchState {
  final List<BlogModel> blogs;

  const BlogFetchLoaded(this.blogs);

  @override
  List<Object?> get props => [blogs];
}

class BlogFetchError extends BlogFetchState {
  final String message;

  const BlogFetchError(this.message);

  @override
  List<Object?> get props => [message];
}
