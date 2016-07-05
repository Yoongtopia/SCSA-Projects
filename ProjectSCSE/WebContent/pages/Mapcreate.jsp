<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<maptitle>Insert maptitle here</maptitle>
<script type="text/javascript" src="assets/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="assets/js/jquery-ui-1.10.4.custom.js"></script>
<script type="text/javascript" src="assets/sui/javascript/semantic.min.js"></script>
<link rel="stylesheet" href="assets/sui/css/semantic.css">
<style type="text/css">
.element {
	width: 60px;
}
.maptitle {
	width: 180px;
}

.mapTable {
	width: 70%;
	left: 0;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#entireMap").modal("show");
		$(".atag").css("text-decoration", "none");
	});
</script>
</head>
<body>


	<div class="ui modal map" id="entireMap">
		<i class="close icon"></i>
		<div class="ui inverted block header" style="background: #D1C8E5; font-family: 'Nanum Gothic';">맵</div>
		<div class="content">
			<div class="contents">

				<!-- 1판 -->
				<table class="ui table mapTable segment" id="chatper1">
					<tr>
						<th rowspan="2" class="maptitle" style="width: 300px;">아코를 찾아라</th>
						<th id="el" class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=11"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=12"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=13"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=14"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=15"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=16"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=17"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=18"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=19"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=20"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=21"><i class="flag circular purple inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=22"><i class="flag circular purple inverted icon"></i></a></th>
					</tr>
					<tr>
						<td>1-1</td>
						<td>1-2</td>
						<td>1-3</td>
						<td>1-4</td>
						<td>1-5</td>
						<td>1-6</td>
						<td>1-7</td>
						<td>1-8</td>
						<td>1-9</td>
						<td>1-10</td>
						<td>1-11</td>
						<td>1-12</td>
					</tr>
				</table>
				<!-- 2판 -->
				<table class="ui table mapTable segment" id="chatper2">
					<tr>
						<th rowspan="2" class="maptitle" style="width: 300px;">아코와의 한판 승부</th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=23"><i class="flag circular red inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=24"><i class="flag circular red inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=25"><i class="flag circular red inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=26"><i class="flag circular red inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=27"><i class="flag circular red inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=28"><i class="flag circular red inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=29"><i class="flag circular red inverted icon"></i></a></th>
					</tr>
					<tr>
						<td>2-1</td>
						<td>2-2</td>
						<td>2-3</td>
						<td>2-4</td>
						<td>2-5</td>
						<td>2-6</td>
						<td>2-7</td>
					</tr>
				</table>
				<!-- 3판 -->
				<table class="ui table mapTable segment" id="chatper3">
					<tr>
						<th rowspan="2" class="maptitle" style="width: 300px;">서부의 무법자, 아코</th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=30"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=31"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=32"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=33"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=34"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=35"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=36"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=37"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=38"><i class="flag circular green inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=39"><i class="flag circular green inverted icon"></i></a></th>
					</tr>
					<tr>
						<td>3-1</td>
						<td>3-2</td>
						<td>3-3</td>
						<td>3-4</td>
						<td>3-5</td>
						<td>3-6</td>
						<td>3-7</td>
						<td>3-8</td>
						<td>3-9</td>
						<td>3-10</td>
					</tr>
				</table>
				<!-- 4판 -->
				<table class="ui table mapTable segment" id="chatper4">
					<tr>
						<th rowspan="2" class="maptitle" style="width: 300px;">친구들아 도와줘!</th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=40"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=41"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=42"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=43"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=44"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=45"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=46"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=47"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=48"><i class="flag circular blue inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=49"><i class="flag circular blue inverted icon"></i></a></th>
					</tr>
					<tr>
						<td>4-1</td>
						<td>4-2</td>
						<td>4-3</td>
						<td>4-4</td>
						<td>4-5</td>
						<td>4-6</td>
						<td>4-7</td>
						<td>4-8</td>
						<td>4-9</td>
						<td>4-10</td>
					</tr>
				</table>
				<!-- 5판 -->
				<table class="ui table mapTable segment" id="chatper5">
					<tr>
						<th rowspan="2" class="maptitle" style="width: 300px;">아코의 습격</th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=50"><i class="flag circular teal inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=51"><i class="flag circular teal inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=52"><i class="flag circular teal inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=53"><i class="flag circular teal inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=54"><i class="flag circular teal inverted icon"></i></a></th>
						<th class="element" style="text-align: center"><a class="atag" href="find_missionIndex.scse?missionIndex=55"><i class="flag circular teal inverted icon"></i></a></th>
					</tr>
					<tr>
						<td>5-1</td>
						<td>5-2</td>
						<td>5-3</td>
						<td>5-4</td>
						<td>5-5</td>
						<td>5-6</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="actions">
			<div class="ui button">닫기</div>
		</div>
	</div>


</body>
</html>