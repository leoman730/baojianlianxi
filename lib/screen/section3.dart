import 'package:flutter/material.dart';
import 'package:game/drawer.dart';
import 'package:flip_card/flip_card.dart';

class Section3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("挑戰題"),
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
                        color: Colors.white,
//                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          image: DecorationImage(
                            image: ExactAssetImage('assets/images/walkingonwater.jpg'),
                            fit: BoxFit.cover,
                            colorFilter:  new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                          )
                      ),
                    child: Center(child: Text("在約翰福音中耶穌所行使的七個神蹟有哪些並且有哪些含義？", style: TextStyle(fontSize: 35),))
                  ),
                  back: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
//                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/peterwater.jpg'),
                        fit: BoxFit.cover,
                        colorFilter:  new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("在約翰福音中耶穌所行使的七個神蹟有哪些並且有哪些含義？",style: TextStyle(fontSize: 25),),
                        Text(
                            "\n\n一、迦拿水變酒的神蹟----給人喜樂【約2；1-11節】\n\n二、醫治大臣之子的神蹟----給人健康【約4；46-54節】\n\n三、三十八年的癱子的醫治的神蹟----給人強壯【約5；1-9節】\n\n四、五餅二魚的神蹟----給人飽足【約6；1-14節】\n\n五、海上行走的神蹟----給人平安【約6；16-21節】\n\n六、生來瞎眼的人得醫的神蹟----給人光明【約9；1-12節】\n\n七、拉撒路死裡復活的神蹟----給人生命【約11；1-46節】",
                            style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                )
          )
        ],
      ),
//      drawer: DrawerWidget(),

    );
  }
}
