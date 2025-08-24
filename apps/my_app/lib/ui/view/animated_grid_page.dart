import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../models/grid_item.dart';
import '../../widgets/animated_grid_card.dart';
import '../../widgets/loading_indicator.dart';
import '../../utils/animation_wrapper.dart';
import '../../data/sample_grid_data.dart';

class AnimatedGridPage extends HookConsumerWidget {
  const AnimatedGridPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoaded = useState(false);
    final animationType = useState(0);
    final gridItems = SampleGridData.items;

    useEffect(() {
      Future<void> loadData() async {
        await Future.delayed(const Duration(milliseconds: 800));
        isLoaded.value = true;
      }

      loadData();
      return null;
    }, []);

    void refreshGrid() {
      isLoaded.value = false;
      Future.delayed(const Duration(milliseconds: 800), () {
        isLoaded.value = true;
      });
    }

    void cycleAnimation() {
      animationType.value = (animationType.value + 1) % 3;
      refreshGrid();
    }

    void onCardTap(int index) {
      final item = gridItems[index];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Tapped on ${item.title}'),
          duration: const Duration(seconds: 1),
        ),
      );
    }

    Widget buildAnimatedCard(int index) {
      final item = gridItems[index];
      final card = AnimatedGridCard(
        item: item,
        index: index,
        onTap: () => onCardTap(index),
      );

      return AnimationWrapper.wrapWithAnimation(
        child: card,
        index: index,
        animationType: AnimationWrapper.getAnimationTypeFromIndex(animationType.value),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Grid Cards'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.animation),
            tooltip: 'Change Animation',
            onPressed: cycleAnimation,
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: refreshGrid,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.surface.withOpacity(0.8),
              Theme.of(context).colorScheme.surface,
            ],
          ),
        ),
        child: isLoaded.value
            ? AnimationLimiter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 1.1,
                    ),
                    itemCount: gridItems.length,
                    itemBuilder: (context, index) => buildAnimatedCard(index),
                  ),
                ),
              )
            : const LoadingIndicator(),
      ),
    );
  }
}