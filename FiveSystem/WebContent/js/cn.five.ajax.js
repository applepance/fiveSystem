window.myAjax = function( url , data , callback  ){
    // 1、初始化 XMLHttpRequest 对象
    var $http = new XMLHttpRequest() ;
    // 2、打开与服务器的连接
    var method = "post" ;
    $http.open( method , url ) ;
    $http.onreadystatechange = function () {
        // 回调函数( 关注的点 在于是否成功 也就是状态变成了 done ，你在回调函数中想做什么就做什么)
        if( $http.readyState == $http.DONE ){
          callback( $http.responseText ) ;
        }
    };
    // 4、设置请求报头
    if( method.toLowerCase() == "post"){
        $http.setRequestHeader("Content-Type" , "application/x-www-form-urlencoded") ;
    }
    // 5 、发送数据
    $http.send( data  ) ;
}