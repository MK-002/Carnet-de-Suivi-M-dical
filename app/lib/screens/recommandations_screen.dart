import 'package:flutter/material.dart';
import '../models/recommandation.dart';
import '../services/data_loader.dart';
import '../widgets/health_tip_card.dart';
import '../widgets/filter_tabs.dart';

class RecommandationsScreen extends StatefulWidget {
  const RecommandationsScreen({super.key});

  @override
  State<RecommandationsScreen> createState() => _RecommandationsScreenState();
}

class _RecommandationsScreenState extends State<RecommandationsScreen> {
  List<Recommandation> allTips = [];
  String selectedCategory = 'Tous';

  @override
  void initState() {
    super.initState();
    _loadTips();
  }

  Future<void> _loadTips() async {
    final tips = await DataLoader.loadRecommandations();
    setState(() {
      allTips = tips;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filtered = selectedCategory == 'Tous'
        ? allTips
        : allTips.where((tip) => tip.categorie == selectedCategory).toList();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 120.0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 16, bottom: 16),
              title: Text(
                "Recommandations Santé",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            pinned: true,
            elevation: 1,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FilterTabs(
                    categories: const ['Tous', 'Sommeil', 'Nutrition', 'Activité physique'],
                    selected: selectedCategory,
                    onSelected: (val) => setState(() => selectedCategory = val),
                  ),
                  const SizedBox(height: 16),
                  ...filtered.map(
                    (tip) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: HealthTipCard(recommandation: tip),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
