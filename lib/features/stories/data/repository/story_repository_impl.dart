import 'package:fpdart/fpdart.dart';
import '../../domain/entities/story_entity.dart';
import '../../domain/repository/story_repository.dart';

class StoryRepositoryImpl implements StoryRepository {
  @override
  Future<Either<Exception, List<StoryEntity>>> getStories() async {
    // Mock data
    await Future.delayed(const Duration(milliseconds: 500));
    return Right([
      const StoryEntity(
        url:
            'https://images.unsplash.com/photo-1500964757637-c85e8a162699?w=800&q=80',
        type: StoryType.image,
      ),
      const StoryEntity(
        url:
            'https://images.unsplash.com/photo-1472214103451-9374bd1c798e?w=800&q=80',
        type: StoryType.image,
      ),
      const StoryEntity(
        url:
            'https://images.unsplash.com/photo-1517849845537-4d257902454a?w=800&q=80',
        type: StoryType.image,
      ),
    ]);
  }
}
