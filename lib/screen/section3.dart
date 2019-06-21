import 'package:flutter/material.dart';
import 'package:game/drawer.dart';
import 'package:flip_card/flip_card.dart';

class Section3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Section 3"),
      ),
      body: Stack (
        children: <Widget>[
          Center(
            child: new Image.asset(
              'assets/images/splash.png',
              width: size.width,
              height: size.height,
              fit: BoxFit.fill,
            ),
          ),
          Center(
              child:
                FlipCard(
                  front: Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow,
//                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    child: Center(child: Text("在約翰福音中耶穌所行使的七個神蹟有哪些並且有哪些含義？"))
                  ),
                  back: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
//                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("在約翰福音中耶穌所行使的七個神蹟有哪些並且有哪些含義？"),
                        Text("\n\n一、迦拿水变酒的神迹----给人喜乐【约2；1-11节】 \n\n二、医治大臣之子的神迹----给人健康【约4；46-54节】 \n\n三、三十八年的瘫子的医治的神迹----给人强壮【约5；1-9节】 \n\n四、五饼二鱼的神迹----给人饱足【约6；1-14节】 \n\n五、海上行走的神迹----给人平安【约6；16-21节】 \n\n六、生来瞎眼的人得医的神迹----给人光明【约9；1-12节】 \n\n七、拉撒路死里复活的神迹----给人生命【约11；1-46节】"),
                      ],
                    ),
                  ),
                )
          )
        ],
      ),
      drawer: DrawerWidget(),

    );
  }
}
