import 'package:flutter/material.dart';

//下啦展开案例
class ExpansionTitlePage extends StatelessWidget {
  static const CITY_NAMES = {
    '北京': ['朝阳区', '东城区', '西城区', '丰台区', '海淀区', '顺义区'],
    '上海': ['黄浦区', '徐汇区', '闵行区', '松江区', '青浦区', '普陀区', '嘉定区', '闸北区', '静安区'],
    '广州': ['海珠区', '越秀区', '荔湾区', '天河区', '白云区', '黄埔区', '南沙区', '番禺区'],
    '深圳': ['南山区', '福田区', '宝安区', '盐田区', '龙岗区', '罗湖区', '龙华区', '光明区'],
    '杭州': ['上城区', '下城区', '江干区', '拱墅区', '西湖区', '滨江区'],
    '苏州': ['姑苏区', '吴中区', '相城区', '高新区', '虎丘区', '工业园区', '吴江区'],
  };

  final title = '列表的展开与收起';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: ListView(
          children: _buildList(),
        ),
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> widgets = [];
    CITY_NAMES.keys.forEach((key) {
      widgets.add(_item(key, CITY_NAMES[key]));
    });
    return widgets;
  }

  Widget _item(String city, List<String> subCities) {
    return ExpansionTile(
      title: Text(
        city,
        style: TextStyle(color: Colors.red, fontSize: 20),
      ),
      children: subCities.map((subCity) => _buildSubCities(subCity)).toList(),
    );
  }

  Widget _buildSubCities(String subCity) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 50,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20),
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Text(subCity,style: TextStyle(color: Colors.white,fontSize: 15)),
      ),
    );
  }
}