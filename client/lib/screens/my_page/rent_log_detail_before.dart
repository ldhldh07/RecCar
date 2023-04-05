import 'package:flutter/material.dart';
import '../../widgets/my_page/damage_log_card.dart';

class BeforeRent extends StatefulWidget {
  final dynamic before;

  const BeforeRent({
    super.key,
    required this.before,
  });

  @override
  State<BeforeRent> createState() => _BeforeRentState();
}

class _BeforeRentState extends State<BeforeRent> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                if (widget.before.length == 0)
                  Container(child: Text("손상 정보가 없습니다"),),
                if (widget.before.length != 0)
                  for (var info in widget.before)
                    DamageLogCard(
                      imageUrl:
                          "${info['damageImageUrl']}",
                      kindOfDamage: (info['scratch'] > 0 ? "스크래치 ":"") + (info['breakage'] > 0 ? "파손 " : "") + (info['crushed'] > 0 ? "찌그러짐 " : "") + (info['separated'] > 0 ? "이격 " : ""),
                      damageDate: "${info['damageDate']}",
                      damageLocation: "${info['part']}" == 'front' ? "앞범퍼/펜더, 전조등" : "${info['part']}" == 'back' ? "뒷범퍼/펜더, 후미등" : "${info['part']}" == 'side' ? "옆면/사이드/스텝" : "${info['part']}" == 'wheel' ? "타이어/휠" : "",
                      damageId: info['detectionInfoId'],
                      memo: info['memo'],
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
