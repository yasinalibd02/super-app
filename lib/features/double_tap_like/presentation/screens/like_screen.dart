import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/import.dart';
import '../../../../core/di/service_locator.dart';
import '../bloc/like_bloc.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LikeBloc>(),
      child: const _LikeView(),
    );
  }
}

class _LikeView extends StatefulWidget {
  const _LikeView();

  @override
  State<_LikeView> createState() => _LikeViewState();
}

class _LikeViewState extends State<_LikeView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted) _controller.reverse();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleDoubleTap() {
    context.read<LikeBloc>().add(ToggleLike());
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Double Tap to Like")),
      body: Center(
        child: GestureDetector(
          onDoubleTap: _handleDoubleTap,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Image
              Container(
                width: double.infinity,
                height: 400,
                color: Colors.grey.shade300,
                child: Image.network(
                  'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800&q=80',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                ),
              ),

              // Big Heart Animation
              ScaleTransition(
                scale: _scaleAnimation,
                child: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 100,
                ),
              ),

              // Like Button (Bottom Right)
              Positioned(
                bottom: 20,
                right: 20,
                child: BlocBuilder<LikeBloc, LikeState>(
                  builder: (context, state) {
                    return IconButton(
                      icon: Icon(
                        state.isLiked ? Icons.favorite : Icons.favorite_border,
                        color: state.isLiked ? Colors.red : Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        context.read<LikeBloc>().add(ToggleLike());
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
