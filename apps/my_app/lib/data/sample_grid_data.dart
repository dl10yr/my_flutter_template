import 'package:flutter/material.dart';
import '../models/grid_item.dart';

class SampleGridData {
  static List<GridItem> get items => [
        const GridItem(
          title: 'Animation',
          subtitle: 'Beautiful animations',
          color: Colors.blue,
          icon: Icons.animation,
          lottie: 'https://assets5.lottiefiles.com/packages/lf20_V9t630.json',
        ),
        const GridItem(
          title: 'Design',
          subtitle: 'Creative designs',
          color: Colors.green,
          icon: Icons.design_services,
          lottie: 'https://assets9.lottiefiles.com/packages/lf20_khzniaya.json',
        ),
        const GridItem(
          title: 'Innovation',
          subtitle: 'Future technology',
          color: Colors.orange,
          icon: Icons.lightbulb,
          lottie: 'https://assets2.lottiefiles.com/packages/lf20_qp1q7mct.json',
        ),
        const GridItem(
          title: 'Photography',
          subtitle: 'Capture moments',
          color: Colors.purple,
          icon: Icons.camera_alt,
          lottie: 'https://assets4.lottiefiles.com/packages/lf20_sSF6EG.json',
        ),
        const GridItem(
          title: 'Music',
          subtitle: 'Sound & rhythm',
          color: Colors.red,
          icon: Icons.music_note,
          lottie: 'https://assets1.lottiefiles.com/packages/lf20_khzniaya.json',
        ),
        const GridItem(
          title: 'Sports',
          subtitle: 'Active lifestyle',
          color: Colors.teal,
          icon: Icons.sports_soccer,
          lottie: 'https://assets3.lottiefiles.com/packages/lf20_khzniaya.json',
        ),
        const GridItem(
          title: 'Learning',
          subtitle: 'Knowledge growth',
          color: Colors.indigo,
          icon: Icons.book,
          lottie: 'https://assets7.lottiefiles.com/packages/lf20_khzniaya.json',
        ),
        const GridItem(
          title: 'Coffee',
          subtitle: 'Daily energy',
          color: Colors.brown,
          icon: Icons.coffee,
          lottie: 'https://assets8.lottiefiles.com/packages/lf20_khzniaya.json',
        ),
      ];
}