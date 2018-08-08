//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'StorageControl.dart';
import 'Finance.dart';
//import 'dart:io';
//import 'dart:isolate';
//import 'dart:convert';


void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List widgets=[];
  String responce ="6758,200,1665\n9837,200,712\n6976,200,1746\n";
  List<Price> prices ;


  int i = 0;
  StorageControl storage = new StorageControl();
  

  @override
  void initState() {
    super.initState(); 
    loadData();
  }

  showLoadingDialog() {
    if (widgets.length == 0) {
      return true;
    }

    return false;
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  getProgressDialog() {
    return new Center(child: new CircularProgressIndicator());
  }

   


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Sample App"),
        ),
        body:getBody(),
        floatingActionButton:FloatingActionButton(
              backgroundColor: Color.fromARGB(0xFF, 0xFF, 0x7F, 0x00),
              tooltip: 'Refresh', // used by assistive technologies
              child: Icon(Icons.update),
              onPressed:loadData,
            ),

        
        
        );

  }




  ListView getListView() => new ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return  new Text("${widgets[position]}");//getRow(position);
      });

  Widget getRow(int i) {
    return new Padding(padding: new EdgeInsets.all(10.0), child: new Text("Row ${widgets[i]["title"]}"));
  }

  void pasonalGetserchi(){
      //List<Price> prices = Finance.Parse(responce);
      loadData();
    }

  //static const int _chunkCount = 1;
  //int _nextChunk = 0;

  String _urlToFetch(String code) {
    //return 'https://domokit.github.io/examples/stocks/data/stock_data_$chunk.json';
    return "https://stocks.finance.yahoo.co.jp/stocks/detail/?code="+ code +".T";
  }


  loadData() async {
    List msg = new List();
    prices = Finance.parse(responce);

    http.Client _httpClient;
     _httpClient = new http.Client();
    int i = 0;
  //static bool actuallyFetchData = true;

  //String _fetchNextChunk() {
    String companyName = "";
    String realValue = "";
    String realChange = "";
    String percent = "";
    

//for
  for(Price item in prices) {
    _httpClient.get(_urlToFetch(item.code)).then<Null>((http.Response response) {
      final String json = response.body;

      String searchWord = "symbol"; //検索する文字列symbol
      int foundIndex = json.indexOf(searchWord, 0);
      //始めの位置を探す
      int nextIndex = foundIndex + searchWord.length;

      foundIndex = json.indexOf(">", nextIndex);
      int i = 5;//searchWord.length; //pricedata to point

      if (foundIndex != -1) {
        for (; json[foundIndex + i] != "<"; i++) {
          companyName += json[foundIndex + i]; //current value 現在値
        }
      } else {
        //price[0] = "Error";
      }

      searchWord = "stoksPrice"; //検索する文字列 ="stoksPrice">
      foundIndex = json.indexOf(searchWord); //始めの位置を探す
      //次の検索開始位置
      nextIndex = foundIndex + searchWord.length;
      //try
      // {
      //次の位置を探す
      foundIndex = json.indexOf(searchWord, nextIndex);
      if (foundIndex != -1) {
        int i = searchWord.length + 2; //pricedata to point
        for (; json[foundIndex + i] != "<"; i++) {
          realValue += json[foundIndex + i]; //current value 現在値
        }
      } else {
        //price[0] = "Error";
      }

      String searchWord1 = "yjMSt"; //検索する文字列前日比
      int foundIndex1 = json.indexOf(searchWord1); //始めの位置を探す
      int i1 = searchWord1.length + 2;

      for (; json[foundIndex1 + i1] != "（"; i1++) {
        realChange += json[foundIndex1 + i1]; //previous 前日比? ¥
      }

      i1++;
      for (; json[foundIndex1 + i1] != "）"; i1++) {
        percent += json[foundIndex1 + i1]; //previous 前日比? %
      }

      print(companyName);
      print(realValue);
      print(realChange);
      print(percent);
      
      item.name =companyName;
      item.realValue = realValue;
      item.prev_day = realChange;
      item.percent = percent;
      //storage.storageWrite(msg.toString());
      //StorageControl save = new StorageControl();
     // save.storageWrite(msg.toString());
      setState(() {
        widgets = prices;
        //storage.storageAll();
        //storage.storageRead3();
      });
    });//http

    
  }//for to end
 }//load

}//stste

/*
 loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = JSON.decode(response.body);
    });
  }
}
*/

 //List<Price> prices = Finance.Parse(responce);


/*
 List<Price> pricesanser = await pasonalGetserchi();//登録データの現在値を取得する
            

                if (Refresh == true)
                {
                    ItemList.Clear();// 全て削除
                }

                foreach (Price item in pricesanser)
                {
            


*/