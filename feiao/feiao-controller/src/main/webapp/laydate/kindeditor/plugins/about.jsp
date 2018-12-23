<!doctype html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>About</title>
		<style type="text/css" rel="stylesheet">
			body {
				margin: 0;
				font:12px/1.5 "sans serif",tahoma,verdana,helvetica;
				background-color:#F0F0EE;
				color:#222222;
				overflow:hidden;
			}
			.main {
				margin: 10px;
			}
			.table {
				list-style-image:none;
				list-style-position:outside;
				list-style-type:none;
				margin:0;
				padding:0;
				display:block;
			}
			.table li {
				padding:0;
				margin:0;
				display:list-item;
			}
		</style>
		<script type="text/javascript">
			var KE = parent.KindEditor;
			var id = KE.util.getParam(location.href, 'id');
			KE.event.ready(function() {
				KE.util.pluginLang('about', document);
				KE.util.hideLoadingPage(id);
			}, window, document);
		</script>
	</head>
	<body>
		<div class="main">
			<ul class="table">
				<li>
					KindEditor <span id="lang.version"></span></span>
				</li>
				<li>
					Copyright &copy; <a href="http://www.kindsoft.net/" target="_blank">kindsoft.net</a> All rights reserved.
				</li>
			</ul>
		</div>
	</body>
</html>
