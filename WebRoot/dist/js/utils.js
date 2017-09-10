/**
 * 
 * Description: 全局公共方法
 * author lzewh@cn.ibm.com  
 * date Feb 17 2017 1:26:48 PM
 */

var Utils = function() {

//    var base_addr = "http://" + window.location.host + "/itops-monitor-service/rest/";
//    var base_addr = "http://9.181.142.44:8080/itops-monitor-service/rest/";
    //var base_addr = "http://9.115.65.76:8180/itops-monitor-service/rest/";
    //var base_addr = "http://127.0.0.1:8180/itops-monitor-service/rest/";
    var base_addr = "http://localhost:8080/itops-monitor-service/rest/";

    var requestTotal = 0;
    var completedTotal = 0;
    var completeLoading = function() {
        requestTotal = 0;
        completedTotal = 0;
    }
    var monitorConfigArr = null;



    return {
        /*缓存对象*/
        caches: {},

        /*http请求相关方法*/
        http: {
            /**
             *   url：            调用地址
             *   para:           调用参数{key:value}
             *   successCallBack:成功后回调函数
             *   errorCallBack 可选:失败后回调函数
             *   method  可选:请求类型。默认为GET。
             *   async   可选:是否为异步调用，默认为true      
             *
             **/
            request: function(url, para, successCallBack, errorCallBack, method, async) {
                if (requestTotal === 0) {
                    Utils.page.setPageLoading(true);
                }
                requestTotal++;

                this.method = method || 'GET';
                if (typeof async == 'undefined') {
                    async = true;
                }
                errorCallBack = errorCallBack || function() {};
                $.ajax({
                    type: method,
                    contentType: "application/json; charset=UTF-8",
                    url: url,
                    data: para,
                    async: async,
                    dataType: 'json',
                    success: function(result) {
                        if (Utils.http.checkRequest(result, url)) {
                            successCallBack(result, para);
                            completedTotal++;
                            if (completedTotal >= requestTotal) {
                                completeLoading();
                                Utils.page.setPageLoading(false);
                            }
                        }
                    },
                    error: function(result) {
                        if (Utils.http.checkRequest(result, url)) {
                            errorCallBack(result, para);
                            completeLoading();
                            Utils.page.setPageLoading(false);
                        }
                    },
                    /*
                    headers: {
                        "X-Auth-Token" : Utils.caches.user.tokenId,                     
                    }
                    */
                });

            },
            //检查请求是否成功 ， 不成功给予相关提示
            checkRequest: function(result, url) {
                /*
                var errorHtml = "";             
                if(!result.httpStatusCode){ 
                    if(result.statusText == 'error'){
                        result.statusText = $.i18n.prop('serverNotavailable');//"unable to connect server";
                    }
                    errorHtml +="<ul>";
                    errorHtml +="   <li>"+$.i18n.prop('HttpStatus')+" : "+result.status+"</li>";
                    errorHtml +="   <li>"+$.i18n.prop('Message')+" : "+result.statusText+"</li>";
                    errorHtml +="    <li>"+$.i18n.prop('requestURL')+" : "+url+"</li>";
                    errorHtml +="</ul>";
                    $('#errorContent').html(errorHtml);
                    $('#errorModal').modal().css({
                                    width: '50%',
                                    'margin-left': function () {
                                       return -($(this).width() / 2);
                                    }
                    });
                    Utils.page.setLoading("none");      
                    return false;
                    
                }
                
                if(result.httpStatusCode !=200 && result.httpStatusCode !=401){
                    errorHtml +="<ul>";
                    errorHtml +="   <li>"+$.i18n.prop('HttpStatus')+" : "+result.httpStatusCode+"</li>"; 
                    errorHtml +="   <li>"+$.i18n.prop('Message')+" : "+result.message+"</li>";
                    errorHtml +="    <li>"+$.i18n.prop('requestURL')+" : "+url+"</li>";
                    errorHtml +="</ul>";
                    $('#errorContent').html(errorHtml);
                    $('#errorModal').modal().css({
                                    width: '30%',
                                    'margin-left': function () {
                                       return -($(this).width() / 2);
                                    }
                    });
                    Utils.page.setLoading("none");      
                    return false;
                }else if (result.httpStatusCode == 401 ){   
                    //在noLoginUrlMap中的URl不需要tokenID就能访问
                    var noLoginUrlMap = Constants.noLoginUrlMap();
                    if(!noLoginUrlMap.get(url)){
                        Constants.url.appUrl +'login.html?message='+result.message;
                    }
                    
                }
                */
                return true;
            }

        },

        /*url处理*/
        url: {
            monitor: {
                topo: base_addr + "monitor/topo",
                datacenter: base_addr + "monitor/datacenters",
                cluster: base_addr + "monitor/clusters",
                host: base_addr + "monitor/hosts",
                vm: base_addr + "monitor/vms",

                hardwareHistory: base_addr + "monitor/hardwareHistory",
                hostUtilHistory: base_addr + "monitor/hostUtilHistory",
                vmUtilHistory: base_addr + "monitor/vmUtilHistory",
                vmHistory: base_addr + "monitor/vmHistory",
                topNSummary: base_addr + "monitor/topNSummary",
                topN: base_addr + "monitor/topN",
                monitorConfig: base_addr + "monitorConfig",
                groups: base_addr + "groups",
                group: base_addr + "group"
            },

            lifecycle: {
                monitor_region: base_addr + "region",
                monitor_ossServer: base_addr + "lifecycle/ossServer",
                monitor_host: base_addr + "lifecycle/host",
                monitor_vm: base_addr + "lifecycle/vm",
            },
            event: {
                event_tree: base_addr + "event/tree",
                event_list: base_addr + "event/micro/query"
            },

            //将url中"?"符后的参数转换为对象返回
            getPrameterObj: function() {
                var url = location.search;
                var theRequest = new Object();
                if (url.indexOf("?") != -1) {
                    var str = url.substr(1);
                    strs = str.split("&");
                    for (var i = 0; i < strs.length; i++) {
                        theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
                    }
                }
                return theRequest;
            },
            //将形如: para1=a&para2=b的参数转换成map
            getParameterMap: function(para) {
                var paraMap = new Utils.Map();
                if (!Utils.isNull(para)) {
                    var arr1 = para.split("&");
                    for (var i = 0; i < arr1.length; i++) {
                        if (Utils.isNull(arr1[i])) continue;
                        paraMap.put(arr1[i].split("=")[0], arr1[i].split("=")[1].replace(/%20/g, ' '));
                    }
                }
                return paraMap;

            },
            //将形如: para1=a&para2=b的参数转换成JSON
            getParameterJSON: function(para) {
                var paraJSON = {};
                if (!Utils.isNull(para)) {
                    var arr1 = para.split("&");
                    for (var i = 0; i < arr1.length; i++) {
                        if (Utils.isNull(arr1[i])) continue;
                        var key = arr1[i].split("=")[0];
                        paraJSON[key] = arr1[i].split("=")[1].replace(/%20/g, ' ');
                    }
                }
                return paraJSON;

            },
            /*根据param获取当前url中传递的参数。 如： url: 127.0.0.1/xx.html?a=1&b=2 , getQueryString(a)得到1, getQueryString(b)得到2 */
            getQueryString: function(param) {
                var reg = new RegExp("(^|&)" + param + "=([^&]*)(&|$)", "i");
                var r = window.location.search.substr(1).match(reg);
                if (r != null)
                    return unescape(r[2]);
                return null;
            },

        },

        /*JSOn相关方法*/
        JSON: {
            str2Json: function(stringValue) {
                eval("var theJsonValue = " + stringValue);
                return theJsonValue;
            },
            json2Str: function(o) {
                return json2StrLocal(o);

            },
            getJsonLength: function(obj) {
                var size = 0,
                    key;
                for (key in obj) {
                    if (obj.hasOwnProperty(key)) size++;
                }
                return size;
            },
        },

        /*string相关方法*/
        string: {

            /*1900-01-01格式的字符转换为日期*/
            strToDate: function(strDate) {
                var date = eval('new Date(' + strDate.replace(/\d+(?=-[^-]+$)/,
                    function(a) { return parseInt(a, 10) - 1; }).match(/\d+/g) + ')');
                return date;
            },

            /*对字段后面增加符号，根据constants中配置：fieldSymbolMap*/
            handleSymbol: function(fieldName, fieldData) {
                if (!Utils.isNull(fieldSymbolMap.get(fieldName)) && fieldData != '') {
                    return fieldData + fieldSymbolMap.get(fieldName);
                } else {
                    return fieldData;
                }
            },
            /*格式化字段（补零） , ignoreFormattedField为忽略补零的字段*/
            formatField: function(fieldName, value) {
                if (!isNaN(value) && Utils.isNull(ignoreFormattedField.get(fieldName))) {
                    value = parseFloat(value).toFixed(2);
                }
                return value;
            },
        },

        /*数组相关方法*/
        array: {

            /*从数组arr中移除值为val的元素*/
            removeFromArr: function(arr, val) {
                var index = arr.indexOf(val);
                if (index > -1) {
                    arr.splice(index, 1);
                }
            },
            /*数组去除重复值*/
            distinctArr: function(arr) {
                var sameObj = function(a, b) {
                    var tag = true;
                    if (!a || !b)
                        return false;
                    for (var x in a) {
                        if (!b[x])
                            return false;
                        if (typeof(a[x]) === 'object') {
                            tag = sameObj(a[x], b[x]);
                        } else {
                            if (a[x] !== b[x])
                                return false;
                        }
                    }
                    return tag;
                };
                var newArr = [],
                    obj = {};
                for (var i = 0, len = arr.length; i < len; i++) {
                    if (!sameObj(obj[typeof(arr[i]) + arr[i]], arr[i])) {
                        newArr.push(arr[i]);
                        obj[typeof(arr[i]) + arr[i]] = arr[i];
                    }
                }
                return newArr;
            },

            /*是否包含某个值*/
            containsValue: function(arr, val) {
                if (Utils.isNull(arr)) return false;
                for (var i in arr) {
                    if (arr[i] == val) return true;
                }
                return false;
            },
            /* 将对象装进数组 */
            warpObj: function(obj) {
                return JSON.stringify(new Array(obj));
            },
            /*按数组中对象的某个字段进行分组，计算这个字段的值在整体中出现次数*/
            getDataListSummary: function(dataList, key, resultKey) {
                var summarys = [];
                if (!dataList || dataList.length == 0) return summarys;
                var dataListMap = new Utils.Map();
                for (var i in dataList) {
                    var value = dataList[i][key];
                    if (value == null) continue;
                    if (dataListMap.get(value) != null) {
                        dataListMap.put(value, dataListMap.get(value) + 1);
                    } else {
                        dataListMap.put(value, 1);
                    }
                }
                for (var i in dataListMap.keySet()) {
                    var keyValue = dataListMap.keySet()[i];
                    var summary = {};
                    summary[resultKey] = keyValue;
                    summary.value = dataListMap.get(keyValue);
                    summarys.push(summary);
                }
                return summarys;
            }

        },

        /*页面操作相关方法*/
        page: {

            /**加载页面
             *	page :	页面名称(模块名.页面名)   
                pageParameter  : 页面参数    
             **/
            loadPage: function(page, pageParameter) {
                alert(2222);
                //根据页面名称设置页面路径
                var pageLocation;
                if (page == 'monitor.realtimeMonitor') {
                    pageLocation = "page/monitor/real-time-monitor.html";
                } else if (page == 'monitor.historyMonitor') {
                    pageLocation = "page/monitor/history-monitor.html";
                } else if (page == 'monitor.ossServer.list') {
                    pageLocation = "page/monitor/management/ossServer/ossServer-list.html";
                } else if (page == "monitor.ossServer.addOssServer") {
                    pageLocation = "page/monitor/management/ossServer/ossServer-add.html";
                } else if (page == "monitor.ossServer.updateOssServer") {
                    pageLocation = "page/monitor/management/ossServer/ossServer-update.html";
                } else if (page == "monitor.host.list") {
                    pageLocation = "page/monitor/management/host/host-list.html";
                } else if (page == "monitor.host.add") {
                    pageLocation = "page/monitor/management/host/host-add.html";
                } else if (page == "monitor.host.update") {
                    pageLocation = "page/monitor/management/host/host-update.html";
                } else if (page == "monitor.vm.list") {
                    pageLocation = "page/monitor/management/vm/vm-list.html";
                } else if (page == "monitor.region.list") {
                    pageLocation = "page/monitor/management/region/region-list.html";
                } else if (page == "monitor.region.add") {
                    pageLocation = "page/monitor/management/region/region-add.html";
                } else if (page == "monitor.region.update") {
                    pageLocation = "page/monitor/management/region/region-update.html";
                } else if (page == "event.eventTree") {
                    pageLocation = "page/event/eventTree.html";
                } else if (page == "event.policy") {
                    pageLocation = "page/event/policy/policy-list.html";
                } else if (page == "event.events") {
                    pageLocation = "page/event/events.html";
                } else if (page == "monitor.configuration.list") {
                    pageLocation = "page/monitor/management/configuration/configuration.html";
                } else if (page == "monitor.configuration.update") {
                    pageLocation = "page/monitor/management/configuration/configuration-update.html";
                } else if (page == "monitor.configuration.scoreConfigDetailUpdate") {
                    pageLocation = "page/monitor/management/configuration/scoreConfigDetail-update.html";
                } else if (page == "monitor.configuration.addScoreConfig") {
                    pageLocation = "page/monitor/management/configuration/scoreConfigDetail-add.html";
                } else if (page == "monitor.nodegroup.list") {
                    pageLocation = "page/monitor/management/node-group/node-group-list.html";
                } else if (page == "monitor.groupManagement.list") {
                    pageLocation = "page/monitor/management/groupManagement/groupManagement.html";
                } else if (page == "monitor.groupManagement.add") {
                    pageLocation = "page/monitor/management/groupManagement/groupManagement-add.html";
                } else if (page == "monitor.groupManagement.addGroupConfig") {
                    pageLocation = "page/monitor/management/groupManagement/groupManagement-addGroupConfig.html";
                } else if (page == "monitor.groupManagement.updateGroupConfig") {
                    pageLocation = "page/monitor/management/groupManagement/groupManagement-updateGroupConfig.html";
                }

                $('.main-footer').hide();
                $("#content-wrapper").load(pageLocation, function() {
                    var tar = eval("(new IBM.itaas." + page + "())");
                    tar.init(pageParameter);
                    $('.main-footer').show();
                });
            },

            setPageLoading: function(isLoading) {
                if (isLoading) {
                    $("#mask").show();
                } else {
                    $("#mask").hide();
                }
            }
        },

        /*通用插件配置*/
        config: {

            datePikerOption: {
                opens: "right",
                startDate: moment().subtract(7, 'days'),
                endDate: moment().subtract(1, 'days'),
                linkedCalendars: true,
                maxDate: moment().subtract(1, 'days'),
                locale: {
                    format: 'YYYY-MM-DD'
                }
            },
            datetimePikerOption: {
                opens: "right",
                startDate: moment().subtract(1, 'hours'),
                endDate: moment(),
                timePicker: true,
                timePicker24Hour: true,
                timePickerIncrement: 10,
                linkedCalendars: true,
                minDate: moment().subtract(24, 'hours').hour(0).minute(0).second(0),
                maxDate: moment(),
                locale: {
                    format: 'YYYY-MM-DD HH:mm:ss'
                }
            },
            lineChartOption: {
                title: {},
                tooltip: {
                    trigger: 'axis'
                },
                legend: {},
                grid: {
                    left: '3%',
                    right: '5%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false
                },
                yAxis: {
                    type: 'value',
                    name: '单位(个)',
                    axisLabel: {
                        formatter: '{value}'
                    }
                }
            },
            lineChartSeries: {
                type: 'line',
                data: [],
                lineStyle: {
                    normal: { color: '#5596E6' }
                },
                itemStyle: {
                    normal: { color: '#5596E6' }
                }
            },
            getMonitorConfigByMasterType: function(type) {
                if (monitorConfigArr == null) {
                    Utils.http.request(Utils.url.monitor.monitorConfig + "/getMonitorConfigList", null, function(data) {
                        monitorConfigArr = [];
                        for (var key in data) {
                            monitorConfigArr[key] = data[key];
                            if (monitorConfigArr[key].length > 0) {
                                monitorConfigArr[key] = monitorConfigArr[key][0].scoreConfig.scoreConfigDetailList;
                            }


                        }
                    }, null, 'GET', false);
                }
                if (type == 'OpenStack') {
                    return monitorConfigArr['x86'];
                } else if (type == 'vCenter') {
                    return monitorConfigArr['x86'];
                } else if (type == 'powervc') {
                    return monitorConfigArr['power'];
                } else if (type == 'BareMetal') {
                    return monitorConfigArr['baremetal'];
                } else if (type == 'docker') {
                    return monitorConfigArr['docker'];
                } else {
                    return monitorConfigArr['x86'];
                }

            }

        },

        //一些公共处理方法
        common: {
            //将格式为{"admin_internal_net":[{"addr":"192.168.111.7","type":"fixed"},{"addr":"9.110.81.52","type":"floating"}]}
            //的IP转换成192.168.111.7,9.110.81.52
            convertIP: function(ip) {
                var result = '';
                if (ip) {
                    try {
                        var ipjson = JSON.parse(ip);
                        var arr = new Array();
                        for (var j in ipjson) {
                            for (var len = 0; len < ipjson[j].length; len++) {
                                arr.push(ipjson[j][len].addr);
                            }
                        }
                        result += arr.toString();
                    } catch (err) {
                        result = ip;
                    }

                }
                return result;

            }
        },



        //判断数据是否为空
        isNull: function(object) {
            return !(object != 'undefined' && typeof(object) != 'undefined' && object != null && object != '');
        },
        isNotNull: function(object) {
            return object != 'undefined' && typeof(object) != 'undefined' && object != null && object != '';
        },

        /*深度克隆*/
        cloneObject: function(obj) {
            var str, newobj = obj.constructor === Array ? [] : {};
            if (typeof obj !== 'object') {
                return;
            } else {
                for (var i in obj) {
                    if (obj[i]._isAMomentObject) {
                        newobj[i] = obj[i].clone();
                    } else {
                        newobj[i] = typeof obj[i] === 'object' ?
                            Utils.cloneObject(obj[i]) : obj[i];
                    }

                }
            }
            return newobj;
            // var result = {};
            // for (var key in obj) {
            //     if (obj[key]._isAMomentObject) {
            //         result[key] = obj[key].clone();
            //     } else {
            //         result[key] = typeof obj[key] === 'object' ? Utils.cloneObject(obj[key]) : obj[key];
            //     }
            // }
            // return result;
        },


        //Map数据结构
        Map: function() {
            this.map = new Object();
            this.length = 0;

            this.size = function() {
                return this.length;
            }

            this.put = function(key, value) {
                if (!this.map['_' + key]) {
                    ++this.length;
                }

                this.map['_' + key] = value;

            }

            this.remove = function(key) {

                if (this.map['_' + key]) {

                    --this.length;
                    return delete this.map['_' + key];
                } else {
                    return false;
                }
            }

            this.containsKey = function(key) {

                return this.map['_' + key] ? true : false;

            }

            this.get = function(key) {

                return this.map['_' + key] ? this.map['_' + key] : null;

            }


            this.inspect = function() {
                var str = '';

                for (var each in this.map) {
                    str += '\n' + each + '  Value:' + this.map[each];
                }

                return str;
            }

            this.keySet = function() {
                var keyArr = new Array();
                for (key in this.map) {
                    keyArr.push(key.substring(1, key.length));
                }
                return keyArr;
            }

        },

        //自动转换数据单位
        changeDataUnit: function(input, unit) {
            if (isNaN(input)) {
                return input;
            }

            var prefix;

            if (input < 0) {
                prefix = '-';
                input = input * -1;
            } else {
                prefix = ''
            }

            var kb = 1024;
            var mb = kb * 1024;
            var gb = mb * 1024;
            var tb = gb * 1024;

            if (unit == 'k') {
                input = input * kb;
            } else if (unit == 'm') {
                input = input * mb;
            } else if (unit == 'g') {
                input = input * gb;
            } else if (unit == 't') {
                input = input * tb;
            }

            var val, suffix;

            if (input >= tb) {
                val = input / tb;
                val = (Math.round(val * 100)) / 100;
                suffix = "TB";
            } else if (input >= gb) {
                val = input / gb;
                val = (Math.round(val * 100)) / 100;
                if (unit == 't') {
                    suffix = "TB";
                } else {
                    suffix = "GB";
                }
            } else if (input >= mb) {
                val = Math.round(input / mb);
                suffix = "MB";
                /*
                if (unit == 'GB') {
                  suffix = "GB";
                } else if (unit == 'TB') {
                  suffix = "TB";
                } else {
                  suffix = "MB";
                }
                */
            } else {
                val = Math.round(input / kb);
                suffix = "KB";
                /*
                if (unit == 'MB') {
                    suffix = "MB";
                } else if (unit == 'GB') {
                  suffix = "GB";
                } else if (unit == 'TB') {
                  suffix = "TB";
                } else {
                  suffix = "KB";
                }
                */
            }
            return prefix + (val) + suffix;
        },


        //随机数
        randomNum: function(rate) {
            rate = rate || 100;
            return Math.round(Math.random() * rate);
        }




    }

    function json2StrLocal(o) {
        var arr = [];
        var fmt = function(s) {
            if (typeof s == 'object' && s != null)
                return json2StrLocal(s);
            return /^(string|number)$/.test(typeof s) ? "'" + s + "'" : s;
        }
        for (var i in o)
            arr.push("'" + i + "':" + fmt(o[i]));
        return '{' + arr.join(',') + '}';
    }


}();