<!doctype html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Cell</title>
		<link href="../../skins/default.css" rel="stylesheet" />
		<style type="text/css" rel="stylesheet">
			body {
				margin: 0;
				font:12px/1.5 "sans serif",tahoma,verdana,helvetica;
				background-color:#F0F0EE;
				color:#333;
				overflow:hidden;
			}
			label {
				cursor:pointer;
				width:60px;
				margin-right:5px;
			}
			.main {
				margin: 0 10px;
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
				margin-bottom:10px;
				display:list-item;
				line-height:1.5;
			}
			.table li label {
				font-weight:bold;
			}
			.table li input {
				vertical-align:middle;
			}
			.table li input.text {
				width:50px;
			}
			.margin-right-10 {
				margin-right:10px;
			}
			.color-picker {
				border: 1px solid #A0A0A0;
				background-color: #FFFFFF;
				font-size: 12px;
				width: 60px;
				height: 20px;
				line-height: 20px;
				padding-left: 5px;
				overflow: hidden;
				cursor: pointer;
			}
		</style>
		<script type="text/javascript">
			var KE = parent.KindEditor;
			var id = KE.util.getParam(location.href, 'id');
			var mode = KE.util.getParam(location.href, 'mode');
			KE.event.ready(function() {
				var widthBox = KE.$('width', document);
				var heightBox = KE.$('height', document);
				var widthTypeBox = KE.$('widthType', document);
				var heightTypeBox = KE.$('heightType', document);
				var textAlignBox = KE.$('textAlign', document);
				var verticalAlignBox = KE.$('verticalAlign', document);
				var borderBox = KE.$('border', document);
				var borderColorBox = KE.$('borderColor', document);
				var backgroundColorBox = KE.$('backgroundColor', document);
				var lang = KE.lang.plugins.advtable;
				widthTypeBox.options[0] = new Option(lang.percent, '%');
				widthTypeBox.options[1] = new Option(lang.px, 'px');
				heightTypeBox.options[0] = new Option(lang.percent, '%');
				heightTypeBox.options[1] = new Option(lang.px, 'px');
				textAlignBox.options[0] = new Option(lang.alignDefault, '');
				textAlignBox.options[1] = new Option(lang.alignLeft, 'left');
				textAlignBox.options[2] = new Option(lang.alignCenter, 'center');
				textAlignBox.options[3] = new Option(lang.alignRight, 'right');
				verticalAlignBox.options[0] = new Option(lang.alignDefault, '');
				verticalAlignBox.options[1] = new Option(lang.alignTop, 'top');
				verticalAlignBox.options[2] = new Option(lang.alignMiddle, 'middle');
				verticalAlignBox.options[3] = new Option(lang.alignBottom, 'bottom');
				verticalAlignBox.options[4] = new Option(lang.alignBaseline, 'baseline');
				var width = '';
				var height = '';
				var widthType = 'px';
				var heightType = 'px';
				var cell = KE.plugin.advtable.getSelectedCell(id);
				var cellWidth = cell.style.width || cell.width || '';
				var cellHeight = cell.style.height || cell.height || '';
				var match;
				if ((match = /^(\d+)((?:px|%)*)$/.exec(cellWidth))) {
					width = match[1];
					widthType = match[2];
				}
				if ((match = /^(\d+)((?:px|%)*)$/.exec(cellHeight))) {
					height = match[1];
					heightType = match[2];
				}
				var textAlign = cell.style.textAlign || '';
				var verticalAlign = cell.style.verticalAlign || '';
				var border = cell.style.borderWidth || '';
				if (border) border = parseInt(border);
				var borderColor = cell.style.borderColor || '';
				var backgroundColor = cell.style.backgroundColor || '';
				var borderColor = KE.util.rgbToHex(borderColor).toUpperCase();
				var backgroundColor = KE.util.rgbToHex(backgroundColor).toUpperCase();
				widthBox.value = width;
				heightBox.value = height;
				widthTypeBox.value = widthType;
				heightTypeBox.value = heightType;
				textAlignBox.value = textAlign;
				verticalAlignBox.value = verticalAlign;
				borderBox.value = border;
				function setColor(el, color) {
					el.style.backgroundColor = color;
					el.style.color = (color == '#000000') ? '#FFFFFF' : '#000000';
					el.innerHTML = color;
				}
				setColor(borderColorBox, borderColor);
				setColor(backgroundColorBox, backgroundColor);
				var picker;
				var currentElement;
				function removePicker() {
					if (picker) {
						picker.remove();
						picker = null;
						currentElement = null;
					}
				}
				function onclickFunc(el) {
					if (picker && el === currentElement) {
						removePicker();
					} else {
						removePicker();
						var dialog = KE.g[id].dialogStack[0];
						dialog.beforeHide = removePicker;
						dialog.ondrag = removePicker;
						var scrollPos = KE.util.getScrollPos();
						var iframePos = KE.util.getElementPos(dialog.iframe);
						var pos = KE.util.getElementPos(el);
						picker = new KE.colorpicker({
							x : iframePos.x + pos.x - scrollPos.x,
							y : iframePos.y + pos.y - scrollPos.y + 22,
							z : dialog.zIndex + 1,
							onclick : function(color) {
								setColor(el, color);
								removePicker();
							},
							selectedColor : (el.innerHTML || '')
						});
						picker.create();
						currentElement = el;
					}
				}
				borderColorBox.onclick = function() {
					onclickFunc(borderColorBox);
				};
				backgroundColorBox.onclick = function() {
					onclickFunc(backgroundColorBox);
				};
				KE.util.pluginLang('advtable', document);
				KE.util.hideLoadingPage(id);
				widthBox.focus();
				widthBox.select();
			}, window, document);
		</script>
	</head>
	<body>
		<div class="main">
			<ul class="table">
				<li>
					<label for="width" class="ke-inline-block"><span id="lang.size"></span></label>
					<span id="lang.width"></span>&nbsp;<input type="text" id="width" name="width" value="" maxlength="4" class="ke-inline-block ke-text-input text" />
					<select id="widthType" name="widthType" align="absmiddle" class="ke-inline-block margin-right-10"></select>
					<span id="lang.height"></span>&nbsp;<input type="text" id="height" name="height" value="" maxlength="4" class="ke-inline-block ke-text-input text" />
					<select id="heightType" name="heightType" align="absmiddle" class="ke-inline-block margin-right-10"></select>
				</li>
				<li>
					<label for="align" class="ke-inline-block"><span id="lang.align"></span></label>
					<span id="lang.textAlign"></span>&nbsp;<select id="textAlign" name="textAlign" class="ke-inline-block margin-right-10"></select>
					<span id="lang.verticalAlign"></span>&nbsp;<select id="verticalAlign" name="verticalAlign" class="ke-inline-block"></select>
				</li>
				<li>
					<label for="border" class="ke-inline-block"><span id="lang.border"></span></label>
					<span id="lang.borderWidth"></span>&nbsp;<input type="text" id="border" name="border" value="" maxlength="4" class="ke-inline-block ke-text-input text margin-right-10" />
					<span id="lang.borderColor"></span>&nbsp;<span id="borderColor" class="ke-inline-block color-picker"></span>
				</li>
				<li>
					<label for="backgroundColor" class="ke-inline-block"><span id="lang.backgroundColor"></span></label>
					<span id="backgroundColor" class="ke-inline-block color-picker"></span>
				</li>
			</ul>
		</div>
	</body>
</html>