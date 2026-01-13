import 'package:equatable/equatable.dart';
// import 'package:fpdart/fpdart.dart';

enum StoryType { image, video }

class StoryEntity extends Equatable {
  final String url;
  final StoryType type;
  final Duration duration;

  const StoryEntity({
    required this.url,
    required this.type,
    this.duration = const Duration(seconds: 5),
  });

  @override
  List<Object?> get props => [url, type, duration];
}
