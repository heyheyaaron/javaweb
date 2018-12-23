<!doctype html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>File Manager</title>
		<link href="../../skins/default.css" rel="stylesheet" />
		<link href="./file_manager.css" rel="stylesheet" />
		<script charset="utf-8" src="./file_manager.js"></script>
	</head>
	<body>
		<table class="top" border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td>
					<img class="ke-inline-block" id="moveupImg" src="./images/go-up.gif" width="16" height="16" border="0" alt="" />
					<a class="ke-inline-block" id="moveup" href="javascript:;"><span id="lang.moveup"></span></a>
				</td>
				<td align="right">
					<span id="lang.viewType"></span><select class="ke-inline-block" id="viewType" name="viewType"></select>
					<span id="lang.orderType"></span><select class="ke-inline-block" id="orderType" name="orderType"></select>
				</td>
			</tr>
			<tr>
				<td height="5"></td>
				<td height="5"></td>
			</tr>
		</table>
		<div id="listDiv" class="file-list"></div>
		<div id="viewDiv" class="file-view"></div>
	</body>
</html>
