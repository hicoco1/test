<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@ include file="/WEB-INF/views/common/taglibs_CS.jsp"%>

<div id="wrap" style="display:none;border:0px solid;width:300px;height:350px;margin:0px 0;position:relative">
<img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="ï¿½ï¿½ï¿½ï¿½ï¿½">
</div>
<style type="text/css">
html { height: 100% }
body { height: 100%; margin: 0; padding: 0 }
#wrap { width: 100%; height: 100% }
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(document).ready(function(){
	$.ajaxSetup({
	 	headers: {
	        'X-CSRF-TOKEN': $('meta[name="${_csrf.parameterName}"]').attr('content')
	    }
	});
});
	
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        element_wrap.style.display = 'none';
        window.external.jsCloseCallback();
    }

    window.onload = function() {
        var address = getURLParameter('address');

        new daum.Postcode({
            oncomplete: function(data) {
                var fullRoadAddr = data.roadAddress;
                var extraRoadAddr = '';

                if (data.bname !== '' && /[ï¿½ï¿½|ï¿½ï¿½|ï¿½ï¿½]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }

                if (data.bname !== '') {
                    var jibunAddress = data.jibunAddress;
                    if (jibunAddress == '' || !jibunAddress || typeof jibunAddress == "undefined")
                        jibunAddress = data.autoJibunAddress;
                    arr_jibun = jibunAddress.split(data.bname + ' ', 2);
                    if (arr_jibun.length > 1)
                        jibun = arr_jibun[1];
                }

                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                if (extraRoadAddr !== '') {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                if (fullRoadAddr !== '') {
                    fullRoadAddr += extraRoadAddr;
                }

                window.external.jsRoadAddressCallback(fullRoadAddr);
                window.external.jsJibunAddressCallback(data.buildingName, jibun, data.jibunAddress);

                element_wrap.style.display = 'none';
            },
            width: '100%',
            height: '100%'
        }).embed(element_wrap, {
            q: address
        });

        element_wrap.style.display = 'block';
    };

    function getURLParameter(sParam) {
        var sPageURL = window.location.search.substring(1);
        sPageURL = decodeURIComponent(sPageURL);
        var sURLVariables = sPageURL.split('&');
        for (var i = 0; i < sURLVariables.length; i++) {
            var sParameterName = sURLVariables[i].split('=');
            if (sParameterName[0] == sParam) {
                return sParameterName[1];
            }
        }
        return null;
    }
</script>
