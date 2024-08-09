import 'package:flutter/material.dart';
import 'package:store_responsive_dashboard/layout/main_layout.dart';
import 'package:store_responsive_dashboard/constaints.dart';
import 'package:store_responsive_dashboard/model.dart';
import 'package:store_responsive_dashboard/widgets/game_item.dart';

class GameSelectionTrackingPage extends StatefulWidget {
  @override
  _GameSelectionTrackingPageState createState() => _GameSelectionTrackingPageState();
}

class _GameSelectionTrackingPageState extends State<GameSelectionTrackingPage> {
  List<Game> games = [];

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final _showDesktop = _size.width >= screenXxl;
    
    return MainLayout(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(componentPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Game Selection',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: primaryAncient,
              ),
            ),
            SizedBox(height: componentPadding * 1.5),
            _buildGameGrid(_showDesktop),
            SizedBox(height: componentPadding),
            ElevatedButton.icon(
              onPressed: _addGame,
              icon: Icon(Icons.add, color: Colors.white),
              label: Text('Add Game', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryAncient,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
            SizedBox(height: componentPadding * 2),
            MotionTrackingWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildGameGrid(bool showDesktop) {
    if (games.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.games, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No games added yet',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            Text(
              'Add a game to get started',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return Container(
      height: 400,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: showDesktop ? 4 : 2,
          childAspectRatio: 1,
          crossAxisSpacing: componentPadding,
          mainAxisSpacing: componentPadding,
        ),
        itemCount: games.length,
        itemBuilder: (context, index) {
          return GameItem(
            game: games[index],
            onDoubleTap: () => _playGame(games[index]),
          );
        },
      ),
    );
  }

  void _addGame() {
    setState(() {
      games.add(Game('New Game ${games.length + 1}', 'assets/game_placeholder.png', ''));
    });
  }

  void _playGame(Game game) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Launching ${game.name}...'))
    );
  }
}

class MotionTrackingWidget extends StatefulWidget {
  @override
  _MotionTrackingWidgetState createState() => _MotionTrackingWidgetState();
}

class _MotionTrackingWidgetState extends State<MotionTrackingWidget> {
  bool isTracking = false;
  Set<TrackingMode> selectedMode = {TrackingMode.head};
  double sensitivity = 0.5;

  @override
   @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(componentPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Motion Tracking',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: primaryAncient,
              ),
            ),
            SizedBox(height: componentPadding),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Video feed will appear here',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ),
            ),
            SizedBox(height: componentPadding),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: _toggleTracking,
                  icon: Icon(isTracking ? Icons.stop : Icons.play_arrow, color: Colors.white),
                  label: Text(
                    isTracking ? 'Stop Tracking' : 'Start Tracking',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isTracking ? Colors.red : Colors.green,
                  ),
                ),
                SizedBox(width: componentPadding),
                SegmentedButton<TrackingMode>(
                  segments: const <ButtonSegment<TrackingMode>>[
                    ButtonSegment<TrackingMode>(
                      value: TrackingMode.head,
                      label: Text('Head'),
                      icon: Icon(Icons.face),
                    ),
                    ButtonSegment<TrackingMode>(
                      value: TrackingMode.hands,
                      label: Text('Hands'),
                      icon: Icon(Icons.pan_tool),
                    ),
                  ],
                  selected: selectedMode,
                  onSelectionChanged: (Set<TrackingMode> newSelection) {
                    setState(() {
                      selectedMode = newSelection;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return Theme.of(context).colorScheme.primary;
                        }
                        return Theme.of(context).colorScheme.surface;
                      },
                    ),
                    foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return Theme.of(context).colorScheme.onPrimary;
                        }
                        return Theme.of(context).colorScheme.onSurface;
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: componentPadding),
            Text('Sensitivity', style: Theme.of(context).textTheme.titleMedium),
            Slider(
              value: sensitivity,
              onChanged: (newValue) => setState(() => sensitivity = newValue),
              min: 0,
              max: 1,
              divisions: 10,
              label: sensitivity.toStringAsFixed(1),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleTracking() {
    setState(() => isTracking = !isTracking);
  }
}

enum TrackingMode { head, hands }