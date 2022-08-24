import 'dart:io';

abstract class ExtractEvent {}

class ExtractTextEvent extends ExtractEvent {
  final File image;

  ExtractTextEvent(this.image);
}
