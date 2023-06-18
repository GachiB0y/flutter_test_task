import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_task/domain/blocs/main_screen_cubit.dart';
import 'package:flutter_test_task/domain/entity/deal.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  static Widget create() {
    return BlocProvider<MainScreenCubit>(
      create: (context) => MainScreenCubit(),
      child: const MainScreenWidget(),
    );
  }

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MainScreenCubit>();
    final List<Deal> listDeal = cubit.state.itemsGet;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: ListView.builder(
              itemCount: listDeal.length,
              itemBuilder: (BuildContext context, int index) {
                return DealElementWidget(
                  index: index,
                  listDeal: listDeal,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class DealElementWidget extends StatelessWidget {
  final int index;
  final List<Deal> listDeal;
  const DealElementWidget(
      {super.key, required this.index, required this.listDeal});

  @override
  Widget build(BuildContext context) {
    final name = listDeal[index].offerFristResponsible;
    final id = listDeal[index].offerId;
    final status = listDeal[index].statusName;
    final type = listDeal[index].segmentName;
    final sum = listDeal[index].offerSum;
    return Card(
      child: Column(
        children: [
          RichText(
            text: TextSpan(
                text: "#${id.toString()} ",style: const TextStyle(color: Colors.black), children: [TextSpan(text: status)]),
          ),
          Text(name),
          Text(type),
          Text(sum),
        ],
      ),
    );
  }
}
