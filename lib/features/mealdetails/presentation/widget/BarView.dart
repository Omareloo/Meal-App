import 'package:flutter/material.dart';

import 'Directions.dart';
import 'Ingrediants.dart';
import 'Summary.dart';
class BarView extends StatelessWidget {
  const BarView({
    super.key,
    required TabController tabController,
    required this.nutrients,
  }) : _tabController = tabController;

  final TabController _tabController;
  final List<Map<String, String>> nutrients;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TabBarView(
          controller: _tabController,
          children: [
            SingleChildScrollView(
              child: SummaryCard(summary: "consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum", nutrients: nutrients),
            ),
            SingleChildScrollView(
              child: IngrediantsCard(name: "Bread",quantity: "2 pcs",),
            ),
            SingleChildScrollView(
              child: DirectionCard(
                  step1: "consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum ",
                  step2: "consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum "),
            )
          ],
        ),
      ),
    );
  }
}