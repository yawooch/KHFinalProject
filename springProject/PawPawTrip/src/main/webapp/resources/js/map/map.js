window.onload = function()
{
    var imageSrc = '/pawpawtrip/img/common/favSiteMarker.png'; // 마커이미지의 주소입니다    
    var imageSize = new kakao.maps.Size(20, 20); // 마커이미지의 크기입니다
    var imageOption = {offset: new kakao.maps.Point(10, 20)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
    
    
    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var markerImage    = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
    var markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다
    
    
    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
    var options = { //지도를 생성할 때 필요한 기본 옵션
        center: new kakao.maps.LatLng(37.567928, 126.983049), //지도의 중심좌표.
        level: 12, //지도의 레벨(확대, 축소 정도)
        draggable : true,
        disableDoubleClickZoom :true
    };
    var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
    
    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
        minLevel: 6, // 클러스터 할 최소 지도 레벨
        disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
        
    });
    
    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.BOTTOMRIGHT);

    
    $.ajax(
    {
        type : 'GET',
        url  : '/pawpawtrip/map/getPosition',
        //data : data,
        success:function(data)
        {
	        var imageSrc = '/pawpawtrip/img/common/favSiteMarker2.png'; // 마커이미지의 주소입니다    
		    var imageSize = new kakao.maps.Size(20, 20); // 마커이미지의 크기입니다
		    var imageOption = {offset: new kakao.maps.Point(10, 20)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
            
            // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
            var markerImage    = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
            var markers = new Array();
            for (var i = 0; i < data.positions.length; i ++) 
            {
                ////지도를 클릭한 위치에 표출할 마커입니다
                //var marker = new kakao.maps.Marker(
                //{ 
                //    map : map,
                //    position: new kakao.maps.LatLng(data.positions[i].mapY, data.positions[i].mapX), // 마커를 표시할 위치
                //    title : data.positions[i].titleName, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                //    image: markerImage // 마커이미지 설정 
                //}); 
                ////지도에 마커를 표시합니다
                //marker.setMap(map);
                
                var marker = new kakao.maps.Marker(
                { 
                    map : map,
	                position : new kakao.maps.LatLng(data.positions[i].mapY, data.positions[i].mapX),
	                title : data.positions[i].titleName, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	                image: markerImage // 마커이미지 설정 
                }); 
                
                //marker.setMap(map);
                
                //var iwContent = data.positions[i].titleName; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                //var iwPosition = new kakao.maps.LatLng(data.positions[i].mapY, data.positions[i].mapX); //인포윈도우 표시 위치입니다
                //
                //// 인포윈도우를 생성합니다
                //var infowindow = new kakao.maps.InfoWindow({
                //    position : new kakao.maps.LatLng(data.positions[i].mapY, data.positions[i].mapX), 
                //    content : data.positions[i].titleName 
                //});
                
                  
                // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
                //infowindow.open(map, marker);
                
                 
                // 데이터에서 좌표 값을 가지고 마커를 표시합니다
		        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
		        markers.push(marker);
                
                
            }
            // 클러스터러에 마커들을 추가합니다
            clusterer.addMarkers(markers);
            
            markers.forEach((idx, marker)=>
            {
	            // 마커에 마우스오버 이벤트를 등록합니다
	            kakao.maps.event.addListener(marker, 'mouseover', function(event) {
	                            //// 인포윈도우를 생성합니다
                  var infowindow = new kakao.maps.InfoWindow({
                      position : marker.position, 
                      content : marker.title 
                  });
	              // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
	                infowindow.open(map, marker);
	            });
	            
	            // 마커에 마우스아웃 이벤트를 등록합니다
	            kakao.maps.event.addListener(marker, 'mouseout', function() {
                                //// 인포윈도우를 생성합니다
                  var infowindow = new kakao.maps.InfoWindow({
                      position : marker.position, 
                      content : marker.title 
                  });
	                // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
	                infowindow.close();
	            });
            });
            
        },
        error: function(error){
            console.log(`error : ${error}`);
        }
    });
    
    
    kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
    
        // 현재 지도 레벨에서 1레벨 확대한 레벨
        var level = map.getLevel()-1;
    
        // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
        map.setLevel(level, {anchor: cluster.getCenter()});
    });
    var imageSrc = '/pawpawtrip/img/common/favSiteMarker.png'; // 마커이미지의 주소입니다    
    var imageSize = new kakao.maps.Size(20, 20); // 마커이미지의 크기입니다
    var imageOption = {offset: new kakao.maps.Point(10, 20)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
    
    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var markerImage    = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
                
                
    var marker = new kakao.maps.Marker(
    { 
        map : map,
        image: markerImage // 마커이미지 설정 
    }); 
    // 지도에 클릭 이벤트를 등록합니다
    // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
    kakao.maps.event.addListener(map, 'click', function(mouseEvent) 
    {        
        
        // 클릭한 위도, 경도 정보를 가져옵니다 
        var latlng = mouseEvent.latLng; 
        
        // 마커 위치를 클릭한 위치로 옮깁니다
        marker.setPosition(latlng);
        
        var message = '클릭한 위치\n위도 : ' + latlng.getLat();
        message += '\n경도 : ' + latlng.getLng();
        
        var resultDiv = document.getElementById('clickLatlng'); 
        resultDiv.innerText = message;
    });
    // 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'zoom_changed', function() {        
	    
	    // 지도의 현재 레벨을 얻어옵니다
	    var level = map.getLevel();
	    
	    var message = '현재 지도 레벨은 ' + level + ' 입니다';
	    var resultDiv = document.getElementById('zoomInfo');  
	    resultDiv.innerHTML = message;
	    
	});
	
	
}
