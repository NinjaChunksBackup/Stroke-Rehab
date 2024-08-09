import 'package:flutter/material.dart';
import 'package:store_responsive_dashboard/constaints.dart';
import 'package:store_responsive_dashboard/model.dart';
import 'package:store_responsive_dashboard/widgets/news_item.dart';

final news = <News>[
  News(
    '5 minutes ago',
    'New Game Released for Hand Coordination',
    'assets/imgs/game_hand_coordination.png',
    'A new game focusing on hand-eye coordination has been released. This game uses motion tracking to help patients improve their fine motor skills.',
  ),
  News(
    '1 hour ago',
    'Upcoming Webinar on Stroke Recovery',
    'assets/imgs/webinar_stroke_recovery.png',
    'Join us for an informative webinar on the latest advancements in stroke recovery. Experts will discuss various rehab techniques and answer your questions.',
  ),
  News(
    'Today',
    'Success Story: Patient Achieves Milestone',
    'assets/imgs/success_story.png',
    'Read about John Doe, who has made significant progress in his recovery by using our rehab games. His dedication and hard work are truly inspiring.',
  ),
];

class NewsList extends StatelessWidget {
  final bool showDesktop;
  const NewsList([this.showDesktop = false]);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryLight.withAlpha(100),
      padding: EdgeInsets.symmetric(horizontal: componentPadding),
      child: Column(
        children: [
          Container(
            height: topBarHeight,
            child: Row(
              children: [
                this.showDesktop
                    ? SizedBox.shrink()
                    : IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                Expanded(
                    child: Center(
                  child: Text(
                    'Latest News',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ))
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: news.map((e) => NewsItem(e)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}