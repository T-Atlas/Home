$(function (){
    var myChart = echarts.init(document.getElementById('temperature'));
    //数据加载完之前的loading动画
    myChart.showLoading({
        text:'waiting...',
    });
    var times=[]; //横坐标数组
    var values=[];  //纵坐标数组
    $.ajax({
        url: "echartCheck",//请求发送到echartCheck
        method:"post",
        dataType:"json",
        success:function (result){
            //请求成功时执行该函数内容，result即为服务器返回的json对象
           if(result){
               for(var i=0; i<result.length; i++){
                   times.push(result[i].time);
               }
               for(var i=0; i<result.length; i++){
                   values.push(result[i].value);
               }

               myChart.hideLoading();//加载隐藏动画

               myChart.setOption({

                   tooltip:{
                       trigger:'axis'
                   },
                   legend:{
                       data:['temperature']
                   },
                   xAxis:{
                       type:'category',
                       data:times,
                   },
                   yAxis:{
                       type:'value',
                       axisLabel:{
                           formatter:'{value} ℃'
                       }
                   },
                   series:[{
                       //根据名字对应到相应的序列
                       data:values,
                       name:'temperature',
                       color:['#fff'],
                       type:'line',
                       markPoint:{
                           data:[
                               {type:'max',name:'max'},
                               {type:'min',name:'min'}
                           ]
                       },
                   }]
               });
           }
        },
        error:function(){
            alert("load failed");
        }
    });
});