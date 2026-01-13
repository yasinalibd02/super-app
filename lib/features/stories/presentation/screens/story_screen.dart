import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../app/import.dart';
import '../../../../core/di/service_locator.dart';
import '../../domain/entities/story_entity.dart';
import '../bloc/story_bloc.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<StoryBloc>()..add(LoadStories()),
      child: const _StoryView(),
    );
  }
}

class _StoryView extends StatelessWidget {
  const _StoryView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<StoryBloc, StoryState>(
        listener: (context, state) {
          if (state is StoryFinished) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is StoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is StoryError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.white),
              ),
            );
          } else if (state is StoryLoaded) {
            final story = state.stories[state.currentIndex];
            return GestureDetector(
              onTapDown: (details) {
                final width = MediaQuery.of(context).size.width;
                if (details.globalPosition.dx < width / 3) {
                  context.read<StoryBloc>().add(PreviousStory());
                } else {
                  context.read<StoryBloc>().add(NextStory());
                }
              },
              onLongPressStart: (_) =>
                  context.read<StoryBloc>().add(PauseStory()),
              onLongPressEnd: (_) =>
                  context.read<StoryBloc>().add(ResumeStory()),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Image
                  CachedNetworkImage(
                    imageUrl: story.url,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),

                  // Shadow Overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.4),
                          Colors.transparent,
                        ],
                        stops: const [0, 0.2],
                      ),
                    ),
                  ),

                  // Progress Bar
                  Positioned(
                    top: 50,
                    left: 10,
                    right: 10,
                    child: Row(
                      children: state.stories.asMap().entries.map((entry) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 2.0,
                            ),
                            child: LinearProgressIndicator(
                              value: (entry.key < state.currentIndex)
                                  ? 1.0
                                  : (entry.key == state.currentIndex)
                                  ? state.percent
                                  : 0.0,
                              backgroundColor: Colors.white.withOpacity(0.3),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                              minHeight: 2,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  // Close Button
                  Positioned(
                    top: 60,
                    right: 20,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
