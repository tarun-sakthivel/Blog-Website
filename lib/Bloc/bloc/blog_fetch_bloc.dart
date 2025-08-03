import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bolg_website/Models/BlogModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
// make sure to import your model

part 'blog_fetch_event.dart';
part 'blog_fetch_state.dart';

class BlogFetchBloc extends Bloc<BlogFetchEvent, BlogFetchState> {
  BlogFetchBloc() : super(BlogFetchInitial()) {
    on<LoadBlogs>(_onLoadBlogs);
  }

  Future<void> _onLoadBlogs(
    LoadBlogs event,
    Emitter<BlogFetchState> emit,
  ) async {
    emit(BlogFetchLoading());
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay

    try {
      print("Entering try");
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Blog')
          .orderBy('Time', descending: true)
          .get();
      print("----------");
      final blogs = querySnapshot.docs.map((doc) {
        return BlogModel.fromMap(doc.id, doc.data());
      }).toList();
      print("Converted to list");
      emit(BlogFetchLoaded(blogs));
    } catch (e) {
      emit(BlogFetchError(e.toString()));
    }
  }
}
