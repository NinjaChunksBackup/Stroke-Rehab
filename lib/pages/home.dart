import 'package:flutter/material.dart';
import 'package:store_responsive_dashboard/layout/main_layout.dart';
import 'package:store_responsive_dashboard/constaints.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  final List<String> sliderItems = [
    'Welcome back! Ready for today\'s exercises?',
    'Remember to stay hydrated during your sessions.',
    'Great job on your progress this week!',
  ];

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(componentPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Your Stroke Rehab App',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: primaryAncient,
              ),
            ),
            SizedBox(height: componentPadding),
            _buildSlider(),
            SizedBox(height: componentPadding),
            _buildQuickStats(),
            SizedBox(height: componentPadding),
            _buildUpcomingSession(),
            SizedBox(height: componentPadding),
            _buildRecommendedGames(),
            SizedBox(height: componentPadding),
            _buildDailyTip(),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 100.0,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: 2.0,
      ),
      items: sliderItems.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  item,
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildQuickStats() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(componentPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Quick Stats', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(Icons.sports_esports, '5', 'Games Played Today'),
                _buildStatItem(Icons.timer, '45 min', 'Time Spent'),
                _buildStatItem(Icons.trending_up, '80%', 'Accuracy'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, size: 32, color: primary),
        SizedBox(height: 8),
        Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildUpcomingSession() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(componentPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Upcoming Session', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.calendar_today, color: primary),
              title: Text('Hand Coordination Exercise'),
              subtitle: Text('Today, 3:00 PM'),
              trailing: ElevatedButton(
                onPressed: () {
                  // Navigate to session or show details
                },
                child: Text('Start'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendedGames() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(componentPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recommended Games', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildGameItem('Pottery', 'assets/pottery_icon.png'),
                  _buildGameItem('Ball Catcher', 'assets/ball_catcher_icon.png'),
                  _buildGameItem('Memory Match', 'assets/memory_match_icon.png'),
                  _buildGameItem('Reaction Time', 'assets/reaction_time_icon.png'),
                  _buildGameItem('Balance Board', 'assets/balance_board_icon.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameItem(String name, String imagePath) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Image.asset(imagePath, width: 64, height: 64),
          SizedBox(height: 8),
          Text(name, style: TextStyle(fontSize: 14), textAlign: TextAlign.center),
        ],
      ),
    );
  }


  Widget _buildDailyTip() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(componentPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Daily Tip', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text(
              'Remember to take frequent breaks during your exercises. '
              'Short rest periods can help prevent fatigue and improve overall performance.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}