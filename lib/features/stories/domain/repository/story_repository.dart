import 'package:fpdart/fpdart.dart';
import '../entities/story_entity.dart';

abstract class StoryRepository {
  Future<Either<Exception, List<StoryEntity>>> getStories();
}
