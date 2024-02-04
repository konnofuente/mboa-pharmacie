import '../../bloc/bloc_export.dart';
import 'package:flutter/material.dart';
import '../../bloc/DrugCategoriesBloc/drug_categories_bloc.dart';

class StatisticScreen extends StatefulWidget {
  StatisticScreen();

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  @override
  void dispose() {
    _getStatistics(context);
    super.dispose();
  }

  late int totalCategories = 0;
  // Replace with your own data
  int totalItems = 0;

  void _getStatistics(BuildContext context) {
    DrugCategoriesBloc equipmentCategoriesBloc =
        BlocProvider.of<DrugCategoriesBloc>(context);
    totalCategories = equipmentCategoriesBloc.state.allDrugCategories.length;
    print(totalCategories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Total Number of Categories
            _buildStatCard(
              'Total Categories',
              '$totalCategories',
              Colors.blue,
            ),
            SizedBox(height: 20),

            // Total Number of Items
            _buildStatCard(
              'Total Items',
              '$totalItems',
              Colors.green,
            ),
            SizedBox(height: 20),

            // Other Stats here...
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color.withOpacity(0.1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
