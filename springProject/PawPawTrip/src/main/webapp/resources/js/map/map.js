//$(document).ready(()=>
//{
//    console.log('hello');
//
//    var container = $('#map'); //지도를 담을 영역의 DOM 레퍼런스
//    var options = { //지도를 생성할 때 필요한 기본 옵션
//        center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
//        level: 12 //지도의 레벨(확대, 축소 정도)
//    };
//    var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
//    
//})

window.onload = function()
{
    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
    var options = { //지도를 생성할 때 필요한 기본 옵션
        center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
        level: 12 //지도의 레벨(확대, 축소 정도)
    };
    var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
    
    
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
	    {
	        title: '카카오', 
	        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
	    },
	    {
	        title: '생태연못', 
	        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
	    },
	    {
	        title: '텃밭', 
	        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
	    },
	    {
	        title: '근린공원',
	        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
	    }
	];    
    
    // var imageSrc = 'localhost:8080/pawpawtrip/resources/img/common/favSiteMarker.png';
    var imageSrc = '/pawpawtrip/img/common/favSiteMarker.png'; // 마커이미지의 주소입니다    
    
    
    
	for (var i = 0; i < positions.length; i ++) 
	{
    
    var imageSize = new kakao.maps.Size(20, 20); // 마커이미지의 크기입니다
    var imageOption = {offset: new kakao.maps.Point(10, 20)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
        markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다


    // 지도를 클릭한 위치에 표출할 마커입니다
    var marker = new kakao.maps.Marker({ 
        // 지도 중심좌표에 마커를 생성합니다 
        //position: map.getCenter(),
        //image: markerImage // 마커이미지 설정 
        map : map,
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image: markerImage // 마커이미지 설정 
    }); 
    // 지도에 마커를 표시합니다
    marker.setMap(map);
       
    }

    // 지도에 클릭 이벤트를 등록합니다
    // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
    kakao.maps.event.addListener(map, 'click', function(mouseEvent) 
    {        
        
        // 클릭한 위도, 경도 정보를 가져옵니다 
        var latlng = mouseEvent.latLng; 
        
        // 마커 위치를 클릭한 위치로 옮깁니다
        marker.setPosition(latlng);
        
        var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
        message += '경도는 ' + latlng.getLng() + ' 입니다';
        
        var resultDiv = document.getElementById('clickLatlng'); 
        resultDiv.innerHTML = message;
    
});
}