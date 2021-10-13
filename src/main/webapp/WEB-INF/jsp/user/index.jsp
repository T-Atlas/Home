<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Smart home management system</title>
</head>
<body class="bg-theme bg-theme1">
<div class="layui-layout layui-layout-admin">
    <!-- wrapper -->
    <div class="wrapper">
        <!--sidebar-wrapper-->
        <div class="sidebar-wrapper" data-simplebar="true">
            <div class="sidebar-header">
                <div class="">
                    <img alt="" class="logo-icon-2" src="/static/images/logo-icon.png"/>
                </div>
                <div>
                    <h4 class="logo-text">Smart Home</h4>
                </div>
                <a class="toggle-btn ml-auto" href="javascript:"> <i class="bx bx-menu"></i>
                </a>
            </div>
            <%@ include file="../layout/left.jsp" %>
        </div>
        <!--end sidebar-wrapper-->
        <%@ include file="../layout/header.jsp" %>
        <!--page-wrapper-->
        <div class="page-wrapper">
            <!--page-content-wrapper-->
            <!--page-content-wrapper-->
            <div class="page-content-wrapper">
                <div class="page-content">
                    <div class="row">
                        <div class="col-12 col-lg-6">
                            <div class="card radius-15">
                                <div class="card-body">
                                    <div class="media align-items-center">
                                        <div class="font-35 text-white">
                                            <i class="lni lni-timer"></i>&nbsp;
                                        </div>
                                        <div class="media-body">
                                            <h2 class="mb-0 font-weight-bold text-white" id="timeShow"></h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-lg-6">
                            <div class="media align-items-center">
                                <div class="col px-md-5 media align-items-center" id="he-plugin-standard"></div>
                                <div class="col px-md-5 media align-items-center">
                                    <button class="btn btn-light" type="button" id="refresh" style="float: right;">
                                        Update current information
                                    </button>
                                </div>
                            </div>
                        </div>
                        <script>
                            WIDGET = {
                                "CONFIG": {
                                    "layout": "1",
                                    "width": 450,
                                    "height": 150,
                                    "background": "1",
                                    "dataColor": "FFFFFF",
                                    "language": "en",
                                    "borderRadius": "5",
                                    "key": "347841292bd54500b323fd42c3555196"
                                }
                            }
                        </script>
                        <script src="https://widget.qweather.net/standard/static/js/he-standard-common.js?v=2.0"></script>
                    </div>
                    <br>
                    <div class="row" id="view">
                    </div>
                    <div class="row">
                        <div class="col-12 col-lg-6">
                            <div class="card radius-15">
                                <div class="card-body" id="temperatureChart" style="height:400px">
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="card radius-15">
                                <div class="card-body" id="humidityChart" style="height:400px">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-lg-6">
                            <div class="card radius-15">
                                <div class="card-body" id="doorChart" style="height:400px">
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                        </div>
                    </div>
                </div>
            </div>
            <!--end page-content-wrapper-->
        </div>
        <!--end page-wrapper-->
        <!--start overlay-->
        <div class="overlay toggle-btn-mobile"></div>
        <!--end overlay-->
    </div>
    <!-- end wrapper -->
    <!--start switcher-->
    <%@ include file="../layout/switcher.jsp" %>
</div>
</body>
</html>
<script id="list" type="text/html">
    {{#  layui.each(d, function(index, item){ }}
    <div class="col-12 col-lg-3">
        <div class="card radius-15">
            <div class="card-body text-center">
                <div class="widgets-icons mx-auto rounded-circle">
                    {{# if(item.typeId==1){ }}
                    <i class="bx bx-bulb"></i>
                    {{# }else if(item.typeId==2){ }}
                    <i class="bx bx-door-open"></i>
                    {{# }else if(item.typeId==3){ }}
                    <i class="bx bx-send"></i>
                    {{# }else{ }}
                    <i class="lni lni-shuffle"></i>
                    {{# } }}
                </div>
                <h2 class="mb-0 font-weight-bold mt-3 text-white">{{item.c}}</h2>
                <p class="mb-0 text-white">{{item.fName}}</p>
            </div>
        </div>
    </div>
    {{#  }) }}
</script>
<script>
    layui.use(['layer', 'laytpl', 'laypage',], function () {
        const laytpl = layui.laytpl;

        const get = function () {
            ajax({
                url: "../factory/getCountByTypeId",
                data: {},
                success: function (res) {
                    if (res.code > 0) {
                        laytpl($('#list').html()).render(res.data, function (html) {
                            $('#view').html(html);
                        });
                    }
                }
            })
        };

        const getDoorNearly7DayCount = function () {
            ajax({
                url: "../log/getNearly7DayCount",
                data: {typeId: 2},
                success: function (res) {
                    if (res.code > 0) {
                        var dateList = [], valList = [];
                        for (var i = 0; i < res.data.length; i++) {
                            dateList.push(res.data[i].date);
                            valList.push(res.data[i].count);
                        }
                        var doorChart = echarts.init(document.getElementById('doorChart'));
                        var option = {
                            title: {
                                text: 'Closed for nearly 7 days',
                                textStyle: {
                                    color: '#fff'
                                }
                            },
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: {
                                    type: 'cross',
                                    label: {
                                        backgroundColor: '#6a7985'
                                    }
                                }
                            },
                            xAxis: {
                                type: 'category',
                                data: dateList,
                                axisLabel: {
                                    interval: 0,
                                    rotate: 40,
                                    textStyle: {
                                        color: '#fff'
                                    }
                                },
                                axisLine: {
                                    lineStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            yAxis: {
                                type: 'value',
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff'
                                    },
                                    formatter: '{value} times'
                                },
                                axisLine: {
                                    lineStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            series: [
                                {
                                    data: valList,
                                    type: 'line',
                                    areaStyle: {
                                        color: '#78cdd1'
                                    },
                                    itemStyle: {
                                        normal: {
                                            color: '#78cdd1',
                                            lineStyle: {
                                                color: '#78cdd1'
                                            }
                                        }
                                    },
                                    name: 'Number of times'
                                }
                            ]
                        };
                        doorChart.setOption(option);
                    }
                }
            })
        };

        const getTodayCount = function () {
            ajax({
                url: "../log/getDateValueByHour",
                data: {typeId: 3},
                success: function (res) {
                    if (res.code > 0) {
                        var dateList = [], temperatureList = [], humidityList = [];
                        for (var i = 0; i < res.data.length; i++) {
                            dateList.push(res.data[i].hour + ' h');
                            temperatureList.push(res.data[i].temperature);
                            humidityList.push(res.data[i].humidity);
                        }
                        var temperatureChart = echarts.init(document.getElementById('temperatureChart'));
                        var temperatureOption = {
                            title: {
                                text: 'Today\'s temperature change',
                                textStyle: {
                                    color: '#fff'
                                }
                            },
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: {
                                    type: 'cross',
                                    label: {
                                        backgroundColor: '#6a7985'
                                    }
                                }
                            },
                            xAxis: {
                                type: 'category',
                                data: dateList,
                                axisLabel: {
                                    interval: 0,
                                    rotate: 50,
                                    textStyle: {
                                        color: '#fff'
                                    }
                                },
                                axisLine: {
                                    lineStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            yAxis: {
                                type: 'value',
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff'
                                    },
                                    formatter: '{value} ℃'
                                },
                                axisLine: {
                                    lineStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            series: [
                                {
                                    data: temperatureList,
                                    type: 'line',
                                    areaStyle: {
                                        color: '#78cdd1'
                                    },
                                    itemStyle: {
                                        normal: {
                                            color: '#78cdd1',
                                            lineStyle: {
                                                color: '#78cdd1'
                                            }
                                        }
                                    },
                                    name: 'Temperature'
                                }
                            ]
                        };
                        temperatureChart.setOption(temperatureOption);

                        var humidityChart = echarts.init(document.getElementById('humidityChart'));
                        var humidityOption = {
                            title: {
                                text: 'Today\'s humidity change',
                                textStyle: {
                                    color: '#fff'
                                }
                            },
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: {
                                    type: 'cross',
                                    label: {
                                        backgroundColor: '#6a7985'
                                    }
                                }
                            },
                            xAxis: {
                                type: 'category',
                                data: dateList,
                                axisLabel: {
                                    interval: 0,
                                    rotate: 50,
                                    textStyle: {
                                        color: '#fff'
                                    }
                                },
                                axisLine: {
                                    lineStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            yAxis: {
                                type: 'value',
                                axisLabel: {
                                    textStyle: {
                                        color: '#fff'
                                    },
                                    formatter: '{value} %'
                                },
                                axisLine: {
                                    lineStyle: {
                                        color: '#fff'
                                    }
                                }
                            },
                            series: [
                                {
                                    data: humidityList,
                                    type: 'line',
                                    areaStyle: {
                                        color: '#78cdd1'
                                    },
                                    itemStyle: {
                                        normal: {
                                            color: '#78cdd1',
                                            lineStyle: {
                                                color: '#78cdd1'
                                            }
                                        }
                                    },
                                    name: 'Humidity'
                                }
                            ]
                        };
                        humidityChart.setOption(humidityOption);
                    }
                }
            })
        };

        $('#refresh').click(function () {
            location.reload();
        });

        setInterval(function () {
            get();
            getDoorNearly7DayCount();
            getTodayCount();
        }, 60000);

        get();
        getDoorNearly7DayCount();
        getTodayCount();
    });
</script>