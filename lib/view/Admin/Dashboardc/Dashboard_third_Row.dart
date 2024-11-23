import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getx/widgets/GridAnimation.dart';

class DashboardThirdRow extends StatelessWidget {
  const DashboardThirdRow({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dashed = [
      {
        'name': 'Total Students',
        'color': Color(0xffF3F4F8),
        'backIconColor': '',
        'upIcon': 'stu.svg',
      },
      {
        'name': 'Total Teacher',
        'color': Color(0xffF9E5EA),
        'backIconColor': '',
        'upIcon': 'tech.svg',
      },
      {
        'name': 'Total Employee',
        'color': Color(0xffB8D8BA),
        'backIconColor': '',
        'upIcon': 'emp.svg',
      },
      {
        'name': 'Total Visitor',
        'color': Color(0xffDFEDF7),
        'backIconColor': '',
        'upIcon': 'vist.svg',
      },
      {
        'name': 'Total Library',
        'color': Color(0xffFBEDD9),
        'backIconColor': '',
        'upIcon': 'divi.svg',
      },
      {
        'name': 'Total Division',
        'color': Color(0xffE7E6FB),
        'backIconColor': '',
        'upIcon': 'divi.svg',
      },
    ];
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 1.3,
        ),
        children: List.generate(6, (index) {
          return HoverScaleCard(
            child: Container(
              padding: EdgeInsets.all(13.0),
              decoration: BoxDecoration(
                color: dashed[index]['color'],
                border: Border.all(color: Colors.grey, width: 0.2),
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 1,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0),
                    child: SvgPicture.asset(
                      "../../images/${dashed[index]['upIcon']}",
                      width: 40.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text("${dashed[index]['name']}"),
                  ),
                  Text("1200"),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
