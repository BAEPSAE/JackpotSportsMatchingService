<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Sing - List Groups</title>
<link href="../css/application.min.css" rel="stylesheet">
<!-- as of IE9 cannot parse css files with more that 4K classes separating in two files -->
<!--[if IE 9]>
    <link href="css/application-ie9-part2.css" rel="stylesheet">
    <![endif]-->
<link rel="shortcut icon" href="../img/favicon.png">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<script src="../js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">

	/*  $(function() {

		//아래는 채팅
		$('#send')
				.on(
						'click',
						function() {
							var msg = $('#msg').val(); // 잘 들어옴
							var game_Id = '<s:property value="games.game_Id" />'
							$
									.ajax({
										url : 'sendMsg',
										method : 'post',
										data : {
											"message.content" : msg,
											"message.game_Id" : game_Id
										},
										dataType : 'json',
										success : function() {
											$('#chat')
													.append(
															'<li class="list-group-item"><h6 class="sender"><s:property value="#session.id" /></h6><p class="body">'
																	+ msg
																	+ '</p></li>');
											$('#msg').val('');
											$("#mydiv")
													.scrollTop(
															$("#mydiv")[0].scrollHeight);
										}
									});
						});
		var count = 0;
		var it =setInterval(function() {
			var game_Id = '<s:property value="games.game_Id" />'
			$.ajax({
				url : 'getMsg',
				data : {
					"ground_Id1" : game_Id
				},
				dataType : 'json',
				success : function(response) {
					$('#chat').children().remove();
					$.each(response.list, function(index, item) {
						$('#chat').append(
								'<li class="list-group-item"><h6 class="sender">'
										+ item.user_Id
										+ '</h6><p class="body">'
										+ item.content + '</p></li>')
					});
				}
			});
			if(count++ > 60) {
				clearInterval(it);
			}
			
		}, 1000);

	}); */
	//

	
	 /* var jsontext = {"item":[{"phone":"02-2128-2961","newAddress":"","imageUrl":"","direction":"북서","zipcode":"","placeUrl":"http://place.map.daum.net/11585925","id":"11585925","title":"서울월드장","distance":"15861","category":"스포츠,레저 > 축구 > 축구장","address":"서울 마포구 성산동 499","longitude":"126.89833496212442","latitude":"37.571487356231465","addressBCode":"1144012500"},{"phone":"02-2670-3522","newAddress":"","imageUrl":"","direction":"서","zipcode":"","placeUrl":"http://place.map.daum.net/11585953","id":"11585953","title":"영롱이갈대1구장","distance":"16112","category":"스포츠,레저 > 축구 > 축구장","address":"서울 영등포구 양화동 4-1","longitude":"126.88487681627713","latitude":"37.545796593884816","addressBCode":"1156013100"},{"phone":"02-930-0070(팩스)","newAddress":"서울 노원구 덕릉로 450","imageUrl":"","direction":"북","zipcode":"139831","placeUrl":"http://place.map.daum.net/11585898","id":"11585898","title":"노원마들 스타디움","distance":"14395","category":"스포츠,레저 > 축구 > 축구장","address":"서울 노원구 상계동 770-2","longitude":"127.05755114285165","latitude":"37.64395305753524","addressBCode":"1135010500"},{"phone":"02-450-9356","newAddress":"서울 광진구 능동로 216","imageUrl":"","direction":"북동","zipcode":"143847","placeUrl":"http://place.map.daum.net/11585948","id":"11585948","title":"어린이대공원 축구장","distance":"4181","category":"스포츠,레저 > 축구 > 축구장","address":"서울 광진구 능동 18","longitude":"127.08435088150107","latitude":"37.54787686233251","addressBCode":"1121510200"},{"phone":"02-824-4471","newAddress":"서울 송파구 올림픽로 424","imageUrl":"http://cfile75.uf.daum.net/image/144D9E274A5ED7B2530C63","direction":"동","zipcode":"138749","placeUrl":"http://place.map.daum.net/8486176","id":"8486176","title":"올림픽공원 축구장","distance":"5357","category":"스포츠,레저 > 축구 > 축구장","address":"서울 송파구 방이동 88","longitude":"127.12334076459916","latitude":"37.516938251173265","addressBCode":"1171011100"},{"phone":"02-350-5393","newAddress":"서울 은평구 진관1로 46","imageUrl":"","direction":"북서","zipcode":"122200","placeUrl":"http://place.map.daum.net/8038602","id":"8038602","title":"은평구민체육센터 축구장","distance":"17757","category":"스포츠,레저 > 축구 > 축구장","address":"서울 은평구 진관동 362-2","longitude":"126.92481802002956","latitude":"37.63065181001224","addressBCode":"1138011400"},{"phone":"02-2045-7826","newAddress":"","imageUrl":"http://cfile175.uf.daum.net/image/1547EF0E4A60257901BFED","direction":"북동","zipcode":"","placeUrl":"http://place.map.daum.net/11460518","id":"11460518","title":"동명근린공원 인조잔디축구장","distance":"10454","category":"스포츠,레저 > 축구 > 축구장","address":"서울 강동구 고덕동 229","longitude":"127.16508833949423","latitude":"37.56167414387973","addressBCode":"1174010200"},{"phone":"02-3437-7234","newAddress":"서울 광진구 천호대로 731","imageUrl":"","direction":"북동","zipcode":"143817","placeUrl":"http://place.map.daum.net/17408213","id":"17408213","title":"아차산 배수지체육공원 인조잔디축구장","distance":"4867","category":"스포츠,레저 > 축구 > 축구장","address":"서울 광진구 구의동 38-4","longitude":"127.09680446499395","latitude":"37.548843991659155","addressBCode":"1121510300"},{"phone":"02-3780-0521","newAddress":"","imageUrl":"","direction":"북동","zipcode":"","placeUrl":"http://place.map.daum.net/11586006","id":"11586006","title":"뚝섬한강공원 축구장1","distance":"1933","category":"스포츠,레저 > 축구 > 축구장","address":"서울 광진구 자양2동 410-1","longitude":"127.07634140325176","latitude":"37.52801706174619","addressBCode":"1121510500"},{"phone":"","newAddress":"","imageUrl":"","direction":"남","zipcode":"","placeUrl":"http://place.map.daum.net/11585904","id":"11585904","title":"대치유수지체육공원 축구장","distance":"1332","category":"스포츠,레저 > 축구 > 축구장","address":"서울 강남구 대치동 78-20","longitude":"127.06830898419253","latitude":"37.50313626197912","addressBCode":"1168010600"},{"phone":"02-2670-3522","newAddress":"","imageUrl":"","direction":"서","zipcode":"","placeUrl":"http://place.map.daum.net/11586302","id":"11586302","title":"영롱이억새3구장","distance":"16103","category":"스포츠,레저 > 축구 > 축구장","address":"서울 구로구 신도림동","longitude":"126.8807302829184","latitude":"37.51762719446776","addressBCode":"1153010100"},{"phone":"02-2286-6090","newAddress":"","imageUrl":"","direction":"북","zipcode":"","placeUrl":"http://place.map.daum.net/11586297","id":"11586297","title":"살곶이체육공원 축구장","distance":"4583","category":"스포츠,레저 > 축구 > 축구장","address":"서울 성동구 사근동 102-1","longitude":"127.04948763902813","latitude":"37.554228835754614","addressBCode":"1120010600"},{"phone":"","newAddress":"","imageUrl":"","direction":"서","zipcode":"","placeUrl":"http://place.map.daum.net/17568198","id":"17568198","title":"동양미래대학교 축구장","distance":"17392","category":"스포츠,레저 > 축구 > 축구장","address":"서울 구로구 고척동 62-185","longitude":"126.8667916025456","latitude":"37.50136539204161","addressBCode":"1153010600"},{"phone":"02-2116-3945","newAddress":"서울 노원구 노원로22길 1","imageUrl":"","direction":"북","zipcode":"139860","placeUrl":"http://place.map.daum.net/11585900","id":"11585900","title":"노해근린공원 축구장","distance":"14983","category":"스포츠,레저 > 축구 > 축구장","address":"서울 노원구 중계동 360-18","longitude":"127.07111674714167","latitude":"37.64916055274094","addressBCode":"1135010600"},{"phone":"02-906-7979","newAddress":"서울 도봉구 해등로3길 48-11","imageUrl":"","direction":"북","zipcode":"132040","placeUrl":"http://place.map.daum.net/16033051","id":"16033051","title":"초안산근린공원 축구장","distance":"15017","category":"스포츠,레저 > 축구 > 축구장","address":"서울 도봉구 창1동 산48-4","longitude":"127.04099715412745","latitude":"37.64850453317693","addressBCode":"1132010700"}],"info":{"samename":{"keyword":"축구장","selected_region":"서울"},"count":"15","page":"1","totalCount":"45"}};
	 var jsontext2= {"item":[{"phone":"02-403-2395","newAddress":"서울 송파구 성내천로33가길 16","imageUrl":"","direction":"","zipcode":"138120","placeUrl":"http://place.map.daum.net/11505286","id":"11505286","title":"천마공원축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 송파구 마천동 산1-5","longitude":"127.16016699606692","latitude":"37.50022548231146","addressBCode":"1171011400"},{"phone":"02-3780-0541","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/11586306","id":"11586306","title":"반포한강시민공원 축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 서초구 잠원동 122-1","longitude":"127.004936199836","latitude":"37.514713997925746","addressBCode":"1165010600"},{"phone":"","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/11586316","id":"11586316","title":"난지천공원 인조잔디축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 마포구 상암동 1538","longitude":"126.88394096734575","latitude":"37.57427077003557","addressBCode":"1144012700"},{"phone":"02-2211-2517","newAddress":"서울 성동구 송정18가길 6-1","imageUrl":"","direction":"","zipcode":"133837","placeUrl":"http://place.map.daum.net/11585990","id":"11585990","title":"중랑 물재생센터축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 성동구 송정동 73-400","longitude":"127.06888406092207","latitude":"37.552954112219865","addressBCode":"1120011800"},{"phone":"02-860-3365","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/11586310","id":"11586310","title":"안양천축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 구로구 구로동 621-8","longitude":"126.87186197378043","latitude":"37.501749422964934","addressBCode":"1153010200"},{"phone":"","newAddress":"서울 송파구 도곡로62길 11","imageUrl":"","direction":"","zipcode":"138865","placeUrl":"http://place.map.daum.net/17575089","id":"17575089","title":"잠실유수지 축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 송파구 잠실동 304-19","longitude":"127.07759208516251","latitude":"37.50344407909964","addressBCode":"1171010100"},{"phone":"02-412-5969","newAddress":"서울 송파구 올림픽로 474","imageUrl":"http://cfile174.uf.daum.net/image/120849354D54C48F0873A3","direction":"","zipcode":"138829","placeUrl":"http://place.map.daum.net/11585931","id":"11585931","title":"송파구여성축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 송파구 방이동 88-10","longitude":"127.11834380632175","latitude":"37.524396455928155","addressBCode":"1171011100"},{"phone":"","newAddress":"서울 노원구 중계로 36","imageUrl":"","direction":"","zipcode":"139240","placeUrl":"http://place.map.daum.net/24633388","id":"24633388","title":"불암산종합스타디움 축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 노원구 공릉동 141","longitude":"127.08492863666787","latitude":"37.63810535544696","addressBCode":"1135010300"},{"phone":"02-436-3466","newAddress":"서울 중랑구 용마산로 250-12","imageUrl":"","direction":"","zipcode":"131812","placeUrl":"http://place.map.daum.net/11461932","id":"11461932","title":"용마폭포공원 축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 중랑구 면목동 산1-4","longitude":"127.09009971641049","latitude":"37.57436912043878","addressBCode":"1126010100"},{"phone":"02-3780-0511","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/11586318","id":"11586318","title":"잠실한강공원 축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 송파구 잠실동","longitude":"127.09760674061339","latitude":"37.5218926079447","addressBCode":"1171010100"},{"phone":"02-2600-4195","newAddress":"서울 강서구 우장산로 72","imageUrl":"","direction":"","zipcode":"157010","placeUrl":"http://place.map.daum.net/10709194","id":"10709194","title":"우장산축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 강서구 화곡동 산60-1","longitude":"126.84514843030742","latitude":"37.5504796150722","addressBCode":"1150010300"},{"phone":"","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/11586317","id":"11586317","title":"양화한강공원 축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 영등포구 양화동 1-4","longitude":"126.89350225181592","latitude":"37.543869342546046","addressBCode":"1156013100"},{"phone":"02-3780-0501","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/17558011","id":"17558011","title":"광나루한강공원 축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 강동구 암사동","longitude":"127.12225637304209","latitude":"37.55113414523998","addressBCode":"1174010700"},{"phone":"02-860-3361","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/11586320","id":"11586320","title":"안양천 C구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 구로구 신도림동","longitude":"126.87504340793106","latitude":"37.50912304979833","addressBCode":"1153010100"},{"phone":"02-449-0600","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/17579488","id":"17579488","title":"탄천족구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 송파구 가락동 222-8","longitude":"127.0990895135168","latitude":"37.49687949281022","addressBCode":"1171010700"}],"info":{"samename":{"keyword":"축구장","selected_region":"서울"},"count":"15","page":"2","totalCount":"45"}};
	 var jsontext3= {"item":[{"phone":"02-2670-3522","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/17578165","id":"17578165","title":"대림체육공원 축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 영등포구 대림동 780","longitude":"126.89498065743904","latitude":"37.499865710049484","addressBCode":"1156013300"},{"phone":"","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/24210639","id":"24210639","title":"이촌한강공원 축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 용산구 이촌동 302-17","longitude":"126.96963040260724","latitude":"37.518011473986434","addressBCode":"1117012900"},{"phone":"02-809-1912","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/18053884","id":"18053884","title":"독산근린공원 잔디축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 금천구 독산동 1086","longitude":"126.884315817783","latitude":"37.463530691265866","addressBCode":"1154510200"},{"phone":"02-2679-6460","newAddress":"서울 영등포구 문래로 55","imageUrl":"http://cfile87.uf.daum.net/image/271406485734655922FD1F","direction":"","zipcode":"150096","placeUrl":"http://place.map.daum.net/1269047390","id":"1269047390","title":"티아이스포츠센터","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 영등포구 문래동6가 12 2층 4호","longitude":"126.88738635492136","latitude":"37.520426836716624","addressBCode":"1156012400"},{"phone":"02-6677-8776","newAddress":"서울 양천구 목동서로 170","imageUrl":"","direction":"","zipcode":"158050","placeUrl":"http://place.map.daum.net/380543679","id":"380543679","title":"루프탑필드 목동점","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 양천구 목동 919-7 홈플러스6층","longitude":"126.87327480997473","latitude":"37.530327161297045","addressBCode":"1147010200"},{"phone":"","newAddress":"서울 도봉구 삼양로144길 33","imageUrl":"","direction":"","zipcode":"132714","placeUrl":"http://place.map.daum.net/25460677","id":"25460677","title":"덕성여자대학교 히딩크 드림필드 풋살구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 도봉구 쌍문동 419","longitude":"127.01847065067729","latitude":"37.65012477279188","addressBCode":"1132010500"},{"phone":"02-376-3155","newAddress":"","imageUrl":"http://cfile105.uf.daum.net/image/2577184451EDEF53373491","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/20436780","id":"20436780","title":"서대문돌산축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 서대문구 홍은1동 10-305","longitude":"126.9463352068833","latitude":"37.60311854895665","addressBCode":"1141011800"},{"phone":"070-4207-3993","newAddress":"","imageUrl":"http://t1.daumcdn.net/localfiy/3190DFB7A512417B834B30605DD8255E","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/1476359579","id":"1476359579","title":"성내유수지축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 송파구 방이동 88-13","longitude":"127.12030145681896","latitude":"37.52615683752154","addressBCode":"1171011100"},{"phone":"","newAddress":"","imageUrl":"http://cfile1.uf.daum.net/original/2718634F5404466534A6E6","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/25716834","id":"25716834","title":"별마루축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 양천구 신정동 871-4","longitude":"126.87819863509961","latitude":"37.51630193849903","addressBCode":"1147010100"},{"phone":"","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/8126948","id":"8126948","title":"한강시민공원 축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 강남구 압구정동","longitude":"127.01690591405608","latitude":"37.52572314815907","addressBCode":"1168011000"},{"phone":"02-782-2898","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/8143300","id":"8143300","title":"한강시민공원축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 영등포구 여의도동 82-9","longitude":"126.91677791001149","latitude":"37.5341320132774","addressBCode":"1156011000"},{"phone":"02-789-2662","newAddress":"서울 성북구 화랑로 140","imageUrl":"","direction":"","zipcode":"136130","placeUrl":"http://place.map.daum.net/17505167","id":"17505167","title":"월곡인조잔디축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 성북구 하월곡동 2-1","longitude":"127.04077594874246","latitude":"37.608662991501234","addressBCode":"1129013600"},{"phone":"","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/17565304","id":"17565304","title":"서남물재생센터공원 축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 강서구 마곡동 123","longitude":"126.82160552549108","latitude":"37.57702214867911","addressBCode":"1150010500"},{"phone":"","newAddress":"서울 구로구 고척로45길 1","imageUrl":"","direction":"","zipcode":"152080","placeUrl":"http://place.map.daum.net/17557409","id":"17557409","title":"고척근린공원 축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 구로구 고척동 산9-14","longitude":"126.85202185370079","latitude":"37.5059429382731","addressBCode":"1153010600"},{"phone":"02-901-5249","newAddress":"서울 도봉구 노해로69길 132","imageUrl":"","direction":"","zipcode":"132898","placeUrl":"http://place.map.daum.net/27323399","id":"27323399","title":"시립창동운동장 축구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 도봉구 창동 1-6","longitude":"127.05048905006223","latitude":"37.65620605700682","addressBCode":"1132010700"}],"info":{"samename":{"keyword":"축구장","selected_region":"서울"},"count":"15","page":"3","totalCount":"45"}};
	 */
	//		var jsontext4={"item":[{"phone":"02-2202-3834","newAddress":"서울 송파구 올림픽로 25","imageUrl":"http://cfile173.uf.daum.net/image/18063D1E4A56C0B009B669","direction":"","zipcode":"138934","placeUrl":"http://place.map.daum.net/20740490","id":"20740490","title":"잠실종합운동장 잠실야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 송파구 잠실동 10","longitude":"127.07189140650917","latitude":"37.51214778784201","addressBCode":"1171010100"},{"phone":"02-2652-3888","newAddress":"서울 양천구 안양천로 939","imageUrl":"http://cfile80.uf.daum.net/image/1853AA504E5709172626DB","direction":"","zipcode":"158050","placeUrl":"http://place.map.daum.net/10330240","id":"10330240","title":"목동종합운동장 목동야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 양천구 목동 914","longitude":"126.88090835543609","latitude":"37.53084687420275","addressBCode":"1147010200"},{"phone":"02-2128-2300","newAddress":"서울 구로구 경인로 430","imageUrl":"http://cfile38.uf.daum.net/image/2358C8375639D8B130757B","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/7890664","id":"7890664","title":"고척스카이돔","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 구로구 고척동 63-6","longitude":"126.86710476171226","latitude":"37.49823384955794","addressBCode":"1153010600"},{"phone":"02-2699-6407","newAddress":"서울 양천구 남부순환로64길 26","imageUrl":"http://cfile71.uf.daum.net/image/174EC5254AA9E2CE39DE29","direction":"","zipcode":"158090","placeUrl":"http://place.map.daum.net/17727127","id":"17727127","title":"신월야구공원","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 양천구 신월동 267-1","longitude":"126.83227928647477","latitude":"37.52620353263055","addressBCode":"1147010300"},{"phone":"02-3436-2890","newAddress":"서울 광진구 워커힐로 57-30","imageUrl":"http://cfile171.uf.daum.net/image/1913CD254AA9CBE447E9DF","direction":"","zipcode":"143820","placeUrl":"http://place.map.daum.net/11394059","id":"11394059","title":"구의야구공원","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 광진구 구의동 164-5","longitude":"127.0959918500925","latitude":"37.54699941020176","addressBCode":"1121510300"},{"phone":"02-3780-0808","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/17361216","id":"17361216","title":"난지한강공원 야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 마포구 상암동 495-71","longitude":"126.87498637814423","latitude":"37.56769517753221","addressBCode":"1144012700"},{"phone":"02-412-0160","newAddress":"서울 송파구 탄천동로 211","imageUrl":"http://cfile8.uf.daum.net/image/243F9F5054B46D06257D91","direction":"","zipcode":"138865","placeUrl":"http://place.map.daum.net/24025021","id":"24025021","title":"송파유소년야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 송파구 잠실동 306","longitude":"127.07655174994476","latitude":"37.50357810665068","addressBCode":"1171010100"},{"phone":"02-949-8417","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/13076419","id":"13076419","title":"공릉유소년야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 노원구 공릉동 산222-24","longitude":"127.08487105380145","latitude":"37.639276676930024","addressBCode":"1135010300"},{"phone":"02-2289-6854","newAddress":"서울 노원구 중계로 36","imageUrl":"","direction":"","zipcode":"139240","placeUrl":"http://place.map.daum.net/24025019","id":"24025019","title":"불암산종합스타디움 야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 노원구 공릉동 141","longitude":"127.08497533109929","latitude":"37.639312641253966","addressBCode":"1135010300"},{"phone":"02-2268-4667","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/8502059","id":"8502059","title":"장충리틀야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 중구 장충동2가 산7-22","longitude":"127.00361705865835","latitude":"37.556235761946304","addressBCode":"1114014400"},{"phone":"02-414-5820","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/13078085","id":"13078085","title":"배명고등학교 야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 송파구 석촌동 220","longitude":"127.09741837800178","latitude":"37.49881984785294","addressBCode":"1171010500"},{"phone":"","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/13081128","id":"13081128","title":"성균관대도봉선수촌 야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 도봉구 도봉동","longitude":"127.04848202339119","latitude":"37.67882511113456","addressBCode":"1132010800"},{"phone":"02-582-8151","newAddress":"서울 서초구 효령로 197","imageUrl":"","direction":"","zipcode":"137871","placeUrl":"http://place.map.daum.net/13080971","id":"13080971","title":"서울고등학교 야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 서초구 서초3동 1526-1","longitude":"127.00560350875135","latitude":"37.483766205792314","addressBCode":""},{"phone":"02-485-3091","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/24025018","id":"24025018","title":"광나루한강공원 광나루야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 송파구 풍납동 45-3","longitude":"127.11320664025001","latitude":"37.5385544131249","addressBCode":"1171010300"},{"phone":"010-4266-6945","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/26353802","id":"26353802","title":"강남베이스볼파크","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 강남구 세곡동 13-3","longitude":"127.11932174062761","latitude":"37.465019148658264","addressBCode":"1168011100"}],"info":{"samename":{"keyword":"야구장","selected_region":"서울"},"count":"15","page":"1","totalCount":"45"}};	
	//	var jsontext5={"item":[{"phone":"02-3780-0601","newAddress":"서울 마포구 마포나루길 407","imageUrl":"","direction":"","zipcode":"121889","placeUrl":"http://place.map.daum.net/25665540","id":"25665540","title":"망원한강공원 리틀야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 마포구 망원동 205-5","longitude":"126.89838290673083","latitude":"37.552858399069414","addressBCode":"1144012300"},{"phone":"02-2620-3400","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/24025022","id":"24025022","title":"안양천야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 양천구 신정동 871-37","longitude":"126.8780870278879","latitude":"37.515375592095324","addressBCode":"1147010100"},{"phone":"","newAddress":"서울 서대문구 연세로 50","imageUrl":"","direction":"","zipcode":"120749","placeUrl":"http://place.map.daum.net/17579647","id":"17579647","title":"연세대학교 야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 서대문구 신촌동 134","longitude":"126.9339964915512","latitude":"37.56149721119951","addressBCode":"1141011400"},{"phone":"","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/1841077698","id":"1841077698","title":"난지한강공원 제1야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 마포구 상암동","longitude":"126.87549381252127","latitude":"37.56749389083485","addressBCode":"1144012700"},{"phone":"","newAddress":"서울 관악구 관악로 1","imageUrl":"","direction":"","zipcode":"151015","placeUrl":"http://place.map.daum.net/24505991","id":"24505991","title":"서울대학교 야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 관악구 신림동 산56-1","longitude":"126.9508682072535","latitude":"37.467206375394184","addressBCode":"1162010200"},{"phone":"","newAddress":"서울 도봉구 도봉로168길 30","imageUrl":"","direction":"","zipcode":"132822","placeUrl":"http://place.map.daum.net/26933237","id":"26933237","title":"도봉성대1구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 도봉구 도봉동 628","longitude":"127.048455065336","latitude":"37.67920713715997","addressBCode":"1132010800"},{"phone":"","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/18848570","id":"18848570","title":"한강시민공원 광나루지구 어린이전용야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 송파구 풍납동","longitude":"127.11533147620594","latitude":"37.53997233249512","addressBCode":"1171010300"},{"phone":"02-944-9900","newAddress":"서울 강북구 솔매로49길 20","imageUrl":"","direction":"","zipcode":"142711","placeUrl":"http://place.map.daum.net/25611407","id":"25611407","title":"신일고등학교 야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 강북구 미아동 193-1","longitude":"127.02692967136782","latitude":"37.62791927496023","addressBCode":"1130510100"},{"phone":"010-9788-6343","newAddress":"서울 강동구 아리수로87길 192","imageUrl":"http://cfile190.uf.daum.net/image/245FB93D54A689C923699B","direction":"","zipcode":"134800","placeUrl":"http://place.map.daum.net/25671882","id":"25671882","title":"강동야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 강동구 고덕동 108","longitude":"127.16473902025997","latitude":"37.56751668520399","addressBCode":"1174010200"},{"phone":"02-954-4105","newAddress":"서울 도봉구 도봉로168길 30","imageUrl":"","direction":"","zipcode":"132822","placeUrl":"http://place.map.daum.net/25588106","id":"25588106","title":"도봉야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 도봉구 도봉동 628","longitude":"127.04787882059934","latitude":"37.67863074615443","addressBCode":"1132010800"},{"phone":"02-2292-5707","newAddress":"서울 성동구 왕십리로 199","imageUrl":"","direction":"","zipcode":"133862","placeUrl":"http://place.map.daum.net/25611668","id":"25611668","title":"덕수고등학교 야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 성동구 행당동 70-28","longitude":"127.04193271070066","latitude":"37.5549453506999","addressBCode":"1120010700"},{"phone":"","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/27164664","id":"27164664","title":"신정교야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 양천구 신정동 871","longitude":"126.87805045067716","latitude":"37.515609815174855","addressBCode":"1147010100"},{"phone":"02-815-1334","newAddress":"서울 동작구 대방동길 74","imageUrl":"","direction":"","zipcode":"156809","placeUrl":"http://place.map.daum.net/25589590","id":"25589590","title":"성남고등학교 야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 동작구 대방동 375-1","longitude":"126.9262122686652","latitude":"37.503601489627044","addressBCode":"1159010800"},{"phone":"","newAddress":"서울 강동구 아리수로87길 32","imageUrl":"","direction":"","zipcode":"134100","placeUrl":"http://place.map.daum.net/25610758","id":"25610758","title":"고덕차량사업소야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 강동구 강일동 227-1","longitude":"127.16994585286157","latitude":"37.56553432392868","addressBCode":"1174011000"},{"phone":"","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/27395734","id":"27395734","title":"살곶이공원 야구장","distance":"","category":"스포츠,레저 > 야구 > 야구장","address":"서울 성동구 사근동 102-16","longitude":"127.05041625693755","latitude":"37.55513664854954","addressBCode":"1120010600"}],"info":{"samename":{"keyword":"야구장","selected_region":"서울"},"count":"15","page":"2","totalCount":"45"}};
	//  	var jsontext6=	{"item":[{"phone":"","newAddress":"서울 종로구 인사동길 3","imageUrl":"","direction":"","zipcode":"110290","placeUrl":"http://place.map.daum.net/20046379","id":"20046379","title":"야구장","distance":"","category":"스포츠,레저 > 야구 > 야구연습장","address":"서울 종로구 인사동 130-1","longitude":"126.98706833693585","latitude":"37.57129256047257","addressBCode":"1111013600"},{"phone":"02-566-2042","newAddress":"서울 강남구 테헤란로70길 16","imageUrl":"","direction":"","zipcode":"135839","placeUrl":"http://place.map.daum.net/17005889","id":"17005889","title":"야구장","distance":"","category":"가정,생활 > 유흥시설 > 유흥주점","address":"서울 강남구 대치동 890-38","longitude":"127.05334975834812","latitude":"37.50439095660389","addressBCode":"1168010600"},{"phone":"02-2612-7150","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/10505274","id":"10505274","title":"서울 럭비구장","distance":"","category":"스포츠,레저 > 스포츠시설","address":"서울 구로구 온수동 49","longitude":"126.82597787192516","latitude":"37.492154498390875","addressBCode":"1153011000"},{"phone":"02-2670-3522","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/11585953","id":"11585953","title":"영롱이갈대1구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 영등포구 양화동 4-1","longitude":"126.88487681627713","latitude":"37.545796593884816","addressBCode":"1156013100"},{"phone":"02-711-6898","newAddress":"서울 마포구 큰우물로 75","imageUrl":"","direction":"","zipcode":"121743","placeUrl":"http://place.map.daum.net/14692032","id":"14692032","title":"야구장","distance":"","category":"음식점 > 술집","address":"서울 마포구 도화동 538","longitude":"126.94629357394976","latitude":"37.54126702659323","addressBCode":"1144010400"},{"phone":"02-518-0111","newAddress":"서울 강남구 강남대로 502","imageUrl":"http://cfile104.uf.daum.net/image/2120973D570B6C37106189","direction":"","zipcode":"135825","placeUrl":"http://place.map.daum.net/27470825","id":"27470825","title":"스트라이크존 논현구장","distance":"","category":"스포츠,레저 > 야구 > 야구연습장 > 스크린야구장","address":"서울 강남구 논현동 165 에임하이타워 지하 1층","longitude":"127.0236877548169","latitude":"37.50716851672477","addressBCode":"1168010800"},{"phone":"02-741-0095","newAddress":"서울 종로구 종로 195","imageUrl":"http://t1.daumcdn.net/localfiy/33DB5EECB3FC4E98B3936DEAD1398C94","direction":"","zipcode":"110853","placeUrl":"http://place.map.daum.net/27517944","id":"27517944","title":"야구장노래방","distance":"","category":"가정,생활 > 유흥시설 > 유흥주점","address":"서울 종로구 종로4가 8 2층","longitude":"126.99931628972868","latitude":"37.5711166716871","addressBCode":"1111016100"},{"phone":"02-6053-0656","newAddress":"서울 동대문구 장한로24길 15","imageUrl":"","direction":"","zipcode":"130840","placeUrl":"http://place.map.daum.net/17012580","id":"17012580","title":"야구장","distance":"","category":"가정,생활 > 유흥시설 > 유흥주점","address":"서울 동대문구 장안동 344-3","longitude":"127.07187519791663","latitude":"37.57069475213028","addressBCode":"1123010600"},{"phone":"","newAddress":"서울 서초구 서초대로73길 30","imageUrl":"","direction":"","zipcode":"137856","placeUrl":"http://place.map.daum.net/27028382","id":"27028382","title":"야구장","distance":"","category":"문화,예술 > 문화시설","address":"서울 서초구 서초동 1307","longitude":"127.02530020674068","latitude":"37.49939791007045","addressBCode":"1165010800"},{"phone":"","newAddress":"서울 용산구 한강대로81길 32","imageUrl":"","direction":"","zipcode":"140807","placeUrl":"http://place.map.daum.net/27436523","id":"27436523","title":"야구장","distance":"","category":"스포츠,레저 > 야구 > 야구연습장","address":"서울 용산구 갈월동 93-36 2층","longitude":"126.97153970780735","latitude":"37.54211193758959","addressBCode":"1117010400"},{"phone":"02-2670-3522","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/11586302","id":"11586302","title":"영롱이억새3구장","distance":"","category":"스포츠,레저 > 축구 > 축구장","address":"서울 구로구 신도림동","longitude":"126.8807302829184","latitude":"37.51762719446776","addressBCode":"1153010100"},{"phone":"02-757-2113","newAddress":"서울 중구 명동길 25-7","imageUrl":"","direction":"","zipcode":"100021","placeUrl":"http://place.map.daum.net/18768731","id":"18768731","title":"골목안당구장","distance":"","category":"스포츠,레저 > 당구 > 당구장,포켓볼","address":"서울 중구 명동1가 54-7","longitude":"126.98380527258229","latitude":"37.5641490635727","addressBCode":"1114012600"},{"phone":"02-2670-3522","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/11585954","id":"11585954","title":"영롱이갈대2구장","distance":"","category":"스포츠,레저 > 스포츠시설 > 운동장","address":"서울 영등포구 양화동 141-1","longitude":"126.88644199036777","latitude":"37.543433888494015","addressBCode":"1156013100"},{"phone":"02-422-8529","newAddress":"서울 송파구 백제고분로7길 14","imageUrl":"http://cfile177.uf.daum.net/image/2245063457035D6D33C969","direction":"","zipcode":"138862","placeUrl":"http://place.map.daum.net/27503661","id":"27503661","title":"스트라이크존 잠실구장","distance":"","category":"스포츠,레저 > 야구 > 야구연습장 > 스크린야구장","address":"서울 송파구 잠실동 193 태원빌딩 지하1층","longitude":"127.08043133073866","latitude":"37.510297024891734","addressBCode":"1171010100"},{"phone":"02-2244-0992","newAddress":"서울 동대문구 장한로 92","imageUrl":"","direction":"","zipcode":"130840","placeUrl":"http://place.map.daum.net/2096585428","id":"2096585428","title":"스트라이크존 서울장안구장","distance":"","category":"스포츠,레저 > 야구 > 야구연습장 > 스크린야구장","address":"서울 동대문구 장안동 365-7 화성빌딩 지하 2층","longitude":"127.06984949384912","latitude":"37.56881829387738","addressBCode":"1123010600"}],"info":{"samename":{"keyword":"야구장","selected_region":"서울"},"count":"15","page":"3","totalCount":"45"}}
	/* 	var jsontext7= 	{"item":[{"phone":"02-468-3025","newAddress":"서울 광진구 능동로13길 39","imageUrl":"","direction":"","zipcode":"143914","placeUrl":"http://place.map.daum.net/10937046","id":"10937046","title":"한아름볼링프라자","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 광진구 화양동 10-1 지하1층","longitude":"127.06978535190183","latitude":"37.54373816972252","addressBCode":"1121510700"},{"phone":"02-3142-3347","newAddress":"서울 마포구 와우산로 111","imageUrl":"","direction":"","zipcode":"121837","placeUrl":"http://place.map.daum.net/20747491","id":"20747491","title":"태화볼링센타","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 마포구 서교동 343-2","longitude":"126.92576927582137","latitude":"37.55349147064185","addressBCode":"1144012000"},{"phone":"02-556-2231","newAddress":"서울 강남구 강남대로 468","imageUrl":"http://cfile38.uf.daum.net/image/267E1539549E14D027EE98","direction":"","zipcode":"135931","placeUrl":"http://place.map.daum.net/18507386","id":"18507386","title":"스매싱볼 강남점","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 강남구 역삼동 808-4 지하 2층","longitude":"127.02518419108263","latitude":"37.50415164162825","addressBCode":"1168010100"},{"phone":"02-437-6104","newAddress":"서울 중랑구 중랑천로10길 76","imageUrl":"http://i1.search.daumcdn.net/cfile185/image/175327374F4D7D4C380B0A","direction":"","zipcode":"131823","placeUrl":"http://place.map.daum.net/17151176","id":"17151176","title":"삼보락볼링장","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 중랑구 면목2동 184-88","longitude":"127.07735357800188","latitude":"37.592264676822786","addressBCode":"1126010100"},{"phone":"02-798-8817","newAddress":"서울 용산구 한남대로 130","imageUrl":"","direction":"","zipcode":"140893","placeUrl":"http://place.map.daum.net/8150356","id":"8150356","title":"한남볼링센타","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 용산구 한남동 726-173","longitude":"127.00440379592224","latitude":"37.539960093461474","addressBCode":"1117013100"},{"phone":"02-6959-6577","newAddress":"서울 종로구 새문안로3길 30","imageUrl":"http://cfile83.uf.daum.net/image/27389E335417D853069DA2","direction":"","zipcode":"110719","placeUrl":"http://place.map.daum.net/25767175","id":"25767175","title":"더프레임","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 종로구 내수동 167 대우빌딩 지하1층","longitude":"126.97313555872063","latitude":"37.57254800128361","addressBCode":"1111011800"},{"phone":"02-521-8808","newAddress":"서울 서초구 방배로13길 18","imageUrl":"","direction":"","zipcode":"137843","placeUrl":"http://place.map.daum.net/18544360","id":"18544360","title":"로얄볼링센타","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 서초구 방배동 923-6","longitude":"126.99535983015816","latitude":"37.483380615856674","addressBCode":"1165010100"},{"phone":"02-771-2345","newAddress":"서울 중구 퇴계로18길 14","imageUrl":"","direction":"","zipcode":"100041","placeUrl":"http://place.map.daum.net/10324535","id":"10324535","title":"LCI볼링장","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 중구 남산동1가 6-1 6-1","longitude":"126.98507376903788","latitude":"37.56010195396023","addressBCode":"1114012800"},{"phone":"02-444-1100","newAddress":"서울 광진구 강변역로 50","imageUrl":"http://cfile87.uf.daum.net/image/2720EB5056614D660DED50","direction":"","zipcode":"143715","placeUrl":"http://place.map.daum.net/27309417","id":"27309417","title":"동서울그랜드볼링센터","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 광진구 구의동 546-1 동서울터미널빌딩 6층","longitude":"127.09418371115775","latitude":"37.534538240137095","addressBCode":"1121510300"},{"phone":"02-742-0707","newAddress":"서울 종로구 창덕궁1길 13","imageUrl":"","direction":"","zipcode":"110280","placeUrl":"http://place.map.daum.net/7914790","id":"7914790","title":"비원볼링센터","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 종로구 원서동 171","longitude":"126.98832134824744","latitude":"37.57907368062267","addressBCode":"1111014900"},{"phone":"1800-0925","newAddress":"서울 구로구 구로중앙로 134","imageUrl":"http://cfile185.uf.daum.net/image/21465543532FF49A30F8A3","direction":"","zipcode":"152731","placeUrl":"http://place.map.daum.net/22316596","id":"22316596","title":"MK볼링센터 구로점","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 구로구 구로동 501 나인스에비뉴 지하1층","longitude":"126.88423301032974","latitude":"37.49962861311756","addressBCode":"1153010200"},{"phone":"02-6373-7005","newAddress":"서울 서대문구 이화여대1길 10","imageUrl":"","direction":"","zipcode":"120753","placeUrl":"http://place.map.daum.net/26322315","id":"26322315","title":"놀러와볼링센터","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 서대문구 대현동 145 예스에이피엠 지하1층","longitude":"126.94506417683967","latitude":"37.55745920553988","addressBCode":"1141011200"},{"phone":"02-2643-9995","newAddress":"서울 양천구 신월로 354","imageUrl":"","direction":"","zipcode":"158861","placeUrl":"http://place.map.daum.net/7956801","id":"7956801","title":"세원볼링센터","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 양천구 신정동 1018-2","longitude":"126.86032552341771","latitude":"37.5217350225198","addressBCode":"1147010100"},{"phone":"02-482-3001","newAddress":"서울 강동구 올림픽로 664","imageUrl":"http://cfile81.uf.daum.net/image/24455F3553BF735A3B3745","direction":"","zipcode":"134874","placeUrl":"http://place.map.daum.net/24856497","id":"24856497","title":"스핀볼링장","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 강동구 천호동 425-5","longitude":"127.12492312779793","latitude":"37.54061129486903","addressBCode":"1174010900"},{"phone":"","newAddress":"서울 노원구 상계로 55","imageUrl":"","direction":"","zipcode":"139827","placeUrl":"http://place.map.daum.net/26647582","id":"26647582","title":"그린라이트","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 노원구 상계동 693-3","longitude":"127.06118689106724","latitude":"37.65603160858541","addressBCode":"1135010500"}],"info":{"samename":{"keyword":"볼링장","selected_region":"서울"},"count":"15","page":"1","totalCount":"45"}};
		var jsontext8={"item":[{"phone":"02-3474-1010","newAddress":"서울 서초구 남부순환로 2567","imageUrl":"http://cfile88.uf.daum.net/image/177607484FF0EB0B1011EE","direction":"","zipcode":"137863","placeUrl":"http://place.map.daum.net/17748175","id":"17748175","title":"캐리어볼링장","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 서초구 서초동 1365-17 세방빌딩 지하1층","longitude":"127.03147766178809","latitude":"37.484540616887706","addressBCode":"1165010800"},{"phone":"02-859-1422","newAddress":"서울 구로구 디지털로32나길 38","imageUrl":"","direction":"","zipcode":"152880","placeUrl":"http://place.map.daum.net/8662113","id":"8662113","title":"구로볼링","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 구로구 구로3동 1124-42 지하2층","longitude":"126.90121625477754","latitude":"37.48452513820181","addressBCode":"1153010200"},{"phone":"02-812-9505","newAddress":"서울 동작구 여의대방로 250","imageUrl":"http://cfile188.uf.daum.net/image/2268004157452CA21DA201","direction":"","zipcode":"156761","placeUrl":"http://place.map.daum.net/8140805","id":"8140805","title":"한숲볼링장","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 동작구 대방동 501 대림쇼핑타운3층","longitude":"126.92442917016604","latitude":"37.508804567100604","addressBCode":"1159010800"},{"phone":"02-392-3550","newAddress":"서울 서대문구 신촌역로 10","imageUrl":"","direction":"","zipcode":"120809","placeUrl":"http://place.map.daum.net/8179108","id":"8179108","title":"혜우볼링센터","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 서대문구 대현동 101-7","longitude":"126.94306309014362","latitude":"37.557627644991015","addressBCode":"1141011200"},{"phone":"02-962-9966","newAddress":"서울 동대문구 회기로28길 8","imageUrl":"","direction":"","zipcode":"130876","placeUrl":"http://place.map.daum.net/10384474","id":"10384474","title":"보스턴볼링","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 동대문구 휘경1동 329","longitude":"127.05596024931631","latitude":"37.58946926690341","addressBCode":"1123010900"},{"phone":"02-2672-8898","newAddress":"서울 영등포구 영등포로28길 5","imageUrl":"","direction":"","zipcode":"150800","placeUrl":"http://place.map.daum.net/17066979","id":"17066979","title":"로얄볼링센타","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 영등포구 당산동1가 9-1 코오롱아파트 지하3층","longitude":"126.89926006740508","latitude":"37.51998345565459","addressBCode":"1156011100"},{"phone":"02-416-9140","newAddress":"서울 송파구 백제고분로 365","imageUrl":"","direction":"","zipcode":"138844","placeUrl":"http://place.map.daum.net/18243570","id":"18243570","title":"석촌볼링장","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 송파구 석촌동 174-7 태문빌딩 지하1층","longitude":"127.1064745612341","latitude":"37.50527043936553","addressBCode":"1171010500"},{"phone":"02-461-0707","newAddress":"서울 성동구 연무장7길 12","imageUrl":"","direction":"","zipcode":"133835","placeUrl":"http://place.map.daum.net/16499143","id":"16499143","title":"유니온스타볼링클럽","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 성동구 성수동2가 315-70 지하1층,2층","longitude":"127.0548714418275","latitude":"37.54374243767165","addressBCode":"1120011500"},{"phone":"02-471-0925","newAddress":"서울 강동구 진황도로 18","imageUrl":"","direction":"","zipcode":"134871","placeUrl":"http://place.map.daum.net/16326715","id":"16326715","title":"현대프라자 볼링장","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 강동구 천호동 410-105","longitude":"127.12885012445871","latitude":"37.5396808479137","addressBCode":"1174010900"},{"phone":"02-822-5900","newAddress":"서울 동작구 상도로 102","imageUrl":"","direction":"","zipcode":"156839","placeUrl":"http://place.map.daum.net/27239842","id":"27239842","title":"성대볼링센타","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 동작구 상도3동 324-1","longitude":"126.93196525114459","latitude":"37.500040564595785","addressBCode":"1159010200"},{"phone":"02-711-0925","newAddress":"서울 용산구 한강대로 273","imageUrl":"","direction":"","zipcode":"140717","placeUrl":"http://place.map.daum.net/8200234","id":"8200234","title":"남영볼링센터","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 용산구 갈월동 92","longitude":"126.97199209944391","latitude":"37.542703101500074","addressBCode":"1117010400"},{"phone":"02-855-0080","newAddress":"서울 금천구 시흥대로 440","imageUrl":"","direction":"","zipcode":"153825","placeUrl":"http://place.map.daum.net/20552187","id":"20552187","title":"크로바볼링장","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 금천구 독산동 983-13","longitude":"126.89873093289285","latitude":"37.472889205738866","addressBCode":"1154510200"},{"phone":"02-532-6462","newAddress":"서울 서초구 서초대로73길 42","imageUrl":"","direction":"","zipcode":"137856","placeUrl":"http://place.map.daum.net/26223049","id":"26223049","title":"비어앤볼","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 서초구 서초동 1308-29 리가스퀘어 2층","longitude":"127.02443228555909","latitude":"37.50123974913942","addressBCode":"1165010800"},{"phone":"02-912-4500","newAddress":"서울 성북구 장위로 126","imageUrl":"http://cfile104.uf.daum.net/image/2517424E54D81C021CB1F2","direction":"","zipcode":"136833","placeUrl":"http://place.map.daum.net/9933011","id":"9933011","title":"장위볼링센터","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 성북구 장위동 238-496 장위쇼핑 2층","longitude":"127.05075437476235","latitude":"37.6131064040169","addressBCode":"1129013800"},{"phone":"02-2245-4975","newAddress":"서울 동대문구 천호대로 405","imageUrl":"","direction":"","zipcode":"130844","placeUrl":"http://place.map.daum.net/16376868","id":"16376868","title":"스타볼링센터","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 동대문구 장안동 416-6 지하2층","longitude":"127.06421565281217","latitude":"37.56199554723181","addressBCode":"1123010600"}],"info":{"samename":{"keyword":"볼링장","selected_region":"서울"},"count":"15","page":"2","totalCount":"45"}};
		var jsontext9={"item":[{"phone":"02-523-8033","newAddress":"서울 서초구 서초대로 350","imageUrl":"http://cfile83.uf.daum.net/image/2612744A52BB626D1D4A70","direction":"","zipcode":"137881","placeUrl":"http://place.map.daum.net/13620229","id":"13620229","title":"스타24시 동네볼링장","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 서초구 서초동 1678-8","longitude":"127.02001556254119","latitude":"37.49512815270855","addressBCode":"1165010800"},{"phone":"02-3661-3030","newAddress":"서울 강서구 양천로 706","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/8728681","id":"8728681","title":"강서볼링장","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 강서구 염창동 263-2","longitude":"126.87408853887949","latitude":"37.549670687687005","addressBCode":"1150010100"},{"phone":"02-928-0146","newAddress":"서울 성북구 보문로34길 69","imageUrl":"","direction":"","zipcode":"136051","placeUrl":"http://place.map.daum.net/7942490","id":"7942490","title":"성신볼링센터","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 성북구 동선동1가 84-2","longitude":"127.01903583706951","latitude":"37.59133343732232","addressBCode":"1129011600"},{"phone":"02-986-1600","newAddress":"서울 강북구 도봉로 34","imageUrl":"","direction":"","zipcode":"142804","placeUrl":"http://place.map.daum.net/21572724","id":"21572724","title":"RNB볼링장","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 강북구 송중동 35-4","longitude":"127.03071586490125","latitude":"37.612057362007164","addressBCode":"1130510100"},{"phone":"02-6338-0753","newAddress":"서울 서대문구 명지대길 103","imageUrl":"","direction":"","zipcode":"120800","placeUrl":"http://place.map.daum.net/17180783","id":"17180783","title":"충암볼링장","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 서대문구 남가좌2동 2-4","longitude":"126.92286719586625","latitude":"37.58460638601439","addressBCode":"1141012000"},{"phone":"","newAddress":"","imageUrl":"","direction":"","zipcode":"","placeUrl":"http://place.map.daum.net/8036895","id":"8036895","title":"위너스볼링장","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 금천구 독산동","longitude":"126.89913316670962","latitude":"37.45959062859569","addressBCode":"1154510200"},{"phone":"02-304-5321","newAddress":"서울 서대문구 수색로 48","imageUrl":"","direction":"","zipcode":"120805","placeUrl":"http://place.map.daum.net/18231289","id":"18231289","title":"뉴원일 볼링센터","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 서대문구 남가좌동 270-4","longitude":"126.91351372239193","latitude":"37.570425465825956","addressBCode":"1141012000"},{"phone":"","newAddress":"서울 서초구 방배로33길 29","imageUrl":"","direction":"","zipcode":"137832","placeUrl":"http://place.map.daum.net/79879292","id":"79879292","title":"오란다볼링센터","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 서초구 방배동 816-1 한신트리플 지하1층","longitude":"126.98927131038425","latitude":"37.491237010167396","addressBCode":"1165010100"},{"phone":"02-356-1571","newAddress":"서울 은평구 은평로 136","imageUrl":"","direction":"","zipcode":"122908","placeUrl":"http://place.map.daum.net/8113727","id":"8113727","title":"코리아보링센터","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 은평구 응암1동 98-65","longitude":"126.92305036292805","latitude":"37.60024051488588","addressBCode":"1138010700"},{"phone":"02-871-9183","newAddress":"서울 관악구 신림로59길 23","imageUrl":"","direction":"","zipcode":"151930","placeUrl":"http://place.map.daum.net/22479753","id":"22479753","title":"삼모스포렉스볼링센타","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 관악구 신림동 1638-32","longitude":"126.92839445181049","latitude":"37.482858047912934","addressBCode":"1162010200"},{"phone":"02-3423-2277","newAddress":"서울 중랑구 봉화산로 221","imageUrl":"","direction":"","zipcode":"131867","placeUrl":"http://place.map.daum.net/8103418","id":"8103418","title":"동성타워볼링장","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 중랑구 신내동 786","longitude":"127.09725255437125","latitude":"37.60800287595667","addressBCode":"1126010600"},{"phone":"","newAddress":"서울 강북구 한천로139길 42","imageUrl":"","direction":"","zipcode":"142878","placeUrl":"http://place.map.daum.net/27345254","id":"27345254","title":"킹콩스트라이크","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 강북구 수유동 192-61 5층","longitude":"127.02490330295828","latitude":"37.638904537587436","addressBCode":"1130510300"},{"phone":"02-991-0013","newAddress":"서울 강북구 한천로 1013","imageUrl":"http://cfile37.uf.daum.net/image/202796464EDC4EE83632EE","direction":"","zipcode":"142864","placeUrl":"http://place.map.daum.net/16620078","id":"16620078","title":"럭키볼링센터","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 강북구 번동 417-106","longitude":"127.02876891908578","latitude":"37.63845316588343","addressBCode":"1130510200"},{"phone":"02-797-6320","newAddress":"서울 용산구 한강대로 257","imageUrl":"","direction":"","zipcode":"140759","placeUrl":"http://place.map.daum.net/9734756","id":"9734756","title":"뉴청룡볼링장","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 용산구 갈월동 98-38","longitude":"126.97255841009633","latitude":"37.541229198982855","addressBCode":"1117010400"},{"phone":"02-3492-9473","newAddress":"서울 도봉구 도당로 75","imageUrl":"http://cfile3.uf.daum.net/image/180E64434EEAEC5F2C9A8D","direction":"","zipcode":"132848","placeUrl":"http://place.map.daum.net/15236760","id":"15236760","title":"신나는 락볼링","distance":"","category":"스포츠,레저 > 볼링 > 볼링장","address":"서울 도봉구 방학동 662-26","longitude":"127.0353936068554","latitude":"37.66490061776173","addressBCode":"1132010600"}],"info":{"samename":{"keyword":"볼링장","selected_region":"서울"},"count":"15","page":"3","totalCount":"45"}};
	 */

	/*	var jsontext10={"item":[{"phone":"033-742-5200","newAddress":"강원 원주시 원일로 52","imageUrl":"","direction":"","zipcode":"220904","placeUrl":"http://place.map.daum.net/10504850","id":"10504850","title":"서울탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"강원 원주시 중앙동 219","longitude":"127.95255875424775","latitude":"37.34720383988237","addressBCode":"4213010100"},{"phone":"02-392-1858","newAddress":"서울 서대문구 연세로 8","imageUrl":"","direction":"","zipcode":"120833","placeUrl":"http://place.map.daum.net/10382613","id":"10382613","title":"복지탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 서대문구 창천동 18-31","longitude":"126.93713383570777","latitude":"37.556197457158746","addressBCode":"1141011600"},{"phone":"02-382-2949","newAddress":"서울 은평구 역말로 37","imageUrl":"","direction":"","zipcode":"122900","placeUrl":"http://place.map.daum.net/14721467","id":"14721467","title":"챔피온탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 은평구 역촌동 48-2 4층","longitude":"126.914378606586","latitude":"37.60595042364231","addressBCode":"1138010800"},{"phone":"02-2243-3959","newAddress":"서울 성동구 천호대로 432","imageUrl":"","direction":"","zipcode":"133850","placeUrl":"http://place.map.daum.net/8417356","id":"8417356","title":"세종 탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 성동구 용답동 235-2","longitude":"127.0668585299814","latitude":"37.56078314079348","addressBCode":"1120012200"},{"phone":"02-2651-3736","newAddress":"서울 양천구 목동동로 345","imageUrl":"","direction":"","zipcode":"158876","placeUrl":"http://place.map.daum.net/14519938","id":"14519938","title":"사라예보탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 양천구 목동 905-21","longitude":"126.87689089866436","latitude":"37.53290784827366","addressBCode":"1147010200"},{"phone":"02-2065-1381","newAddress":"서울 양천구 신월로 132","imageUrl":"http://cfile88.uf.daum.net/image/2528864C54D6C924185F6F","direction":"","zipcode":"158848","placeUrl":"http://place.map.daum.net/26489104","id":"26489104","title":"나이스탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 양천구 신월동 1001-1","longitude":"126.83852213557074","latitude":"37.51657511662673","addressBCode":"1147010300"},{"phone":"02-2212-4719","newAddress":"서울 동대문구 장한로 173","imageUrl":"http://cfile176.uf.daum.net/image/233E13505566ABB620B07D","direction":"","zipcode":"130838","placeUrl":"http://place.map.daum.net/22578751","id":"22578751","title":"배봉탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 동대문구 장안동 304-1 4층","longitude":"127.07177604826884","latitude":"37.57589535404372","addressBCode":"1123010600"},{"phone":"02-875-5211","newAddress":"서울 관악구 신림로 91","imageUrl":"","direction":"","zipcode":"151858","placeUrl":"http://place.map.daum.net/18119145","id":"18119145","title":"한울탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 관악구 신림동 241-22","longitude":"126.93913660778371","latitude":"37.47035084895734","addressBCode":"1162010200"},{"phone":"02-2244-6554","newAddress":"서울 동대문구 망우로 71","imageUrl":"","direction":"","zipcode":"130876","placeUrl":"http://place.map.daum.net/17002507","id":"17002507","title":"휘경탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 동대문구 휘경동 264-10","longitude":"127.06119169205385","latitude":"37.59002528597182","addressBCode":"1123010900"},{"phone":"02-3394-8850","newAddress":"서울 동대문구 전농로 75","imageUrl":"","direction":"","zipcode":"130802","placeUrl":"http://place.map.daum.net/12887472","id":"12887472","title":"챔프탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 동대문구 답십리동 250-13 5층","longitude":"127.0571241391335","latitude":"37.57160741045002","addressBCode":"1123010500"},{"phone":"010-8484-3944","newAddress":"서울 광진구 천호대로 629","imageUrl":"http://cfile88.uf.daum.net/image/220D6D4C5395A9BE35145A","direction":"","zipcode":"143890","placeUrl":"http://place.map.daum.net/24876656","id":"24876656","title":"블루윈탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 광진구 중곡2동 116-8 대영빌딩 지하1층","longitude":"127.08756327120368","latitude":"37.55441216557511","addressBCode":"1121510100"},{"phone":"010-9506-5049","newAddress":"서울 강남구 논현로8길 24","imageUrl":"http://cfile3.uf.daum.net/image/2232BB4D532C1D751FBFEF","direction":"","zipcode":"135961","placeUrl":"http://place.map.daum.net/23922132","id":"23922132","title":"준탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 강남구 개포동 1186 한경빌딩 지하","longitude":"127.05083678343077","latitude":"37.47439211392419","addressBCode":"1168010300"},{"phone":"010-5355-4003","newAddress":"서울 금천구 남부순환로128길 41-6","imageUrl":"http://cfile39.uf.daum.net/image/276A3B4D5729A293321EB3","direction":"","zipcode":"153820","placeUrl":"http://place.map.daum.net/971155242","id":"971155242","title":"금광탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 금천구 독산동 904-5 지하1층","longitude":"126.90832398154569","latitude":"37.47865989482598","addressBCode":"1154510200"},{"phone":"02-6013-3990","newAddress":"서울 강남구 삼성로126길 14","imageUrl":"http://cfile8.uf.daum.net/image/12424A41509095EC25C071","direction":"","zipcode":"135870","placeUrl":"http://place.map.daum.net/18776427","id":"18776427","title":"청담탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 강남구 삼성동 64-3","longitude":"127.05230948301748","latitude":"37.517657809770505","addressBCode":"1168010500"},{"phone":"02-6081-0543","newAddress":"서울 관악구 봉천로 602","imageUrl":"http://cfile140.uf.daum.net/image/24240C475624B2161853FA","direction":"","zipcode":"151832","placeUrl":"http://place.map.daum.net/27188021","id":"27188021","title":"낙성대탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 관악구 봉천동 1632-7 지하 1층","longitude":"126.96390882086529","latitude":"37.47599412740405","addressBCode":"1162010100"}],"info":{"samename":{"keyword":"서울탁구장","selected_region":""},"count":"15","page":"1","totalCount":"45"}};
	var jsontext11={"item":[{"phone":"070-8281-0288","newAddress":"서울 은평구 증산로15길 35-8","imageUrl":"","direction":"","zipcode":"122884","placeUrl":"http://place.map.daum.net/21689181","id":"21689181","title":"레인보우탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 은평구 신사2동 140-1 피노키오어린이집 4층","longitude":"126.90881700187386","latitude":"37.59009963085961","addressBCode":"1138010900"},{"phone":"010-4001-3701","newAddress":"서울 금천구 독산로107길 11","imageUrl":"http://cfile138.uf.daum.net/image/22478F415438F7C134E0A2","direction":"","zipcode":"153823","placeUrl":"http://place.map.daum.net/25975264","id":"25975264","title":"성원탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 금천구 독산3동 962","longitude":"126.90312878462787","latitude":"37.47794575453837","addressBCode":"1154510200"},{"phone":"02-558-1253","newAddress":"서울 강남구 선릉로69길 19","imageUrl":"","direction":"","zipcode":"135796","placeUrl":"http://place.map.daum.net/19499214","id":"19499214","title":"강남한티탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 강남구 역삼동 764","longitude":"127.05117348045574","latitude":"37.497313617060335","addressBCode":"1168010100"},{"phone":"","newAddress":"서울 은평구 서오릉로 88","imageUrl":"","direction":"","zipcode":"122841","placeUrl":"http://place.map.daum.net/20548216","id":"20548216","title":"역촌오거리탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 은평구 대조동 179-7","longitude":"126.92163796672557","latitude":"37.60806378252228","addressBCode":"1138010600"},{"phone":"02-461-7233","newAddress":"서울 광진구 능동로13길 39","imageUrl":"","direction":"","zipcode":"143914","placeUrl":"http://place.map.daum.net/11210600","id":"11210600","title":"한아름 탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 광진구 화양동 10-1","longitude":"127.06989828876262","latitude":"37.54350384311284","addressBCode":"1121510700"},{"phone":"02-436-7970","newAddress":"서울 중랑구 용마산로 458","imageUrl":"http://cfile20.uf.daum.net/image/1973373B4ECB1A492421B9","direction":"","zipcode":"131806","placeUrl":"http://place.map.daum.net/14982490","id":"14982490","title":"티앤티탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 중랑구 망우3동 444-26 3층","longitude":"127.09845901612248","latitude":"37.59191739334614","addressBCode":"1126010500"},{"phone":"02-523-7974","newAddress":"서울 동작구 사당로 253-4","imageUrl":"http://cfile2.uf.daum.net/image/224E3A3656B303B10766F7","direction":"","zipcode":"156820","placeUrl":"http://place.map.daum.net/7913273","id":"7913273","title":"사당탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 동작구 사당동 324-17","longitude":"126.97612968334013","latitude":"37.4837747394771","addressBCode":"1159010700"},{"phone":"02-491-7535","newAddress":"서울 중랑구 망우로 469","imageUrl":"","direction":"","zipcode":"131802","placeUrl":"http://place.map.daum.net/10761509","id":"10761509","title":"참피온탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 중랑구 망우동 209-5 3층","longitude":"127.10433207477413","latitude":"37.600763683742706","addressBCode":"1126010500"},{"phone":"02-2648-5224","newAddress":"서울 양천구 목동중앙로 81","imageUrl":"","direction":"","zipcode":"158817","placeUrl":"http://place.map.daum.net/8232451","id":"8232451","title":"공공탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 양천구 목4동 758-7","longitude":"126.87130417543464","latitude":"37.536805025176136","addressBCode":"1147010200"},{"phone":"02-451-3606","newAddress":"서울 강남구 양재대로33길 17","imageUrl":"","direction":"","zipcode":"135516","placeUrl":"http://place.map.daum.net/8100013","id":"8100013","title":"청솔탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 강남구 일원1동 681-1","longitude":"127.08266270728063","latitude":"37.49063553766372","addressBCode":""},{"phone":"02-2615-0009","newAddress":"서울 구로구 개봉로 8","imageUrl":"","direction":"","zipcode":"152812","placeUrl":"http://place.map.daum.net/10053219","id":"10053219","title":"한일탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 구로구 개봉동 290-3","longitude":"126.85684103539982","latitude":"37.48636461109371","addressBCode":"1153010700"},{"phone":"02-780-3289","newAddress":"서울 영등포구 여의대방로 394","imageUrl":"","direction":"","zipcode":"150895","placeUrl":"http://place.map.daum.net/10660438","id":"10660438","title":"여의도탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 영등포구 여의도동 53","longitude":"126.93277572580865","latitude":"37.51938018871914","addressBCode":"1156011000"},{"phone":"02-849-5800","newAddress":"서울 영등포구 가마산로69가길 12","imageUrl":"","direction":"","zipcode":"150841","placeUrl":"http://place.map.daum.net/12816576","id":"12816576","title":"신길탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 영등포구 신길3동 259-4","longitude":"126.90961590033943","latitude":"37.50614520749279","addressBCode":"1156013200"},{"phone":"02-862-1330","newAddress":"서울 관악구 남부순환로 1425","imageUrl":"","direction":"","zipcode":"151877","placeUrl":"http://place.map.daum.net/13025958","id":"13025958","title":"관악탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 관악구 조원동 564-7","longitude":"126.90918931778059","latitude":"37.48109328710826","addressBCode":"1162010200"},{"phone":"02-955-0758","newAddress":"서울 도봉구 도당로 40","imageUrl":"","direction":"","zipcode":"132827","placeUrl":"http://place.map.daum.net/12382082","id":"12382082","title":"스카이탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 도봉구 방학동 263-65","longitude":"127.03498866580311","latitude":"37.661804967561444","addressBCode":"1132010600"}],"info":{"samename":{"keyword":"서울탁구장","selected_region":""},"count":"15","page":"2","totalCount":"45"}};
	var jsontext12={"item":[{"phone":"02-356-3521","newAddress":"서울 은평구 연서로 65","imageUrl":"http://cfile87.uf.daum.net/image/120FE9444DFEB022047DD5","direction":"","zipcode":"122900","placeUrl":"http://place.map.daum.net/13591900","id":"13591900","title":"그린탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 은평구 역촌동 62-17 2층","longitude":"126.91519524418355","latitude":"37.604859013710545","addressBCode":"1138010800"},{"phone":"010-9413-6118","newAddress":"서울 은평구 통일로89길 5","imageUrl":"","direction":"","zipcode":"122810","placeUrl":"http://place.map.daum.net/13720910","id":"13720910","title":"크로바탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 은평구 갈현동 413-1","longitude":"126.91905608440989","latitude":"37.6245176866338","addressBCode":"1138010400"},{"phone":"02-441-6004","newAddress":"서울 강동구 고덕로24길 50","imageUrl":"","direction":"","zipcode":"134857","placeUrl":"http://place.map.daum.net/25091632","id":"25091632","title":"오핑탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 강동구 암사동 473-3 지층","longitude":"127.13509624913387","latitude":"37.552374341384244","addressBCode":"1174010700"},{"phone":"010-5344-5548","newAddress":"서울 중랑구 봉화산로56길 153","imageUrl":"","direction":"","zipcode":"131869","placeUrl":"http://place.map.daum.net/26782374","id":"26782374","title":"대명탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 중랑구 신내동 502-5 대명프라자","longitude":"127.09683674769211","latitude":"37.60175755693462","addressBCode":"1126010600"},{"phone":"010-3952-8850","newAddress":"서울 동대문구 서울시립대로 36","imageUrl":"","direction":"","zipcode":"130859","placeUrl":"http://place.map.daum.net/23326089","id":"23326089","title":"드림탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 동대문구 전농동 647-1 지하 1층","longitude":"127.04699704442507","latitude":"37.57454191167086","addressBCode":"1123010400"},{"phone":"070-8243-8899","newAddress":"서울 동대문구 장한로 166","imageUrl":"","direction":"","zipcode":"130839","placeUrl":"http://place.map.daum.net/17004669","id":"17004669","title":"올림픽탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 동대문구 장안동 310-1 대흥빌딩","longitude":"127.0722507712311","latitude":"37.57513462518717","addressBCode":"1123010600"},{"phone":"02-958-3943","newAddress":"서울 동대문구 회기로 85","imageUrl":"","direction":"","zipcode":"130868","placeUrl":"http://place.map.daum.net/8583994","id":"8583994","title":"한국과학기술원 탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 동대문구 청량리동 산1-192","longitude":"127.04686873550118","latitude":"37.59378357289933","addressBCode":"1123010700"},{"phone":"02-430-2891","newAddress":"서울 송파구 동남로 98","imageUrl":"","direction":"","zipcode":"138825","placeUrl":"http://place.map.daum.net/20941786","id":"20941786","title":"코리아탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 송파구 문정동 42-9","longitude":"127.1224538288662","latitude":"37.48917019620199","addressBCode":"1171010800"},{"phone":"02-3663-5959","newAddress":"서울 강서구 양천로 410","imageUrl":"","direction":"","zipcode":"157801","placeUrl":"http://place.map.daum.net/19900065","id":"19900065","title":"비전탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 강서구 가양동 54-5","longitude":"126.8465081278048","latitude":"37.565095552791384","addressBCode":"1150010400"},{"phone":"02-808-0169","newAddress":"서울 금천구 독산로 56","imageUrl":"","direction":"","zipcode":"153841","placeUrl":"http://place.map.daum.net/27435550","id":"27435550","title":"한성탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 금천구 시흥동 837-38","longitude":"126.90620884137084","latitude":"37.45228744227479","addressBCode":"1154510300"},{"phone":"02-871-7902","newAddress":"서울 관악구 신림로 108","imageUrl":"","direction":"","zipcode":"151856","placeUrl":"http://place.map.daum.net/25857626","id":"25857626","title":"광장탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 관악구 서림동 118-3","longitude":"126.93757592318556","latitude":"37.47115013207461","addressBCode":"1162010200"},{"phone":"02-481-1120","newAddress":"서울 강동구 고덕로62길 58","imageUrl":"","direction":"","zipcode":"134825","placeUrl":"http://place.map.daum.net/25818401","id":"25818401","title":"vip탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 강동구 명일동 42","longitude":"127.15156597497233","latitude":"37.55084427723957","addressBCode":"1174010100"},{"phone":"02-435-7974","newAddress":"서울 중랑구 면목로 352","imageUrl":"","direction":"","zipcode":"131813","placeUrl":"http://place.map.daum.net/25883654","id":"25883654","title":"에이스탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 중랑구 면목동 458-29","longitude":"127.08862513544558","latitude":"37.583336926809885","addressBCode":"1126010100"},{"phone":"02-404-7070","newAddress":"서울 송파구 문정로 25","imageUrl":"","direction":"","zipcode":"138825","placeUrl":"http://place.map.daum.net/21627950","id":"21627950","title":"나이스탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 송파구 문정동 37-12","longitude":"127.12568758474701","latitude":"37.4863880933328","addressBCode":"1171010800"},{"phone":"010-5126-3759","newAddress":"서울 중랑구 신내로14길 26","imageUrl":"","direction":"","zipcode":"131868","placeUrl":"http://place.map.daum.net/23181611","id":"23181611","title":"신내탁구장","distance":"","category":"스포츠,레저 > 탁구 > 탁구장","address":"서울 중랑구 신내동 454-4 디딤빌딩 4층","longitude":"127.0970727466772","latitude":"37.60559197621343","addressBCode":"1126010600"}],"info":{"samename":{"keyword":"서울탁구장","selected_region":""},"count":"15","page":"3","totalCount":"45"}};
		
		
	/*
		alert(jsontext4.item[0].phone);
		for(var i=0;i<jsontext4.item.length;i++){
			var item = {
					"item.ground_id":jsontext4.item[i].id,
					"item.ground_name":jsontext4.item[i].title,
					"item.ground_phone":jsontext4.item[i].phone,
					"item.ground_address":jsontext4.item[i].address,
					"item.ground_longitude":jsontext4.item[i].longitude,
					"item.ground_latitude":jsontext4.item[i].latitude,
			};
			
			$.ajax({
				url:'ground',
				method:'post',
				data:item,
				dataType:'json',
				success:function(response){
				
				}
				
				});
			}  
	 */
	 /* for(var i=0;i<jsontext.item.length;i++){	//축구장부분
	var item = {
		"item.ground_id":jsontext.item[i].id,
		"item.ground_name":jsontext.item[i].title,
		"item.ground_phone":jsontext.item[i].phone,
		"item.ground_address":jsontext.item[i].address,
		"item.ground_longitude":jsontext.item[i].longitude,
		"item.ground_latitude":jsontext.item[i].latitude,
	};
	
	$.ajax({
	url:'ground',
	method:'post',
	data:item,
	dataType:'json',
	success:function(response){
	
	}
	
	});
	} 

	for(var i=0;i<jsontext.item.length;i++){
	var item = {
		"item.ground_id":jsontext2.item[i].id,
		"item.ground_name":jsontext2.item[i].title,
		"item.ground_phone":jsontext2.item[i].phone,
		"item.ground_address":jsontext2.item[i].address,
		"item.ground_longitude":jsontext2.item[i].longitude,
		"item.ground_latitude":jsontext2.item[i].latitude,
	};
	
	$.ajax({
	url:'ground',
	method:'post',
	data:item,
	dataType:'json',
	success:function(response){
	
	}
	
	});
	} 
	for(var i=0;i<jsontext.item.length;i++){
	var item = {
			"item.ground_id":jsontext3.item[i].id,
			"item.ground_name":jsontext3.item[i].title,
			"item.ground_phone":jsontext3.item[i].phone,
			"item.ground_address":jsontext3.item[i].address,
			"item.ground_longitude":jsontext3.item[i].longitude,
			"item.ground_latitude":jsontext3.item[i].latitude,
	};
	
	$.ajax({
		url:'ground',
		method:'post',
		data:item,
		dataType:'json',
		success:function(response){
			
		}
		
		});
	}    */
	 
	/* for(var i=0;i<jsontext7.item.length;i++){	
		var item = {
				"item.ground_id":jsontext7.item[i].id,
				"item.ground_name":jsontext7.item[i].title,
				"item.ground_phone":jsontext7.item[i].phone,
				"item.ground_address":jsontext7.item[i].address,
				"item.ground_longitude":jsontext7.item[i].longitude,
				"item.ground_latitude":jsontext7.item[i].latitude,
		};
		
		$.ajax({
			url:'ground',
			method:'post',
			data:item,
			dataType:'json',
			success:function(response){
			
			}
			
			});
		} 

	 	for(var i=0;i<jsontext8.item.length;i++){
		var item = {
				"item.ground_id":jsontext8.item[i].id,
				"item.ground_name":jsontext8.item[i].title,
				"item.ground_phone":jsontext8.item[i].phone,
				"item.ground_address":jsontext8.item[i].address,
				"item.ground_longitude":jsontext8.item[i].longitude,
				"item.ground_latitude":jsontext8.item[i].latitude,
		};
		
		$.ajax({
			url:'ground',
			method:'post',
			data:item,
			dataType:'json',
			success:function(response){
			
			}
			
			});
		} 
		for(var i=0;i<jsontext9.item.length;i++){
			var item = {
					"item.ground_id":jsontext9.item[i].id,
					"item.ground_name":jsontext9.item[i].title,
					"item.ground_phone":jsontext9.item[i].phone,
					"item.ground_address":jsontext9.item[i].address,
					"item.ground_longitude":jsontext9.item[i].longitude,
					"item.ground_latitude":jsontext9.item[i].latitude,
			};
			
			$.ajax({
				url:'ground',
				method:'post',
				data:item,
				dataType:'json',
				success:function(response){
					
				}
				
				});
			} 
	 */
	/* 
	 for(var i=0;i<jsontext10.item.length;i++){	
		var item = {
				"item.ground_id":jsontext10.item[i].id,
				"item.ground_name":jsontext10.item[i].title,
				"item.ground_phone":jsontext10.item[i].phone,
				"item.ground_address":jsontext10.item[i].address,
				"item.ground_longitude":jsontext10.item[i].longitude,
				"item.ground_latitude":jsontext10.item[i].latitude,
		};
		
		$.ajax({
			url:'ground',
			method:'post',
			data:item,
			dataType:'json',
			success:function(response){
			
			}
			
			});
		} 

	 	for(var i=0;i<jsontext11.item.length;i++){
		var item = {
				"item.ground_id":jsontext11.item[i].id,
				"item.ground_name":jsontext11.item[i].title,
				"item.ground_phone":jsontext11.item[i].phone,
				"item.ground_address":jsontext11.item[i].address,
				"item.ground_longitude":jsontext11.item[i].longitude,
				"item.ground_latitude":jsontext11.item[i].latitude,
		};
		
		$.ajax({
			url:'ground',
			method:'post',
			data:item,
			dataType:'json',
			success:function(response){
			
			}
			
			});
		} 
		for(var i=0;i<jsontext12.item.length;i++){
			var item = {
					"item.ground_id":jsontext12.item[i].id,
					"item.ground_name":jsontext12.item[i].title,
					"item.ground_phone":jsontext12.item[i].phone,
					"item.ground_address":jsontext12.item[i].address,
					"item.ground_longitude":jsontext12.item[i].longitude,
					"item.ground_latitude":jsontext12.item[i].latitude,
			};
			
			$.ajax({
				url:'ground',
				method:'post',
				data:item,
				dataType:'json',
				success:function(response){
					
				}
				
				});
			}  
	 */
</script>
<style type="text/css">
.jqstooltip {
	position: absolute;
	left: 0px;
	top: 0px;
	visibility: hidden;
	background: rgb(0, 0, 0) transparent;
	background-color: rgba(0, 0, 0, 0.6);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,
		endColorstr=#99000000);
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
	color: white;
	font: 10px arial, san serif;
	text-align: left;
	white-space: nowrap;
	padding: 5px;
	border: 1px solid white;
	z-index: 10000;
}

.jqsfield {
	color: white;
	font: 10px arial, san serif;
	text-align: left;
}

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}
</style>

</head>
<body>
	<!--
  Main sidebar seen on the left. may be static or collapsing depending on selected state.

    * Collapsing - navigation automatically collapse when mouse leaves it and expand when enters.
    * Static - stays always open.
-->
	<nav id="sidebar" class="sidebar" role="navigation">
      <!-- need this .js class to initiate slimscroll -->
      <div class="js-sidebar-content">
         <header class="logo hidden-sm-down">
            <s:a action="../intro">Matching</s:a>
         </header>
         <!-- seems like lots of recent admin template have this feature of user info in the sidebar.
             looks good, so adding it and enhancing with notifications -->
         <div class="sidebar-status hidden-md-up">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span
               class="thumb-sm avatar pull-xs-right"> <!-- <img class="img-circle" src="demo/img/people/a5.jpg" alt="..."> -->
            </span> <!-- .circle is a pretty cool way to add a bit of beauty to raw data.
                     should be used with bg-* and text-* classes for colors -->
               <span class="circle bg-warning fw-bold text-gray-dark"> </span>
               &nbsp; 우리동내 <strong>골목대장</strong> <b class="caret"></b>
            </a>
            <!-- #notifications-dropdown-menu goes here when screen collapsed to xs or sm -->
         </div>
         <!-- main notification links are placed inside of .sidebar-nav -->
         <ul class="sidebar-nav">
            <li class="active"><a href="#sidebar-ui" data-toggle="collapse"
               data-parent="#sidebar"> <span class="icon"> <!-- <i class="glyphicon glyphicon-tree-conifer"></i> -->
                     <i class="fa fa-child"></i>
               </span> My Page <i class="toggle fa fa-angle-down"></i>
            </a>
               <ul id="sidebar-ui" class="collapse in">
                  <li><s:a action="mypagev" namespace="/player">전적/게임 정보</s:a></li>
               </ul>
               </li>
            <li><a class="collapsed" href="#sidebar-maps"
               data-toggle="collapse" data-parent="#sidebar"> <span
                  class="icon"> <i class="fa fa-users"></i>
               </span> TEAM <i class="toggle fa fa-angle-down"></i>
            </a>
               <ul id="sidebar-maps" class="collapse">
                  <!-- data-no-pjax turns off pjax loading for this link. Use in case of complicated js loading on the
                         target page -->
                  <li><s:a action="soccerteampage" namespace="/team">축구팀 관리</s:a></li>
                  <li><s:a action="baseballteampage" namespace="/team">야구팀 관리</s:a></li>
                  <li><s:a action="t_searchv" namespace="/team">팀 찾기</s:a></li>
               </ul></li>
            <li>
               <!-- an example of nested submenu. basic bootstrap collapse component -->
               <a class="collapsed" href="#sidebar-tables" data-toggle="collapse"
               data-parent="#sidebar"> <span class="icon"> <i
                     class="fa fa-sitemap"></i>
               </span> Matching <i class="toggle fa fa-angle-down"></i>
            </a>
               <ul id="sidebar-tables" class="collapse">
                  <li><s:a action="index_matching" namespace="..">매칭신청</s:a></li>
                  <li><s:a action="Matching" namespace="/player">진행 중</s:a></li>
               </ul>
            </li>
            
            <li><a class="collapsed" href="#sidebar-forms" data-toggle="collapse" data-parent="#sidebar" aria-expanded="false">
                    <span class="icon">
                        <i class="glyphicon glyphicon-star"></i>
                    </span>
                    Ranking
                    <i class="toggle fa fa-angle-down"></i>
                </a>
                <ul id="sidebar-forms" class="collapse" aria-expanded="false">
                  <li><s:a action="scranking" namespace="/player">축구 명예의 전당</s:a></li>
                  <li><s:a action="baranking" namespace="/player">야구 명예의 전당</s:a></li>
                  <li><s:a action="blranking" namespace="/player">볼링 명예의 전당</s:a></li>
                  <li><s:a action="ppranking" namespace="/player">탁구 명예의 전당</s:a></li>
                </ul>
            </li>
            <li><s:a action="list" namespace="/board"> <span class="icon"> <span
                     class="glyphicon glyphicon-list-alt"></span>
               </span> 자유게시판
            </s:a></li>
            
         </ul>
      </div>
   </nav>
   <!-- This is the white navigation bar seen on the top. A bit enhanced BS navbar. See .page-controls in _base.scss. -->

   <nav class="page-controls navbar navbar-dashboard">
      <div class="container-fluid">
         <div class="navbar-header">
            <ul class="nav navbar-nav">
               <li class="nav-item">
                  <!-- whether to automatically collapse sidebar on mouseleave. If activated acts more like usual admin templates -->
                  <a class="hidden-md-down nav-link" id="nav-state-toggle" href="#"
                  data-toggle="tooltip" data-html="true"
                  data-original-title="Turn<br>on/off<br>sidebar<br>collapsing"
                  data-placement="bottom"> <i class="fa fa-bars fa-lg"></i>
               </a> <!-- shown on xs & sm screen. collapses and expands navigation -->
                  <a class="hidden-lg-up nav-link" id="nav-collapse-toggle" href="#"
                  data-html="true" title="Show/hide<br>sidebar"
                  data-placement="bottom"> <span
                     class="rounded rounded-lg bg-gray text-white hidden-md-up"><i
                        class="fa fa-bars fa-lg"></i></span> <i
                     class="fa fa-bars fa-lg hidden-sm-down"></i>
               </a>
               </li>
            </ul>
            <ul class="nav navbar-nav navbar-right hidden-md-up">
               <li>
                  <!-- toggles chat --> <a href="#" data-toggle="chat-sidebar">
                     <span class="rounded rounded-lg bg-gray text-white"><i
                        class="fa fa-globe fa-lg"></i></span>
               </a>
               </li>
            </ul>
            <!-- xs & sm screen logo -->
            <s:a class="navbar-brand hidden-md-up" action="index" namespace="/"> <i
               class="fa fa-circle text-gray mr-n-sm"></i> <i
               class="fa fa-circle text-warning"></i> &nbsp; 골목대장 &nbsp; <i
               class="fa fa-circle text-warning mr-n-sm"></i> <i
               class="fa fa-circle text-gray"></i>
            </s:a>
         </div>
         <!-- this part is hidden for xs screens -->
         <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav pull-xs-right">
               <li class="dropdown nav-item"><a href="#"
                  class="dropdown-toggle dropdown-toggle-notifications nav-link"
                  id="notifications-dropdown-toggle" data-toggle="dropdown">
                     &nbsp; <strong> <s:if test="#session.user_Id != null">
                           <s:property value="#session.user_Name" />
                        </s:if>
                        <s:else>
                           <s:a action="loginv" namespace="/player">로그인하기</s:a>
                        </s:else>
                  </strong>&nbsp; <b class="caret"></b>
               </a> <!-- 드롭다운 -->
                  <ul class="dropdown-menu dropdown-menu-right">
                     <li><s:a class="dropdown-item" action="logout" namespace="/player" ><i
                           class="fa fa-sign-out"></i> &nbsp; Log Out</s:a></li>
                  </ul></li>
            </ul>
         </div>
      </div>
   </nav>

	<div class="content-wrap">
		<main id="content" class="content" role="main">
		<style>
body {
	overflow-x: visible;
}
</style>

		<script type="text/javascript"
			src="//apis.daum.net/maps/maps3.js?apikey=e476fd3b9c743461f3c713db7e85c418&libraries=services"></script>
		<s:if test="games.ground_Id != 0">
			<div class="map_wrap">
				<div id="map"
					style="width: 100%; height: 90%; position: relative; overflow: hidden;"></div>
			</div>
			
			<div class="row">
				<div class="col-lg-12">
				
				<s:a href='javascript:window.open("gameResultv.action?ground_Id=%{games.game_Id}","result","resizable=yes, width =300px, height=250px")'>
				<button type="button" class="btn btn-info btn-block"  style="height: 50px;">결과를 입력해주세요</button></s:a>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<section class="widget">
						<div class="widget-body">
							<table class="table">
								<thead>
									<tr>
										<th>경기장 이름</th>
										<th class="hidden-sm-down">위치</th>
										<th class="hidden-sm-down">전화번호</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<h4>
												<s:property value="item.ground_name" />
											</h4>
										</td>
										<td><h4>
												<s:property value="item.ground_address" />
											</h4></td>
										<td><span
											class="label label-pill bg-gray-lighter text-gray">
												<h4>
													<s:property value="item.ground_phone" />
												</h4>
										</span></td>

									</tr>
								</tbody>

							</table>
						</div>
					</section>
				</div>
			</div>
			
			





			<div class="row">
				<div class="col-lg-12">

					<section class="widget">
						<header class="bb">
							<h6>
								<span class="fw-semi-bold">대화</span>
							</h6>
						</header>
						<div class="widget-body">
							<div>
								<div id="mydiv"
									style="overflow: auto; width: auto; height: 287px;">
									<ul id="chat" class="list-group widget-chat-list-group"
										style="width: auto; height: 287px;">

									</ul>
								</div>
							</div>
						</div>
						<footer class="bg-body-light bt">
							<div class="input-group input-group-sm">
								<input id="msg" type="text" class="form-control"
									placeholder="Your message"> <span
									class="input-group-btn">
									<button type="submit" id="send" class="btn btn-secondary">Send</button>
								</span>
							</div>
						</footer>
					</section>
				</div>
			</div>

			<script>
				var latitude = <s:property value="item.ground_latitude" />;
				var longitude = <s:property value="item.ground_longitude" />;

				var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
				mapOption = {
					center : new daum.maps.LatLng(latitude, longitude), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};
				var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				// 마커를 표시할 위치와 title 객체 배열입니다 여기에 홈 어웨이 따로 만들어야 할듯한데
				//좌표를 몇개 찍을지,무슨 기준으로 가져올지 생각해봐야함.
				var positions = [ {
					title : '확정 경기장',
					latlng : new daum.maps.LatLng(latitude, longitude)
				} ];

				// 마커 이미지의 이미지 주소입니다
				var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

				for (var i = 0; i < positions.length; i++) {

					// 마커 이미지의 이미지 크기 입니다
					var imageSize = new daum.maps.Size(34, 45);

					// 마커 이미지를 생성합니다    
					var markerImage = new daum.maps.MarkerImage(imageSrc,
							imageSize);

					// 마커를 생성합니다
					var marker1 = new daum.maps.Marker({
						map : map, // 마커를 표시할 지도
						position : positions[i].latlng, // 마커를 표시할 위치
						title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						image : markerImage
					// 마커 이미지 
					});

				}
			</script>
			<!-- 채팅 로우 -->
			<!-- 챗창-->

		</s:if> <s:else>
			<div class="row">
				<div class="col-lg-6">
					<h1>
						<label>HOME</label>
					</h1>
					<div class="map_wrap">
						<div id="map1"
							style="width: 100%; height: 90%; position: relative; overflow: hidden;"></div>
					</div>
				</div>
				<div class="col-lg-6">
					<h1>
						<label>AWAY</label>
					</h1>
					<div class="map_wrap">
						<div id="map2"
							style="width: 100%; height: 90%; position: relative; overflow: hidden;"></div>
					</div>
				</div>
			</div>
			         <script>
            var la1=<s:property value='games.p1_latitude' />;
            var lo1=<s:property value='games.p1_longitude' />;
            var mapContainer = document.getElementById('map1'), // 지도를 표시할 div  
            
            mapOption = {
               center : new daum.maps.LatLng(la1,
            		   lo1), // 지도의 중심좌표 이부분 바꿔야되는데. <s:property value="games.p1_latitude" />
               level : 8
            // 지도의 확대 레벨
            };
            var la2=<s:property value='games.p2_latitude' />;
            var lo2=<s:property value='games.p2_longitude' />;
            var map1 = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
            
            var mapContainer = document.getElementById('map2'), // 지도를 표시할 div  
            mapOption = { 
               center : new daum.maps.LatLng(la2,
                     lo2), // 지도의 중심좌표
               level : 8
            // 지도의 확대 레벨
            };

            var map2 = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
            // 마커를 표시할 위치와 title 객체 배열입니다 여기에 홈 어웨이 따로 만들어야 할듯한데
            //좌표를 몇개 찍을지,무슨 기준으로 가져올지 생각해봐야함.

            var positions = [];
            var idd = <s:property value="games.game_Id" />;
            $.ajax({
                     url : 'List',
                     method : 'post',
                     data : {'games.game_Id': idd},
                     dataType : 'json',
                     success : function(response) {
                     <%--    var userId = "<%=session.getAttribute("user_Id")%>"; //로그인이 연결되면 테스트함
                        var teamId1= "<%=session.getAttribute("team_Id1")%>";
                        var teamId2= "<%=session.getAttribute("team_Id2")%>";
                        alert(userId);
                        
                        var x="<s:property value="games.player1" />";
                     if(x.equals(userId) || x.equals(teamId1) || x.equals(teamId2) ){
                        var list = response.home_list;   //home리스트 뽑아온거
                        var list2 = response.away_list;   //away리스트 뽑아온거
                        }
                        else{
                           var list2 = response.home_list;   //home리스트 뽑아온거 
                           var list1 = response.away_list;   //away리스트 뽑아온거
                           }
                         --%>
                           var list = response.home_list;   //home리스트 뽑아온거
                           var list2 = response.away_list;   //away리스트 뽑아온거
                        var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
                        $.each(   list,function(index, value) {

                                       //      positions.push({latitude:list[index].ground_latitude});
                                       //      positions.push({longitude:list[index].ground_longitude});
                                       //   alert(list[index].ground_name);
                                       //   positions.push({latlng: new daum.maps.LatLng(list[index].ground_latitude, list[index].ground_longitude)},{title:list[index].ground_name});
                                       var imageSize = new daum.maps.Size(
                                             34, 45);

                                       // 마커 이미지를 생성합니다    
                                       var markerImage = new daum.maps.MarkerImage(
                                             imageSrc, imageSize);

                                       // 마커를 생성합니다
                                       var marker1 = new daum.maps.Marker(
                                             {
                                                map : map1, // 마커를 표시할 지도
                                                position : new daum.maps.LatLng(
                                                      list[index].ground_latitude,
                                                      list[index].ground_longitude), // 마커를 표시할 위치
                                                title : list[index].ground_name, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                                                image : markerImage
                                             // 마커 이미지 
                                             }); //마커 생성 끝

                                       // 마커를 생성합니다
                              		
                          /*              var iwContent = '<div style="padding:5px;">경기장</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                                       iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

                                   // 인포윈도우를 생성하고 지도에 표시합니다
                                   var infowindow = new daum.maps.InfoWindow({
                                       map: map, // 인포윈도우가 표시될 지도
                                       position : iwPosition, 
                                       content : iwContent,
                                       removable : iwRemoveable
                                   });
 */
                                    }); //each
                                    $.each(   list2,function(index, value) {

                                       //      positions.push({latitude:list[index].ground_latitude});
                                       //      positions.push({longitude:list[index].ground_longitude});
                                       //   alert(list[index].ground_name);
                                       //   positions.push({latlng: new daum.maps.LatLng(list[index].ground_latitude, list[index].ground_longitude)},{title:list[index].ground_name});
                                       var imageSize = new daum.maps.Size(
                                             34, 45);

                                       // 마커 이미지를 생성합니다    
                                       var markerImage = new daum.maps.MarkerImage(
                                             imageSrc, imageSize);

                                       // 마커를 생성합니다
                                       

                                       // 마커를 생성합니다
                                       var marker2 = new daum.maps.Marker(
                                             {
                                                map : map2, // 마커를 표시할 지도
                                                position : new daum.maps.LatLng(
                                                      list2[index].ground_latitude,
                                                      list2[index].ground_longitude), // 마커를 표시할 위치
                                                title : list2[index].ground_name, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                                                image : markerImage
                                             // 마커 이미지 
                                             }); //마커 생성 끝

                                    }); //each
                                    
                                    

                     }//sucess

                  }); //ajax
         </script>


			<div class="row">
				<div class="col-lg-12">

					<section class="widget">
						<header class="bb">
							<h6>
								<span class="fw-semi-bold">대화</span>
							</h6>
						</header>
						<div class="widget-body">
							<div>
								<div id="mydiv"
									style="overflow: auto; width: auto; height: 287px;">
									<ul id="chat" class="list-group widget-chat-list-group"
										style="width: auto; height: 287px;">

									</ul>
								</div>
							</div>
						</div>
						<footer class="bg-body-light bt">
							<div class="input-group input-group-sm">
								<input id="msg" type="text" class="form-control"
									placeholder="Your message"> <span
									class="input-group-btn">
									<button type="submit" id="send" class="btn btn-secondary">Send</button>
								</span>
							</div>
						</footer>
					</section>
				</div>
			</div>


			<div class="row">
				<div class="col-lg-12">
					<section class="widget">
						<div class="widget-body">
							<table class="table">
								<thead>
									<tr>
										<th>경기장 이름</th>
										<th class="hidden-sm-down">위치</th>
										<th class="hidden-sm-down">전화번호</th>
										<th></th>
									</tr>
								</thead>
								 <tbody>      
                        <tr style="background-color: white;"><td>HOME　</td><td></td><td></td><td></td></tr>
                     
                           <s:iterator value="home_list">
                              <tr>
                                 <td>
                                       <h4>
                                          <s:property value="ground_name" />
                                       </h4>
                              </td>
                                 <td><h4>
                                       <s:property value="ground_address" />
                                    </h4></td>
                                 <td><span
                                    class="label label-pill bg-gray-lighter text-gray">
                                       <h4>
                                          <s:property value="ground_phone" />
                                       </h4>
                                 </span></td>
                                 <td><s:a
                                       href="select.action?games.ground_Id=%{ground_id}&games.game_Id=%{games.game_Id}">
                                       <button id="select" style="width: 100%" class="btn btn-inverse width-100 mb-xs"
                                          role="button">
                                          <span class="circle bg-white"> <i
                                             class="fa fa-map-marker text-gray"></i>
                                          </span> 확정
                                       </button>
                                    </s:a>
                                    <s:a
                                       href='javascript:window.open("review.action?ground_Id=%{ground_id}","review","resizable=yes, width =500, height=550")'>
                                    <button class="btn btn-warning btn-block"
                                        role="button">
                                       <i class="glyphicon glyphicon-tree-conifer text-success"></i>
                                       한줄평
                                    </button>
                                    </s:a>
                                    </td>

                              </tr>
                           </s:iterator> <!-- 홈 -->
                           <tr style="background-color: white;"><td>AWAY　</td><td></td><td></td><td></td></tr>
                           <s:iterator value="away_list"><!-- 어웨이 -->
                              <tr>
                                 <td>
                                       <h4>
                                          <s:property value="ground_name" />
                                       </h4>
                              </td>
                                 <td><h4>
                                       <s:property value="ground_address" />
                                    </h4></td>
                                 <td><span
                                    class="label label-pill bg-gray-lighter text-gray">
                                       <h4>
                                          <s:property value="ground_phone" />
                                       </h4>
                                 </span></td>
                                 <td><s:a
                                       href="select.action?games.ground_Id=%{ground_id}">
                                       <button id="select" style="width: 100%" class="btn btn-inverse width-100 mb-xs"
                                          role="button">
                                          <span class="circle bg-white"> <i
                                             class="fa fa-map-marker text-gray"></i>
                                          </span> 확정
                                       </button>
                                    </s:a>
                                    <s:a
                                       href='javascript:window.open("review.action?ground_Id=%{ground_id}","review","resizable=yes, width =500, height=550")'>
                                    <button class="btn btn-warning btn-block"
                                        role="button">
                                       <i class="glyphicon glyphicon-tree-conifer text-success"></i>
                                       한줄평
                                    </button>
                                    </s:a>
                                    </td>

                              </tr>
                           </s:iterator>
                        </tbody>

							</table>
						</div>
					</section>
				</div>
			</div>
		</s:else>

		<!-- row --> <!-- 경기장 리스트 --> </main>
	</div>


	<!-- The Loader. Is shown when pjax happens -->
	<div class="loader-wrap hiding hide">
		<i class="fa fa-circle-o-notch fa-spin-fast"></i>
	</div>

	<!-- common libraries. required for every page-->
	<script src="../vendor/jquery/dist/jquery.min.js"></script>
	<script src="../vendor/jquery-pjax/jquery.pjax.js"></script>
	<script src="../vendor/tether/dist/js/tether.js"></script>
	<script src="../vendor/bootstrap/js/dist/util.js"></script>
	<script src="../vendor/bootstrap/js/dist/collapse.js"></script>
	<script src="../vendor/bootstrap/js/dist/dropdown.js"></script>
	<script src="../vendor/bootstrap/js/dist/button.js"></script>
	<script src="../vendor/bootstrap/js/dist/tooltip.js"></script>
	<script src="../vendor/bootstrap/js/dist/alert.js"></script>
	<script src="../vendor/slimScroll/jquery.slimscroll.min.js"></script>
	<script src="../vendor/widgster/widgster.js"></script>
	<script src="../vendor/pace.js/pace.js"
		data-pace-options='{ "target": ".content-wrap", "ghostTime": 1000 }'></script>
	<script src="../vendor/jquery-touchswipe/jquery.touchSwipe.js"></script>
	<script src="../js/bootstrap-fix/button.js"></script>

	<!-- common app js -->
	<script src="../js/settings.js"></script>
	<script src="../js/app.js"></script>

	<!-- page specific libs -->
	<script src="../vendor/jquery-ui/ui/core.js"></script>
	<script
		src="../vendor/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
	<script src="../vendor/jquery.nestable/jquery.nestable.js"></script>
	<script src="../vendor/underscore/underscore.js"></script>
	<script src="../vendor/jquery.sparkline/index.js"></script>
	<script src="../vendor/d3/d3.min.js"></script>
	<script src="../vendor/raphael/raphael-min.js"></script>
	<script src="../vendor/jQuery-Mapael/js/jquery.mapael.js"></script>
	<script src="../vendor/jQuery-Mapael/js/maps/usa_states.js"></script>
	<script src="../vendor/jQuery-Mapael/js/maps/world_countries.js"></script>
	<script src="../vendor/flot/jquery.flot.js"></script>
	<script src="../vendor/MetroJS/release/MetroJs.Full/MetroJs.js"></script>
	<script src="../vendor/skycons/skycons.js"></script>

	<!-- page specific js -->
	<script src="../demo/js/_fake-world-data.js"></script>
	<div data-tether-id="1"
		style="top: 0px; left: 0px; position: absolute;"></div>
</body>
</html>