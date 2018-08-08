
//import 'package:flutter/material.dart';
//import 'package:decimal/decimal.dart';


    class Finance
    {
        //public static async Task<List<Price>> Parse( )
        static List<Price> parse(var responce)
        {
            List<Price> prices = new List<Price>(); //ｺﾝｽﾄﾗｸﾀ
            //SaveLoadCS saveLoadCS = new SaveLoadCS();

            // UTF8のファイルの読み込み Edit.        
            //string response = await saveLoadCS.DataLoadAsync();//登録データ読み込み

            //dynamic rows = responce.replaceAll("\n,", "\n").split('\n');  //\r to delete & \n split 
            //dynamic rows = responce.replaceAll("\n,", "\n").split('\n');
              var list = responce.split("\n"); 

              //var listb =  list.length;        
              //var list =responce;// ['apples, bananas, oranges'];
              for( String row in list ) {
                if (row.isNotEmpty){
                    //continue;
                  var lista = row.split(",");  
                  //Price p = new Price(lista[0],lista[1],lista[2],lista[3],lista[4],lista[5],list[6]);
                  Price p = new Price();
                  p.code = lista[0];//企業コード
                  p.stocks = (lista[1]);//保有数
                  p.itemprice = (lista[2]);//購入単価
                  prices.add(p);

                  print('${list.indexOf(row)}: $row');
                };
              };


          
              
             // if (list.indexOf(item).isNotEmpty){
             //     continue;
             // };

              //  var cols = null;//lista;//row.split(',');
              /*
                Price p = new Price(cols[0],cols[1],cols[3],cols[4]);
                p.code = cols[0];//企業コード
                p.stocks = (cols[1]);//保有数
                p.itemprice = (cols[2]);//購入単価
               
                prices.add(p);
               */
         



            return prices;
        }
    }

    class Price
    {
      String code ;//会社名*
      //get code => _code; set code(value) {_code = value;}



        String name;
        dynamic stocks;//保有数*
        dynamic itemprice;//購入価格*
        dynamic realprice;//現在値**
        String prev_day;//前日比±**
        String percent; //前日比％**
        String polar; //上げ下げ(+ or -)
        dynamic ayAssetprice;//保有数* 購入価格 = 投資総額
        dynamic realValue;//利益総額
        //public decimal Ask { get; set; }//買値
        //Decimal Bid { get; set; }//売値/取引値
        dynamic investmen;//投資額
        dynamic investmens;//投資総額
        dynamic uptoAsset;//個別利益
        dynamic totalAsset;//現在評価額合計
        //public string  ButtonId { get; set; }
        //public string ButtonColor { get; set; }
        dynamic gain;//損益
        //String FirstLastName { get { return Prev_day + "," + Percent; } }
        int idindex;

        //c# to {get; set;}
         //Price(this.code, this.stocks, this.itemprice,this.name,this.realValue,this.prev_day,this.percent );
    }


