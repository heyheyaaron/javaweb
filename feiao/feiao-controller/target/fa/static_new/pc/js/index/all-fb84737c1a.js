;(function(window,undefined){var document=window.document,navigator=window.navigator,location=window.location;var jQuery=(function(){var jQuery=function(selector,context){return new jQuery.fn.init(selector,context,rootjQuery);},_jQuery=window.jQuery,_$=window.$,rootjQuery,quickExpr=/^(?:[^#<]*(<[\w\W]+>)[^>]*$|#([\w\-]*)$)/,rnotwhite=/\S/,trimLeft=/^\s+/,trimRight=/\s+$/,rsingleTag=/^<(\w+)\s*\/?>(?:<\/\1>)?$/,rvalidchars=/^[\],:{}\s]*$/,rvalidescape=/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,rvalidtokens=/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,rvalidbraces=/(?:^|:|,)(?:\s*\[)+/g,rwebkit=/(webkit)[ \/]([\w.]+)/,ropera=/(opera)(?:.*version)?[ \/]([\w.]+)/,rmsie=/(msie) ([\w.]+)/,rmozilla=/(mozilla)(?:.*? rv:([\w.]+))?/,rdashAlpha=/-([a-z]|[0-9])/ig,rmsPrefix=/^-ms-/,fcamelCase=function(all,letter){return(letter+"").toUpperCase();},userAgent=navigator.userAgent,browserMatch,readyList,DOMContentLoaded,toString=Object.prototype.toString,hasOwn=Object.prototype.hasOwnProperty,push=Array.prototype.push,slice=Array.prototype.slice,trim=String.prototype.trim,indexOf=Array.prototype.indexOf,class2type={};jQuery.fn=jQuery.prototype={constructor:jQuery,init:function(selector,context,rootjQuery){var match,elem,ret,doc;if(!selector){return this;}
if(selector.nodeType){this.context=this[0]=selector;this.length=1;return this;}
if(selector==="body"&&!context&&document.body){this.context=document;this[0]=document.body;this.selector=selector;this.length=1;return this;}
if(typeof selector==="string"){if(selector.charAt(0)==="<"&&selector.charAt(selector.length-1)===">"&&selector.length>=3){match=[null,selector,null];}else{match=quickExpr.exec(selector);}
if(match&&(match[1]||!context)){if(match[1]){context=context instanceof jQuery?context[0]:context;doc=(context?context.ownerDocument||context:document);ret=rsingleTag.exec(selector);if(ret){if(jQuery.isPlainObject(context)){selector=[document.createElement(ret[1])];jQuery.fn.attr.call(selector,context,true);}else{selector=[doc.createElement(ret[1])];}}else{ret=jQuery.buildFragment([match[1]],[doc]);selector=(ret.cacheable?jQuery.clone(ret.fragment):ret.fragment).childNodes;}
return jQuery.merge(this,selector);}else{elem=document.getElementById(match[2]);if(elem&&elem.parentNode){if(elem.id!==match[2]){return rootjQuery.find(selector);}
this.length=1;this[0]=elem;}
this.context=document;this.selector=selector;return this;}}else if(!context||context.jquery){return(context||rootjQuery).find(selector);}else{return this.constructor(context).find(selector);}}else if(jQuery.isFunction(selector)){return rootjQuery.ready(selector);}
if(selector.selector!==undefined){this.selector=selector.selector;this.context=selector.context;}
return jQuery.makeArray(selector,this);},selector:"",jquery:"1.7.1",length:0,size:function(){return this.length;},toArray:function(){return slice.call(this,0);},get:function(num){return num==null?this.toArray():(num<0?this[this.length+num]:this[num]);},pushStack:function(elems,name,selector){var ret=this.constructor();if(jQuery.isArray(elems)){push.apply(ret,elems);}else{jQuery.merge(ret,elems);}
ret.prevObject=this;ret.context=this.context;if(name==="find"){ret.selector=this.selector+(this.selector?" ":"")+selector;}else if(name){ret.selector=this.selector+"."+name+"("+selector+")";}
return ret;},each:function(callback,args){return jQuery.each(this,callback,args);},ready:function(fn){jQuery.bindReady();readyList.add(fn);return this;},eq:function(i){i=+i;return i===-1?this.slice(i):this.slice(i,i+1);},first:function(){return this.eq(0);},last:function(){return this.eq(-1);},slice:function(){return this.pushStack(slice.apply(this,arguments),"slice",slice.call(arguments).join(","));},map:function(callback){return this.pushStack(jQuery.map(this,function(elem,i){return callback.call(elem,i,elem);}));},end:function(){return this.prevObject||this.constructor(null);},push:push,sort:[].sort,splice:[].splice};jQuery.fn.init.prototype=jQuery.fn;jQuery.extend=jQuery.fn.extend=function(){var options,name,src,copy,copyIsArray,clone,target=arguments[0]||{},i=1,length=arguments.length,deep=false;if(typeof target==="boolean"){deep=target;target=arguments[1]||{};i=2;}
if(typeof target!=="object"&&!jQuery.isFunction(target)){target={};}
if(length===i){target=this;--i;}
for(;i<length;i++){if((options=arguments[i])!=null){for(name in options){src=target[name];copy=options[name];if(target===copy){continue;}
if(deep&&copy&&(jQuery.isPlainObject(copy)||(copyIsArray=jQuery.isArray(copy)))){if(copyIsArray){copyIsArray=false;clone=src&&jQuery.isArray(src)?src:[];}else{clone=src&&jQuery.isPlainObject(src)?src:{};}
target[name]=jQuery.extend(deep,clone,copy);}else if(copy!==undefined){target[name]=copy;}}}}
return target;};jQuery.extend({noConflict:function(deep){if(window.$===jQuery){window.$=_$;}
if(deep&&window.jQuery===jQuery){window.jQuery=_jQuery;}
return jQuery;},isReady:false,readyWait:1,holdReady:function(hold){if(hold){jQuery.readyWait++;}else{jQuery.ready(true);}},ready:function(wait){if((wait===true&&!--jQuery.readyWait)||(wait!==true&&!jQuery.isReady)){if(!document.body){return setTimeout(jQuery.ready,1);}
jQuery.isReady=true;if(wait!==true&&--jQuery.readyWait>0){return;}
readyList.fireWith(document,[jQuery]);if(jQuery.fn.trigger){jQuery(document).trigger("ready").off("ready");}}},bindReady:function(){if(readyList){return;}
readyList=jQuery.Callbacks("once memory");if(document.readyState==="complete"){return setTimeout(jQuery.ready,1);}
if(document.addEventListener){document.addEventListener("DOMContentLoaded",DOMContentLoaded,false);window.addEventListener("load",jQuery.ready,false);}else if(document.attachEvent){document.attachEvent("onreadystatechange",DOMContentLoaded);window.attachEvent("onload",jQuery.ready);var toplevel=false;try{toplevel=window.frameElement==null;}catch(e){}
if(document.documentElement.doScroll&&toplevel){doScrollCheck();}}},isFunction:function(obj){return jQuery.type(obj)==="function";},isArray:Array.isArray||function(obj){return jQuery.type(obj)==="array";},isWindow:function(obj){return obj&&typeof obj==="object"&&"setInterval"in obj;},isNumeric:function(obj){return!isNaN(parseFloat(obj))&&isFinite(obj);},type:function(obj){return obj==null?String(obj):class2type[toString.call(obj)]||"object";},isPlainObject:function(obj){if(!obj||jQuery.type(obj)!=="object"||obj.nodeType||jQuery.isWindow(obj)){return false;}
try{if(obj.constructor&&!hasOwn.call(obj,"constructor")&&!hasOwn.call(obj.constructor.prototype,"isPrototypeOf")){return false;}}catch(e){return false;}
var key;for(key in obj){}
return key===undefined||hasOwn.call(obj,key);},isEmptyObject:function(obj){for(var name in obj){return false;}
return true;},error:function(msg){throw new Error(msg);},parseJSON:function(data){if(typeof data!=="string"||!data){return null;}
data=jQuery.trim(data);if(window.JSON&&window.JSON.parse){return window.JSON.parse(data);}
if(rvalidchars.test(data.replace(rvalidescape,"@").replace(rvalidtokens,"]").replace(rvalidbraces,""))){return(new Function("return "+data))();}
jQuery.error("Invalid JSON: "+data);},parseXML:function(data){var xml,tmp;try{if(window.DOMParser){tmp=new DOMParser();xml=tmp.parseFromString(data,"text/xml");}else{xml=new ActiveXObject("Microsoft.XMLDOM");xml.async="false";xml.loadXML(data);}}catch(e){xml=undefined;}
if(!xml||!xml.documentElement||xml.getElementsByTagName("parsererror").length){jQuery.error("Invalid XML: "+data);}
return xml;},noop:function(){},globalEval:function(data){if(data&&rnotwhite.test(data)){(window.execScript||function(data){window["eval"].call(window,data);})(data);}},camelCase:function(string){return string.replace(rmsPrefix,"ms-").replace(rdashAlpha,fcamelCase);},nodeName:function(elem,name){return elem.nodeName&&elem.nodeName.toUpperCase()===name.toUpperCase();},each:function(object,callback,args){var name,i=0,length=object.length,isObj=length===undefined||jQuery.isFunction(object);if(args){if(isObj){for(name in object){if(callback.apply(object[name],args)===false){break;}}}else{for(;i<length;){if(callback.apply(object[i++],args)===false){break;}}}}else{if(isObj){for(name in object){if(callback.call(object[name],name,object[name])===false){break;}}}else{for(;i<length;){if(callback.call(object[i],i,object[i++])===false){break;}}}}
return object;},trim:trim?function(text){return text==null?"":trim.call(text);}:function(text){return text==null?"":text.toString().replace(trimLeft,"").replace(trimRight,"");},makeArray:function(array,results){var ret=results||[];if(array!=null){var type=jQuery.type(array);if(array.length==null||type==="string"||type==="function"||type==="regexp"||jQuery.isWindow(array)){push.call(ret,array);}else{jQuery.merge(ret,array);}}
return ret;},inArray:function(elem,array,i){var len;if(array){if(indexOf){return indexOf.call(array,elem,i);}
len=array.length;i=i?i<0?Math.max(0,len+i):i:0;for(;i<len;i++){if(i in array&&array[i]===elem){return i;}}}
return-1;},merge:function(first,second){var i=first.length,j=0;if(typeof second.length==="number"){for(var l=second.length;j<l;j++){first[i++]=second[j];}}else{while(second[j]!==undefined){first[i++]=second[j++];}}
first.length=i;return first;},grep:function(elems,callback,inv){var ret=[],retVal;inv=!!inv;for(var i=0,length=elems.length;i<length;i++){retVal=!!callback(elems[i],i);if(inv!==retVal){ret.push(elems[i]);}}
return ret;},map:function(elems,callback,arg){var value,key,ret=[],i=0,length=elems.length,isArray=elems instanceof jQuery||length!==undefined&&typeof length==="number"&&((length>0&&elems[0]&&elems[length-1])||length===0||jQuery.isArray(elems));if(isArray){for(;i<length;i++){value=callback(elems[i],i,arg);if(value!=null){ret[ret.length]=value;}}}else{for(key in elems){value=callback(elems[key],key,arg);if(value!=null){ret[ret.length]=value;}}}
return ret.concat.apply([],ret);},guid:1,proxy:function(fn,context){if(typeof context==="string"){var tmp=fn[context];context=fn;fn=tmp;}
if(!jQuery.isFunction(fn)){return undefined;}
var args=slice.call(arguments,2),proxy=function(){return fn.apply(context,args.concat(slice.call(arguments)));};proxy.guid=fn.guid=fn.guid||proxy.guid||jQuery.guid++;return proxy;},access:function(elems,key,value,exec,fn,pass){var length=elems.length;if(typeof key==="object"){for(var k in key){jQuery.access(elems,k,key[k],exec,fn,value);}
return elems;}
if(value!==undefined){exec=!pass&&exec&&jQuery.isFunction(value);for(var i=0;i<length;i++){fn(elems[i],key,exec?value.call(elems[i],i,fn(elems[i],key)):value,pass);}
return elems;}
return length?fn(elems[0],key):undefined;},now:function(){return(new Date()).getTime();},uaMatch:function(ua){ua=ua.toLowerCase();var match=rwebkit.exec(ua)||ropera.exec(ua)||rmsie.exec(ua)||ua.indexOf("compatible")<0&&rmozilla.exec(ua)||[];return{browser:match[1]||"",version:match[2]||"0"};},sub:function(){function jQuerySub(selector,context){return new jQuerySub.fn.init(selector,context);}
jQuery.extend(true,jQuerySub,this);jQuerySub.superclass=this;jQuerySub.fn=jQuerySub.prototype=this();jQuerySub.fn.constructor=jQuerySub;jQuerySub.sub=this.sub;jQuerySub.fn.init=function init(selector,context){if(context&&context instanceof jQuery&&!(context instanceof jQuerySub)){context=jQuerySub(context);}
return jQuery.fn.init.call(this,selector,context,rootjQuerySub);};jQuerySub.fn.init.prototype=jQuerySub.fn;var rootjQuerySub=jQuerySub(document);return jQuerySub;},browser:{}});jQuery.each("Boolean Number String Function Array Date RegExp Object".split(" "),function(i,name){class2type["[object "+name+"]"]=name.toLowerCase();});browserMatch=jQuery.uaMatch(userAgent);if(browserMatch.browser){jQuery.browser[browserMatch.browser]=true;jQuery.browser.version=browserMatch.version;}
if(jQuery.browser.webkit){jQuery.browser.safari=true;}
if(rnotwhite.test("\xA0")){trimLeft=/^[\s\xA0]+/;trimRight=/[\s\xA0]+$/;}
rootjQuery=jQuery(document);if(document.addEventListener){DOMContentLoaded=function(){document.removeEventListener("DOMContentLoaded",DOMContentLoaded,false);jQuery.ready();};}else if(document.attachEvent){DOMContentLoaded=function(){if(document.readyState==="complete"){document.detachEvent("onreadystatechange",DOMContentLoaded);jQuery.ready();}};}
function doScrollCheck(){if(jQuery.isReady){return;}
try{document.documentElement.doScroll("left");}catch(e){setTimeout(doScrollCheck,1);return;}
jQuery.ready();}
return jQuery;})();var flagsCache={};function createFlags(flags){var object=flagsCache[flags]={},i,length;flags=flags.split(/\s+/);for(i=0,length=flags.length;i<length;i++){object[flags[i]]=true;}
return object;}
jQuery.Callbacks=function(flags){flags=flags?(flagsCache[flags]||createFlags(flags)):{};var
list=[],stack=[],memory,firing,firingStart,firingLength,firingIndex,add=function(args){var i,length,elem,type,actual;for(i=0,length=args.length;i<length;i++){elem=args[i];type=jQuery.type(elem);if(type==="array"){add(elem);}else if(type==="function"){if(!flags.unique||!self.has(elem)){list.push(elem);}}}},fire=function(context,args){args=args||[];memory=!flags.memory||[context,args];firing=true;firingIndex=firingStart||0;firingStart=0;firingLength=list.length;for(;list&&firingIndex<firingLength;firingIndex++){if(list[firingIndex].apply(context,args)===false&&flags.stopOnFalse){memory=true;break;}}
firing=false;if(list){if(!flags.once){if(stack&&stack.length){memory=stack.shift();self.fireWith(memory[0],memory[1]);}}else if(memory===true){self.disable();}else{list=[];}}},self={add:function(){if(list){var length=list.length;add(arguments);if(firing){firingLength=list.length;}else if(memory&&memory!==true){firingStart=length;fire(memory[0],memory[1]);}}
return this;},remove:function(){if(list){var args=arguments,argIndex=0,argLength=args.length;for(;argIndex<argLength;argIndex++){for(var i=0;i<list.length;i++){if(args[argIndex]===list[i]){if(firing){if(i<=firingLength){firingLength--;if(i<=firingIndex){firingIndex--;}}}
list.splice(i--,1);if(flags.unique){break;}}}}}
return this;},has:function(fn){if(list){var i=0,length=list.length;for(;i<length;i++){if(fn===list[i]){return true;}}}
return false;},empty:function(){list=[];return this;},disable:function(){list=stack=memory=undefined;return this;},disabled:function(){return!list;},lock:function(){stack=undefined;if(!memory||memory===true){self.disable();}
return this;},locked:function(){return!stack;},fireWith:function(context,args){if(stack){if(firing){if(!flags.once){stack.push([context,args]);}}else if(!(flags.once&&memory)){fire(context,args);}}
return this;},fire:function(){self.fireWith(this,arguments);return this;},fired:function(){return!!memory;}};return self;};var
sliceDeferred=[].slice;jQuery.extend({Deferred:function(func){var doneList=jQuery.Callbacks("once memory"),failList=jQuery.Callbacks("once memory"),progressList=jQuery.Callbacks("memory"),state="pending",lists={resolve:doneList,reject:failList,notify:progressList},promise={done:doneList.add,fail:failList.add,progress:progressList.add,state:function(){return state;},isResolved:doneList.fired,isRejected:failList.fired,then:function(doneCallbacks,failCallbacks,progressCallbacks){deferred.done(doneCallbacks).fail(failCallbacks).progress(progressCallbacks);return this;},always:function(){deferred.done.apply(deferred,arguments).fail.apply(deferred,arguments);return this;},pipe:function(fnDone,fnFail,fnProgress){return jQuery.Deferred(function(newDefer){jQuery.each({done:[fnDone,"resolve"],fail:[fnFail,"reject"],progress:[fnProgress,"notify"]},function(handler,data){var fn=data[0],action=data[1],returned;if(jQuery.isFunction(fn)){deferred[handler](function(){returned=fn.apply(this,arguments);if(returned&&jQuery.isFunction(returned.promise)){returned.promise().then(newDefer.resolve,newDefer.reject,newDefer.notify);}else{newDefer[action+"With"](this===deferred?newDefer:this,[returned]);}});}else{deferred[handler](newDefer[action]);}});}).promise();},promise:function(obj){if(obj==null){obj=promise;}else{for(var key in promise){obj[key]=promise[key];}}
return obj;}},deferred=promise.promise({}),key;for(key in lists){deferred[key]=lists[key].fire;deferred[key+"With"]=lists[key].fireWith;}
deferred.done(function(){state="resolved";},failList.disable,progressList.lock).fail(function(){state="rejected";},doneList.disable,progressList.lock);if(func){func.call(deferred,deferred);}
return deferred;},when:function(firstParam){var args=sliceDeferred.call(arguments,0),i=0,length=args.length,pValues=new Array(length),count=length,pCount=length,deferred=length<=1&&firstParam&&jQuery.isFunction(firstParam.promise)?firstParam:jQuery.Deferred(),promise=deferred.promise();function resolveFunc(i){return function(value){args[i]=arguments.length>1?sliceDeferred.call(arguments,0):value;if(!(--count)){deferred.resolveWith(deferred,args);}};}
function progressFunc(i){return function(value){pValues[i]=arguments.length>1?sliceDeferred.call(arguments,0):value;deferred.notifyWith(promise,pValues);};}
if(length>1){for(;i<length;i++){if(args[i]&&args[i].promise&&jQuery.isFunction(args[i].promise)){args[i].promise().then(resolveFunc(i),deferred.reject,progressFunc(i));}else{--count;}}
if(!count){deferred.resolveWith(deferred,args);}}else if(deferred!==firstParam){deferred.resolveWith(deferred,length?[firstParam]:[]);}
return promise;}});jQuery.support=(function(){var support,all,a,select,opt,input,marginDiv,fragment,tds,events,eventName,i,isSupported,div=document.createElement("div"),documentElement=document.documentElement;div.setAttribute("className","t");div.innerHTML="   <link/><table></table><a href='/a' style='top:1px;float:left;opacity:.55;'>a</a><input type='checkbox'/>";all=div.getElementsByTagName("*");a=div.getElementsByTagName("a")[0];if(!all||!all.length||!a){return{};}
select=document.createElement("select");opt=select.appendChild(document.createElement("option"));input=div.getElementsByTagName("input")[0];support={leadingWhitespace:(div.firstChild.nodeType===3),tbody:!div.getElementsByTagName("tbody").length,htmlSerialize:!!div.getElementsByTagName("link").length,style:/top/.test(a.getAttribute("style")),hrefNormalized:(a.getAttribute("href")==="/a"),opacity:/^0.55/.test(a.style.opacity),cssFloat:!!a.style.cssFloat,checkOn:(input.value==="on"),optSelected:opt.selected,getSetAttribute:div.className!=="t",enctype:!!document.createElement("form").enctype,html5Clone:document.createElement("nav").cloneNode(true).outerHTML!=="<:nav></:nav>",submitBubbles:true,changeBubbles:true,focusinBubbles:false,deleteExpando:true,noCloneEvent:true,inlineBlockNeedsLayout:false,shrinkWrapBlocks:false,reliableMarginRight:true};input.checked=true;support.noCloneChecked=input.cloneNode(true).checked;select.disabled=true;support.optDisabled=!opt.disabled;try{delete div.test;}catch(e){support.deleteExpando=false;}
if(!div.addEventListener&&div.attachEvent&&div.fireEvent){div.attachEvent("onclick",function(){support.noCloneEvent=false;});div.cloneNode(true).fireEvent("onclick");}
input=document.createElement("input");input.value="t";input.setAttribute("type","radio");support.radioValue=input.value==="t";input.setAttribute("checked","checked");div.appendChild(input);fragment=document.createDocumentFragment();fragment.appendChild(div.lastChild);support.checkClone=fragment.cloneNode(true).cloneNode(true).lastChild.checked;support.appendChecked=input.checked;fragment.removeChild(input);fragment.appendChild(div);div.innerHTML="";if(window.getComputedStyle){marginDiv=document.createElement("div");marginDiv.style.width="0";marginDiv.style.marginRight="0";div.style.width="2px";div.appendChild(marginDiv);support.reliableMarginRight=(parseInt((window.getComputedStyle(marginDiv,null)||{marginRight:0}).marginRight,10)||0)===0;}
if(div.attachEvent){for(i in{submit:1,change:1,focusin:1}){eventName="on"+i;isSupported=(eventName in div);if(!isSupported){div.setAttribute(eventName,"return;");isSupported=(typeof div[eventName]==="function");}
support[i+"Bubbles"]=isSupported;}}
fragment.removeChild(div);fragment=select=opt=marginDiv=div=input=null;jQuery(function(){var container,outer,inner,table,td,offsetSupport,conMarginTop,ptlm,vb,style,html,body=document.getElementsByTagName("body")[0];if(!body){return;}
conMarginTop=1;ptlm="position:absolute;top:0;left:0;width:1px;height:1px;margin:0;";vb="visibility:hidden;border:0;";style="style='"+ptlm+"border:5px solid #000;padding:0;'";html="<div "+style+"><div></div></div>"+"<table "+style+" cellpadding='0' cellspacing='0'>"+"<tr><td></td></tr></table>";container=document.createElement("div");container.style.cssText=vb+"width:0;height:0;position:static;top:0;margin-top:"+conMarginTop+"px";body.insertBefore(container,body.firstChild);div=document.createElement("div");container.appendChild(div);div.innerHTML="<table><tr><td style='padding:0;border:0;display:none'></td><td>t</td></tr></table>";tds=div.getElementsByTagName("td");isSupported=(tds[0].offsetHeight===0);tds[0].style.display="";tds[1].style.display="none";support.reliableHiddenOffsets=isSupported&&(tds[0].offsetHeight===0);div.innerHTML="";div.style.width=div.style.paddingLeft="1px";jQuery.boxModel=support.boxModel=div.offsetWidth===2;if(typeof div.style.zoom!=="undefined"){div.style.display="inline";div.style.zoom=1;support.inlineBlockNeedsLayout=(div.offsetWidth===2);div.style.display="";div.innerHTML="<div style='width:4px;'></div>";support.shrinkWrapBlocks=(div.offsetWidth!==2);}
div.style.cssText=ptlm+vb;div.innerHTML=html;outer=div.firstChild;inner=outer.firstChild;td=outer.nextSibling.firstChild.firstChild;offsetSupport={doesNotAddBorder:(inner.offsetTop!==5),doesAddBorderForTableAndCells:(td.offsetTop===5)};inner.style.position="fixed";inner.style.top="20px";offsetSupport.fixedPosition=(inner.offsetTop===20||inner.offsetTop===15);inner.style.position=inner.style.top="";outer.style.overflow="hidden";outer.style.position="relative";offsetSupport.subtractsBorderForOverflowNotVisible=(inner.offsetTop===-5);offsetSupport.doesNotIncludeMarginInBodyOffset=(body.offsetTop!==conMarginTop);body.removeChild(container);div=container=null;jQuery.extend(support,offsetSupport);});return support;})();var rbrace=/^(?:\{.*\}|\[.*\])$/,rmultiDash=/([A-Z])/g;jQuery.extend({cache:{},uuid:0,expando:"jQuery"+(jQuery.fn.jquery+Math.random()).replace(/\D/g,""),noData:{"embed":true,"object":"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000","applet":true},hasData:function(elem){elem=elem.nodeType?jQuery.cache[elem[jQuery.expando]]:elem[jQuery.expando];return!!elem&&!isEmptyDataObject(elem);},data:function(elem,name,data,pvt){if(!jQuery.acceptData(elem)){return;}
var privateCache,thisCache,ret,internalKey=jQuery.expando,getByName=typeof name==="string",isNode=elem.nodeType,cache=isNode?jQuery.cache:elem,id=isNode?elem[internalKey]:elem[internalKey]&&internalKey,isEvents=name==="events";if((!id||!cache[id]||(!isEvents&&!pvt&&!cache[id].data))&&getByName&&data===undefined){return;}
if(!id){if(isNode){elem[internalKey]=id=++jQuery.uuid;}else{id=internalKey;}}
if(!cache[id]){cache[id]={};if(!isNode){cache[id].toJSON=jQuery.noop;}}
if(typeof name==="object"||typeof name==="function"){if(pvt){cache[id]=jQuery.extend(cache[id],name);}else{cache[id].data=jQuery.extend(cache[id].data,name);}}
privateCache=thisCache=cache[id];if(!pvt){if(!thisCache.data){thisCache.data={};}
thisCache=thisCache.data;}
if(data!==undefined){thisCache[jQuery.camelCase(name)]=data;}
if(isEvents&&!thisCache[name]){return privateCache.events;}
if(getByName){ret=thisCache[name];if(ret==null){ret=thisCache[jQuery.camelCase(name)];}}else{ret=thisCache;}
return ret;},removeData:function(elem,name,pvt){if(!jQuery.acceptData(elem)){return;}
var thisCache,i,l,internalKey=jQuery.expando,isNode=elem.nodeType,cache=isNode?jQuery.cache:elem,id=isNode?elem[internalKey]:internalKey;if(!cache[id]){return;}
if(name){thisCache=pvt?cache[id]:cache[id].data;if(thisCache){if(!jQuery.isArray(name)){if(name in thisCache){name=[name];}else{name=jQuery.camelCase(name);if(name in thisCache){name=[name];}else{name=name.split(" ");}}}
for(i=0,l=name.length;i<l;i++){delete thisCache[name[i]];}
if(!(pvt?isEmptyDataObject:jQuery.isEmptyObject)(thisCache)){return;}}}
if(!pvt){delete cache[id].data;if(!isEmptyDataObject(cache[id])){return;}}
if(jQuery.support.deleteExpando||!cache.setInterval){delete cache[id];}else{cache[id]=null;}
if(isNode){if(jQuery.support.deleteExpando){delete elem[internalKey];}else if(elem.removeAttribute){elem.removeAttribute(internalKey);}else{elem[internalKey]=null;}}},_data:function(elem,name,data){return jQuery.data(elem,name,data,true);},acceptData:function(elem){if(elem.nodeName){var match=jQuery.noData[elem.nodeName.toLowerCase()];if(match){return!(match===true||elem.getAttribute("classid")!==match);}}
return true;}});jQuery.fn.extend({data:function(key,value){var parts,attr,name,data=null;if(typeof key==="undefined"){if(this.length){data=jQuery.data(this[0]);if(this[0].nodeType===1&&!jQuery._data(this[0],"parsedAttrs")){attr=this[0].attributes;for(var i=0,l=attr.length;i<l;i++){name=attr[i].name;if(name.indexOf("data-")===0){name=jQuery.camelCase(name.substring(5));dataAttr(this[0],name,data[name]);}}
jQuery._data(this[0],"parsedAttrs",true);}}
return data;}else if(typeof key==="object"){return this.each(function(){jQuery.data(this,key);});}
parts=key.split(".");parts[1]=parts[1]?"."+parts[1]:"";if(value===undefined){data=this.triggerHandler("getData"+parts[1]+"!",[parts[0]]);if(data===undefined&&this.length){data=jQuery.data(this[0],key);data=dataAttr(this[0],key,data);}
return data===undefined&&parts[1]?this.data(parts[0]):data;}else{return this.each(function(){var self=jQuery(this),args=[parts[0],value];self.triggerHandler("setData"+parts[1]+"!",args);jQuery.data(this,key,value);self.triggerHandler("changeData"+parts[1]+"!",args);});}},removeData:function(key){return this.each(function(){jQuery.removeData(this,key);});}});function dataAttr(elem,key,data){if(data===undefined&&elem.nodeType===1){var name="data-"+key.replace(rmultiDash,"-$1").toLowerCase();data=elem.getAttribute(name);if(typeof data==="string"){try{data=data==="true"?true:data==="false"?false:data==="null"?null:jQuery.isNumeric(data)?parseFloat(data):rbrace.test(data)?jQuery.parseJSON(data):data;}catch(e){}
jQuery.data(elem,key,data);}else{data=undefined;}}
return data;}
function isEmptyDataObject(obj){for(var name in obj){if(name==="data"&&jQuery.isEmptyObject(obj[name])){continue;}
if(name!=="toJSON"){return false;}}
return true;}
function handleQueueMarkDefer(elem,type,src){var deferDataKey=type+"defer",queueDataKey=type+"queue",markDataKey=type+"mark",defer=jQuery._data(elem,deferDataKey);if(defer&&(src==="queue"||!jQuery._data(elem,queueDataKey))&&(src==="mark"||!jQuery._data(elem,markDataKey))){setTimeout(function(){if(!jQuery._data(elem,queueDataKey)&&!jQuery._data(elem,markDataKey)){jQuery.removeData(elem,deferDataKey,true);defer.fire();}},0);}}
jQuery.extend({_mark:function(elem,type){if(elem){type=(type||"fx")+"mark";jQuery._data(elem,type,(jQuery._data(elem,type)||0)+1);}},_unmark:function(force,elem,type){if(force!==true){type=elem;elem=force;force=false;}
if(elem){type=type||"fx";var key=type+"mark",count=force?0:((jQuery._data(elem,key)||1)-1);if(count){jQuery._data(elem,key,count);}else{jQuery.removeData(elem,key,true);handleQueueMarkDefer(elem,type,"mark");}}},queue:function(elem,type,data){var q;if(elem){type=(type||"fx")+"queue";q=jQuery._data(elem,type);if(data){if(!q||jQuery.isArray(data)){q=jQuery._data(elem,type,jQuery.makeArray(data));}else{q.push(data);}}
return q||[];}},dequeue:function(elem,type){type=type||"fx";var queue=jQuery.queue(elem,type),fn=queue.shift(),hooks={};if(fn==="inprogress"){fn=queue.shift();}
if(fn){if(type==="fx"){queue.unshift("inprogress");}
jQuery._data(elem,type+".run",hooks);fn.call(elem,function(){jQuery.dequeue(elem,type);},hooks);}
if(!queue.length){jQuery.removeData(elem,type+"queue "+type+".run",true);handleQueueMarkDefer(elem,type,"queue");}}});jQuery.fn.extend({queue:function(type,data){if(typeof type!=="string"){data=type;type="fx";}
if(data===undefined){return jQuery.queue(this[0],type);}
return this.each(function(){var queue=jQuery.queue(this,type,data);if(type==="fx"&&queue[0]!=="inprogress"){jQuery.dequeue(this,type);}});},dequeue:function(type){return this.each(function(){jQuery.dequeue(this,type);});},delay:function(time,type){time=jQuery.fx?jQuery.fx.speeds[time]||time:time;type=type||"fx";return this.queue(type,function(next,hooks){var timeout=setTimeout(next,time);hooks.stop=function(){clearTimeout(timeout);};});},clearQueue:function(type){return this.queue(type||"fx",[]);},promise:function(type,object){if(typeof type!=="string"){object=type;type=undefined;}
type=type||"fx";var defer=jQuery.Deferred(),elements=this,i=elements.length,count=1,deferDataKey=type+"defer",queueDataKey=type+"queue",markDataKey=type+"mark",tmp;function resolve(){if(!(--count)){defer.resolveWith(elements,[elements]);}}
while(i--){if((tmp=jQuery.data(elements[i],deferDataKey,undefined,true)||(jQuery.data(elements[i],queueDataKey,undefined,true)||jQuery.data(elements[i],markDataKey,undefined,true))&&jQuery.data(elements[i],deferDataKey,jQuery.Callbacks("once memory"),true))){count++;tmp.add(resolve);}}
resolve();return defer.promise();}});var rclass=/[\n\t\r]/g,rspace=/\s+/,rreturn=/\r/g,rtype=/^(?:button|input)$/i,rfocusable=/^(?:button|input|object|select|textarea)$/i,rclickable=/^a(?:rea)?$/i,rboolean=/^(?:autofocus|autoplay|async|checked|controls|defer|disabled|hidden|loop|multiple|open|readonly|required|scoped|selected)$/i,getSetAttribute=jQuery.support.getSetAttribute,nodeHook,boolHook,fixSpecified;jQuery.fn.extend({attr:function(name,value){return jQuery.access(this,name,value,true,jQuery.attr);},removeAttr:function(name){return this.each(function(){jQuery.removeAttr(this,name);});},prop:function(name,value){return jQuery.access(this,name,value,true,jQuery.prop);},removeProp:function(name){name=jQuery.propFix[name]||name;return this.each(function(){try{this[name]=undefined;delete this[name];}catch(e){}});},addClass:function(value){var classNames,i,l,elem,setClass,c,cl;if(jQuery.isFunction(value)){return this.each(function(j){jQuery(this).addClass(value.call(this,j,this.className));});}
if(value&&typeof value==="string"){classNames=value.split(rspace);for(i=0,l=this.length;i<l;i++){elem=this[i];if(elem.nodeType===1){if(!elem.className&&classNames.length===1){elem.className=value;}else{setClass=" "+elem.className+" ";for(c=0,cl=classNames.length;c<cl;c++){if(!~setClass.indexOf(" "+classNames[c]+" ")){setClass+=classNames[c]+" ";}}
elem.className=jQuery.trim(setClass);}}}}
return this;},removeClass:function(value){var classNames,i,l,elem,className,c,cl;if(jQuery.isFunction(value)){return this.each(function(j){jQuery(this).removeClass(value.call(this,j,this.className));});}
if((value&&typeof value==="string")||value===undefined){classNames=(value||"").split(rspace);for(i=0,l=this.length;i<l;i++){elem=this[i];if(elem.nodeType===1&&elem.className){if(value){className=(" "+elem.className+" ").replace(rclass," ");for(c=0,cl=classNames.length;c<cl;c++){className=className.replace(" "+classNames[c]+" "," ");}
elem.className=jQuery.trim(className);}else{elem.className="";}}}}
return this;},toggleClass:function(value,stateVal){var type=typeof value,isBool=typeof stateVal==="boolean";if(jQuery.isFunction(value)){return this.each(function(i){jQuery(this).toggleClass(value.call(this,i,this.className,stateVal),stateVal);});}
return this.each(function(){if(type==="string"){var className,i=0,self=jQuery(this),state=stateVal,classNames=value.split(rspace);while((className=classNames[i++])){state=isBool?state:!self.hasClass(className);self[state?"addClass":"removeClass"](className);}}else if(type==="undefined"||type==="boolean"){if(this.className){jQuery._data(this,"__className__",this.className);}
this.className=this.className||value===false?"":jQuery._data(this,"__className__")||"";}});},hasClass:function(selector){var className=" "+selector+" ",i=0,l=this.length;for(;i<l;i++){if(this[i].nodeType===1&&(" "+this[i].className+" ").replace(rclass," ").indexOf(className)>-1){return true;}}
return false;},val:function(value){var hooks,ret,isFunction,elem=this[0];if(!arguments.length){if(elem){hooks=jQuery.valHooks[elem.nodeName.toLowerCase()]||jQuery.valHooks[elem.type];if(hooks&&"get"in hooks&&(ret=hooks.get(elem,"value"))!==undefined){return ret;}
ret=elem.value;return typeof ret==="string"?ret.replace(rreturn,""):ret==null?"":ret;}
return;}
isFunction=jQuery.isFunction(value);return this.each(function(i){var self=jQuery(this),val;if(this.nodeType!==1){return;}
if(isFunction){val=value.call(this,i,self.val());}else{val=value;}
if(val==null){val="";}else if(typeof val==="number"){val+="";}else if(jQuery.isArray(val)){val=jQuery.map(val,function(value){return value==null?"":value+"";});}
hooks=jQuery.valHooks[this.nodeName.toLowerCase()]||jQuery.valHooks[this.type];if(!hooks||!("set"in hooks)||hooks.set(this,val,"value")===undefined){this.value=val;}});}});jQuery.extend({valHooks:{option:{get:function(elem){var val=elem.attributes.value;return!val||val.specified?elem.value:elem.text;}},select:{get:function(elem){var value,i,max,option,index=elem.selectedIndex,values=[],options=elem.options,one=elem.type==="select-one";if(index<0){return null;}
i=one?index:0;max=one?index+1:options.length;for(;i<max;i++){option=options[i];if(option.selected&&(jQuery.support.optDisabled?!option.disabled:option.getAttribute("disabled")===null)&&(!option.parentNode.disabled||!jQuery.nodeName(option.parentNode,"optgroup"))){value=jQuery(option).val();if(one){return value;}
values.push(value);}}
if(one&&!values.length&&options.length){return jQuery(options[index]).val();}
return values;},set:function(elem,value){var values=jQuery.makeArray(value);jQuery(elem).find("option").each(function(){this.selected=jQuery.inArray(jQuery(this).val(),values)>=0;});if(!values.length){elem.selectedIndex=-1;}
return values;}}},attrFn:{val:true,css:true,html:true,text:true,data:true,width:true,height:true,offset:true},attr:function(elem,name,value,pass){var ret,hooks,notxml,nType=elem.nodeType;if(!elem||nType===3||nType===8||nType===2){return;}
if(pass&&name in jQuery.attrFn){return jQuery(elem)[name](value);}
if(typeof elem.getAttribute==="undefined"){return jQuery.prop(elem,name,value);}
notxml=nType!==1||!jQuery.isXMLDoc(elem);if(notxml){name=name.toLowerCase();hooks=jQuery.attrHooks[name]||(rboolean.test(name)?boolHook:nodeHook);}
if(value!==undefined){if(value===null){jQuery.removeAttr(elem,name);return;}else if(hooks&&"set"in hooks&&notxml&&(ret=hooks.set(elem,value,name))!==undefined){return ret;}else{elem.setAttribute(name,""+value);return value;}}else if(hooks&&"get"in hooks&&notxml&&(ret=hooks.get(elem,name))!==null){return ret;}else{ret=elem.getAttribute(name);return ret===null?undefined:ret;}},removeAttr:function(elem,value){var propName,attrNames,name,l,i=0;if(value&&elem.nodeType===1){attrNames=value.toLowerCase().split(rspace);l=attrNames.length;for(;i<l;i++){name=attrNames[i];if(name){propName=jQuery.propFix[name]||name;jQuery.attr(elem,name,"");elem.removeAttribute(getSetAttribute?name:propName);if(rboolean.test(name)&&propName in elem){elem[propName]=false;}}}}},attrHooks:{type:{set:function(elem,value){if(rtype.test(elem.nodeName)&&elem.parentNode){jQuery.error("type property can't be changed");}else if(!jQuery.support.radioValue&&value==="radio"&&jQuery.nodeName(elem,"input")){var val=elem.value;elem.setAttribute("type",value);if(val){elem.value=val;}
return value;}}},value:{get:function(elem,name){if(nodeHook&&jQuery.nodeName(elem,"button")){return nodeHook.get(elem,name);}
return name in elem?elem.value:null;},set:function(elem,value,name){if(nodeHook&&jQuery.nodeName(elem,"button")){return nodeHook.set(elem,value,name);}
elem.value=value;}}},propFix:{tabindex:"tabIndex",readonly:"readOnly","for":"htmlFor","class":"className",maxlength:"maxLength",cellspacing:"cellSpacing",cellpadding:"cellPadding",rowspan:"rowSpan",colspan:"colSpan",usemap:"useMap",frameborder:"frameBorder",contenteditable:"contentEditable"},prop:function(elem,name,value){var ret,hooks,notxml,nType=elem.nodeType;if(!elem||nType===3||nType===8||nType===2){return;}
notxml=nType!==1||!jQuery.isXMLDoc(elem);if(notxml){name=jQuery.propFix[name]||name;hooks=jQuery.propHooks[name];}
if(value!==undefined){if(hooks&&"set"in hooks&&(ret=hooks.set(elem,value,name))!==undefined){return ret;}else{return(elem[name]=value);}}else{if(hooks&&"get"in hooks&&(ret=hooks.get(elem,name))!==null){return ret;}else{return elem[name];}}},propHooks:{tabIndex:{get:function(elem){var attributeNode=elem.getAttributeNode("tabindex");return attributeNode&&attributeNode.specified?parseInt(attributeNode.value,10):rfocusable.test(elem.nodeName)||rclickable.test(elem.nodeName)&&elem.href?0:undefined;}}}});jQuery.attrHooks.tabindex=jQuery.propHooks.tabIndex;boolHook={get:function(elem,name){var attrNode,property=jQuery.prop(elem,name);return property===true||typeof property!=="boolean"&&(attrNode=elem.getAttributeNode(name))&&attrNode.nodeValue!==false?name.toLowerCase():undefined;},set:function(elem,value,name){var propName;if(value===false){jQuery.removeAttr(elem,name);}else{propName=jQuery.propFix[name]||name;if(propName in elem){elem[propName]=true;}
elem.setAttribute(name,name.toLowerCase());}
return name;}};if(!getSetAttribute){fixSpecified={name:true,id:true};nodeHook=jQuery.valHooks.button={get:function(elem,name){var ret;ret=elem.getAttributeNode(name);return ret&&(fixSpecified[name]?ret.nodeValue!=="":ret.specified)?ret.nodeValue:undefined;},set:function(elem,value,name){var ret=elem.getAttributeNode(name);if(!ret){ret=document.createAttribute(name);elem.setAttributeNode(ret);}
return(ret.nodeValue=value+"");}};jQuery.attrHooks.tabindex.set=nodeHook.set;jQuery.each(["width","height"],function(i,name){jQuery.attrHooks[name]=jQuery.extend(jQuery.attrHooks[name],{set:function(elem,value){if(value===""){elem.setAttribute(name,"auto");return value;}}});});jQuery.attrHooks.contenteditable={get:nodeHook.get,set:function(elem,value,name){if(value===""){value="false";}
nodeHook.set(elem,value,name);}};}
if(!jQuery.support.hrefNormalized){jQuery.each(["href","src","width","height"],function(i,name){jQuery.attrHooks[name]=jQuery.extend(jQuery.attrHooks[name],{get:function(elem){var ret=elem.getAttribute(name,2);return ret===null?undefined:ret;}});});}
if(!jQuery.support.style){jQuery.attrHooks.style={get:function(elem){return elem.style.cssText.toLowerCase()||undefined;},set:function(elem,value){return(elem.style.cssText=""+value);}};}
if(!jQuery.support.optSelected){jQuery.propHooks.selected=jQuery.extend(jQuery.propHooks.selected,{get:function(elem){var parent=elem.parentNode;if(parent){parent.selectedIndex;if(parent.parentNode){parent.parentNode.selectedIndex;}}
return null;}});}
if(!jQuery.support.enctype){jQuery.propFix.enctype="encoding";}
if(!jQuery.support.checkOn){jQuery.each(["radio","checkbox"],function(){jQuery.valHooks[this]={get:function(elem){return elem.getAttribute("value")===null?"on":elem.value;}};});}
jQuery.each(["radio","checkbox"],function(){jQuery.valHooks[this]=jQuery.extend(jQuery.valHooks[this],{set:function(elem,value){if(jQuery.isArray(value)){return(elem.checked=jQuery.inArray(jQuery(elem).val(),value)>=0);}}});});var rformElems=/^(?:textarea|input|select)$/i,rtypenamespace=/^([^\.]*)?(?:\.(.+))?$/,rhoverHack=/\bhover(\.\S+)?\b/,rkeyEvent=/^key/,rmouseEvent=/^(?:mouse|contextmenu)|click/,rfocusMorph=/^(?:focusinfocus|focusoutblur)$/,rquickIs=/^(\w*)(?:#([\w\-]+))?(?:\.([\w\-]+))?$/,quickParse=function(selector){var quick=rquickIs.exec(selector);if(quick){quick[1]=(quick[1]||"").toLowerCase();quick[3]=quick[3]&&new RegExp("(?:^|\\s)"+quick[3]+"(?:\\s|$)");}
return quick;},quickIs=function(elem,m){var attrs=elem.attributes||{};return((!m[1]||elem.nodeName.toLowerCase()===m[1])&&(!m[2]||(attrs.id||{}).value===m[2])&&(!m[3]||m[3].test((attrs["class"]||{}).value)));},hoverHack=function(events){return jQuery.event.special.hover?events:events.replace(rhoverHack,"mouseenter$1 mouseleave$1");};jQuery.event={add:function(elem,types,handler,data,selector){var elemData,eventHandle,events,t,tns,type,namespaces,handleObj,handleObjIn,quick,handlers,special;if(elem.nodeType===3||elem.nodeType===8||!types||!handler||!(elemData=jQuery._data(elem))){return;}
if(handler.handler){handleObjIn=handler;handler=handleObjIn.handler;}
if(!handler.guid){handler.guid=jQuery.guid++;}
events=elemData.events;if(!events){elemData.events=events={};}
eventHandle=elemData.handle;if(!eventHandle){elemData.handle=eventHandle=function(e){return typeof jQuery!=="undefined"&&(!e||jQuery.event.triggered!==e.type)?jQuery.event.dispatch.apply(eventHandle.elem,arguments):undefined;};eventHandle.elem=elem;}
types=jQuery.trim(hoverHack(types)).split(" ");for(t=0;t<types.length;t++){tns=rtypenamespace.exec(types[t])||[];type=tns[1];namespaces=(tns[2]||"").split(".").sort();special=jQuery.event.special[type]||{};type=(selector?special.delegateType:special.bindType)||type;special=jQuery.event.special[type]||{};handleObj=jQuery.extend({type:type,origType:tns[1],data:data,handler:handler,guid:handler.guid,selector:selector,quick:quickParse(selector),namespace:namespaces.join(".")},handleObjIn);handlers=events[type];if(!handlers){handlers=events[type]=[];handlers.delegateCount=0;if(!special.setup||special.setup.call(elem,data,namespaces,eventHandle)===false){if(elem.addEventListener){elem.addEventListener(type,eventHandle,false);}else if(elem.attachEvent){elem.attachEvent("on"+type,eventHandle);}}}
if(special.add){special.add.call(elem,handleObj);if(!handleObj.handler.guid){handleObj.handler.guid=handler.guid;}}
if(selector){handlers.splice(handlers.delegateCount++,0,handleObj);}else{handlers.push(handleObj);}
jQuery.event.global[type]=true;}
elem=null;},global:{},remove:function(elem,types,handler,selector,mappedTypes){var elemData=jQuery.hasData(elem)&&jQuery._data(elem),t,tns,type,origType,namespaces,origCount,j,events,special,handle,eventType,handleObj;if(!elemData||!(events=elemData.events)){return;}
types=jQuery.trim(hoverHack(types||"")).split(" ");for(t=0;t<types.length;t++){tns=rtypenamespace.exec(types[t])||[];type=origType=tns[1];namespaces=tns[2];if(!type){for(type in events){jQuery.event.remove(elem,type+types[t],handler,selector,true);}
continue;}
special=jQuery.event.special[type]||{};type=(selector?special.delegateType:special.bindType)||type;eventType=events[type]||[];origCount=eventType.length;namespaces=namespaces?new RegExp("(^|\\.)"+namespaces.split(".").sort().join("\\.(?:.*\\.)?")+"(\\.|$)"):null;for(j=0;j<eventType.length;j++){handleObj=eventType[j];if((mappedTypes||origType===handleObj.origType)&&(!handler||handler.guid===handleObj.guid)&&(!namespaces||namespaces.test(handleObj.namespace))&&(!selector||selector===handleObj.selector||selector==="**"&&handleObj.selector)){eventType.splice(j--,1);if(handleObj.selector){eventType.delegateCount--;}
if(special.remove){special.remove.call(elem,handleObj);}}}
if(eventType.length===0&&origCount!==eventType.length){if(!special.teardown||special.teardown.call(elem,namespaces)===false){jQuery.removeEvent(elem,type,elemData.handle);}
delete events[type];}}
if(jQuery.isEmptyObject(events)){handle=elemData.handle;if(handle){handle.elem=null;}
jQuery.removeData(elem,["events","handle"],true);}},customEvent:{"getData":true,"setData":true,"changeData":true},trigger:function(event,data,elem,onlyHandlers){if(elem&&(elem.nodeType===3||elem.nodeType===8)){return;}
var type=event.type||event,namespaces=[],cache,exclusive,i,cur,old,ontype,special,handle,eventPath,bubbleType;if(rfocusMorph.test(type+jQuery.event.triggered)){return;}
if(type.indexOf("!")>=0){type=type.slice(0,-1);exclusive=true;}
if(type.indexOf(".")>=0){namespaces=type.split(".");type=namespaces.shift();namespaces.sort();}
if((!elem||jQuery.event.customEvent[type])&&!jQuery.event.global[type]){return;}
event=typeof event==="object"?event[jQuery.expando]?event:new jQuery.Event(type,event):new jQuery.Event(type);event.type=type;event.isTrigger=true;event.exclusive=exclusive;event.namespace=namespaces.join(".");event.namespace_re=event.namespace?new RegExp("(^|\\.)"+namespaces.join("\\.(?:.*\\.)?")+"(\\.|$)"):null;ontype=type.indexOf(":")<0?"on"+type:"";if(!elem){cache=jQuery.cache;for(i in cache){if(cache[i].events&&cache[i].events[type]){jQuery.event.trigger(event,data,cache[i].handle.elem,true);}}
return;}
event.result=undefined;if(!event.target){event.target=elem;}
data=data!=null?jQuery.makeArray(data):[];data.unshift(event);special=jQuery.event.special[type]||{};if(special.trigger&&special.trigger.apply(elem,data)===false){return;}
eventPath=[[elem,special.bindType||type]];if(!onlyHandlers&&!special.noBubble&&!jQuery.isWindow(elem)){bubbleType=special.delegateType||type;cur=rfocusMorph.test(bubbleType+type)?elem:elem.parentNode;old=null;for(;cur;cur=cur.parentNode){eventPath.push([cur,bubbleType]);old=cur;}
if(old&&old===elem.ownerDocument){eventPath.push([old.defaultView||old.parentWindow||window,bubbleType]);}}
for(i=0;i<eventPath.length&&!event.isPropagationStopped();i++){cur=eventPath[i][0];event.type=eventPath[i][1];handle=(jQuery._data(cur,"events")||{})[event.type]&&jQuery._data(cur,"handle");if(handle){handle.apply(cur,data);}
handle=ontype&&cur[ontype];if(handle&&jQuery.acceptData(cur)&&handle.apply(cur,data)===false){event.preventDefault();}}
event.type=type;if(!onlyHandlers&&!event.isDefaultPrevented()){if((!special._default||special._default.apply(elem.ownerDocument,data)===false)&&!(type==="click"&&jQuery.nodeName(elem,"a"))&&jQuery.acceptData(elem)){if(ontype&&elem[type]&&((type!=="focus"&&type!=="blur")||event.target.offsetWidth!==0)&&!jQuery.isWindow(elem)){old=elem[ontype];if(old){elem[ontype]=null;}
jQuery.event.triggered=type;elem[type]();jQuery.event.triggered=undefined;if(old){elem[ontype]=old;}}}}
return event.result;},dispatch:function(event){event=jQuery.event.fix(event||window.event);var handlers=((jQuery._data(this,"events")||{})[event.type]||[]),delegateCount=handlers.delegateCount,args=[].slice.call(arguments,0),run_all=!event.exclusive&&!event.namespace,handlerQueue=[],i,j,cur,jqcur,ret,selMatch,matched,matches,handleObj,sel,related;args[0]=event;event.delegateTarget=this;if(delegateCount&&!event.target.disabled&&!(event.button&&event.type==="click")){jqcur=jQuery(this);jqcur.context=this.ownerDocument||this;for(cur=event.target;cur!=this;cur=cur.parentNode||this){selMatch={};matches=[];jqcur[0]=cur;for(i=0;i<delegateCount;i++){handleObj=handlers[i];sel=handleObj.selector;if(selMatch[sel]===undefined){selMatch[sel]=(handleObj.quick?quickIs(cur,handleObj.quick):jqcur.is(sel));}
if(selMatch[sel]){matches.push(handleObj);}}
if(matches.length){handlerQueue.push({elem:cur,matches:matches});}}}
if(handlers.length>delegateCount){handlerQueue.push({elem:this,matches:handlers.slice(delegateCount)});}
for(i=0;i<handlerQueue.length&&!event.isPropagationStopped();i++){matched=handlerQueue[i];event.currentTarget=matched.elem;for(j=0;j<matched.matches.length&&!event.isImmediatePropagationStopped();j++){handleObj=matched.matches[j];if(run_all||(!event.namespace&&!handleObj.namespace)||event.namespace_re&&event.namespace_re.test(handleObj.namespace)){event.data=handleObj.data;event.handleObj=handleObj;ret=((jQuery.event.special[handleObj.origType]||{}).handle||handleObj.handler).apply(matched.elem,args);if(ret!==undefined){event.result=ret;if(ret===false){event.preventDefault();event.stopPropagation();}}}}}
return event.result;},props:"attrChange attrName relatedNode srcElement altKey bubbles cancelable ctrlKey currentTarget eventPhase metaKey relatedTarget shiftKey target timeStamp view which".split(" "),fixHooks:{},keyHooks:{props:"char charCode key keyCode".split(" "),filter:function(event,original){if(event.which==null){event.which=original.charCode!=null?original.charCode:original.keyCode;}
return event;}},mouseHooks:{props:"button buttons clientX clientY fromElement offsetX offsetY pageX pageY screenX screenY toElement".split(" "),filter:function(event,original){var eventDoc,doc,body,button=original.button,fromElement=original.fromElement;if(event.pageX==null&&original.clientX!=null){eventDoc=event.target.ownerDocument||document;doc=eventDoc.documentElement;body=eventDoc.body;event.pageX=original.clientX+(doc&&doc.scrollLeft||body&&body.scrollLeft||0)-(doc&&doc.clientLeft||body&&body.clientLeft||0);event.pageY=original.clientY+(doc&&doc.scrollTop||body&&body.scrollTop||0)-(doc&&doc.clientTop||body&&body.clientTop||0);}
if(!event.relatedTarget&&fromElement){event.relatedTarget=fromElement===event.target?original.toElement:fromElement;}
if(!event.which&&button!==undefined){event.which=(button&1?1:(button&2?3:(button&4?2:0)));}
return event;}},fix:function(event){if(event[jQuery.expando]){return event;}
var i,prop,originalEvent=event,fixHook=jQuery.event.fixHooks[event.type]||{},copy=fixHook.props?this.props.concat(fixHook.props):this.props;event=jQuery.Event(originalEvent);for(i=copy.length;i;){prop=copy[--i];event[prop]=originalEvent[prop];}
if(!event.target){event.target=originalEvent.srcElement||document;}
if(event.target.nodeType===3){event.target=event.target.parentNode;}
if(event.metaKey===undefined){event.metaKey=event.ctrlKey;}
return fixHook.filter?fixHook.filter(event,originalEvent):event;},special:{ready:{setup:jQuery.bindReady},load:{noBubble:true},focus:{delegateType:"focusin"},blur:{delegateType:"focusout"},beforeunload:{setup:function(data,namespaces,eventHandle){if(jQuery.isWindow(this)){this.onbeforeunload=eventHandle;}},teardown:function(namespaces,eventHandle){if(this.onbeforeunload===eventHandle){this.onbeforeunload=null;}}}},simulate:function(type,elem,event,bubble){var e=jQuery.extend(new jQuery.Event(),event,{type:type,isSimulated:true,originalEvent:{}});if(bubble){jQuery.event.trigger(e,null,elem);}else{jQuery.event.dispatch.call(elem,e);}
if(e.isDefaultPrevented()){event.preventDefault();}}};jQuery.event.handle=jQuery.event.dispatch;jQuery.removeEvent=document.removeEventListener?function(elem,type,handle){if(elem.removeEventListener){elem.removeEventListener(type,handle,false);}}:function(elem,type,handle){if(elem.detachEvent){elem.detachEvent("on"+type,handle);}};jQuery.Event=function(src,props){if(!(this instanceof jQuery.Event)){return new jQuery.Event(src,props);}
if(src&&src.type){this.originalEvent=src;this.type=src.type;this.isDefaultPrevented=(src.defaultPrevented||src.returnValue===false||src.getPreventDefault&&src.getPreventDefault())?returnTrue:returnFalse;}else{this.type=src;}
if(props){jQuery.extend(this,props);}
this.timeStamp=src&&src.timeStamp||jQuery.now();this[jQuery.expando]=true;};function returnFalse(){return false;}
function returnTrue(){return true;}
jQuery.Event.prototype={preventDefault:function(){this.isDefaultPrevented=returnTrue;var e=this.originalEvent;if(!e){return;}
if(e.preventDefault){e.preventDefault();}else{e.returnValue=false;}},stopPropagation:function(){this.isPropagationStopped=returnTrue;var e=this.originalEvent;if(!e){return;}
if(e.stopPropagation){e.stopPropagation();}
e.cancelBubble=true;},stopImmediatePropagation:function(){this.isImmediatePropagationStopped=returnTrue;this.stopPropagation();},isDefaultPrevented:returnFalse,isPropagationStopped:returnFalse,isImmediatePropagationStopped:returnFalse};jQuery.each({mouseenter:"mouseover",mouseleave:"mouseout"},function(orig,fix){jQuery.event.special[orig]={delegateType:fix,bindType:fix,handle:function(event){var target=this,related=event.relatedTarget,handleObj=event.handleObj,selector=handleObj.selector,ret;if(!related||(related!==target&&!jQuery.contains(target,related))){event.type=handleObj.origType;ret=handleObj.handler.apply(this,arguments);event.type=fix;}
return ret;}};});if(!jQuery.support.submitBubbles){jQuery.event.special.submit={setup:function(){if(jQuery.nodeName(this,"form")){return false;}
jQuery.event.add(this,"click._submit keypress._submit",function(e){var elem=e.target,form=jQuery.nodeName(elem,"input")||jQuery.nodeName(elem,"button")?elem.form:undefined;if(form&&!form._submit_attached){jQuery.event.add(form,"submit._submit",function(event){if(this.parentNode&&!event.isTrigger){jQuery.event.simulate("submit",this.parentNode,event,true);}});form._submit_attached=true;}});},teardown:function(){if(jQuery.nodeName(this,"form")){return false;}
jQuery.event.remove(this,"._submit");}};}
if(!jQuery.support.changeBubbles){jQuery.event.special.change={setup:function(){if(rformElems.test(this.nodeName)){if(this.type==="checkbox"||this.type==="radio"){jQuery.event.add(this,"propertychange._change",function(event){if(event.originalEvent.propertyName==="checked"){this._just_changed=true;}});jQuery.event.add(this,"click._change",function(event){if(this._just_changed&&!event.isTrigger){this._just_changed=false;jQuery.event.simulate("change",this,event,true);}});}
return false;}
jQuery.event.add(this,"beforeactivate._change",function(e){var elem=e.target;if(rformElems.test(elem.nodeName)&&!elem._change_attached){jQuery.event.add(elem,"change._change",function(event){if(this.parentNode&&!event.isSimulated&&!event.isTrigger){jQuery.event.simulate("change",this.parentNode,event,true);}});elem._change_attached=true;}});},handle:function(event){var elem=event.target;if(this!==elem||event.isSimulated||event.isTrigger||(elem.type!=="radio"&&elem.type!=="checkbox")){return event.handleObj.handler.apply(this,arguments);}},teardown:function(){jQuery.event.remove(this,"._change");return rformElems.test(this.nodeName);}};}
if(!jQuery.support.focusinBubbles){jQuery.each({focus:"focusin",blur:"focusout"},function(orig,fix){var attaches=0,handler=function(event){jQuery.event.simulate(fix,event.target,jQuery.event.fix(event),true);};jQuery.event.special[fix]={setup:function(){if(attaches++===0){document.addEventListener(orig,handler,true);}},teardown:function(){if(--attaches===0){document.removeEventListener(orig,handler,true);}}};});}
jQuery.fn.extend({on:function(types,selector,data,fn,one){var origFn,type;if(typeof types==="object"){if(typeof selector!=="string"){data=selector;selector=undefined;}
for(type in types){this.on(type,selector,data,types[type],one);}
return this;}
if(data==null&&fn==null){fn=selector;data=selector=undefined;}else if(fn==null){if(typeof selector==="string"){fn=data;data=undefined;}else{fn=data;data=selector;selector=undefined;}}
if(fn===false){fn=returnFalse;}else if(!fn){return this;}
if(one===1){origFn=fn;fn=function(event){jQuery().off(event);return origFn.apply(this,arguments);};fn.guid=origFn.guid||(origFn.guid=jQuery.guid++);}
return this.each(function(){jQuery.event.add(this,types,fn,data,selector);});},one:function(types,selector,data,fn){return this.on.call(this,types,selector,data,fn,1);},off:function(types,selector,fn){if(types&&types.preventDefault&&types.handleObj){var handleObj=types.handleObj;jQuery(types.delegateTarget).off(handleObj.namespace?handleObj.type+"."+handleObj.namespace:handleObj.type,handleObj.selector,handleObj.handler);return this;}
if(typeof types==="object"){for(var type in types){this.off(type,selector,types[type]);}
return this;}
if(selector===false||typeof selector==="function"){fn=selector;selector=undefined;}
if(fn===false){fn=returnFalse;}
return this.each(function(){jQuery.event.remove(this,types,fn,selector);});},bind:function(types,data,fn){return this.on(types,null,data,fn);},unbind:function(types,fn){return this.off(types,null,fn);},live:function(types,data,fn){jQuery(this.context).on(types,this.selector,data,fn);return this;},die:function(types,fn){jQuery(this.context).off(types,this.selector||"**",fn);return this;},delegate:function(selector,types,data,fn){return this.on(types,selector,data,fn);},undelegate:function(selector,types,fn){return arguments.length==1?this.off(selector,"**"):this.off(types,selector,fn);},trigger:function(type,data){return this.each(function(){jQuery.event.trigger(type,data,this);});},triggerHandler:function(type,data){if(this[0]){return jQuery.event.trigger(type,data,this[0],true);}},toggle:function(fn){var args=arguments,guid=fn.guid||jQuery.guid++,i=0,toggler=function(event){var lastToggle=(jQuery._data(this,"lastToggle"+fn.guid)||0)%i;jQuery._data(this,"lastToggle"+fn.guid,lastToggle+1);event.preventDefault();return args[lastToggle].apply(this,arguments)||false;};toggler.guid=guid;while(i<args.length){args[i++].guid=guid;}
return this.click(toggler);},hover:function(fnOver,fnOut){return this.mouseenter(fnOver).mouseleave(fnOut||fnOver);}});jQuery.each(("blur focus focusin focusout load resize scroll unload click dblclick "+"mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave "+"change select submit keydown keypress keyup error contextmenu").split(" "),function(i,name){jQuery.fn[name]=function(data,fn){if(fn==null){fn=data;data=null;}
return arguments.length>0?this.on(name,null,data,fn):this.trigger(name);};if(jQuery.attrFn){jQuery.attrFn[name]=true;}
if(rkeyEvent.test(name)){jQuery.event.fixHooks[name]=jQuery.event.keyHooks;}
if(rmouseEvent.test(name)){jQuery.event.fixHooks[name]=jQuery.event.mouseHooks;}});(function(){var chunker=/((?:\((?:\([^()]+\)|[^()]+)+\)|\[(?:\[[^\[\]]*\]|['"][^'"]*['"]|[^\[\]'"]+)+\]|\\.|[^ >+~,(\[\\]+)+|[>+~])(\s*,\s*)?((?:.|\r|\n)*)/g,expando="sizcache"+(Math.random()+'').replace('.',''),done=0,toString=Object.prototype.toString,hasDuplicate=false,baseHasDuplicate=true,rBackslash=/\\/g,rReturn=/\r\n/g,rNonWord=/\W/;[0,0].sort(function(){baseHasDuplicate=false;return 0;});var Sizzle=function(selector,context,results,seed){results=results||[];context=context||document;var origContext=context;if(context.nodeType!==1&&context.nodeType!==9){return[];}
if(!selector||typeof selector!=="string"){return results;}
var m,set,checkSet,extra,ret,cur,pop,i,prune=true,contextXML=Sizzle.isXML(context),parts=[],soFar=selector;do{chunker.exec("");m=chunker.exec(soFar);if(m){soFar=m[3];parts.push(m[1]);if(m[2]){extra=m[3];break;}}}while(m);if(parts.length>1&&origPOS.exec(selector)){if(parts.length===2&&Expr.relative[parts[0]]){set=posProcess(parts[0]+parts[1],context,seed);}else{set=Expr.relative[parts[0]]?[context]:Sizzle(parts.shift(),context);while(parts.length){selector=parts.shift();if(Expr.relative[selector]){selector+=parts.shift();}
set=posProcess(selector,set,seed);}}}else{if(!seed&&parts.length>1&&context.nodeType===9&&!contextXML&&Expr.match.ID.test(parts[0])&&!Expr.match.ID.test(parts[parts.length-1])){ret=Sizzle.find(parts.shift(),context,contextXML);context=ret.expr?Sizzle.filter(ret.expr,ret.set)[0]:ret.set[0];}
if(context){ret=seed?{expr:parts.pop(),set:makeArray(seed)}:Sizzle.find(parts.pop(),parts.length===1&&(parts[0]==="~"||parts[0]==="+")&&context.parentNode?context.parentNode:context,contextXML);set=ret.expr?Sizzle.filter(ret.expr,ret.set):ret.set;if(parts.length>0){checkSet=makeArray(set);}else{prune=false;}
while(parts.length){cur=parts.pop();pop=cur;if(!Expr.relative[cur]){cur="";}else{pop=parts.pop();}
if(pop==null){pop=context;}
Expr.relative[cur](checkSet,pop,contextXML);}}else{checkSet=parts=[];}}
if(!checkSet){checkSet=set;}
if(!checkSet){Sizzle.error(cur||selector);}
if(toString.call(checkSet)==="[object Array]"){if(!prune){results.push.apply(results,checkSet);}else if(context&&context.nodeType===1){for(i=0;checkSet[i]!=null;i++){if(checkSet[i]&&(checkSet[i]===true||checkSet[i].nodeType===1&&Sizzle.contains(context,checkSet[i]))){results.push(set[i]);}}}else{for(i=0;checkSet[i]!=null;i++){if(checkSet[i]&&checkSet[i].nodeType===1){results.push(set[i]);}}}}else{makeArray(checkSet,results);}
if(extra){Sizzle(extra,origContext,results,seed);Sizzle.uniqueSort(results);}
return results;};Sizzle.uniqueSort=function(results){if(sortOrder){hasDuplicate=baseHasDuplicate;results.sort(sortOrder);if(hasDuplicate){for(var i=1;i<results.length;i++){if(results[i]===results[i-1]){results.splice(i--,1);}}}}
return results;};Sizzle.matches=function(expr,set){return Sizzle(expr,null,null,set);};Sizzle.matchesSelector=function(node,expr){return Sizzle(expr,null,null,[node]).length>0;};Sizzle.find=function(expr,context,isXML){var set,i,len,match,type,left;if(!expr){return[];}
for(i=0,len=Expr.order.length;i<len;i++){type=Expr.order[i];if((match=Expr.leftMatch[type].exec(expr))){left=match[1];match.splice(1,1);if(left.substr(left.length-1)!=="\\"){match[1]=(match[1]||"").replace(rBackslash,"");set=Expr.find[type](match,context,isXML);if(set!=null){expr=expr.replace(Expr.match[type],"");break;}}}}
if(!set){set=typeof context.getElementsByTagName!=="undefined"?context.getElementsByTagName("*"):[];}
return{set:set,expr:expr};};Sizzle.filter=function(expr,set,inplace,not){var match,anyFound,type,found,item,filter,left,i,pass,old=expr,result=[],curLoop=set,isXMLFilter=set&&set[0]&&Sizzle.isXML(set[0]);while(expr&&set.length){for(type in Expr.filter){if((match=Expr.leftMatch[type].exec(expr))!=null&&match[2]){filter=Expr.filter[type];left=match[1];anyFound=false;match.splice(1,1);if(left.substr(left.length-1)==="\\"){continue;}
if(curLoop===result){result=[];}
if(Expr.preFilter[type]){match=Expr.preFilter[type](match,curLoop,inplace,result,not,isXMLFilter);if(!match){anyFound=found=true;}else if(match===true){continue;}}
if(match){for(i=0;(item=curLoop[i])!=null;i++){if(item){found=filter(item,match,i,curLoop);pass=not^found;if(inplace&&found!=null){if(pass){anyFound=true;}else{curLoop[i]=false;}}else if(pass){result.push(item);anyFound=true;}}}}
if(found!==undefined){if(!inplace){curLoop=result;}
expr=expr.replace(Expr.match[type],"");if(!anyFound){return[];}
break;}}}
if(expr===old){if(anyFound==null){Sizzle.error(expr);}else{break;}}
old=expr;}
return curLoop;};Sizzle.error=function(msg){throw new Error("Syntax error, unrecognized expression: "+msg);};var getText=Sizzle.getText=function(elem){var i,node,nodeType=elem.nodeType,ret="";if(nodeType){if(nodeType===1||nodeType===9){if(typeof elem.textContent==='string'){return elem.textContent;}else if(typeof elem.innerText==='string'){return elem.innerText.replace(rReturn,'');}else{for(elem=elem.firstChild;elem;elem=elem.nextSibling){ret+=getText(elem);}}}else if(nodeType===3||nodeType===4){return elem.nodeValue;}}else{for(i=0;(node=elem[i]);i++){if(node.nodeType!==8){ret+=getText(node);}}}
return ret;};var Expr=Sizzle.selectors={order:["ID","NAME","TAG"],match:{ID:/#((?:[\w\u00c0-\uFFFF\-]|\\.)+)/,CLASS:/\.((?:[\w\u00c0-\uFFFF\-]|\\.)+)/,NAME:/\[name=['"]*((?:[\w\u00c0-\uFFFF\-]|\\.)+)['"]*\]/,ATTR:/\[\s*((?:[\w\u00c0-\uFFFF\-]|\\.)+)\s*(?:(\S?=)\s*(?:(['"])(.*?)\3|(#?(?:[\w\u00c0-\uFFFF\-]|\\.)*)|)|)\s*\]/,TAG:/^((?:[\w\u00c0-\uFFFF\*\-]|\\.)+)/,CHILD:/:(only|nth|last|first)-child(?:\(\s*(even|odd|(?:[+\-]?\d+|(?:[+\-]?\d*)?n\s*(?:[+\-]\s*\d+)?))\s*\))?/,POS:/:(nth|eq|gt|lt|first|last|even|odd)(?:\((\d*)\))?(?=[^\-]|$)/,PSEUDO:/:((?:[\w\u00c0-\uFFFF\-]|\\.)+)(?:\((['"]?)((?:\([^\)]+\)|[^\(\)]*)+)\2\))?/},leftMatch:{},attrMap:{"class":"className","for":"htmlFor"},attrHandle:{href:function(elem){return elem.getAttribute("href");},type:function(elem){return elem.getAttribute("type");}},relative:{"+":function(checkSet,part){var isPartStr=typeof part==="string",isTag=isPartStr&&!rNonWord.test(part),isPartStrNotTag=isPartStr&&!isTag;if(isTag){part=part.toLowerCase();}
for(var i=0,l=checkSet.length,elem;i<l;i++){if((elem=checkSet[i])){while((elem=elem.previousSibling)&&elem.nodeType!==1){}
checkSet[i]=isPartStrNotTag||elem&&elem.nodeName.toLowerCase()===part?elem||false:elem===part;}}
if(isPartStrNotTag){Sizzle.filter(part,checkSet,true);}},">":function(checkSet,part){var elem,isPartStr=typeof part==="string",i=0,l=checkSet.length;if(isPartStr&&!rNonWord.test(part)){part=part.toLowerCase();for(;i<l;i++){elem=checkSet[i];if(elem){var parent=elem.parentNode;checkSet[i]=parent.nodeName.toLowerCase()===part?parent:false;}}}else{for(;i<l;i++){elem=checkSet[i];if(elem){checkSet[i]=isPartStr?elem.parentNode:elem.parentNode===part;}}
if(isPartStr){Sizzle.filter(part,checkSet,true);}}},"":function(checkSet,part,isXML){var nodeCheck,doneName=done++,checkFn=dirCheck;if(typeof part==="string"&&!rNonWord.test(part)){part=part.toLowerCase();nodeCheck=part;checkFn=dirNodeCheck;}
checkFn("parentNode",part,doneName,checkSet,nodeCheck,isXML);},"~":function(checkSet,part,isXML){var nodeCheck,doneName=done++,checkFn=dirCheck;if(typeof part==="string"&&!rNonWord.test(part)){part=part.toLowerCase();nodeCheck=part;checkFn=dirNodeCheck;}
checkFn("previousSibling",part,doneName,checkSet,nodeCheck,isXML);}},find:{ID:function(match,context,isXML){if(typeof context.getElementById!=="undefined"&&!isXML){var m=context.getElementById(match[1]);return m&&m.parentNode?[m]:[];}},NAME:function(match,context){if(typeof context.getElementsByName!=="undefined"){var ret=[],results=context.getElementsByName(match[1]);for(var i=0,l=results.length;i<l;i++){if(results[i].getAttribute("name")===match[1]){ret.push(results[i]);}}
return ret.length===0?null:ret;}},TAG:function(match,context){if(typeof context.getElementsByTagName!=="undefined"){return context.getElementsByTagName(match[1]);}}},preFilter:{CLASS:function(match,curLoop,inplace,result,not,isXML){match=" "+match[1].replace(rBackslash,"")+" ";if(isXML){return match;}
for(var i=0,elem;(elem=curLoop[i])!=null;i++){if(elem){if(not^(elem.className&&(" "+elem.className+" ").replace(/[\t\n\r]/g," ").indexOf(match)>=0)){if(!inplace){result.push(elem);}}else if(inplace){curLoop[i]=false;}}}
return false;},ID:function(match){return match[1].replace(rBackslash,"");},TAG:function(match,curLoop){return match[1].replace(rBackslash,"").toLowerCase();},CHILD:function(match){if(match[1]==="nth"){if(!match[2]){Sizzle.error(match[0]);}
match[2]=match[2].replace(/^\+|\s*/g,'');var test=/(-?)(\d*)(?:n([+\-]?\d*))?/.exec(match[2]==="even"&&"2n"||match[2]==="odd"&&"2n+1"||!/\D/.test(match[2])&&"0n+"+match[2]||match[2]);match[2]=(test[1]+(test[2]||1))-0;match[3]=test[3]-0;}
else if(match[2]){Sizzle.error(match[0]);}
match[0]=done++;return match;},ATTR:function(match,curLoop,inplace,result,not,isXML){var name=match[1]=match[1].replace(rBackslash,"");if(!isXML&&Expr.attrMap[name]){match[1]=Expr.attrMap[name];}
match[4]=(match[4]||match[5]||"").replace(rBackslash,"");if(match[2]==="~="){match[4]=" "+match[4]+" ";}
return match;},PSEUDO:function(match,curLoop,inplace,result,not){if(match[1]==="not"){if((chunker.exec(match[3])||"").length>1||/^\w/.test(match[3])){match[3]=Sizzle(match[3],null,null,curLoop);}else{var ret=Sizzle.filter(match[3],curLoop,inplace,true^not);if(!inplace){result.push.apply(result,ret);}
return false;}}else if(Expr.match.POS.test(match[0])||Expr.match.CHILD.test(match[0])){return true;}
return match;},POS:function(match){match.unshift(true);return match;}},filters:{enabled:function(elem){return elem.disabled===false&&elem.type!=="hidden";},disabled:function(elem){return elem.disabled===true;},checked:function(elem){return elem.checked===true;},selected:function(elem){if(elem.parentNode){elem.parentNode.selectedIndex;}
return elem.selected===true;},parent:function(elem){return!!elem.firstChild;},empty:function(elem){return!elem.firstChild;},has:function(elem,i,match){return!!Sizzle(match[3],elem).length;},header:function(elem){return(/h\d/i).test(elem.nodeName);},text:function(elem){var attr=elem.getAttribute("type"),type=elem.type;return elem.nodeName.toLowerCase()==="input"&&"text"===type&&(attr===type||attr===null);},radio:function(elem){return elem.nodeName.toLowerCase()==="input"&&"radio"===elem.type;},checkbox:function(elem){return elem.nodeName.toLowerCase()==="input"&&"checkbox"===elem.type;},file:function(elem){return elem.nodeName.toLowerCase()==="input"&&"file"===elem.type;},password:function(elem){return elem.nodeName.toLowerCase()==="input"&&"password"===elem.type;},submit:function(elem){var name=elem.nodeName.toLowerCase();return(name==="input"||name==="button")&&"submit"===elem.type;},image:function(elem){return elem.nodeName.toLowerCase()==="input"&&"image"===elem.type;},reset:function(elem){var name=elem.nodeName.toLowerCase();return(name==="input"||name==="button")&&"reset"===elem.type;},button:function(elem){var name=elem.nodeName.toLowerCase();return name==="input"&&"button"===elem.type||name==="button";},input:function(elem){return(/input|select|textarea|button/i).test(elem.nodeName);},focus:function(elem){return elem===elem.ownerDocument.activeElement;}},setFilters:{first:function(elem,i){return i===0;},last:function(elem,i,match,array){return i===array.length-1;},even:function(elem,i){return i%2===0;},odd:function(elem,i){return i%2===1;},lt:function(elem,i,match){return i<match[3]-0;},gt:function(elem,i,match){return i>match[3]-0;},nth:function(elem,i,match){return match[3]-0===i;},eq:function(elem,i,match){return match[3]-0===i;}},filter:{PSEUDO:function(elem,match,i,array){var name=match[1],filter=Expr.filters[name];if(filter){return filter(elem,i,match,array);}else if(name==="contains"){return(elem.textContent||elem.innerText||getText([elem])||"").indexOf(match[3])>=0;}else if(name==="not"){var not=match[3];for(var j=0,l=not.length;j<l;j++){if(not[j]===elem){return false;}}
return true;}else{Sizzle.error(name);}},CHILD:function(elem,match){var first,last,doneName,parent,cache,count,diff,type=match[1],node=elem;switch(type){case"only":case"first":while((node=node.previousSibling)){if(node.nodeType===1){return false;}}
if(type==="first"){return true;}
node=elem;case"last":while((node=node.nextSibling)){if(node.nodeType===1){return false;}}
return true;case"nth":first=match[2];last=match[3];if(first===1&&last===0){return true;}
doneName=match[0];parent=elem.parentNode;if(parent&&(parent[expando]!==doneName||!elem.nodeIndex)){count=0;for(node=parent.firstChild;node;node=node.nextSibling){if(node.nodeType===1){node.nodeIndex=++count;}}
parent[expando]=doneName;}
diff=elem.nodeIndex-last;if(first===0){return diff===0;}else{return(diff%first===0&&diff/first>=0);}}},ID:function(elem,match){return elem.nodeType===1&&elem.getAttribute("id")===match;},TAG:function(elem,match){return(match==="*"&&elem.nodeType===1)||!!elem.nodeName&&elem.nodeName.toLowerCase()===match;},CLASS:function(elem,match){return(" "+(elem.className||elem.getAttribute("class"))+" ").indexOf(match)>-1;},ATTR:function(elem,match){var name=match[1],result=Sizzle.attr?Sizzle.attr(elem,name):Expr.attrHandle[name]?Expr.attrHandle[name](elem):elem[name]!=null?elem[name]:elem.getAttribute(name),value=result+"",type=match[2],check=match[4];return result==null?type==="!=":!type&&Sizzle.attr?result!=null:type==="="?value===check:type==="*="?value.indexOf(check)>=0:type==="~="?(" "+value+" ").indexOf(check)>=0:!check?value&&result!==false:type==="!="?value!==check:type==="^="?value.indexOf(check)===0:type==="$="?value.substr(value.length-check.length)===check:type==="|="?value===check||value.substr(0,check.length+1)===check+"-":false;},POS:function(elem,match,i,array){var name=match[2],filter=Expr.setFilters[name];if(filter){return filter(elem,i,match,array);}}}};var origPOS=Expr.match.POS,fescape=function(all,num){return"\\"+(num-0+1);};for(var type in Expr.match){Expr.match[type]=new RegExp(Expr.match[type].source+(/(?![^\[]*\])(?![^\(]*\))/.source));Expr.leftMatch[type]=new RegExp(/(^(?:.|\r|\n)*?)/.source+Expr.match[type].source.replace(/\\(\d+)/g,fescape));}
var makeArray=function(array,results){array=Array.prototype.slice.call(array,0);if(results){results.push.apply(results,array);return results;}
return array;};try{Array.prototype.slice.call(document.documentElement.childNodes,0)[0].nodeType;}catch(e){makeArray=function(array,results){var i=0,ret=results||[];if(toString.call(array)==="[object Array]"){Array.prototype.push.apply(ret,array);}else{if(typeof array.length==="number"){for(var l=array.length;i<l;i++){ret.push(array[i]);}}else{for(;array[i];i++){ret.push(array[i]);}}}
return ret;};}
var sortOrder,siblingCheck;if(document.documentElement.compareDocumentPosition){sortOrder=function(a,b){if(a===b){hasDuplicate=true;return 0;}
if(!a.compareDocumentPosition||!b.compareDocumentPosition){return a.compareDocumentPosition?-1:1;}
return a.compareDocumentPosition(b)&4?-1:1;};}else{sortOrder=function(a,b){if(a===b){hasDuplicate=true;return 0;}else if(a.sourceIndex&&b.sourceIndex){return a.sourceIndex-b.sourceIndex;}
var al,bl,ap=[],bp=[],aup=a.parentNode,bup=b.parentNode,cur=aup;if(aup===bup){return siblingCheck(a,b);}else if(!aup){return-1;}else if(!bup){return 1;}
while(cur){ap.unshift(cur);cur=cur.parentNode;}
cur=bup;while(cur){bp.unshift(cur);cur=cur.parentNode;}
al=ap.length;bl=bp.length;for(var i=0;i<al&&i<bl;i++){if(ap[i]!==bp[i]){return siblingCheck(ap[i],bp[i]);}}
return i===al?siblingCheck(a,bp[i],-1):siblingCheck(ap[i],b,1);};siblingCheck=function(a,b,ret){if(a===b){return ret;}
var cur=a.nextSibling;while(cur){if(cur===b){return-1;}
cur=cur.nextSibling;}
return 1;};}
(function(){var form=document.createElement("div"),id="script"+(new Date()).getTime(),root=document.documentElement;form.innerHTML="<a name='"+id+"'/>";root.insertBefore(form,root.firstChild);if(document.getElementById(id)){Expr.find.ID=function(match,context,isXML){if(typeof context.getElementById!=="undefined"&&!isXML){var m=context.getElementById(match[1]);return m?m.id===match[1]||typeof m.getAttributeNode!=="undefined"&&m.getAttributeNode("id").nodeValue===match[1]?[m]:undefined:[];}};Expr.filter.ID=function(elem,match){var node=typeof elem.getAttributeNode!=="undefined"&&elem.getAttributeNode("id");return elem.nodeType===1&&node&&node.nodeValue===match;};}
root.removeChild(form);root=form=null;})();(function(){var div=document.createElement("div");div.appendChild(document.createComment(""));if(div.getElementsByTagName("*").length>0){Expr.find.TAG=function(match,context){var results=context.getElementsByTagName(match[1]);if(match[1]==="*"){var tmp=[];for(var i=0;results[i];i++){if(results[i].nodeType===1){tmp.push(results[i]);}}
results=tmp;}
return results;};}
div.innerHTML="<a href='#'></a>";if(div.firstChild&&typeof div.firstChild.getAttribute!=="undefined"&&div.firstChild.getAttribute("href")!=="#"){Expr.attrHandle.href=function(elem){return elem.getAttribute("href",2);};}
div=null;})();if(document.querySelectorAll){(function(){var oldSizzle=Sizzle,div=document.createElement("div"),id="__sizzle__";div.innerHTML="<p class='TEST'></p>";if(div.querySelectorAll&&div.querySelectorAll(".TEST").length===0){return;}
Sizzle=function(query,context,extra,seed){context=context||document;if(!seed&&!Sizzle.isXML(context)){var match=/^(\w+$)|^\.([\w\-]+$)|^#([\w\-]+$)/.exec(query);if(match&&(context.nodeType===1||context.nodeType===9)){if(match[1]){return makeArray(context.getElementsByTagName(query),extra);}else if(match[2]&&Expr.find.CLASS&&context.getElementsByClassName){return makeArray(context.getElementsByClassName(match[2]),extra);}}
if(context.nodeType===9){if(query==="body"&&context.body){return makeArray([context.body],extra);}else if(match&&match[3]){var elem=context.getElementById(match[3]);if(elem&&elem.parentNode){if(elem.id===match[3]){return makeArray([elem],extra);}}else{return makeArray([],extra);}}
try{return makeArray(context.querySelectorAll(query),extra);}catch(qsaError){}}else if(context.nodeType===1&&context.nodeName.toLowerCase()!=="object"){var oldContext=context,old=context.getAttribute("id"),nid=old||id,hasParent=context.parentNode,relativeHierarchySelector=/^\s*[+~]/.test(query);if(!old){context.setAttribute("id",nid);}else{nid=nid.replace(/'/g,"\\$&");}
if(relativeHierarchySelector&&hasParent){context=context.parentNode;}
try{if(!relativeHierarchySelector||hasParent){return makeArray(context.querySelectorAll("[id='"+nid+"'] "+query),extra);}}catch(pseudoError){}finally{if(!old){oldContext.removeAttribute("id");}}}}
return oldSizzle(query,context,extra,seed);};for(var prop in oldSizzle){Sizzle[prop]=oldSizzle[prop];}
div=null;})();}
(function(){var html=document.documentElement,matches=html.matchesSelector||html.mozMatchesSelector||html.webkitMatchesSelector||html.msMatchesSelector;if(matches){var disconnectedMatch=!matches.call(document.createElement("div"),"div"),pseudoWorks=false;try{matches.call(document.documentElement,"[test!='']:sizzle");}catch(pseudoError){pseudoWorks=true;}
Sizzle.matchesSelector=function(node,expr){expr=expr.replace(/\=\s*([^'"\]]*)\s*\]/g,"='$1']");if(!Sizzle.isXML(node)){try{if(pseudoWorks||!Expr.match.PSEUDO.test(expr)&&!/!=/.test(expr)){var ret=matches.call(node,expr);if(ret||!disconnectedMatch||node.document&&node.document.nodeType!==11){return ret;}}}catch(e){}}
return Sizzle(expr,null,null,[node]).length>0;};}})();(function(){var div=document.createElement("div");div.innerHTML="<div class='test e'></div><div class='test'></div>";if(!div.getElementsByClassName||div.getElementsByClassName("e").length===0){return;}
div.lastChild.className="e";if(div.getElementsByClassName("e").length===1){return;}
Expr.order.splice(1,0,"CLASS");Expr.find.CLASS=function(match,context,isXML){if(typeof context.getElementsByClassName!=="undefined"&&!isXML){return context.getElementsByClassName(match[1]);}};div=null;})();function dirNodeCheck(dir,cur,doneName,checkSet,nodeCheck,isXML){for(var i=0,l=checkSet.length;i<l;i++){var elem=checkSet[i];if(elem){var match=false;elem=elem[dir];while(elem){if(elem[expando]===doneName){match=checkSet[elem.sizset];break;}
if(elem.nodeType===1&&!isXML){elem[expando]=doneName;elem.sizset=i;}
if(elem.nodeName.toLowerCase()===cur){match=elem;break;}
elem=elem[dir];}
checkSet[i]=match;}}}
function dirCheck(dir,cur,doneName,checkSet,nodeCheck,isXML){for(var i=0,l=checkSet.length;i<l;i++){var elem=checkSet[i];if(elem){var match=false;elem=elem[dir];while(elem){if(elem[expando]===doneName){match=checkSet[elem.sizset];break;}
if(elem.nodeType===1){if(!isXML){elem[expando]=doneName;elem.sizset=i;}
if(typeof cur!=="string"){if(elem===cur){match=true;break;}}else if(Sizzle.filter(cur,[elem]).length>0){match=elem;break;}}
elem=elem[dir];}
checkSet[i]=match;}}}
if(document.documentElement.contains){Sizzle.contains=function(a,b){return a!==b&&(a.contains?a.contains(b):true);};}else if(document.documentElement.compareDocumentPosition){Sizzle.contains=function(a,b){return!!(a.compareDocumentPosition(b)&16);};}else{Sizzle.contains=function(){return false;};}
Sizzle.isXML=function(elem){var documentElement=(elem?elem.ownerDocument||elem:0).documentElement;return documentElement?documentElement.nodeName!=="HTML":false;};var posProcess=function(selector,context,seed){var match,tmpSet=[],later="",root=context.nodeType?[context]:context;while((match=Expr.match.PSEUDO.exec(selector))){later+=match[0];selector=selector.replace(Expr.match.PSEUDO,"");}
selector=Expr.relative[selector]?selector+"*":selector;for(var i=0,l=root.length;i<l;i++){Sizzle(selector,root[i],tmpSet,seed);}
return Sizzle.filter(later,tmpSet);};Sizzle.attr=jQuery.attr;Sizzle.selectors.attrMap={};jQuery.find=Sizzle;jQuery.expr=Sizzle.selectors;jQuery.expr[":"]=jQuery.expr.filters;jQuery.unique=Sizzle.uniqueSort;jQuery.text=Sizzle.getText;jQuery.isXMLDoc=Sizzle.isXML;jQuery.contains=Sizzle.contains;})();var runtil=/Until$/,rparentsprev=/^(?:parents|prevUntil|prevAll)/,rmultiselector=/,/,isSimple=/^.[^:#\[\.,]*$/,slice=Array.prototype.slice,POS=jQuery.expr.match.POS,guaranteedUnique={children:true,contents:true,next:true,prev:true};jQuery.fn.extend({find:function(selector){var self=this,i,l;if(typeof selector!=="string"){return jQuery(selector).filter(function(){for(i=0,l=self.length;i<l;i++){if(jQuery.contains(self[i],this)){return true;}}});}
var ret=this.pushStack("","find",selector),length,n,r;for(i=0,l=this.length;i<l;i++){length=ret.length;jQuery.find(selector,this[i],ret);if(i>0){for(n=length;n<ret.length;n++){for(r=0;r<length;r++){if(ret[r]===ret[n]){ret.splice(n--,1);break;}}}}}
return ret;},has:function(target){var targets=jQuery(target);return this.filter(function(){for(var i=0,l=targets.length;i<l;i++){if(jQuery.contains(this,targets[i])){return true;}}});},not:function(selector){return this.pushStack(winnow(this,selector,false),"not",selector);},filter:function(selector){return this.pushStack(winnow(this,selector,true),"filter",selector);},is:function(selector){return!!selector&&(typeof selector==="string"?POS.test(selector)?jQuery(selector,this.context).index(this[0])>=0:jQuery.filter(selector,this).length>0:this.filter(selector).length>0);},closest:function(selectors,context){var ret=[],i,l,cur=this[0];if(jQuery.isArray(selectors)){var level=1;while(cur&&cur.ownerDocument&&cur!==context){for(i=0;i<selectors.length;i++){if(jQuery(cur).is(selectors[i])){ret.push({selector:selectors[i],elem:cur,level:level});}}
cur=cur.parentNode;level++;}
return ret;}
var pos=POS.test(selectors)||typeof selectors!=="string"?jQuery(selectors,context||this.context):0;for(i=0,l=this.length;i<l;i++){cur=this[i];while(cur){if(pos?pos.index(cur)>-1:jQuery.find.matchesSelector(cur,selectors)){ret.push(cur);break;}else{cur=cur.parentNode;if(!cur||!cur.ownerDocument||cur===context||cur.nodeType===11){break;}}}}
ret=ret.length>1?jQuery.unique(ret):ret;return this.pushStack(ret,"closest",selectors);},index:function(elem){if(!elem){return(this[0]&&this[0].parentNode)?this.prevAll().length:-1;}
if(typeof elem==="string"){return jQuery.inArray(this[0],jQuery(elem));}
return jQuery.inArray(elem.jquery?elem[0]:elem,this);},add:function(selector,context){var set=typeof selector==="string"?jQuery(selector,context):jQuery.makeArray(selector&&selector.nodeType?[selector]:selector),all=jQuery.merge(this.get(),set);return this.pushStack(isDisconnected(set[0])||isDisconnected(all[0])?all:jQuery.unique(all));},andSelf:function(){return this.add(this.prevObject);}});function isDisconnected(node){return!node||!node.parentNode||node.parentNode.nodeType===11;}
jQuery.each({parent:function(elem){var parent=elem.parentNode;return parent&&parent.nodeType!==11?parent:null;},parents:function(elem){return jQuery.dir(elem,"parentNode");},parentsUntil:function(elem,i,until){return jQuery.dir(elem,"parentNode",until);},next:function(elem){return jQuery.nth(elem,2,"nextSibling");},prev:function(elem){return jQuery.nth(elem,2,"previousSibling");},nextAll:function(elem){return jQuery.dir(elem,"nextSibling");},prevAll:function(elem){return jQuery.dir(elem,"previousSibling");},nextUntil:function(elem,i,until){return jQuery.dir(elem,"nextSibling",until);},prevUntil:function(elem,i,until){return jQuery.dir(elem,"previousSibling",until);},siblings:function(elem){return jQuery.sibling(elem.parentNode.firstChild,elem);},children:function(elem){return jQuery.sibling(elem.firstChild);},contents:function(elem){return jQuery.nodeName(elem,"iframe")?elem.contentDocument||elem.contentWindow.document:jQuery.makeArray(elem.childNodes);}},function(name,fn){jQuery.fn[name]=function(until,selector){var ret=jQuery.map(this,fn,until);if(!runtil.test(name)){selector=until;}
if(selector&&typeof selector==="string"){ret=jQuery.filter(selector,ret);}
ret=this.length>1&&!guaranteedUnique[name]?jQuery.unique(ret):ret;if((this.length>1||rmultiselector.test(selector))&&rparentsprev.test(name)){ret=ret.reverse();}
return this.pushStack(ret,name,slice.call(arguments).join(","));};});jQuery.extend({filter:function(expr,elems,not){if(not){expr=":not("+expr+")";}
return elems.length===1?jQuery.find.matchesSelector(elems[0],expr)?[elems[0]]:[]:jQuery.find.matches(expr,elems);},dir:function(elem,dir,until){var matched=[],cur=elem[dir];while(cur&&cur.nodeType!==9&&(until===undefined||cur.nodeType!==1||!jQuery(cur).is(until))){if(cur.nodeType===1){matched.push(cur);}
cur=cur[dir];}
return matched;},nth:function(cur,result,dir,elem){result=result||1;var num=0;for(;cur;cur=cur[dir]){if(cur.nodeType===1&&++num===result){break;}}
return cur;},sibling:function(n,elem){var r=[];for(;n;n=n.nextSibling){if(n.nodeType===1&&n!==elem){r.push(n);}}
return r;}});function winnow(elements,qualifier,keep){qualifier=qualifier||0;if(jQuery.isFunction(qualifier)){return jQuery.grep(elements,function(elem,i){var retVal=!!qualifier.call(elem,i,elem);return retVal===keep;});}else if(qualifier.nodeType){return jQuery.grep(elements,function(elem,i){return(elem===qualifier)===keep;});}else if(typeof qualifier==="string"){var filtered=jQuery.grep(elements,function(elem){return elem.nodeType===1;});if(isSimple.test(qualifier)){return jQuery.filter(qualifier,filtered,!keep);}else{qualifier=jQuery.filter(qualifier,filtered);}}
return jQuery.grep(elements,function(elem,i){return(jQuery.inArray(elem,qualifier)>=0)===keep;});}
function createSafeFragment(document){var list=nodeNames.split("|"),safeFrag=document.createDocumentFragment();if(safeFrag.createElement){while(list.length){safeFrag.createElement(list.pop());}}
return safeFrag;}
var nodeNames="abbr|article|aside|audio|canvas|datalist|details|figcaption|figure|footer|"+"header|hgroup|mark|meter|nav|output|progress|section|summary|time|video",rinlinejQuery=/ jQuery\d+="(?:\d+|null)"/g,rleadingWhitespace=/^\s+/,rxhtmlTag=/<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:]+)[^>]*)\/>/ig,rtagName=/<([\w:]+)/,rtbody=/<tbody/i,rhtml=/<|&#?\w+;/,rnoInnerhtml=/<(?:script|style)/i,rnocache=/<(?:script|object|embed|option|style)/i,rnoshimcache=new RegExp("<(?:"+nodeNames+")","i"),rchecked=/checked\s*(?:[^=]|=\s*.checked.)/i,rscriptType=/\/(java|ecma)script/i,rcleanScript=/^\s*<!(?:\[CDATA\[|\-\-)/,wrapMap={option:[1,"<select multiple='multiple'>","</select>"],legend:[1,"<fieldset>","</fieldset>"],thead:[1,"<table>","</table>"],tr:[2,"<table><tbody>","</tbody></table>"],td:[3,"<table><tbody><tr>","</tr></tbody></table>"],col:[2,"<table><tbody></tbody><colgroup>","</colgroup></table>"],area:[1,"<map>","</map>"],_default:[0,"",""]},safeFragment=createSafeFragment(document);wrapMap.optgroup=wrapMap.option;wrapMap.tbody=wrapMap.tfoot=wrapMap.colgroup=wrapMap.caption=wrapMap.thead;wrapMap.th=wrapMap.td;if(!jQuery.support.htmlSerialize){wrapMap._default=[1,"div<div>","</div>"];}
jQuery.fn.extend({text:function(text){if(jQuery.isFunction(text)){return this.each(function(i){var self=jQuery(this);self.text(text.call(this,i,self.text()));});}
if(typeof text!=="object"&&text!==undefined){return this.empty().append((this[0]&&this[0].ownerDocument||document).createTextNode(text));}
return jQuery.text(this);},wrapAll:function(html){if(jQuery.isFunction(html)){return this.each(function(i){jQuery(this).wrapAll(html.call(this,i));});}
if(this[0]){var wrap=jQuery(html,this[0].ownerDocument).eq(0).clone(true);if(this[0].parentNode){wrap.insertBefore(this[0]);}
wrap.map(function(){var elem=this;while(elem.firstChild&&elem.firstChild.nodeType===1){elem=elem.firstChild;}
return elem;}).append(this);}
return this;},wrapInner:function(html){if(jQuery.isFunction(html)){return this.each(function(i){jQuery(this).wrapInner(html.call(this,i));});}
return this.each(function(){var self=jQuery(this),contents=self.contents();if(contents.length){contents.wrapAll(html);}else{self.append(html);}});},wrap:function(html){var isFunction=jQuery.isFunction(html);return this.each(function(i){jQuery(this).wrapAll(isFunction?html.call(this,i):html);});},unwrap:function(){return this.parent().each(function(){if(!jQuery.nodeName(this,"body")){jQuery(this).replaceWith(this.childNodes);}}).end();},append:function(){return this.domManip(arguments,true,function(elem){if(this.nodeType===1){this.appendChild(elem);}});},prepend:function(){return this.domManip(arguments,true,function(elem){if(this.nodeType===1){this.insertBefore(elem,this.firstChild);}});},before:function(){if(this[0]&&this[0].parentNode){return this.domManip(arguments,false,function(elem){this.parentNode.insertBefore(elem,this);});}else if(arguments.length){var set=jQuery.clean(arguments);set.push.apply(set,this.toArray());return this.pushStack(set,"before",arguments);}},after:function(){if(this[0]&&this[0].parentNode){return this.domManip(arguments,false,function(elem){this.parentNode.insertBefore(elem,this.nextSibling);});}else if(arguments.length){var set=this.pushStack(this,"after",arguments);set.push.apply(set,jQuery.clean(arguments));return set;}},remove:function(selector,keepData){for(var i=0,elem;(elem=this[i])!=null;i++){if(!selector||jQuery.filter(selector,[elem]).length){if(!keepData&&elem.nodeType===1){jQuery.cleanData(elem.getElementsByTagName("*"));jQuery.cleanData([elem]);}
if(elem.parentNode){elem.parentNode.removeChild(elem);}}}
return this;},empty:function(){for(var i=0,elem;(elem=this[i])!=null;i++){if(elem.nodeType===1){jQuery.cleanData(elem.getElementsByTagName("*"));}
while(elem.firstChild){elem.removeChild(elem.firstChild);}}
return this;},clone:function(dataAndEvents,deepDataAndEvents){dataAndEvents=dataAndEvents==null?false:dataAndEvents;deepDataAndEvents=deepDataAndEvents==null?dataAndEvents:deepDataAndEvents;return this.map(function(){return jQuery.clone(this,dataAndEvents,deepDataAndEvents);});},html:function(value){if(value===undefined){return this[0]&&this[0].nodeType===1?this[0].innerHTML.replace(rinlinejQuery,""):null;}else if(typeof value==="string"&&!rnoInnerhtml.test(value)&&(jQuery.support.leadingWhitespace||!rleadingWhitespace.test(value))&&!wrapMap[(rtagName.exec(value)||["",""])[1].toLowerCase()]){value=value.replace(rxhtmlTag,"<$1></$2>");try{for(var i=0,l=this.length;i<l;i++){if(this[i].nodeType===1){jQuery.cleanData(this[i].getElementsByTagName("*"));this[i].innerHTML=value;}}}catch(e){this.empty().append(value);}}else if(jQuery.isFunction(value)){this.each(function(i){var self=jQuery(this);self.html(value.call(this,i,self.html()));});}else{this.empty().append(value);}
return this;},replaceWith:function(value){if(this[0]&&this[0].parentNode){if(jQuery.isFunction(value)){return this.each(function(i){var self=jQuery(this),old=self.html();self.replaceWith(value.call(this,i,old));});}
if(typeof value!=="string"){value=jQuery(value).detach();}
return this.each(function(){var next=this.nextSibling,parent=this.parentNode;jQuery(this).remove();if(next){jQuery(next).before(value);}else{jQuery(parent).append(value);}});}else{return this.length?this.pushStack(jQuery(jQuery.isFunction(value)?value():value),"replaceWith",value):this;}},detach:function(selector){return this.remove(selector,true);},domManip:function(args,table,callback){var results,first,fragment,parent,value=args[0],scripts=[];if(!jQuery.support.checkClone&&arguments.length===3&&typeof value==="string"&&rchecked.test(value)){return this.each(function(){jQuery(this).domManip(args,table,callback,true);});}
if(jQuery.isFunction(value)){return this.each(function(i){var self=jQuery(this);args[0]=value.call(this,i,table?self.html():undefined);self.domManip(args,table,callback);});}
if(this[0]){parent=value&&value.parentNode;if(jQuery.support.parentNode&&parent&&parent.nodeType===11&&parent.childNodes.length===this.length){results={fragment:parent};}else{results=jQuery.buildFragment(args,this,scripts);}
fragment=results.fragment;if(fragment.childNodes.length===1){first=fragment=fragment.firstChild;}else{first=fragment.firstChild;}
if(first){table=table&&jQuery.nodeName(first,"tr");for(var i=0,l=this.length,lastIndex=l-1;i<l;i++){callback.call(table?root(this[i],first):this[i],results.cacheable||(l>1&&i<lastIndex)?jQuery.clone(fragment,true,true):fragment);}}
if(scripts.length){jQuery.each(scripts,evalScript);}}
return this;}});function root(elem,cur){return jQuery.nodeName(elem,"table")?(elem.getElementsByTagName("tbody")[0]||elem.appendChild(elem.ownerDocument.createElement("tbody"))):elem;}
function cloneCopyEvent(src,dest){if(dest.nodeType!==1||!jQuery.hasData(src)){return;}
var type,i,l,oldData=jQuery._data(src),curData=jQuery._data(dest,oldData),events=oldData.events;if(events){delete curData.handle;curData.events={};for(type in events){for(i=0,l=events[type].length;i<l;i++){jQuery.event.add(dest,type+(events[type][i].namespace?".":"")+events[type][i].namespace,events[type][i],events[type][i].data);}}}
if(curData.data){curData.data=jQuery.extend({},curData.data);}}
function cloneFixAttributes(src,dest){var nodeName;if(dest.nodeType!==1){return;}
if(dest.clearAttributes){dest.clearAttributes();}
if(dest.mergeAttributes){dest.mergeAttributes(src);}
nodeName=dest.nodeName.toLowerCase();if(nodeName==="object"){dest.outerHTML=src.outerHTML;}else if(nodeName==="input"&&(src.type==="checkbox"||src.type==="radio")){if(src.checked){dest.defaultChecked=dest.checked=src.checked;}
if(dest.value!==src.value){dest.value=src.value;}}else if(nodeName==="option"){dest.selected=src.defaultSelected;}else if(nodeName==="input"||nodeName==="textarea"){dest.defaultValue=src.defaultValue;}
dest.removeAttribute(jQuery.expando);}
jQuery.buildFragment=function(args,nodes,scripts){var fragment,cacheable,cacheresults,doc,first=args[0];if(nodes&&nodes[0]){doc=nodes[0].ownerDocument||nodes[0];}
if(!doc.createDocumentFragment){doc=document;}
if(args.length===1&&typeof first==="string"&&first.length<512&&doc===document&&first.charAt(0)==="<"&&!rnocache.test(first)&&(jQuery.support.checkClone||!rchecked.test(first))&&(jQuery.support.html5Clone||!rnoshimcache.test(first))){cacheable=true;cacheresults=jQuery.fragments[first];if(cacheresults&&cacheresults!==1){fragment=cacheresults;}}
if(!fragment){fragment=doc.createDocumentFragment();jQuery.clean(args,doc,fragment,scripts);}
if(cacheable){jQuery.fragments[first]=cacheresults?fragment:1;}
return{fragment:fragment,cacheable:cacheable};};jQuery.fragments={};jQuery.each({appendTo:"append",prependTo:"prepend",insertBefore:"before",insertAfter:"after",replaceAll:"replaceWith"},function(name,original){jQuery.fn[name]=function(selector){var ret=[],insert=jQuery(selector),parent=this.length===1&&this[0].parentNode;if(parent&&parent.nodeType===11&&parent.childNodes.length===1&&insert.length===1){insert[original](this[0]);return this;}else{for(var i=0,l=insert.length;i<l;i++){var elems=(i>0?this.clone(true):this).get();jQuery(insert[i])[original](elems);ret=ret.concat(elems);}
return this.pushStack(ret,name,insert.selector);}};});function getAll(elem){if(typeof elem.getElementsByTagName!=="undefined"){return elem.getElementsByTagName("*");}else if(typeof elem.querySelectorAll!=="undefined"){return elem.querySelectorAll("*");}else{return[];}}
function fixDefaultChecked(elem){if(elem.type==="checkbox"||elem.type==="radio"){elem.defaultChecked=elem.checked;}}
function findInputs(elem){var nodeName=(elem.nodeName||"").toLowerCase();if(nodeName==="input"){fixDefaultChecked(elem);}else if(nodeName!=="script"&&typeof elem.getElementsByTagName!=="undefined"){jQuery.grep(elem.getElementsByTagName("input"),fixDefaultChecked);}}
function shimCloneNode(elem){var div=document.createElement("div");safeFragment.appendChild(div);div.innerHTML=elem.outerHTML;return div.firstChild;}
jQuery.extend({clone:function(elem,dataAndEvents,deepDataAndEvents){var srcElements,destElements,i,clone=jQuery.support.html5Clone||!rnoshimcache.test("<"+elem.nodeName)?elem.cloneNode(true):shimCloneNode(elem);if((!jQuery.support.noCloneEvent||!jQuery.support.noCloneChecked)&&(elem.nodeType===1||elem.nodeType===11)&&!jQuery.isXMLDoc(elem)){cloneFixAttributes(elem,clone);srcElements=getAll(elem);destElements=getAll(clone);for(i=0;srcElements[i];++i){if(destElements[i]){cloneFixAttributes(srcElements[i],destElements[i]);}}}
if(dataAndEvents){cloneCopyEvent(elem,clone);if(deepDataAndEvents){srcElements=getAll(elem);destElements=getAll(clone);for(i=0;srcElements[i];++i){cloneCopyEvent(srcElements[i],destElements[i]);}}}
srcElements=destElements=null;return clone;},clean:function(elems,context,fragment,scripts){var checkScriptType;context=context||document;if(typeof context.createElement==="undefined"){context=context.ownerDocument||context[0]&&context[0].ownerDocument||document;}
var ret=[],j;for(var i=0,elem;(elem=elems[i])!=null;i++){if(typeof elem==="number"){elem+="";}
if(!elem){continue;}
if(typeof elem==="string"){if(!rhtml.test(elem)){elem=context.createTextNode(elem);}else{elem=elem.replace(rxhtmlTag,"<$1></$2>");var tag=(rtagName.exec(elem)||["",""])[1].toLowerCase(),wrap=wrapMap[tag]||wrapMap._default,depth=wrap[0],div=context.createElement("div");if(context===document){safeFragment.appendChild(div);}else{createSafeFragment(context).appendChild(div);}
div.innerHTML=wrap[1]+elem+wrap[2];while(depth--){div=div.lastChild;}
if(!jQuery.support.tbody){var hasBody=rtbody.test(elem),tbody=tag==="table"&&!hasBody?div.firstChild&&div.firstChild.childNodes:wrap[1]==="<table>"&&!hasBody?div.childNodes:[];for(j=tbody.length-1;j>=0;--j){if(jQuery.nodeName(tbody[j],"tbody")&&!tbody[j].childNodes.length){tbody[j].parentNode.removeChild(tbody[j]);}}}
if(!jQuery.support.leadingWhitespace&&rleadingWhitespace.test(elem)){div.insertBefore(context.createTextNode(rleadingWhitespace.exec(elem)[0]),div.firstChild);}
elem=div.childNodes;}}
var len;if(!jQuery.support.appendChecked){if(elem[0]&&typeof(len=elem.length)==="number"){for(j=0;j<len;j++){findInputs(elem[j]);}}else{findInputs(elem);}}
if(elem.nodeType){ret.push(elem);}else{ret=jQuery.merge(ret,elem);}}
if(fragment){checkScriptType=function(elem){return!elem.type||rscriptType.test(elem.type);};for(i=0;ret[i];i++){if(scripts&&jQuery.nodeName(ret[i],"script")&&(!ret[i].type||ret[i].type.toLowerCase()==="text/javascript")){scripts.push(ret[i].parentNode?ret[i].parentNode.removeChild(ret[i]):ret[i]);}else{if(ret[i].nodeType===1){var jsTags=jQuery.grep(ret[i].getElementsByTagName("script"),checkScriptType);ret.splice.apply(ret,[i+1,0].concat(jsTags));}
fragment.appendChild(ret[i]);}}}
return ret;},cleanData:function(elems){var data,id,cache=jQuery.cache,special=jQuery.event.special,deleteExpando=jQuery.support.deleteExpando;for(var i=0,elem;(elem=elems[i])!=null;i++){if(elem.nodeName&&jQuery.noData[elem.nodeName.toLowerCase()]){continue;}
id=elem[jQuery.expando];if(id){data=cache[id];if(data&&data.events){for(var type in data.events){if(special[type]){jQuery.event.remove(elem,type);}else{jQuery.removeEvent(elem,type,data.handle);}}
if(data.handle){data.handle.elem=null;}}
if(deleteExpando){delete elem[jQuery.expando];}else if(elem.removeAttribute){elem.removeAttribute(jQuery.expando);}
delete cache[id];}}}});function evalScript(i,elem){if(elem.src){jQuery.ajax({url:elem.src,async:false,dataType:"script"});}else{jQuery.globalEval((elem.text||elem.textContent||elem.innerHTML||"").replace(rcleanScript,"/*$0*/"));}
if(elem.parentNode){elem.parentNode.removeChild(elem);}}
var ralpha=/alpha\([^)]*\)/i,ropacity=/opacity=([^)]*)/,rupper=/([A-Z]|^ms)/g,rnumpx=/^-?\d+(?:px)?$/i,rnum=/^-?\d/,rrelNum=/^([\-+])=([\-+.\de]+)/,cssShow={position:"absolute",visibility:"hidden",display:"block"},cssWidth=["Left","Right"],cssHeight=["Top","Bottom"],curCSS,getComputedStyle,currentStyle;jQuery.fn.css=function(name,value){if(arguments.length===2&&value===undefined){return this;}
return jQuery.access(this,name,value,true,function(elem,name,value){return value!==undefined?jQuery.style(elem,name,value):jQuery.css(elem,name);});};jQuery.extend({cssHooks:{opacity:{get:function(elem,computed){if(computed){var ret=curCSS(elem,"opacity","opacity");return ret===""?"1":ret;}else{return elem.style.opacity;}}}},cssNumber:{"fillOpacity":true,"fontWeight":true,"lineHeight":true,"opacity":true,"orphans":true,"widows":true,"zIndex":true,"zoom":true},cssProps:{"float":jQuery.support.cssFloat?"cssFloat":"styleFloat"},style:function(elem,name,value,extra){if(!elem||elem.nodeType===3||elem.nodeType===8||!elem.style){return;}
var ret,type,origName=jQuery.camelCase(name),style=elem.style,hooks=jQuery.cssHooks[origName];name=jQuery.cssProps[origName]||origName;if(value!==undefined){type=typeof value;if(type==="string"&&(ret=rrelNum.exec(value))){value=(+(ret[1]+1)*+ret[2])+parseFloat(jQuery.css(elem,name));type="number";}
if(value==null||type==="number"&&isNaN(value)){return;}
if(type==="number"&&!jQuery.cssNumber[origName]){value+="px";}
if(!hooks||!("set"in hooks)||(value=hooks.set(elem,value))!==undefined){try{style[name]=value;}catch(e){}}}else{if(hooks&&"get"in hooks&&(ret=hooks.get(elem,false,extra))!==undefined){return ret;}
return style[name];}},css:function(elem,name,extra){var ret,hooks;name=jQuery.camelCase(name);hooks=jQuery.cssHooks[name];name=jQuery.cssProps[name]||name;if(name==="cssFloat"){name="float";}
if(hooks&&"get"in hooks&&(ret=hooks.get(elem,true,extra))!==undefined){return ret;}else if(curCSS){return curCSS(elem,name);}},swap:function(elem,options,callback){var old={};for(var name in options){old[name]=elem.style[name];elem.style[name]=options[name];}
callback.call(elem);for(name in options){elem.style[name]=old[name];}}});jQuery.curCSS=jQuery.css;jQuery.each(["height","width"],function(i,name){jQuery.cssHooks[name]={get:function(elem,computed,extra){var val;if(computed){if(elem.offsetWidth!==0){return getWH(elem,name,extra);}else{jQuery.swap(elem,cssShow,function(){val=getWH(elem,name,extra);});}
return val;}},set:function(elem,value){if(rnumpx.test(value)){value=parseFloat(value);if(value>=0){return value+"px";}}else{return value;}}};});if(!jQuery.support.opacity){jQuery.cssHooks.opacity={get:function(elem,computed){return ropacity.test((computed&&elem.currentStyle?elem.currentStyle.filter:elem.style.filter)||"")?(parseFloat(RegExp.$1)/100)+"":computed?"1":"";},set:function(elem,value){var style=elem.style,currentStyle=elem.currentStyle,opacity=jQuery.isNumeric(value)?"alpha(opacity="+value*100+")":"",filter=currentStyle&&currentStyle.filter||style.filter||"";style.zoom=1;if(value>=1&&jQuery.trim(filter.replace(ralpha,""))===""){style.removeAttribute("filter");if(currentStyle&&!currentStyle.filter){return;}}
style.filter=ralpha.test(filter)?filter.replace(ralpha,opacity):filter+" "+opacity;}};}
jQuery(function(){if(!jQuery.support.reliableMarginRight){jQuery.cssHooks.marginRight={get:function(elem,computed){var ret;jQuery.swap(elem,{"display":"inline-block"},function(){if(computed){ret=curCSS(elem,"margin-right","marginRight");}else{ret=elem.style.marginRight;}});return ret;}};}});if(document.defaultView&&document.defaultView.getComputedStyle){getComputedStyle=function(elem,name){var ret,defaultView,computedStyle;name=name.replace(rupper,"-$1").toLowerCase();if((defaultView=elem.ownerDocument.defaultView)&&(computedStyle=defaultView.getComputedStyle(elem,null))){ret=computedStyle.getPropertyValue(name);if(ret===""&&!jQuery.contains(elem.ownerDocument.documentElement,elem)){ret=jQuery.style(elem,name);}}
return ret;};}
if(document.documentElement.currentStyle){currentStyle=function(elem,name){var left,rsLeft,uncomputed,ret=elem.currentStyle&&elem.currentStyle[name],style=elem.style;if(ret===null&&style&&(uncomputed=style[name])){ret=uncomputed;}
if(!rnumpx.test(ret)&&rnum.test(ret)){left=style.left;rsLeft=elem.runtimeStyle&&elem.runtimeStyle.left;if(rsLeft){elem.runtimeStyle.left=elem.currentStyle.left;}
style.left=name==="fontSize"?"1em":(ret||0);ret=style.pixelLeft+"px";style.left=left;if(rsLeft){elem.runtimeStyle.left=rsLeft;}}
return ret===""?"auto":ret;};}
curCSS=getComputedStyle||currentStyle;function getWH(elem,name,extra){var val=name==="width"?elem.offsetWidth:elem.offsetHeight,which=name==="width"?cssWidth:cssHeight,i=0,len=which.length;if(val>0){if(extra!=="border"){for(;i<len;i++){if(!extra){val-=parseFloat(jQuery.css(elem,"padding"+which[i]))||0;}
if(extra==="margin"){val+=parseFloat(jQuery.css(elem,extra+which[i]))||0;}else{val-=parseFloat(jQuery.css(elem,"border"+which[i]+"Width"))||0;}}}
return val+"px";}
val=curCSS(elem,name,name);if(val<0||val==null){val=elem.style[name]||0;}
val=parseFloat(val)||0;if(extra){for(;i<len;i++){val+=parseFloat(jQuery.css(elem,"padding"+which[i]))||0;if(extra!=="padding"){val+=parseFloat(jQuery.css(elem,"border"+which[i]+"Width"))||0;}
if(extra==="margin"){val+=parseFloat(jQuery.css(elem,extra+which[i]))||0;}}}
return val+"px";}
if(jQuery.expr&&jQuery.expr.filters){jQuery.expr.filters.hidden=function(elem){var width=elem.offsetWidth,height=elem.offsetHeight;return(width===0&&height===0)||(!jQuery.support.reliableHiddenOffsets&&((elem.style&&elem.style.display)||jQuery.css(elem,"display"))==="none");};jQuery.expr.filters.visible=function(elem){return!jQuery.expr.filters.hidden(elem);};}
var r20=/%20/g,rbracket=/\[\]$/,rCRLF=/\r?\n/g,rhash=/#.*$/,rheaders=/^(.*?):[ \t]*([^\r\n]*)\r?$/mg,rinput=/^(?:color|date|datetime|datetime-local|email|hidden|month|number|password|range|search|tel|text|time|url|week)$/i,rlocalProtocol=/^(?:about|app|app\-storage|.+\-extension|file|res|widget):$/,rnoContent=/^(?:GET|HEAD)$/,rprotocol=/^\/\//,rquery=/\?/,rscript=/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi,rselectTextarea=/^(?:select|textarea)/i,rspacesAjax=/\s+/,rts=/([?&])_=[^&]*/,rurl=/^([\w\+\.\-]+:)(?:\/\/([^\/?#:]*)(?::(\d+))?)?/,_load=jQuery.fn.load,prefilters={},transports={},ajaxLocation,ajaxLocParts,allTypes=["*/"]+["*"];try{ajaxLocation=location.href;}catch(e){ajaxLocation=document.createElement("a");ajaxLocation.href="";ajaxLocation=ajaxLocation.href;}
ajaxLocParts=rurl.exec(ajaxLocation.toLowerCase())||[];function addToPrefiltersOrTransports(structure){return function(dataTypeExpression,func){if(typeof dataTypeExpression!=="string"){func=dataTypeExpression;dataTypeExpression="*";}
if(jQuery.isFunction(func)){var dataTypes=dataTypeExpression.toLowerCase().split(rspacesAjax),i=0,length=dataTypes.length,dataType,list,placeBefore;for(;i<length;i++){dataType=dataTypes[i];placeBefore=/^\+/.test(dataType);if(placeBefore){dataType=dataType.substr(1)||"*";}
list=structure[dataType]=structure[dataType]||[];list[placeBefore?"unshift":"push"](func);}}};}
function inspectPrefiltersOrTransports(structure,options,originalOptions,jqXHR,dataType,inspected){dataType=dataType||options.dataTypes[0];inspected=inspected||{};inspected[dataType]=true;var list=structure[dataType],i=0,length=list?list.length:0,executeOnly=(structure===prefilters),selection;for(;i<length&&(executeOnly||!selection);i++){selection=list[i](options,originalOptions,jqXHR);if(typeof selection==="string"){if(!executeOnly||inspected[selection]){selection=undefined;}else{options.dataTypes.unshift(selection);selection=inspectPrefiltersOrTransports(structure,options,originalOptions,jqXHR,selection,inspected);}}}
if((executeOnly||!selection)&&!inspected["*"]){selection=inspectPrefiltersOrTransports(structure,options,originalOptions,jqXHR,"*",inspected);}
return selection;}
function ajaxExtend(target,src){var key,deep,flatOptions=jQuery.ajaxSettings.flatOptions||{};for(key in src){if(src[key]!==undefined){(flatOptions[key]?target:(deep||(deep={})))[key]=src[key];}}
if(deep){jQuery.extend(true,target,deep);}}
jQuery.fn.extend({load:function(url,params,callback){if(typeof url!=="string"&&_load){return _load.apply(this,arguments);}else if(!this.length){return this;}
var off=url.indexOf(" ");if(off>=0){var selector=url.slice(off,url.length);url=url.slice(0,off);}
var type="GET";if(params){if(jQuery.isFunction(params)){callback=params;params=undefined;}else if(typeof params==="object"){params=jQuery.param(params,jQuery.ajaxSettings.traditional);type="POST";}}
var self=this;jQuery.ajax({url:url,type:type,dataType:"html",data:params,complete:function(jqXHR,status,responseText){responseText=jqXHR.responseText;if(jqXHR.isResolved()){jqXHR.done(function(r){responseText=r;});self.html(selector?jQuery("<div>").append(responseText.replace(rscript,"")).find(selector):responseText);}
if(callback){self.each(callback,[responseText,status,jqXHR]);}}});return this;},serialize:function(){return jQuery.param(this.serializeArray());},serializeArray:function(){return this.map(function(){return this.elements?jQuery.makeArray(this.elements):this;}).filter(function(){return this.name&&!this.disabled&&(this.checked||rselectTextarea.test(this.nodeName)||rinput.test(this.type));}).map(function(i,elem){var val=jQuery(this).val();return val==null?null:jQuery.isArray(val)?jQuery.map(val,function(val,i){return{name:elem.name,value:val.replace(rCRLF,"\r\n")};}):{name:elem.name,value:val.replace(rCRLF,"\r\n")};}).get();}});jQuery.each("ajaxStart ajaxStop ajaxComplete ajaxError ajaxSuccess ajaxSend".split(" "),function(i,o){jQuery.fn[o]=function(f){return this.on(o,f);};});jQuery.each(["get","post"],function(i,method){jQuery[method]=function(url,data,callback,type){if(jQuery.isFunction(data)){type=type||callback;callback=data;data=undefined;}
return jQuery.ajax({type:method,url:url,data:data,success:callback,dataType:type});};});jQuery.extend({getScript:function(url,callback){return jQuery.get(url,undefined,callback,"script");},getJSON:function(url,data,callback){return jQuery.get(url,data,callback,"json");},ajaxSetup:function(target,settings){if(settings){ajaxExtend(target,jQuery.ajaxSettings);}else{settings=target;target=jQuery.ajaxSettings;}
ajaxExtend(target,settings);return target;},ajaxSettings:{url:ajaxLocation,isLocal:rlocalProtocol.test(ajaxLocParts[1]),global:true,type:"GET",contentType:"application/x-www-form-urlencoded",processData:true,async:true,accepts:{xml:"application/xml, text/xml",html:"text/html",text:"text/plain",json:"application/json, text/javascript","*":allTypes},contents:{xml:/xml/,html:/html/,json:/json/},responseFields:{xml:"responseXML",text:"responseText"},converters:{"* text":window.String,"text html":true,"text json":jQuery.parseJSON,"text xml":jQuery.parseXML},flatOptions:{context:true,url:true}},ajaxPrefilter:addToPrefiltersOrTransports(prefilters),ajaxTransport:addToPrefiltersOrTransports(transports),ajax:function(url,options){if(typeof url==="object"){options=url;url=undefined;}
options=options||{};var
s=jQuery.ajaxSetup({},options),callbackContext=s.context||s,globalEventContext=callbackContext!==s&&(callbackContext.nodeType||callbackContext instanceof jQuery)?jQuery(callbackContext):jQuery.event,deferred=jQuery.Deferred(),completeDeferred=jQuery.Callbacks("once memory"),statusCode=s.statusCode||{},ifModifiedKey,requestHeaders={},requestHeadersNames={},responseHeadersString,responseHeaders,transport,timeoutTimer,parts,state=0,fireGlobals,i,jqXHR={readyState:0,setRequestHeader:function(name,value){if(!state){var lname=name.toLowerCase();name=requestHeadersNames[lname]=requestHeadersNames[lname]||name;requestHeaders[name]=value;}
return this;},getAllResponseHeaders:function(){return state===2?responseHeadersString:null;},getResponseHeader:function(key){var match;if(state===2){if(!responseHeaders){responseHeaders={};while((match=rheaders.exec(responseHeadersString))){responseHeaders[match[1].toLowerCase()]=match[2];}}
match=responseHeaders[key.toLowerCase()];}
return match===undefined?null:match;},overrideMimeType:function(type){if(!state){s.mimeType=type;}
return this;},abort:function(statusText){statusText=statusText||"abort";if(transport){transport.abort(statusText);}
done(0,statusText);return this;}};function done(status,nativeStatusText,responses,headers){if(state===2){return;}
state=2;if(timeoutTimer){clearTimeout(timeoutTimer);}
transport=undefined;responseHeadersString=headers||"";jqXHR.readyState=status>0?4:0;var isSuccess,success,error,statusText=nativeStatusText,response=responses?ajaxHandleResponses(s,jqXHR,responses):undefined,lastModified,etag;if(status>=200&&status<300||status===304){if(s.ifModified){if((lastModified=jqXHR.getResponseHeader("Last-Modified"))){jQuery.lastModified[ifModifiedKey]=lastModified;}
if((etag=jqXHR.getResponseHeader("Etag"))){jQuery.etag[ifModifiedKey]=etag;}}
if(status===304){statusText="notmodified";isSuccess=true;}else{try{success=ajaxConvert(s,response);statusText="success";isSuccess=true;}catch(e){statusText="parsererror";error=e;}}}else{error=statusText;if(!statusText||status){statusText="error";if(status<0){status=0;}}}
jqXHR.status=status;jqXHR.statusText=""+(nativeStatusText||statusText);if(isSuccess){deferred.resolveWith(callbackContext,[success,statusText,jqXHR]);}else{deferred.rejectWith(callbackContext,[jqXHR,statusText,error]);}
jqXHR.statusCode(statusCode);statusCode=undefined;if(fireGlobals){globalEventContext.trigger("ajax"+(isSuccess?"Success":"Error"),[jqXHR,s,isSuccess?success:error]);}
completeDeferred.fireWith(callbackContext,[jqXHR,statusText]);if(fireGlobals){globalEventContext.trigger("ajaxComplete",[jqXHR,s]);if(!(--jQuery.active)){jQuery.event.trigger("ajaxStop");}}}
deferred.promise(jqXHR);jqXHR.success=jqXHR.done;jqXHR.error=jqXHR.fail;jqXHR.complete=completeDeferred.add;jqXHR.statusCode=function(map){if(map){var tmp;if(state<2){for(tmp in map){statusCode[tmp]=[statusCode[tmp],map[tmp]];}}else{tmp=map[jqXHR.status];jqXHR.then(tmp,tmp);}}
return this;};s.url=((url||s.url)+"").replace(rhash,"").replace(rprotocol,ajaxLocParts[1]+"//");s.dataTypes=jQuery.trim(s.dataType||"*").toLowerCase().split(rspacesAjax);if(s.crossDomain==null){parts=rurl.exec(s.url.toLowerCase());s.crossDomain=!!(parts&&(parts[1]!=ajaxLocParts[1]||parts[2]!=ajaxLocParts[2]||(parts[3]||(parts[1]==="http:"?80:443))!=(ajaxLocParts[3]||(ajaxLocParts[1]==="http:"?80:443))));}
if(s.data&&s.processData&&typeof s.data!=="string"){s.data=jQuery.param(s.data,s.traditional);}
inspectPrefiltersOrTransports(prefilters,s,options,jqXHR);if(state===2){return false;}
fireGlobals=s.global;s.type=s.type.toUpperCase();s.hasContent=!rnoContent.test(s.type);if(fireGlobals&&jQuery.active++===0){jQuery.event.trigger("ajaxStart");}
if(!s.hasContent){if(s.data){s.url+=(rquery.test(s.url)?"&":"?")+s.data;delete s.data;}
ifModifiedKey=s.url;if(s.cache===false){var ts=jQuery.now(),ret=s.url.replace(rts,"$1_="+ts);s.url=ret+((ret===s.url)?(rquery.test(s.url)?"&":"?")+"_="+ts:"");}}
if(s.data&&s.hasContent&&s.contentType!==false||options.contentType){jqXHR.setRequestHeader("Content-Type",s.contentType);}
if(s.ifModified){ifModifiedKey=ifModifiedKey||s.url;if(jQuery.lastModified[ifModifiedKey]){jqXHR.setRequestHeader("If-Modified-Since",jQuery.lastModified[ifModifiedKey]);}
if(jQuery.etag[ifModifiedKey]){jqXHR.setRequestHeader("If-None-Match",jQuery.etag[ifModifiedKey]);}}
jqXHR.setRequestHeader("Accept",s.dataTypes[0]&&s.accepts[s.dataTypes[0]]?s.accepts[s.dataTypes[0]]+(s.dataTypes[0]!=="*"?", "+allTypes+"; q=0.01":""):s.accepts["*"]);for(i in s.headers){jqXHR.setRequestHeader(i,s.headers[i]);}
if(s.beforeSend&&(s.beforeSend.call(callbackContext,jqXHR,s)===false||state===2)){jqXHR.abort();return false;}
for(i in{success:1,error:1,complete:1}){jqXHR[i](s[i]);}
transport=inspectPrefiltersOrTransports(transports,s,options,jqXHR);if(!transport){done(-1,"No Transport");}else{jqXHR.readyState=1;if(fireGlobals){globalEventContext.trigger("ajaxSend",[jqXHR,s]);}
if(s.async&&s.timeout>0){timeoutTimer=setTimeout(function(){jqXHR.abort("timeout");},s.timeout);}
try{state=1;transport.send(requestHeaders,done);}catch(e){if(state<2){done(-1,e);}else{throw e;}}}
return jqXHR;},param:function(a,traditional){var s=[],add=function(key,value){value=jQuery.isFunction(value)?value():value;s[s.length]=encodeURIComponent(key)+"="+encodeURIComponent(value);};if(traditional===undefined){traditional=jQuery.ajaxSettings.traditional;}
if(jQuery.isArray(a)||(a.jquery&&!jQuery.isPlainObject(a))){jQuery.each(a,function(){add(this.name,this.value);});}else{for(var prefix in a){buildParams(prefix,a[prefix],traditional,add);}}
return s.join("&").replace(r20,"+");}});function buildParams(prefix,obj,traditional,add){if(jQuery.isArray(obj)){jQuery.each(obj,function(i,v){if(traditional||rbracket.test(prefix)){add(prefix,v);}else{buildParams(prefix+"["+(typeof v==="object"||jQuery.isArray(v)?i:"")+"]",v,traditional,add);}});}else if(!traditional&&obj!=null&&typeof obj==="object"){for(var name in obj){buildParams(prefix+"["+name+"]",obj[name],traditional,add);}}else{add(prefix,obj);}}
jQuery.extend({active:0,lastModified:{},etag:{}});function ajaxHandleResponses(s,jqXHR,responses){var contents=s.contents,dataTypes=s.dataTypes,responseFields=s.responseFields,ct,type,finalDataType,firstDataType;for(type in responseFields){if(type in responses){jqXHR[responseFields[type]]=responses[type];}}
while(dataTypes[0]==="*"){dataTypes.shift();if(ct===undefined){ct=s.mimeType||jqXHR.getResponseHeader("content-type");}}
if(ct){for(type in contents){if(contents[type]&&contents[type].test(ct)){dataTypes.unshift(type);break;}}}
if(dataTypes[0]in responses){finalDataType=dataTypes[0];}else{for(type in responses){if(!dataTypes[0]||s.converters[type+" "+dataTypes[0]]){finalDataType=type;break;}
if(!firstDataType){firstDataType=type;}}
finalDataType=finalDataType||firstDataType;}
if(finalDataType){if(finalDataType!==dataTypes[0]){dataTypes.unshift(finalDataType);}
return responses[finalDataType];}}
function ajaxConvert(s,response){if(s.dataFilter){response=s.dataFilter(response,s.dataType);}
var dataTypes=s.dataTypes,converters={},i,key,length=dataTypes.length,tmp,current=dataTypes[0],prev,conversion,conv,conv1,conv2;for(i=1;i<length;i++){if(i===1){for(key in s.converters){if(typeof key==="string"){converters[key.toLowerCase()]=s.converters[key];}}}
prev=current;current=dataTypes[i];if(current==="*"){current=prev;}else if(prev!=="*"&&prev!==current){conversion=prev+" "+current;conv=converters[conversion]||converters["* "+current];if(!conv){conv2=undefined;for(conv1 in converters){tmp=conv1.split(" ");if(tmp[0]===prev||tmp[0]==="*"){conv2=converters[tmp[1]+" "+current];if(conv2){conv1=converters[conv1];if(conv1===true){conv=conv2;}else if(conv2===true){conv=conv1;}
break;}}}}
if(!(conv||conv2)){jQuery.error("No conversion from "+conversion.replace(" "," to "));}
if(conv!==true){response=conv?conv(response):conv2(conv1(response));}}}
return response;}
var jsc=jQuery.now(),jsre=/(\=)\?(&|$)|\?\?/i;jQuery.ajaxSetup({jsonp:"callback",jsonpCallback:function(){return jQuery.expando+"_"+(jsc++);}});jQuery.ajaxPrefilter("json jsonp",function(s,originalSettings,jqXHR){var inspectData=s.contentType==="application/x-www-form-urlencoded"&&(typeof s.data==="string");if(s.dataTypes[0]==="jsonp"||s.jsonp!==false&&(jsre.test(s.url)||inspectData&&jsre.test(s.data))){var responseContainer,jsonpCallback=s.jsonpCallback=jQuery.isFunction(s.jsonpCallback)?s.jsonpCallback():s.jsonpCallback,previous=window[jsonpCallback],url=s.url,data=s.data,replace="$1"+jsonpCallback+"$2";if(s.jsonp!==false){url=url.replace(jsre,replace);if(s.url===url){if(inspectData){data=data.replace(jsre,replace);}
if(s.data===data){url+=(/\?/.test(url)?"&":"?")+s.jsonp+"="+jsonpCallback;}}}
s.url=url;s.data=data;window[jsonpCallback]=function(response){responseContainer=[response];};jqXHR.always(function(){window[jsonpCallback]=previous;if(responseContainer&&jQuery.isFunction(previous)){window[jsonpCallback](responseContainer[0]);}});s.converters["script json"]=function(){if(!responseContainer){jQuery.error(jsonpCallback+" was not called");}
return responseContainer[0];};s.dataTypes[0]="json";return"script";}});jQuery.ajaxSetup({accepts:{script:"text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"},contents:{script:/javascript|ecmascript/},converters:{"text script":function(text){jQuery.globalEval(text);return text;}}});jQuery.ajaxPrefilter("script",function(s){if(s.cache===undefined){s.cache=false;}
if(s.crossDomain){s.type="GET";s.global=false;}});jQuery.ajaxTransport("script",function(s){if(s.crossDomain){var script,head=document.head||document.getElementsByTagName("head")[0]||document.documentElement;return{send:function(_,callback){script=document.createElement("script");script.async="async";if(s.scriptCharset){script.charset=s.scriptCharset;}
script.src=s.url;script.onload=script.onreadystatechange=function(_,isAbort){if(isAbort||!script.readyState||/loaded|complete/.test(script.readyState)){script.onload=script.onreadystatechange=null;if(head&&script.parentNode){head.removeChild(script);}
script=undefined;if(!isAbort){callback(200,"success");}}};head.insertBefore(script,head.firstChild);},abort:function(){if(script){script.onload(0,1);}}};}});var
xhrOnUnloadAbort=window.ActiveXObject?function(){for(var key in xhrCallbacks){xhrCallbacks[key](0,1);}}:false,xhrId=0,xhrCallbacks;function createStandardXHR(){try{return new window.XMLHttpRequest();}catch(e){}}
function createActiveXHR(){try{return new window.ActiveXObject("Microsoft.XMLHTTP");}catch(e){}}
jQuery.ajaxSettings.xhr=window.ActiveXObject?function(){return!this.isLocal&&createStandardXHR()||createActiveXHR();}:createStandardXHR;(function(xhr){jQuery.extend(jQuery.support,{ajax:!!xhr,cors:!!xhr&&("withCredentials"in xhr)});})(jQuery.ajaxSettings.xhr());if(jQuery.support.ajax){jQuery.ajaxTransport(function(s){if(!s.crossDomain||jQuery.support.cors){var callback;return{send:function(headers,complete){var xhr=s.xhr(),handle,i;if(s.username){xhr.open(s.type,s.url,s.async,s.username,s.password);}else{xhr.open(s.type,s.url,s.async);}
if(s.xhrFields){for(i in s.xhrFields){xhr[i]=s.xhrFields[i];}}
if(s.mimeType&&xhr.overrideMimeType){xhr.overrideMimeType(s.mimeType);}
if(!s.crossDomain&&!headers["X-Requested-With"]){headers["X-Requested-With"]="XMLHttpRequest";}
try{for(i in headers){xhr.setRequestHeader(i,headers[i]);}}catch(_){}
xhr.send((s.hasContent&&s.data)||null);callback=function(_,isAbort){var status,statusText,responseHeaders,responses,xml;try{if(callback&&(isAbort||xhr.readyState===4)){callback=undefined;if(handle){xhr.onreadystatechange=jQuery.noop;if(xhrOnUnloadAbort){delete xhrCallbacks[handle];}}
if(isAbort){if(xhr.readyState!==4){xhr.abort();}}else{status=xhr.status;responseHeaders=xhr.getAllResponseHeaders();responses={};xml=xhr.responseXML;if(xml&&xml.documentElement){responses.xml=xml;}
responses.text=xhr.responseText;try{statusText=xhr.statusText;}catch(e){statusText="";}
if(!status&&s.isLocal&&!s.crossDomain){status=responses.text?200:404;}else if(status===1223){status=204;}}}}catch(firefoxAccessException){if(!isAbort){complete(-1,firefoxAccessException);}}
if(responses){complete(status,statusText,responses,responseHeaders);}};if(!s.async||xhr.readyState===4){callback();}else{handle=++xhrId;if(xhrOnUnloadAbort){if(!xhrCallbacks){xhrCallbacks={};jQuery(window).unload(xhrOnUnloadAbort);}
xhrCallbacks[handle]=callback;}
xhr.onreadystatechange=callback;}},abort:function(){if(callback){callback(0,1);}}};}});}
var elemdisplay={},iframe,iframeDoc,rfxtypes=/^(?:toggle|show|hide)$/,rfxnum=/^([+\-]=)?([\d+.\-]+)([a-z%]*)$/i,timerId,fxAttrs=[["height","marginTop","marginBottom","paddingTop","paddingBottom"],["width","marginLeft","marginRight","paddingLeft","paddingRight"],["opacity"]],fxNow;jQuery.fn.extend({show:function(speed,easing,callback){var elem,display;if(speed||speed===0){return this.animate(genFx("show",3),speed,easing,callback);}else{for(var i=0,j=this.length;i<j;i++){elem=this[i];if(elem.style){display=elem.style.display;if(!jQuery._data(elem,"olddisplay")&&display==="none"){display=elem.style.display="";}
if(display===""&&jQuery.css(elem,"display")==="none"){jQuery._data(elem,"olddisplay",defaultDisplay(elem.nodeName));}}}
for(i=0;i<j;i++){elem=this[i];if(elem.style){display=elem.style.display;if(display===""||display==="none"){elem.style.display=jQuery._data(elem,"olddisplay")||"";}}}
return this;}},hide:function(speed,easing,callback){if(speed||speed===0){return this.animate(genFx("hide",3),speed,easing,callback);}else{var elem,display,i=0,j=this.length;for(;i<j;i++){elem=this[i];if(elem.style){display=jQuery.css(elem,"display");if(display!=="none"&&!jQuery._data(elem,"olddisplay")){jQuery._data(elem,"olddisplay",display);}}}
for(i=0;i<j;i++){if(this[i].style){this[i].style.display="none";}}
return this;}},_toggle:jQuery.fn.toggle,toggle:function(fn,fn2,callback){var bool=typeof fn==="boolean";if(jQuery.isFunction(fn)&&jQuery.isFunction(fn2)){this._toggle.apply(this,arguments);}else if(fn==null||bool){this.each(function(){var state=bool?fn:jQuery(this).is(":hidden");jQuery(this)[state?"show":"hide"]();});}else{this.animate(genFx("toggle",3),fn,fn2,callback);}
return this;},fadeTo:function(speed,to,easing,callback){return this.filter(":hidden").css("opacity",0).show().end().animate({opacity:to},speed,easing,callback);},animate:function(prop,speed,easing,callback){var optall=jQuery.speed(speed,easing,callback);if(jQuery.isEmptyObject(prop)){return this.each(optall.complete,[false]);}
prop=jQuery.extend({},prop);function doAnimation(){if(optall.queue===false){jQuery._mark(this);}
var opt=jQuery.extend({},optall),isElement=this.nodeType===1,hidden=isElement&&jQuery(this).is(":hidden"),name,val,p,e,parts,start,end,unit,method;opt.animatedProperties={};for(p in prop){name=jQuery.camelCase(p);if(p!==name){prop[name]=prop[p];delete prop[p];}
val=prop[name];if(jQuery.isArray(val)){opt.animatedProperties[name]=val[1];val=prop[name]=val[0];}else{opt.animatedProperties[name]=opt.specialEasing&&opt.specialEasing[name]||opt.easing||'swing';}
if(val==="hide"&&hidden||val==="show"&&!hidden){return opt.complete.call(this);}
if(isElement&&(name==="height"||name==="width")){opt.overflow=[this.style.overflow,this.style.overflowX,this.style.overflowY];if(jQuery.css(this,"display")==="inline"&&jQuery.css(this,"float")==="none"){if(!jQuery.support.inlineBlockNeedsLayout||defaultDisplay(this.nodeName)==="inline"){this.style.display="inline-block";}else{this.style.zoom=1;}}}}
if(opt.overflow!=null){this.style.overflow="hidden";}
for(p in prop){e=new jQuery.fx(this,opt,p);val=prop[p];if(rfxtypes.test(val)){method=jQuery._data(this,"toggle"+p)||(val==="toggle"?hidden?"show":"hide":0);if(method){jQuery._data(this,"toggle"+p,method==="show"?"hide":"show");e[method]();}else{e[val]();}}else{parts=rfxnum.exec(val);start=e.cur();if(parts){end=parseFloat(parts[2]);unit=parts[3]||(jQuery.cssNumber[p]?"":"px");if(unit!=="px"){jQuery.style(this,p,(end||1)+unit);start=((end||1)/e.cur())*start;jQuery.style(this,p,start+unit);}
if(parts[1]){end=((parts[1]==="-="?-1:1)*end)+start;}
e.custom(start,end,unit);}else{e.custom(start,val,"");}}}
return true;}
return optall.queue===false?this.each(doAnimation):this.queue(optall.queue,doAnimation);},stop:function(type,clearQueue,gotoEnd){if(typeof type!=="string"){gotoEnd=clearQueue;clearQueue=type;type=undefined;}
if(clearQueue&&type!==false){this.queue(type||"fx",[]);}
return this.each(function(){var index,hadTimers=false,timers=jQuery.timers,data=jQuery._data(this);if(!gotoEnd){jQuery._unmark(true,this);}
function stopQueue(elem,data,index){var hooks=data[index];jQuery.removeData(elem,index,true);hooks.stop(gotoEnd);}
if(type==null){for(index in data){if(data[index]&&data[index].stop&&index.indexOf(".run")===index.length-4){stopQueue(this,data,index);}}}else if(data[index=type+".run"]&&data[index].stop){stopQueue(this,data,index);}
for(index=timers.length;index--;){if(timers[index].elem===this&&(type==null||timers[index].queue===type)){if(gotoEnd){timers[index](true);}else{timers[index].saveState();}
hadTimers=true;timers.splice(index,1);}}
if(!(gotoEnd&&hadTimers)){jQuery.dequeue(this,type);}});}});function createFxNow(){setTimeout(clearFxNow,0);return(fxNow=jQuery.now());}
function clearFxNow(){fxNow=undefined;}
function genFx(type,num){var obj={};jQuery.each(fxAttrs.concat.apply([],fxAttrs.slice(0,num)),function(){obj[this]=type;});return obj;}
jQuery.each({slideDown:genFx("show",1),slideUp:genFx("hide",1),slideToggle:genFx("toggle",1),fadeIn:{opacity:"show"},fadeOut:{opacity:"hide"},fadeToggle:{opacity:"toggle"}},function(name,props){jQuery.fn[name]=function(speed,easing,callback){return this.animate(props,speed,easing,callback);};});jQuery.extend({speed:function(speed,easing,fn){var opt=speed&&typeof speed==="object"?jQuery.extend({},speed):{complete:fn||!fn&&easing||jQuery.isFunction(speed)&&speed,duration:speed,easing:fn&&easing||easing&&!jQuery.isFunction(easing)&&easing};opt.duration=jQuery.fx.off?0:typeof opt.duration==="number"?opt.duration:opt.duration in jQuery.fx.speeds?jQuery.fx.speeds[opt.duration]:jQuery.fx.speeds._default;if(opt.queue==null||opt.queue===true){opt.queue="fx";}
opt.old=opt.complete;opt.complete=function(noUnmark){if(jQuery.isFunction(opt.old)){opt.old.call(this);}
if(opt.queue){jQuery.dequeue(this,opt.queue);}else if(noUnmark!==false){jQuery._unmark(this);}};return opt;},easing:{linear:function(p,n,firstNum,diff){return firstNum+diff*p;},swing:function(p,n,firstNum,diff){return((-Math.cos(p*Math.PI)/2)+0.5)*diff+firstNum;}},timers:[],fx:function(elem,options,prop){this.options=options;this.elem=elem;this.prop=prop;options.orig=options.orig||{};}});jQuery.fx.prototype={update:function(){if(this.options.step){this.options.step.call(this.elem,this.now,this);}
(jQuery.fx.step[this.prop]||jQuery.fx.step._default)(this);},cur:function(){if(this.elem[this.prop]!=null&&(!this.elem.style||this.elem.style[this.prop]==null)){return this.elem[this.prop];}
var parsed,r=jQuery.css(this.elem,this.prop);return isNaN(parsed=parseFloat(r))?!r||r==="auto"?0:r:parsed;},custom:function(from,to,unit){var self=this,fx=jQuery.fx;this.startTime=fxNow||createFxNow();this.end=to;this.now=this.start=from;this.pos=this.state=0;this.unit=unit||this.unit||(jQuery.cssNumber[this.prop]?"":"px");function t(gotoEnd){return self.step(gotoEnd);}
t.queue=this.options.queue;t.elem=this.elem;t.saveState=function(){if(self.options.hide&&jQuery._data(self.elem,"fxshow"+self.prop)===undefined){jQuery._data(self.elem,"fxshow"+self.prop,self.start);}};if(t()&&jQuery.timers.push(t)&&!timerId){timerId=setInterval(fx.tick,fx.interval);}},show:function(){var dataShow=jQuery._data(this.elem,"fxshow"+this.prop);this.options.orig[this.prop]=dataShow||jQuery.style(this.elem,this.prop);this.options.show=true;if(dataShow!==undefined){this.custom(this.cur(),dataShow);}else{this.custom(this.prop==="width"||this.prop==="height"?1:0,this.cur());}
jQuery(this.elem).show();},hide:function(){this.options.orig[this.prop]=jQuery._data(this.elem,"fxshow"+this.prop)||jQuery.style(this.elem,this.prop);this.options.hide=true;this.custom(this.cur(),0);},step:function(gotoEnd){var p,n,complete,t=fxNow||createFxNow(),done=true,elem=this.elem,options=this.options;if(gotoEnd||t>=options.duration+this.startTime){this.now=this.end;this.pos=this.state=1;this.update();options.animatedProperties[this.prop]=true;for(p in options.animatedProperties){if(options.animatedProperties[p]!==true){done=false;}}
if(done){if(options.overflow!=null&&!jQuery.support.shrinkWrapBlocks){jQuery.each(["","X","Y"],function(index,value){elem.style["overflow"+value]=options.overflow[index];});}
if(options.hide){jQuery(elem).hide();}
if(options.hide||options.show){for(p in options.animatedProperties){jQuery.style(elem,p,options.orig[p]);jQuery.removeData(elem,"fxshow"+p,true);jQuery.removeData(elem,"toggle"+p,true);}}
complete=options.complete;if(complete){options.complete=false;complete.call(elem);}}
return false;}else{if(options.duration==Infinity){this.now=t;}else{n=t-this.startTime;this.state=n/options.duration;this.pos=jQuery.easing[options.animatedProperties[this.prop]](this.state,n,0,1,options.duration);this.now=this.start+((this.end-this.start)*this.pos);}
this.update();}
return true;}};jQuery.extend(jQuery.fx,{tick:function(){var timer,timers=jQuery.timers,i=0;for(;i<timers.length;i++){timer=timers[i];if(!timer()&&timers[i]===timer){timers.splice(i--,1);}}
if(!timers.length){jQuery.fx.stop();}},interval:13,stop:function(){clearInterval(timerId);timerId=null;},speeds:{slow:600,fast:200,_default:400},step:{opacity:function(fx){jQuery.style(fx.elem,"opacity",fx.now);},_default:function(fx){if(fx.elem.style&&fx.elem.style[fx.prop]!=null){fx.elem.style[fx.prop]=fx.now+fx.unit;}else{fx.elem[fx.prop]=fx.now;}}}});jQuery.each(["width","height"],function(i,prop){jQuery.fx.step[prop]=function(fx){jQuery.style(fx.elem,prop,Math.max(0,fx.now)+fx.unit);};});if(jQuery.expr&&jQuery.expr.filters){jQuery.expr.filters.animated=function(elem){return jQuery.grep(jQuery.timers,function(fn){return elem===fn.elem;}).length;};}
function defaultDisplay(nodeName){if(!elemdisplay[nodeName]){var body=document.body,elem=jQuery("<"+nodeName+">").appendTo(body),display=elem.css("display");elem.remove();if(display==="none"||display===""){if(!iframe){iframe=document.createElement("iframe");iframe.frameBorder=iframe.width=iframe.height=0;}
body.appendChild(iframe);if(!iframeDoc||!iframe.createElement){iframeDoc=(iframe.contentWindow||iframe.contentDocument).document;iframeDoc.write((document.compatMode==="CSS1Compat"?"<!doctype html>":"")+"<html><body>");iframeDoc.close();}
elem=iframeDoc.createElement(nodeName);iframeDoc.body.appendChild(elem);display=jQuery.css(elem,"display");body.removeChild(iframe);}
elemdisplay[nodeName]=display;}
return elemdisplay[nodeName];}
var rtable=/^t(?:able|d|h)$/i,rroot=/^(?:body|html)$/i;if("getBoundingClientRect"in document.documentElement){jQuery.fn.offset=function(options){var elem=this[0],box;if(options){return this.each(function(i){jQuery.offset.setOffset(this,options,i);});}
if(!elem||!elem.ownerDocument){return null;}
if(elem===elem.ownerDocument.body){return jQuery.offset.bodyOffset(elem);}
try{box=elem.getBoundingClientRect();}catch(e){}
var doc=elem.ownerDocument,docElem=doc.documentElement;if(!box||!jQuery.contains(docElem,elem)){return box?{top:box.top,left:box.left}:{top:0,left:0};}
var body=doc.body,win=getWindow(doc),clientTop=docElem.clientTop||body.clientTop||0,clientLeft=docElem.clientLeft||body.clientLeft||0,scrollTop=win.pageYOffset||jQuery.support.boxModel&&docElem.scrollTop||body.scrollTop,scrollLeft=win.pageXOffset||jQuery.support.boxModel&&docElem.scrollLeft||body.scrollLeft,top=box.top+scrollTop-clientTop,left=box.left+scrollLeft-clientLeft;return{top:top,left:left};};}else{jQuery.fn.offset=function(options){var elem=this[0];if(options){return this.each(function(i){jQuery.offset.setOffset(this,options,i);});}
if(!elem||!elem.ownerDocument){return null;}
if(elem===elem.ownerDocument.body){return jQuery.offset.bodyOffset(elem);}
var computedStyle,offsetParent=elem.offsetParent,prevOffsetParent=elem,doc=elem.ownerDocument,docElem=doc.documentElement,body=doc.body,defaultView=doc.defaultView,prevComputedStyle=defaultView?defaultView.getComputedStyle(elem,null):elem.currentStyle,top=elem.offsetTop,left=elem.offsetLeft;while((elem=elem.parentNode)&&elem!==body&&elem!==docElem){if(jQuery.support.fixedPosition&&prevComputedStyle.position==="fixed"){break;}
computedStyle=defaultView?defaultView.getComputedStyle(elem,null):elem.currentStyle;top-=elem.scrollTop;left-=elem.scrollLeft;if(elem===offsetParent){top+=elem.offsetTop;left+=elem.offsetLeft;if(jQuery.support.doesNotAddBorder&&!(jQuery.support.doesAddBorderForTableAndCells&&rtable.test(elem.nodeName))){top+=parseFloat(computedStyle.borderTopWidth)||0;left+=parseFloat(computedStyle.borderLeftWidth)||0;}
prevOffsetParent=offsetParent;offsetParent=elem.offsetParent;}
if(jQuery.support.subtractsBorderForOverflowNotVisible&&computedStyle.overflow!=="visible"){top+=parseFloat(computedStyle.borderTopWidth)||0;left+=parseFloat(computedStyle.borderLeftWidth)||0;}
prevComputedStyle=computedStyle;}
if(prevComputedStyle.position==="relative"||prevComputedStyle.position==="static"){top+=body.offsetTop;left+=body.offsetLeft;}
if(jQuery.support.fixedPosition&&prevComputedStyle.position==="fixed"){top+=Math.max(docElem.scrollTop,body.scrollTop);left+=Math.max(docElem.scrollLeft,body.scrollLeft);}
return{top:top,left:left};};}
jQuery.offset={bodyOffset:function(body){var top=body.offsetTop,left=body.offsetLeft;if(jQuery.support.doesNotIncludeMarginInBodyOffset){top+=parseFloat(jQuery.css(body,"marginTop"))||0;left+=parseFloat(jQuery.css(body,"marginLeft"))||0;}
return{top:top,left:left};},setOffset:function(elem,options,i){var position=jQuery.css(elem,"position");if(position==="static"){elem.style.position="relative";}
var curElem=jQuery(elem),curOffset=curElem.offset(),curCSSTop=jQuery.css(elem,"top"),curCSSLeft=jQuery.css(elem,"left"),calculatePosition=(position==="absolute"||position==="fixed")&&jQuery.inArray("auto",[curCSSTop,curCSSLeft])>-1,props={},curPosition={},curTop,curLeft;if(calculatePosition){curPosition=curElem.position();curTop=curPosition.top;curLeft=curPosition.left;}else{curTop=parseFloat(curCSSTop)||0;curLeft=parseFloat(curCSSLeft)||0;}
if(jQuery.isFunction(options)){options=options.call(elem,i,curOffset);}
if(options.top!=null){props.top=(options.top-curOffset.top)+curTop;}
if(options.left!=null){props.left=(options.left-curOffset.left)+curLeft;}
if("using"in options){options.using.call(elem,props);}else{curElem.css(props);}}};jQuery.fn.extend({position:function(){if(!this[0]){return null;}
var elem=this[0],offsetParent=this.offsetParent(),offset=this.offset(),parentOffset=rroot.test(offsetParent[0].nodeName)?{top:0,left:0}:offsetParent.offset();offset.top-=parseFloat(jQuery.css(elem,"marginTop"))||0;offset.left-=parseFloat(jQuery.css(elem,"marginLeft"))||0;parentOffset.top+=parseFloat(jQuery.css(offsetParent[0],"borderTopWidth"))||0;parentOffset.left+=parseFloat(jQuery.css(offsetParent[0],"borderLeftWidth"))||0;return{top:offset.top-parentOffset.top,left:offset.left-parentOffset.left};},offsetParent:function(){return this.map(function(){var offsetParent=this.offsetParent||document.body;while(offsetParent&&(!rroot.test(offsetParent.nodeName)&&jQuery.css(offsetParent,"position")==="static")){offsetParent=offsetParent.offsetParent;}
return offsetParent;});}});jQuery.each(["Left","Top"],function(i,name){var method="scroll"+name;jQuery.fn[method]=function(val){var elem,win;if(val===undefined){elem=this[0];if(!elem){return null;}
win=getWindow(elem);return win?("pageXOffset"in win)?win[i?"pageYOffset":"pageXOffset"]:jQuery.support.boxModel&&win.document.documentElement[method]||win.document.body[method]:elem[method];}
return this.each(function(){win=getWindow(this);if(win){win.scrollTo(!i?val:jQuery(win).scrollLeft(),i?val:jQuery(win).scrollTop());}else{this[method]=val;}});};});function getWindow(elem){return jQuery.isWindow(elem)?elem:elem.nodeType===9?elem.defaultView||elem.parentWindow:false;}
jQuery.each(["Height","Width"],function(i,name){var type=name.toLowerCase();jQuery.fn["inner"+name]=function(){var elem=this[0];return elem?elem.style?parseFloat(jQuery.css(elem,type,"padding")):this[type]():null;};jQuery.fn["outer"+name]=function(margin){var elem=this[0];return elem?elem.style?parseFloat(jQuery.css(elem,type,margin?"margin":"border")):this[type]():null;};jQuery.fn[type]=function(size){var elem=this[0];if(!elem){return size==null?null:this;}
if(jQuery.isFunction(size)){return this.each(function(i){var self=jQuery(this);self[type](size.call(this,i,self[type]()));});}
if(jQuery.isWindow(elem)){var docElemProp=elem.document.documentElement["client"+name],body=elem.document.body;return elem.document.compatMode==="CSS1Compat"&&docElemProp||body&&body["client"+name]||docElemProp;}else if(elem.nodeType===9){return Math.max(elem.documentElement["client"+name],elem.body["scroll"+name],elem.documentElement["scroll"+name],elem.body["offset"+name],elem.documentElement["offset"+name]);}else if(size===undefined){var orig=jQuery.css(elem,type),ret=parseFloat(orig);return jQuery.isNumeric(ret)?ret:orig;}else{return this.css(type,typeof size==="string"?size:size+"px");}};});window.jQuery=window.$j=jQuery;if(typeof define==="function"&&define.amd&&define.amd.jQuery){define("jquery",[],function(){return jQuery;});}})(window);
// JavaScript Document	公共js
// JavaScript Document
var	isIE 	= /msie/i.test(navigator.userAgent);			// 是否是 IE
var isIE6 	= /msie(\s?)6.0/i.test(navigator.userAgent);	// 是否是  IE 6
var isIE7 	= /msie(\s?)7.0/i.test(navigator.userAgent);	// 是否是  IE 6
var isIE8 	= /msie(\s?)8.0/i.test(navigator.userAgent);	// 是否是  IE 6

var DONATEID = 2839280;		// 2010-03-18 11:16:34 赠送2万个现金特殊活动的帖子ID
/**
 * 由于 jquery 的冲突，己把 jquery 的命名空间改为   $j
 */
var is_newsNum_live_mouseover = 0;
var is_newsNum_live_mouseover_execute = 0;
//页面初始化
$j(function(){
	//若用户已登录，取用户信息
	if($j("#mzCust").attr("rel") == 1){
		if(!navigator.userAgent.match(/pad|gt-p1000/i) && $j('#footer_mobile_switch').length == 0 && navigator.userAgent.match(/android|webos|ip(hone|od)|opera (mini|mobi|tablet)|iemobile|windows.+phone|mobile|fennec|kindle (Fire)|maemo|blackberry|playbook|bb10\; (touch|kbd)|Symbian(OS)|Ubuntu Touch/i)){
			var mobile_switch = '<a id= "footer_mobile_switch" class="bottoma" href="javascript:goto_mobile_href();">触屏版</a>'+
            					'<img class="footline" src="//bbs.res.meizu.com/resources/php/bbs/static/common/images/default/space.gif">';
			$j('#footer1').prepend(mobile_switch);
		}
	}
	if($j("#mzCust").attr("attribute") == 1){

		if(is_newsNum_live_mouseover<=0){
			is_newsNum_live_mouseover = 1;
			$j("#newsNum").live('mouseover',function(){
				if(is_newsNum_live_mouseover_execute<=0){
					is_newsNum_live_mouseover_execute = 1;
					newsLevelFun();

				}
			});
		}
		getNoticeAll();
	}
	//网站语言切换
	$j(".globalName").hover(function(){
		$j("#globalContainer").show();
	},function(){
		$j("#globalContainer").hide();
	})

//        if(isIE){
//            var urlis = window.location.toString();
//            var urlid = url.split('#')[1];
//            if(urlid == 'f_pst'){
//                alert('1111');
//            }
//        }
})

// 去掉a标签的虚线框
try{
$j(
  	function (){
	  	// onfocus="this.blur()" hidefocus
            if(isIE){
                $j("a").attr('hidefocus','true');
            }
	}
);
}catch(e){}

//判断浏览器类型（pc/mobile）
var _browser={
	versions:function(){
		var u = navigator.userAgent, app = navigator.appVersion;
		return {
			trident: u.indexOf('Trident') > -1, //IE内核
			presto: u.indexOf('Presto') > -1, //opera内核
			webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
			gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
			mobile: !!u.match(/AppleWebKit.*Mobile.*/)||!!u.match(/AppleWebKit/), //是否为移动终端
			ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
			android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器
			iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者QQHD浏览器
			iPad: u.indexOf('iPad') > -1, //是否iPad
			webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
		};
	}()
}
// 首页的 js
index_js = {
	init:function(){
		this.load_index_list('load_index_list');
		this.scroll_last();	// 滚动条到最后， 开始加载数据

		change_box.init( $j('.tagbox') );
		change_box.init( $j('.tagbox2') );

		var tttt=new picTurn();
		tttt.picControl();

		var tuji1	= new tuji_show_desc();
		tuji1.init('tuji_frame1');
		var tuji2	= new tuji_show_desc();
		tuji2.init('tuji_frame2');


		//index_js.initImage($j);


		public.public_mouseover();

		//index_js.change_roll_html(1);
		//index_js.change_roll_html(2);
		//index_js.change_roll_html(3);

	},
	change_roll_html:function (id){	// 改变滚动的名字
		try{

			var html 	= document.getElementById('bbs_roll_img'+id).innerHTML;
			document.getElementById('roll_control_'+id).innerHTML	= html;
			html2 	= $j('#roll_control_'+id).text();
			document.getElementById ('roll_control_'+id).title = html2;

		}catch(e){}
	},
	load_index_list:function (id){
		$j('#'+id).click(function (){
			var self2 	= this;
			thisobj		= $j(this);
			if( thisobj.attr('is_lock')=='1' ){
				return ;
			}
			rhref	= thisobj.attr('rhref');
			page 	= $1.cint(thisobj.attr('page'))
			thisobj.attr('is_lock', '1');

			$j.ajax({url:rhref,
				   dataType:'json',
				   type:"GET",
				   data:{page:page},
				   async:false,
				   success:function(rest){
					   	try{
        				$j("#"+id).before(rest['data']);
						$j("#"+id).attr('page', rest['page']);

						if(rest['is_last']=='true'){	// 己经没有加载。    退出
							$j("#"+id).remove();
						}
						}catch(e){}
						$j(self2).attr('is_lock', '0');
    			   }});

		});

	},
	scroll_last:function(){
		$j(window).scroll(function(){
			dh 	= $j(document).height();
			wh 	= $j(window).height();
			st	= $1.__scrolltop();

			if((st+wh*2)>dh){
				//auth_load	= $1.cint( $j('#load_index_list').attr('auth_load') );		// auth_load 加载的次数
				//auth_load++;
				page	= $1.cint( $j('#load_index_list').attr('page') );
				if(page<=2){	// 最多自动加载 2次
					$j('#load_index_list').click();

					//$j('#load_index_list').attr('auth_load', auth_load);
				}
			}
		});
	}
};


function click_href(id){
    var url     = $j("#"+id).attr("rhref");
    $1.__href(url);
}

// 首页刷新按钮
var refresh_click_look 	= false;
function refresh_click(){
	if(refresh_click_look==true){
		return ;
	}
	refresh_click_look 	= true;
        var rand =  Math.ceil(Math.random(1,10000)*100000);
	$j.getJSON('/index_new_thread.php?'+rand ,function(data){
		refresh_click_look 	= false;
		if( $1.cint(data['status'])==1){
			$j('#new_threadlist').html(data['data']);
			delete_bottom_line();
		}
	});
}

//新注册用户邮箱检测
function check_email(){
        var rand =  Math.ceil(Math.random(1,10000)*100000);
        $j.ajax({
                type:'GET',
                url:'/check_email.php?'+rand,
                dataType:'json',
                success:function(data){
                        var url = window.location.href+'#f_pst';
                        if(data['status'] == 1){
                               window.location= url;
                               window.location.reload();
                        }else{
                               window.location= 'https://member.meizu.com/uc/webjsp/member/detail';
                        }
                }
        })
}



function delete_bottom_line(){
	tr 	= $j("#new_threadlist").find("table").find('tr').length;
	$j("#new_threadlist").find("table").find('tr').eq(tr-1).addClass('tr_threadlist_last');

	tr 	= $j("#index_threadlist").find("table").find('tr').length;
	$j("#index_threadlist").find("table").find('tr').eq(tr-1).addClass('tr_threadlist_last');
}






// heyuejuan function 的封装
/*==================               常用对象        =====================*/
$1	= {
	testfun:function(val){alert(val);},

	get_id:function(id){						// 获得 id 对象
		return document.getElementById(id);
	},
	get_name:function(name){					// 获得 name 对象
		return document.getElementsByName(name);
	},
	get_elem:function(element){					// 获得元素对象
		return document.getElementsByTagName(element);
	},
	gb:function(){								// IE 清除内存
		if(isIE){
			try{
				CollectGarbage();
			}catch(e){}
		}
	},
	rand:function(num){							// 生成一个随机数  最大值  生成  0-num 之间的值
		return this.cint(num*Math.random());
	},
	trim:function(str){							// 去掉前后空格
		if(!str)	return '';
		if(str==undefined) return '';
		if( ! isNaN(str) ) return str;
		return str.replace(/(^\s*)|(\s*$)/g, "");
	},
	cint:function(value){						//  parseInt  转成数字  整型
		if( (!value))	return 0;
		var number	=  parseInt(value,10);
		if(isNaN(number)) return 0;
		return number;
	},
	cNumber:function(value){					// 转成数字型  整型与浮点型
		if( (!value))	return 0;
		var number	=  Number(value);
		if(isNaN(number)) return 0;
		return number;
	},
	cabs:function(value){						// 取整
		number	= this.cNumber(value);
		number	= Math.abs(number);
		return number;
	},
	__eval:function(rest){						// 解析 json 成数组    返回数组   或 执行
		try{
			var obj	= eval("(" + rest + ")");
		}catch(e){
			var obj	= rest;
		}
		return obj;
	},
	is_email:function(email){					// 检测  email
		 var myreg = /^[_.0-9a-zA-Z-]+@([0-9a-zA-Z-]+\.)+[a-zA-Z]{2,3}$/;
		 return myreg.test(email);
	},
	__scrolltop:function(){						// 滚动条高度
		var scrollTop=0;
		if(document.documentElement&&document.documentElement.scrollTop){
			scrollTop=document.documentElement.scrollTop;
		}else if(document.body){
			scrollTop=document.body.scrollTop;
		}
		return scrollTop;
	},
	__scrollleft:function(){
		var scrollLeft=0;
		if(document.documentElement&&document.documentElement.scrollLeft){
			scrollLeft=document.documentElement.scrollLeft;
		}else if(document.body){
			scrollLeft=document.body.scrollLeft;
		}
		return scrollLeft;
	},
	url_split:function(url){						//  把 url 后的参数分割  返回 arr行
		var url_arr		= new Array();
		if(! url){	url	= window.location.href;}//没有传参表示用现在的url的
		var urls_a		= url.split('?');
		if(! urls_a[1]) urls_a[1] = urls_a[0];
		if(urls_a[1]){
			urls_a2 		= urls_a[1].split('&');
			for(key in urls_a2){
				urls_a3		= urls_a2[key].split('=');
				if(urls_a3[0] && urls_a3[1]){
					url_arr[urls_a3[0]] = urls_a3[1];
				}
			}
		}
		return url_arr;
	},
	url_com:function(url_arr){					// /* 把 url 的数组的数据  组合 */
		var url			= window.location.href;
		var urls_a		= url.split('?');
		var aurl		= urls_a[0];
		aurl 			= aurl + '?';
		var n 			= 0;

		for(key in url_arr){
			if(url_arr[key]){
				if(n>0)	aurl = aurl + '&';
				// arr_key	= decodeURIComponent(url_arr[key]);  //encodeURI
				arr_key		= url_arr[key]+'';
				arr_key		= $1.__encodeURI(arr_key);
				aurl	= aurl + key + '=' + arr_key;
			}
			n++;
		}
		return aurl;
	},
	middle_site:function($screen , $min ){		// 计算中间位置
		return ($screen/2)-($min/2);
	},
	obj_json:function(o){  						// 对象转 json 字符串   0 必须是对象
		var r = [];
		if(typeof o =="string") return "\""+o.replace(/([\'\"\\])/g,"\\$1").replace(/(\n)/g,"\\n").replace(/(\r)/g,"\\r").replace(/(\t)/g,"\\t")+"\"";
		if(typeof o =="undefined") return "\"\"";
		if(typeof o == "object"){
			if(o===null) return "null";
			else if(!o.sort){
				for(var i in o){  r.push("\""+i+"\""+":"+this.obj_json(o[i])); }
				r="{"+r.join()+"}";
			}else{
				for(var i =0;i<o.length;i++)  r.push(this.obj_json(o[i])) ;
				r="["+r.join()+"]";
			}
			return r;
		}else if(typeof o == "number"){
			return "\""+o+"\"";
		}else{
			return "\"\"";
		}
		return o.toString();
	},
	__reload:function(){						//重新装入当前页面
		window.location.reload();
	},
	__href:function(url){							// 页面跳转 与刷新网站
		window.location.href	= url;
	},
	__confirm:function(msg){						// 提示框
		if(! msg){	msg = "确定？"; }
		if (confirm(msg)==true){
			return true;
		}else{
			return false;
		}
	},
	time:function(){							// 获得 时间  秒 linux
		var now = new Date();
		return this.cint( now.getTime()/1000 );
	},
	is_int:function(str){						// 获得 整型  正负都是	return boolen
		var re = new RegExp(/^(-|\+)?\d+$/);
		return re.test(str);
	},
	is_positive_int:function(str){				// 正整 数 	return boolen
		var re = new RegExp(/^\d+$/);
		return re.test(str);
	},
	is_float:function(str){						// 浮点型
		var pos = new RegExp(/^(-|\+)?\d+(\.\d+)?$/);
		return re.test(str);
	},
	is_not_string:function(str){				// 特殊字符  return boolen     true 没有
		var reg = /^[\da-zA-Z\-\_\*]*$/;
		return reg.test(str);
	},
	is_phone:function(str){						// 手机格试
		//var reg = new RegExp(/^[\d]{4}(\-)?(([\d]{7,8})|([\d]{3,4}))$/);
		if(str.length!=11){
			return false;
		}
		var reg = new RegExp(/^0{0,1}(13[0-9]|15[0-9]|18[0-9]|14[0-9]|16[0-9])[0-9]{8}$/);
		return reg.test(str);
	},
	__focus:function(obj){						// 对象焦点的输入点移动到最后		只有  IE     如果是 query  这样传 a = $("#abc")  $1.__focus(a[0])
		if(isIE){								//					js 这样传   $1.__focus($1.get_id("abc"))
			try{
				var   r   = obj.createTextRange();
				r.moveStart('character',obj.value.length);
				r.collapse(true);
				r.select();
			}catch(e){}
		}
	},
	__encodeURI:function(url){					// url 转码
		//if(url.indexOf("%")<0){
			url 	= decodeURIComponent(url);
			url 	= encodeURI(url);
		//}
		return url;
	},
	check_submit:function(id){					//  数据提交
		document.getElementById(id).submit();
	},
	getCookie:function(c_name){		// 获得 cookie 的值
		if(document.cookie.length>0){
			c_start=document.cookie.indexOf(c_name + "=")
			if(c_start!=-1){
				c_start=c_start + c_name.length+1
				c_end=document.cookie.indexOf(";",c_start)
				if(c_end==-1) c_end=document.cookie.length;
				return unescape(document.cookie.substring(c_start,c_end))
			}
		}
		return ""
	},
	setCookie:function(name,value){	// 写cookies		neme是key   value 是值
		var Days	= 30;
		var exp		= new Date();
		exp.setTime(exp.getTime() + Days*24*60*60*1000);
		document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
	},
	delCookie:function(name){	//删除cookies
		var exp 	= new Date();
		exp.setTime(exp.getTime() - 1);
		var cval	= getCookie(name);
		if(cval!=null){
			document.cookie	= name + "="+cval+";expires="+exp.toGMTString();
		}
	}



}
/*==================               常用对象        =====================*/










public = {
	init:function(){
		this.hide_window();
		this.document_click();
	},
	public_mouseover:function (){
		/*
		$j("body").mouseover(function (){
			// //if( !(isIE6 || isIE7 || isIE8) ){
			// //	$j(".tuji_desc").slideUp('slow');
			// //}

		});
		*/
	},
	box_simcheck:function(specify){	// 选中按钮		specify 要转移到的选中按钮的 class 里去
		/*
		$j(".box_simcheck").live('click',function(event){
			obj 	= $j(this).parents('.o').find('.'+specify);
			checked	= $j(obj).attr('checked');
			if(checked){
				$j(obj).attr('checked',false);
				$j(this).parents('.o').removeClass('checked_simcheck');
			}else{
				$j(obj).attr('checked',true);
				$j(this).parents('.o').addClass('checked_simcheck');
			}

			event.stopPropagation();
			event.preventDefault();
		});
		*/
		$j(".box_simcheck").click(function(event){
			obj 	= $j(this).parents('.o').find('.'+specify);

			checked	= $j(obj).attr('checked');
			if(checked){
				$j(obj).attr('checked',false);
				$j(this).parents('.o').removeClass('checked_simcheck');
			}else{
				$j(obj).attr('checked',true);
				$j(this).parents('.o').addClass('checked_simcheck');
			}

			event.stopPropagation();
			event.preventDefault();
		});

	},
	hide_window:function (){
		/*
		$j(".fwinmask").live('mouseleave', function(){
			wid 	= $j(this).attr('id');
			$j(document).click(function(){
				try{
					awid 	= wid.substr(5);
					hideWindow(awid);
					hideWindow('comment');


				}catch(e){}
			});
		});
		*/


		/*
		$j(document).click(function(){
			try{
				fwinobj	= $j("#append_parent").find(".fwinmask");
				fwinlen = fwinobj.length;
				var i = 0;
				for(i=0;i<fwinlen; i++){
					wid	 = $j(fwinobj[i]).attr('id');
					if(wid!='fwin_showblock' && wid!='fwin_cropper'){
						awid 	= wid.substr(5);
						hideWindow(awid,0);
					}
				}

				hideWindow('comment',0);
			}catch(e){}
		});
		*/


	},
	document_click:function(){

		$j(document).live('click',function(e){
			$j(".space_card_user_box").hide();
			$j(".sign_card_user_box5").hide();
		});

	}
};
public.init();






/**
 * 切换框
 * cs 是框的 class
 * 		页框头为 tag_tags->tg	  	活动为  activity
 * 		页框内容	tag_main->ctag
 * 调用方法如  change_box.init('tagbox');
 */
change_box = {
	init:function(obj){

		//try{
			var tabs = $j(obj).find(".tag_tags .tg");
			if(!tabs[0]){
				return ;
			}

			var mains = $j(obj).find(".tag_main .ctag");
			if(!mains[0] ) 	return;

			active_obj 	= $j(obj).find(".tag_tags .activity");
			index		= $j(tabs).index(active_obj);
			if(index>=(tabs.length-1) ) index = tabs.length-1;

			tabs.css("cursor","pointer");


			for(var i = 0 ;i<tabs.length ; i++ ){
				tabs[i].val = i;
				//获得CSS
				var cls_name = tabs[i].className;

				if(i==index){
					$j(tabs[i]).addClass('activity');
					mains[i].style.display = "block";
				}else{
					$j(tabs[i]).removeClass('activity');
					mains[i].style.display = "none";
				}
				$j(tabs[i]).live('click mousemove', function() {
					for(var k=0;k<tabs.length;k++){//上框架
						$j(tabs[k]).removeClass('activity');
					}

					$j(this).addClass('activity');

					mains.hide();  //下框架
					mains[this.val].style.display = "block";

				} );


			}
		//}catch(e){}

	}

}

/**
 * 头像浮动框
 * new avatar_drift();
 *
 * isdrift="true"  为标记的所有都显示浮动框
 */
var avatar_drift_geturl_lock = new Object();
var avatar_drift_mouseover	= new Object();	// 1,0
function avatar_drift(){}
avatar_drift.prototype = {
	init:function(){
		this.load_user_data();

	},
	load_user_data:function(){	// http://bbs2.meizu.com/home.php?mod=space&uid=409691&ajaxmenu=1&inajax=1&ajaxtarget=card_2775_menu_content
		var clsself 	= this;
		$j("[isdrift='true']").parent().mouseenter(function (){
			$j(this).find("[isdrift='true']").css("cursor","pointer");
			var uid		= $j(this).find("[isdrift='true']").attr('uid');
			avatar_drift_mouseover[uid]	= 1;
			html_id 	= 'space_card_new_'+uid;


			soffset	= $j(this).find("[isdrift='true']").offset();
			imgleft	= soffset.left;
			imgtop	= soffset.top
			html_top	= imgtop - 20;
			html_left	= imgleft - 20;

			if( $j('#'+html_id).length>0 ){
				$j('#'+html_id).css('top',html_top+'px').css('left',html_left+'px');

				$j('#'+html_id).show();return ;
			}
			if(avatar_drift_geturl_lock[uid]==1)	return ;	// 被锁定,退出



			setTimeout(function(){clsself.auto_load_userinfo(uid, html_left, html_top)},500);



		});

		$j("[isdrift='true']").parent().mouseleave(function(){
			var uid		= $j(this).find("[isdrift='true']").attr('uid');
			avatar_drift_mouseover[uid]	= 0;

		});

		$j(".space_card_user_box").live('mouseleave', function(){
			$j(this).hide();
		});

	},
	auto_load_userinfo:function(uid , imgleft , imgtop ){	// uid, 对象left , 对象top\
		if(avatar_drift_mouseover[uid]!=1){return ;}

		avatar_drift_geturl_lock[uid]	= 1;
		$j.ajax({
			type: 'GET',
			url: 'home.php?mod=space&uid='+uid+'&ajaxmenu=1&inajax=1&card=space_card_new',
			cache: false,
			success: function(data){
				html_id 	= 'space_card_new_'+uid;
				html 	= '<div id="'+html_id+'" class="space_card_user_box" style="position:absolute;display:none;top:'+html_top+'px;left:'+html_left+'px; " >';
				html 	+= data;
				html 	+= '</div>';

				$j("#append_parent").append(html);
				avatar_drift_geturl_lock[uid] = 0;

				if(avatar_drift_mouseover[uid]==1){
					$j("#"+html_id).show();
				}
			}

		});
	}
}




// 菜单框初使化	aa = new menu_box();
function menu_box(){};
menu_box.prototype	= {
	box_class:'',
	viewtype:'',
	init:function(ls , viewtype){
		this.box_class	= ls;
		this.viewtype	= viewtype;
		this.mouse_move();
		this.mouse_click();
		this.box_menu();
		this.mouse_leave();


		// 选中的移上
		selct_obj	= $j( "."+ this.box_class + " .son_menu li[is_select]");
		if(selct_obj.length>0){
			var vl		 = $j(selct_obj).attr('vl');
			var html 	= $j(selct_obj).html();
			arrow_dark_len 	= $j( "."+ this.box_class + " .box_menu").find('.arrow_dark').length;
			if(arrow_dark_len>=1){
				html	= html + '<span class="arrow_dark"></span>';
			}
			$j( "."+ this.box_class + " .box_menu").attr('vl',vl);
			$j( "."+ this.box_class + " .box_menu").attr('value',vl);
			$j( "."+ this.box_class + " .box_menu").html(html);
		}

	},
	mouse_move:function(){	// 鼠标移上去
		var self	= this;

		$j( "."+ this.box_class + " .son_menu li").mousemove(function(){
			$j( "."+ self.box_class + " .son_menu li").removeClass('activity');

			$j(this).addClass('activity');


		});
	},
	mouse_click:function(){
		var self	= this;
		$j( "."+ this.box_class + " .son_menu li").click(function(){
			var html	= $j(this).html();
			var value	= $j(this).attr("vl");
			arrow_dark_len 	= $j( "."+ self.box_class + " .box_menu").find('.arrow_dark').length;
			if(arrow_dark_len>=1){
				html	= html + '<span class="arrow_dark"></span>';
			}
			$j( "."+ self.box_class + " .box_menu").html(html);
			$j( "."+ self.box_class + " .box_menu").attr('value',value);
			$j( "."+ self.box_class + " .box_menu").attr('vl',value);

			$j( "."+ self.box_class + " .son_menu").hide();

			// URL跳转 个人中心--帖子
			filter	= $j( "."+ self.box_class + " .box_menu").attr('filter');
			if(filter=='true'){
				self.filter();
			}
			// URL跳转 个人中心--关系--好友
			change_group	= $j( "."+ self.box_class + " .box_menu").attr('change_group');
			if(change_group=='true'){
				self.change_group();
			}
			if(self.box_class == "select_box_4"){
				self.post_uid(value);
			}
		});
	},
	box_menu:function(){
		var self	= this;
		$j( "."+ this.box_class + " .box_menu").click(function(e){
			$j(".son_menu").hide();

			is_hidden	= $j( "."+ self.box_class + " .son_menu").is(":hidden")
			if(is_hidden){
				$j( "."+ self.box_class + " .son_menu").show();
			}else{
				$j( "."+ self.box_class + " .son_menu").hide();
			}
			//$j( "."+ self.box_class + " .son_menu").toggle();
			e.stopPropagation();
		});
	},
	filter:function (){		// 跳转
		var filter 	= $j( ".select_box_1 .box_menu").attr('vl');
		var fid 	= $j( ".select_box_2 .box_menu").attr('vl');

		location.replace('/forum.php?mod=guide&view=my&type=' + this.viewtype + '&filter=' + filter + '&fid=' + fid);
	},
	change_group:function (){	// 跳转
		var fkey 	= $j( "."+this.box_class+" .box_menu").attr('vl');
		location.replace('/home.php?mod=space&do=friend&group=' + fkey);
	},
	post_uid:function(_vl){
		var items = $j("#friend_ul li");
		var uArray = [];
		items.each(function(){
			var _uId = $j(this).attr("attribute");
			if($j(this).find(".checked_simcheck").length>=1){
				uArray.push(_uId);
			}
		})
		var uString = uArray.join(",");

		$j.ajax({
			type:"GET",
			url:"/home.php?mod=spacecp&ac=friend&op=changegroup&uid="+encodeURIComponent(uString)+"&group="+_vl+"&inajax=1&changegroupsubmit=true&handlekey=friend_group_2&formhash=e4c05c7d",
			success:function(){
				setTimeout(function(){$1.__reload();},2000);
				if(uString==''){
					showDialog('请选择用户', 'right', null, null, 0, null, null, null, null, null, 3);
				}else{
					showDialog('操作成功', 'right', null, null, 0, null, null, null, null, null, 3);
				}

			}
		})
	},
	mouse_leave:function(){
	   var self	= this;
		$j( "."+ this.box_class + " .son_menu").live("mouseleave",function(){
			var _box = $j( "."+ self.box_class + " .son_menu");
			$j(document).click(function(){
				$j(".son_menu").hide();
			})
		})
	}
}



// 回到顶部
function goto_top(){}
goto_top.prototype 	= {
	init:function(){
		var self 	= this;
		self.scrolltop2_click();
		self.scrolltop2_mousemove();

		$j(window).scroll(function(){
			// dh 	= $j(document).height();// 页面总高度
			wh 	= $j(window).height();	// 页面可视高度
			wh2 = wh/2;
			st	= $1.__scrolltop();
			if(st>(wh+wh2)){
				self.show_scrolltop();
			}else{
				self.hide_scrolltop();
			}

		});

		// dh 	= $j(document).height();
		// wh 	= $j(window).height();
		// st	= $1.__scrolltop();
	},
	show_scrolltop:function(){
		obj 	= $j("#scrolltop2");
		offset	= $j("#wp").offset();
		scroll_left 	= offset.left+1080;

		if(obj.length>0){
			obj.show();
			if(isIE6){
				st	= $1.__scrolltop();
				wh 	= $j(window).height();
				//try{
				var top2 = $1.cint(st)+$1.cint(wh)-180;
				//}catch(e){}
				obj.css({ left: scroll_left+"px", position: "absolute" , top : top2+'px'});
			}else{

				obj.css("left",scroll_left+"px");
			}
		}else{
			html	= '<div id="scrolltop2" style="left:'+scroll_left+'px;"> </div>';
			$j("body").append(html);
		}

	},
	hide_scrolltop:function(){
		$j("#scrolltop2").hide();
	},
	scrolltop2_click:function(){
		$j("#scrolltop2").live('click', function(){
			window.scrollTo('0','0');
		});
	},
	scrolltop2_mousemove:function(){
		$j("#scrolltop2").live("mouseover",function(){
			$j(this).addClass("scrolltop2_mousemove");
		});
		$j("#scrolltop2").live("mouseleave",function(){
			$j(this).removeClass("scrolltop2_mousemove");
		});

	}
}






// 图记鼠标有移上去时	显示描述
function tuji_show_desc(){};
tuji_show_desc.prototype = {
	class_name:'',
	effect: {},	// 1 移入   2 移出  0 没有移
	init:function(name){

		this.class_name = name;
		this.mouseover();
		this.mouseout();
		this.tuji_img_box_mouseout();
	},
	mousemove:function(){	// 在里面移动
		var self	= this;
	},
	mouseover:function (){	// 移入
		var self	= this;
		$j("."+this.class_name).find("img").mouseover(function (){

			var desc 	= $j(this).attr('cc');
			try{
				desc	= emote(desc);
			}catch(e){}


			var tuji_desc 	= $j(this).parents("div.tuji_img_box").find(".tuji_desc");

			if(tuji_desc.length<=0){
				img_widht	= $j(this).width();
				img_height	= 48;
				if(img_widht<400){
					img_height	= 95;
				}
				img_widht 	= img_widht - 20;
				img_widht2 	= img_widht+4;
				rand 		= $1.rand(10000);
				html 	= '<div id="rand_'+rand+'" class="tuji_desc" style="display:none; width:'+img_widht+'px; max-height: '+img_height+'px; *width: '+img_widht2+'px;*+width: '+img_widht2+'px;" >'+desc+'</div>';
				$j(this).parents("div.tuji_img_box").append(html);	// 没有数据加入进来

			}
			var desc_obj	= $j(this).parents("div.tuji_img_box").find(".tuji_desc");
			id 	= $j(desc_obj).attr('id');
			if(self.effect[id]!=1){
				$j(desc_obj).slideDown('slow', function (){
					self.effect[id] = 1;
				});
				self.effect[id] = 1;
			}

		});
	},
	mouseout:function (){	// 移出
		var self 	= this;
		$j("."+this.class_name).find("img").mouseout(function (e){
			try{
				tuji 		= $j(this).parents("div.tuji_img_box").find(".tuji_desc");
				tuji_of 	= $j(tuji).offset();
				tuji_left	= tuji_of.left-1;
				tuji_top	= tuji_of.top-1;
				tuji_width	= $j(tuji).width()+1;
				tuji_height	= $j(tuji).innerHeight()+1;

				var xx 	= e.pageX;
				var yy 	= e.pageY;

				if( (xx>tuji_left && xx<(tuji_left+tuji_width)) && (yy>tuji_top && yy<tuji_top+tuji_height) ){
					return ;
				}else{
					var desc_obj	= $j(this).parents("div.tuji_img_box").find(".tuji_desc");
					id 				= $j(desc_obj).attr('id');
					if(self.effect[id]!=2){
						$j(desc_obj).slideUp('slow', function (){
							self.effect[id] = 2;
						});
						self.effect[id] = 2;
					}

				}
			}catch(e){}
		});
	},
	tuji_img_box_mouseout:function (){	// 隐藏
		var self 	= this;

		$j("."+this.class_name).find(".tuji_desc").live('mouseout', function(e){
			var xx = e.pageX;
			var yy = e.pageY;

			of 		= $j(this).offset();
			wid 	= $j(this).width();
			if(xx> of.left && xx<(of.left+wid)){
				if(yy<of.top){
					return ;	// 向上移去不做动作
				}
			}
			//alert(of.top);

			id 		= $j(this).attr('id');
			if(self.effect[id]!=2){
				$j(this).slideUp('slow',function (){
					self.effect[id] = 2;
				});
				self.effect[id] = 2;
			}

		});


	}
};


function img_move_float_box(){};
img_move_float_box.prototype = {
	class_name:'',
	init:function(class_name){	// 初使化
		this.class_name = class_name;
		this.mousemove();
		this.mouseout();
	},
	mousemove:function(){
		var self 	= this;
		$j("."+this.class_name).mousemove(function(){
			$j("."+self.class_name+"_absolute").show();
		});
	},
	mouseout:function(){
		var self 	= this;
		$j("."+this.class_name).mouseleave(function(e){
			$j("."+self.class_name+"_absolute").hide();
		});
	}
}


//售前售后
function customer_service(fid){
	html 	= '<div class="customer_service">';
	html 	+= '	<a target="_blank" href="http://www.meizu.com/services/repairdetail.html?action=ck&chasn=" onclick="hideMenu(\'fwin_dialog\', \'dialog\');" ><div class="custmoner1" > </div></a>';
	html 	+= '	<a target="_blank" href="http://www.meizu.com/services" onclick="hideMenu(\'fwin_dialog\', \'dialog\');"  ><div class="custmoner2" > </div></a>';
	html 	+= '	<div class="cr"></div>';
	html 	+= '	<a href="javascript:void(0);" onclick="hideMenu(\'fwin_dialog\', \'dialog\');window.open(\'/kf.php\',\'_blank\',\'height=473,width=703,fullscreen=3,top=200,left=200,status=yes,toolbar=no,menubar=no,resizable=no,scrollbars=no,location=no,titlebar=no,fullscreen=no\');" ><div class="custmoner3" ></div></a>';
	html 	+= '	<a href="forum.php?mod=post&action=newthread&fid='+fid+'&extra=" onclick="hideMenu(\'fwin_dialog\', \'dialog\');"  ><div class="custmoner4" ></div></a>';
	html 	+= '	<div class="cr"></div>';
	html 	+= '</div>';

	//showDialog('', 'info344', html);
	showDialog(html, 'info', 'not_flb_css', null, true, null, '', '', '');

}



/*pictureTurn*/
function picTurn(){};
var index_pic_num	= 0;
var index_pic_cont	= null;
var index_pic_itemW	= 1038;
var index_pic_index	= 0;
var index_pic_item = null;
var _int = null;
picTurn.prototype = {
	init : function(){
		var self	= this;
		var ox ,oy 	= 0;
		var img = document.getElementById('roll_img_cc');

		index_pic_num 	= $j(".roll_img_kk").length;
		index_pic_cont	= $j("#portal_block_500_content");
		index_pic_item  = $j("#portal_block_500_content .roll_img_kk");
                $j(".roll").hide();
                $j('.roll_opacity').hide();
                $j(".box1").mouseenter(function(){
                    var now_index = $j('.roll_small_signimg_div .current_con').index();
                    roll_title	= '<a target="_blank" href="'+$j(".roll_img_kk").eq(now_index).attr('rurl')+'">'+$j(".roll_img_kk").eq(now_index).attr('alt')+'</a>';
                    //roll_title	= '<a target="_blank" href="'+$j(".roll_img_kk").eq(index_pic_index).attr('rurl')+'">'+$j(".roll_img_kk").eq(index_pic_index).attr('alt')+'</a>';
                    $j(".roll_title").html(roll_title);
                    //picTurn.prototype.picSwitch();
                    $j('.roll_opacity').show();
                    $j('.roll').show();
                });
                $j('.box1').mouseleave(function(){
                    $j('.roll_opacity').hide();
                    $j('.roll').hide();
                });



		// 生成缩略图
		for(k=0; k<index_pic_num; k++){
			this.pic_image(k);
		}


		// 图片按下事件
		//$j(".roll_img_kk").click(function(){
		//	url 	= $j(this).attr("rurl");
		//	$1.__href(url);
		//});


		/*
		// 图片拖动事件
		$j(".roll_img_kk").mousedown(function(evt){
			org_x 	= evt.pageX;
			org_y	= evt.pageY;
			$j(".roll_img_kk").mouseup(function(evt2){
				now_x 	= evt2.pageX;
				now_y 	= evt2.pageY;
				if(org_x==0 || org_y==0){
					return false;
				}

				if( org_x-now_x>=100 ){	// 左移动
					clearTimeout(_int);
					picTurn.prototype.picSwitch();
				}else if( org_x-now_x<=-100 ){	// 右移动
					self.previous_page();
				}
				try{
					evt2.stopPropagation();
				}catch(e){
					try{
						window.event.cancelBubble	= true;
					}catch(e){}
				}
				org_x=org_y=now_x=now_y=0;
				return false;
			});

		});
		*/
		try{
			img.addEventListener('touchstart', function(event) {
				// event.preventDefault();
				try{
					self.ox = event.touches[0].pageX;
					self.oy = event.touches[0].pageY;
				}catch(e){
					try{
					self.ox = event.targetTouches[0].pageX;
					self.oy = event.targetTouches[0].pageY;
					}catch(e){}
				}

				try{
					event.stopPropagation();
				}catch(e){
					try{
						window.event.cancelBubble	= true;
					}catch(e){}
				}

			}, false);
			img.addEventListener('touchend', function(event) {
				// event.preventDefault();
				try{
					nx = event.changedTouches[0].pageX;
					ny = event.changedTouches[0].pageY;
				}catch(e){
					nx = event.targetTouches[0].pageX;
					ny = event.targetTouches[0].pageY;
				}
				if( self.ox-nx>=100 ){	// 左移动
					clearTimeout(_int);
					picTurn.prototype.picSwitch();
				}else if( self.ox-nx<=-100 ){	// 右移动
					self.previous_page();
				}

				self.ox	= 0;
				self.oy	= 0;

					try{
						event.stopPropagation();
					}catch(e){
						try{
							window.event.cancelBubble	= true;
						}catch(e){}
					}
			}, false);
		}catch(e){}


		// 按下前翻
		$j(".leftbtn_picturn").click(function(){
			self.previous_page();
		});
		// 按下后翻
		$j(".rightbtn_picturn").click(function(){
			clearTimeout(_int);
			picTurn.prototype.picSwitch();
		});
	},
	previous_page : function (){	// 上一页， （前翻）
		index_pic_index--;
		index_pic_index--;
		if(index_pic_index<0){
				index_pic_index	= index_pic_num-1;
		}
		clearTimeout(_int);
		picTurn.prototype.picSwitch();
	},
	pic_image : function (i){	// 显示image图片
		try{
                        var current_con = '';
                        if(i == 0) current_con = 'current_con';
			//src 	= $j(".roll_img_kk").eq(i).find("img").attr("src");
			src 	= $j(".roll_img_kk").eq(i).attr("src");
			html	= '<img class="roll_small_signimg '+current_con+' " width="50" height="29" src="'+src+'">';
			$j(".roll_small_signimg_div").append(html);
		}catch(e){}

	},
	picSwitch : function(){
		if(index_pic_index == index_pic_num){
			index_pic_index = 0;
		}

		left 	=  parseInt( 0- (index_pic_index * 686) ,10);
		leftpx 	= left + 'px';
		//index_pic_item.css("display","none");
		//index_pic_item.eq(index_pic_index).fadeIn(1000);//.css("display","block");
		$j(".roll_img .roll_img_cc").animate({left:leftpx}, 400);
		//$j(".roll_img #portal_block_500_content").css('left',leftpx);

		roll_title	= '<a target="_blank" href="'+$j(".roll_img_kk").eq(index_pic_index).attr('rurl')+'">'+$j(".roll_img_kk").eq(index_pic_index).attr('alt')+'</a>';
		$j(".roll_title").html(roll_title);

		$j(".roll_small_signimg").eq(index_pic_index).addClass("current_con").siblings().removeClass("current_con");
		index_pic_index++;
		clearTimeout(_int);
		_int = setTimeout("picTurn.prototype.picSwitch()",6000);
	},
	picControl : function(){

		this.init();
		var that = this;

		//index_pic_cont.css("width",index_pic_itemW*index_pic_num);
		//index_pic_cont.css("position",'absolute');return ;
		picTurn.prototype.picSwitch();
		//$j(".roll_small_signimg").removeClass("current_con");
		//$j(".roll_small_signimg").eq(0).addClass("current_con");

		//点击进度条时，控制动画效果 mouseover
		$j(".roll_small_signimg").click(function(){
			var overIndex = $j(this).index(".roll_small_signimg");
			if(index_pic_index == Number(overIndex+1)){return false;}
			clearTimeout(_int);
			index_pic_index = overIndex;
			picTurn.prototype.picSwitch();
		});
		//鼠标悬浮在图片容器上停止动画，鼠标移开开始动画
		$j("#portal_block_500_content").hover(function(){
			clearTimeout(_int);
		},function(){
			_int = setTimeout("picTurn.prototype.picSwitch()",6000);
		});
	}

};




function click_product_omit_show(){
	$j('.click_product_omit_show').click(function (){
		obj	= $j(this).parents('.pls');
		$j(obj).find('.products_omit').hide();
		$j(obj).find('.products_all').show();
	});
}











try{
	function openCropper(pic) {
		width 	= $j('#id_img_width').val();
		height	= $j('#id_img_height').val();
		bid 	= $j('#id_hidden_bid').val();
		var url = 'misc.php?mod=imgcropper&cutting_type=index_cutting&width='+width+'&height='+height+'&bid='+bid+'&ictype=block&picflag=1&img='+pic;
		showWindow('cropper', url, 'get', 0);
	}
}catch(e){}


/*鼠标悬浮去掉样式*/
function hoverSub(box,cN){
	$j(box).live({
		mouseenter: function() {
			$j(this).removeClass(cN);
		},
		mouseleave: function() {
			$j(this).addClass(cN);
		}
	});


}
/*鼠标悬浮添加样式*/
function hoverAdd(box,cN){
	$j(box).live({
		mouseenter: function() {
			$j(this).addClass(cN);
		},
		mouseleave: function() {
			$j(this).removeClass(cN);
		}
	});
}
/*input textarea 获得焦点时添加样式*/
function focusBox(box){
	var cN = "focusBox";
	$j(box).live({
		focus: function(){
			$j(this).addClass(cN);
		},
		blur: function(){
			$j(this).removeClass(cN);
		}
	})
}
/*模拟checkbox*/
var checkFun_items_live_click_object 	= new Object();
var checkFun_items_click				= new Object();	// 同一次按下只执行一次
function checkFun(items,cN){
	var self	= this;
	$j(items).each(function(){
		var checked = $j(this).find("input:checked").length;
		var checkC = checked == 0?"":cN;
		$j(this).addClass(checkC);

	});
	if(checkFun_items_live_click_object[items]){
		return ;
	}
	checkFun_items_live_click_object[items] = true;

	$j(items).bind("click",function(){
		if(checkFun_items_click[items]){
			return ;
		}

		if(items=='.wrap_full_screen'){		// 富文本与纯文件钮只执行一次
			checkFun_items_click[items]		= true;
			if($j(this).hasClass(cN)){
				$j(this).removeClass(cN);
				$j(this).find("input:checkbox").attr("checked",false);
				$j(this).find("input:checkbox").click();
			}else{
				$j(this).addClass(cN);
				$j(this).find("input:checkbox").attr("checked",true);
				$j(this).find("input:checkbox").click();
			}
			return ;
		}




		if($j(this).hasClass(cN)){
			$j(this).removeClass(cN);
			$j(this).find("input:checkbox").attr("checked",false);

			//判断是否点击纯文本链接，参数1 是取消纯文本模式
			if(this.id == "textId_1"){switchEditor(1);};

			isclick 	= $j(this).find("input:checkbox").attr('isclick');
			if(isclick=='true'){	// 允许click事件
				$j(this).find("input:checkbox").click();
			}else if( isclick=='showsyncinfo'){	// 动态 --> 广播块
				display('flw_post_subject');
				display('forumlistdev');

				var sObj = $('subject');
				sObj.value = '主题';
				strLenCalc(sObj, 'checklen', 70);
			}

		}else{
			$j(this).addClass(cN);
			$j(this).find("input:checkbox").attr("checked",true);

			//判断是否点击纯文本链接，参数0 是打开纯文本模式
			if(this.id == "textId_1"){switchEditor(0);}

			isclick 	= $j(this).find("input:checkbox").attr('isclick');
			if(isclick=='true'){	// 允许click事件
				$j(this).find("input:checkbox").click();
			}else if( isclick=='showsyncinfo'){	// 动态 --> 广播块
				display('flw_post_subject');
				display('forumlistdev');

				var sObj = $('subject');
				sObj.value = '主题';
				strLenCalc(sObj, 'checklen', 70);
			}

		}
		return false;
	});

}

function checkFun2(items){
	var cN = "checked_simcheck";
	$j(items).each(function(){
		var that = $j(this);
		var checked = $j(this).attr("checked");
		var checkC = checked == true?cN:"";
		var _wrap = '<label class="wrap_simcheck '+checkC+'"></label>'
		that.wrap(_wrap);
		that.before('<em class="box_simcheck"> </em>');
	})
	$j(".wrap_simcheck").live("click",function(){
		if($j(this).hasClass(cN)){
			$j(this).removeClass(cN);
			$j(this).find("input:checkbox").attr("checked",false);
		}else{
			$j(this).addClass(cN);
			$j(this).find("input:checkbox").attr("checked",true);

		}
		return false;
	})
}

function checkFunLine(e,cN){
		if($j(e).hasClass(cN)){
			$j(e).removeClass(cN);
			$j(e).find("input:checkbox").attr("checked",false);
		}else{
			$j(e).addClass(cN);
			$j(e).find("input:checkbox").attr("checked",true);
		}
		return false;
}

/**
 * 模拟select
 *  添加 onchange 事件
 */
var simSelectFun_islive 	= false;
function simSelectFun(items,clname){
	$j(items).each(function(){
		var that 	= $j(this);
		pclass 		= that.parent().attr('class');
		if( pclass=="simselect" ){
			return ;
		}

		var _name 	= $j(this).attr("name");
		var _id 	= that.attr("id");
		if(_name==undefined){_name=''}	// 没有数据为空
		if(_id==undefined){_id=''}	// 没有数据为空

		// 追加 onchange 事件		(heyuejaun)
		var ischange 		= that.attr('ischange');
		var change_event	= '';
		if(ischange=='true'){	// onchange 的属性只支持 单引号 ‘
			change_event 	= 'onchange="'+ that.attr('onchange')+'" ischange="true" ';
		}

		var _wrap = ['<span class="simselect">',
					'<strong title="',
					'',
					'">',
					'',
					'</strong>',
					'<em class="arrow_dark"></em>',
					'<select '+change_event+' name="'+_name+'" id="'+_id+'">',
					'',
					'</select>',
					'',
					'</span>']
		var _select = that.html();
		var _default = that.find("option:eq(0)").text();
		_wrap[2] = _wrap[4] = _default;
		_wrap[8] = _select;
		var w = that.width();
		w = w == 0?110:w+15;
		var array = [];
		var listItem 		= that.find("option");
		var selectedItem;

		listItem.each(function(){
			var isSelected = $j(this).is(":selected");
			if(isSelected == true){
				selectedItem = $j(this).text();
				_wrap[2] = _wrap[4] = selectedItem;
			};
			array.push({"key":$j(this).attr("value"),"value":$j(this).text()});
		})
		if(array.length > 6){
			var list = "<ul class='selectbox_simu' style='width:"+w+"px;height:240px;overflow-y:auto;'>";
		}else{
			var list = "<ul class='selectbox_simu' style='width:"+w+"px;'>";
		}
		for(i=0;i<array.length;i++){
			var cont = listItem
			if(i != array.length-1){
				list += "<li><a attribute='"+array[i].key+"'>"+array[i].value+"</a></li>";
			}else{
				list += "<li style='border:none;'><a attribute='"+array[i].key+"'>"+array[i].value+"</a></li>";
				list += "</ul>";
			}
		}
		_wrap[10] = list;
		that.replaceWith(_wrap.join(''));

	})
	if(simSelectFun_islive){	// live 只能用一次
		return ;
	}
	simSelectFun_islive = true;
	$j(".simselect strong").live("click",function(e){
		$j(".selectbox_simu").hide();
		$j(".simselect").css("z-index","");//为兼容IE6、7下层级问题
		$j(this).parent(".simselect").css("z-index","9")
		$j(this).parent(".simselect").find(".selectbox_simu").show();
		e.stopPropagation();
	})

	$j(".simselect").find("li a").live("click",function(){
		var _attr = $j(this).attr("attribute");
		var _val = $j(this).text();
		var _p = $j(this).parents(".simselect");
		var _box = $j(this).parents(".selectbox_simu");
		_p.css("z-index","");//为兼容IE6、7下层级问题
		_p.find("option").attr("selected",false);
		_p.find("option[value='" + _attr + "']").attr("selected",true);
		_p.find("strong").text(_val).attr("title",_val);

		if(_p.find("select").attr('ischange')=='true'){	// 响应 change 事件		(heyuejaun)
			_p.find("select").trigger('change');
		}

		_box.hide();
	})
	$j(".simselect").live("mouseleave",function(){
		var _that = $j(this);
		var _box = $j(".selectbox_simu:visible");
		$j(document).click(function(){
			_box.hide();
			_that.css("z-index","");//为兼容IE6、7下层级问题
		})
	})
}
/*日期控件触发框*/
function timeControlBox(items){
	$j(items).each(function(){
		var that = $j(this);
		var _wrap = '<span class="wrap_timecon"></span>'
		that.wrap(_wrap);
		that.before('<em class="arrow_dark"></em>');
	})
}
/*获得焦点添加样式，失去焦点去掉样式（input textarea）*/
function boxFocusFun(fBox,wBox,cName){
	$j(fBox).focus(function(){
		$j(this).parents(wBox).addClass(cName);
	}).blur(function(){
		$j(this).parents(wBox).removeClass(cName);
	})
}
/*个人中心 -- 动态  顶部编辑框*/
function boxFocusFun2(fBox,fBox2,wBox,wBox2,cName,cName2,fVal,fVal2){
	$j(fBox).attr("value",fVal);
	$j(fBox).focus(function(){
		var curVal = $j(this).attr("value");
		if(curVal == fVal){
			$j(this).attr("value","");
		}
		$j(wBox).addClass(cName);
		if($j(wBox2).is(":visible")){
			$j(wBox2).addClass(cName2);
		}
	}).blur(function(){
		var curVal = $j(this).attr("value");
		if(curVal == ''){
			$j(this).attr("value",fVal);
		}
		$j(wBox).removeClass(cName);
		if($j(wBox2).is(":visible")){
			$j(wBox2).removeClass(cName2);
		}
	})
	$j(fBox2).live({
		focus: function(){
			var curVal = $j(this).attr("value");
			if(curVal == fVal2){
				$j(this).attr("value","");
			}
			$j(wBox).addClass(cName);
			$j(wBox2).addClass(cName2);
		},
		blur: function(){
			var curVal = $j(this).attr("value");
			if(curVal == ''){
				$j(this).attr("value",fVal2);
			}
			$j(wBox).removeClass(cName);
			$j(wBox2).removeClass(cName2);
		}
	})
}
/*个人中心 -- 动态 -- 关注 转播回复*/
function quickreply(fid, tid, feedid) {
	$j('#relaybox_'+feedid).css("display","none");
	var replyboxid = 'replybox_'+feedid;
	$j('.flw_replybox').html("");
	$j('.flw_replybox').css("display","none");
	if($j("#"+replyboxid).css("display") == "") {
		$j("#"+replyboxid).css("display","none");
	} else {
		ajaxget('forum.php?mod=ajax&action=quickreply&tid='+tid+'&fid='+fid+'&handlekey=qreply_'+feedid+'&feedid='+feedid, replyboxid);
		$j("#"+replyboxid).css("display","");
	}
}
function quickrelay(feedid, tid) {
	$j('#replybox_'+feedid).css("display","none");
	var replyboxid = 'relaybox_'+feedid;
	$j('.flw_replybox').html("");
	$j('.flw_replybox').css("display","none");
	if($j("#"+replyboxid).css("display") == "") {
		$j("#"+replyboxid).css("display","none");
	} else {
		ajaxget('home.php?mod=spacecp&ac=follow&op=relay&feedid='+feedid+'&tid='+tid+'&handlekey=qrelay_'+feedid, replyboxid);
		$j("#"+replyboxid).css("display","");
	}
	parentId = feedid;
}

/*mzDialog*/

/*function showBox(popCont,btn){
	var layerMask = '<div id="mzLayerMask" class="mzLayerMask" style="z-index: 10005; height: 515px; width: 1190px; display: block; top: 756px;"> </div>';
	var cont = ['<div id="mzDialog" class="mzdialog">',
				'',
				'</div>'];
	cont[1] = popCont;
	var endCont = cont.join('');
}*/


/*模拟radio*/
function radioController(pa){
	$j(pa + " .radiowrapper input[type='radio']").each(function(){
		if($j(this).attr('checked')){
			$j(pa).find(".radiowrapper").removeClass("radiochecked").next("input:radio").attr("checked",false);
			$j(this).parents('.radiowrapper').addClass("radiochecked").next("input:radio").attr("checked",true);
		}
	});
	$j(pa + " .radiowrapper").click(function(){
		if(!$j(this).hasClass("radiochecked")){
			$j(this).parents(pa).find(".radiowrapper").removeClass("radiochecked").next("input:radio").attr("checked",false);
			$j(this).addClass("radiochecked").next("input:radio").attr("checked",true);

			if( pa=='reportreason' ){
				$j('#message').val($j(this).find('.text_pway').text());
			}

			$j(this).find("[type='radio']").attr("checked","checked");

			return false;
		}
	});

}

/*列表项全选、单选控制删除按钮高亮灰显*///#deletepmform .checked_simcheck

function checkControlBtn(checkBtn,checkedItem,conBtn,classN,wrapper){
	$j(checkBtn).click(function(){
		var count = $j(checkedItem).length;
		if(count>0){
			$j(conBtn).removeClass(classN);
			$j(wrapper).attr("attribute","1")
		}else{
			$j(conBtn).addClass(classN);
			$j(wrapper).attr("attribute","0")
		}
		//alert($j(wrapper).attr("attribute"));
	})
}

var G ={
	scroll:null,
	radio:null,
	checkbox:null,
	testBtn:null,
	moreContent:null,
	checkBoxPlugIn3:null,
	checkBoxPlugIn4:null,
	dialog:null
};
function showBox(btn,box,w,h,closeBtn,okBtn){;
	$j(btn).click(function(){
		G.dialog = $j(box).mzDialog({'width':w,'height':h,'closeBtn':true,'nohide':true});/**调用弹出窗组件**/
		G.dialog.open()
	})
	$j(".mzBlockLayer").live("click",function(){
		if(G.dialog){
			G.dialog.close();
		}
	}) //mzClose
	$j(".mzCancelBtn").live("click",function(){
		G.dialog.close();
	})
	hoverAdd(".mzClose","mzCloseh");
}

//页面顶部消息展开块操作
function newsLevelFun(){
	newsFirstLevelFun(4);
	hoverAdd(".item_newsmenu","hover_newsmenu");
	hoverAdd(".item_seclevel","hover_newsmenu");
}

//获取第一层级数据
function newsFirstLevelFun(_perPage){
	$j.ajax({
		type:"POST",
		url:"/misc.php?mod=message&first=1",
		dataType:"json",
		success:function(data){
			if(!data){return false;}
			var dataArray = data;
			var newsNum = 0;
			var newsCont = '<div class="title_newsmenu">全部消息</div>';
			for(i=0;i<dataArray.length;i++){
				var contC = ['<div class="item_newsmenu" attribute="'+dataArray[i].type+'">',
									'<div class="cont_itemnmenu">',
										'<h3>',
										'',
										'</h3>',
										'<p>',
										'',
										'</p>',
									'</div>',
								   '<div class="num_itemnmenu">',
								   '',
								   '</div>',
								   '<div class="itemcover_itemnmenu"></div>',
							   '</div>']
				contC[3] = dataArray[i].title;
				contC[6] = dataArray[i].text;
				contC[10] = dataArray[i].num;
				newsNum += Number(dataArray[i].num);
				if(dataArray[i].num != 0){
					var endContC = contC.join('');
					newsCont += endContC;
				}
			}

			$j("#newsNum").html(newsNum);
			if(newsNum == 0){
				$j("#newsNum_menu").removeClass("p_pop");
				$j("#newsNum").addClass("empty_newsnum");
				return false;
			}else{
				$j("#newsNum_menu").addClass("p_pop");
			}
			$j("#firstLevelNews").html(newsCont);
			$j(".item_newsmenu").unbind( "click" );
			$j(".item_newsmenu").click(function(){
				var msgType = $j(this).attr("attribute");
				newsSecLevelFun(msgType,_perPage);
			})
		}
	})
}
//获取第二层级数据
function newsSecLevelFun(type,number){
	var msgType = type;
	var _perPage = number;
	$j.ajax({
		type:"POST",
		url:"/misc.php?mod=message&type=" + msgType + "&perpage=" + _perPage,
		dataType:"json",
		success:function(data){
			var dataArray = data.list,
			dataNum = data.num,
			dataType = data.type,
			titleText = "",
			itemLink = 0;
			if(dataNum == 0){return false}
			if(dataType == "message"){
				titleText = "社区消息";
				itemLink = 1;
			}else if(dataType == "system"){
				titleText = "系统通知";
			}else if(dataType == "notice"){
				titleText = "社区提醒";
			}
			var newsCont = '<div class="title_newsmenu">' + titleText + '<span class="back_newsmenu">返回</span></div>';
			var className = "";
			if(msgType == "message"){
				className = "msgitem_seclevel";
			}
			try{	// 有报错
				for(i=0;i<dataArray.length;i++){
					var contC = ['<div class="item_seclevel ' + className + '" id="' + dataArray[i].id + '">',
									'<table cellspacing="0" cellpadding="0">',
										'<tr>',
											'<td class="head_seclevel"><a class="avatar">',
											'',
											'<span class="shadowbox_avatar"> </span></a></td>',
											'<td class="cont_seclevel"><div class="contwrap_seclevel">',
											'<div class="continner_seclevel">',
											'',
											'</div>',
											'<div class="btnbar_seclevel">',
												'<a href="javascript:;" title="忽略该条" class="readed_seclevel closenotice"></a>',
											'</div>',
											'</div></td>',
										'</tr>',
									'</table>',
								'</div>']
					if(itemLink == 1){
						var locH = 'location.href="' + dataArray[i].url + '"';
						contC[0] = '<div class="item_seclevel ' + className + '" id="' + dataArray[i].id + '" onclick='+locH+'>';
					}
					contC[4] = dataArray[i].avatar;
					contC[8] = dataArray[i].text;
					var endContC = contC.join('');
					newsCont += endContC;
				}
			}catch(e){}
			newsCont += '<div class="item_seclevel more_seclevel"><a href="' + data.more_url + '">更多</a></div>';
			$j("#secLevelNews").html(newsCont);
			$j("#firstLevelNews").hide();
			$j("#secLevelNews").show();
			$j(".continner_seclevel").each(function(){//为每条提醒的最后一个链接添加清除本条功能
				$j(this).find("a:last").addClass("closenotice");
			})
			$j(".back_newsmenu").unbind("click");
			$j(".back_newsmenu").click(function(){
				newsFirstLevelFun(4);
				$j("#secLevelNews").hide();
				$j("#firstLevelNews").show();
			})
			$j(".closenotice").unbind("click");
			$j(".closenotice").click(function(){
				var thisP = $j(this).parents(".item_seclevel");
				var newId = thisP.attr("id");
				$j.ajax({
					type:'POST',
					url:'/misc.php?mod=message&read=1&type=' + dataType + '&id=' + newId,
					dataType:"json",
					success:function(data){
						var _num = $j("#newsNum").text();
						thisP.remove();
						newsSecLevelFun(dataType,4);
						if(_num != 0){
							$j("#newsNum").text(Number(_num - 1));
							if(_num - 1 == 0){
								$j('#newsNum_menu').hide();
								$j('#newsNum').addClass('empty_newsnum')
								$j('#secLevelNews').empty()
							}

						}
					}
				})
			})

		}
	})
}
function getNoticeAll(){
	$j.ajax({
		type:"POST",
		url:"/misc.php?mod=message&type=notice_all&isindex=" + $j("#mzCust").attr("rel"),
		dataType:"json",
		success:function(data){
			if(typeof(data.message_notice_all) != "undefined"){
				if(data.message_notice_all != 0){
					$j("#newsNum").removeClass('empty_newsnum');
				}else{
					$j("#newsNum").addClass('empty_newsnum');
				}
				$j("#newsNum").text(data.message_notice_all);
			}
			if(typeof(data.message_notice_num) != "undefined"  && parseInt(data.message_notice_num) > 0){
				$j('#message_notice_num').text('提醒' + parseInt(data.message_notice_num));
				$j('#message_notice_num').addClass('xi1');
			}
			if(typeof(data.message_system_num) != "undefined"  && parseInt(data.message_system_num) > 0){
				$j('#message_system_num').text('未读系统消息');
				$j('#message_system_num').addClass('xi1');
			}
			if(typeof(data.message_news_num) != "undefined"  && parseInt(data.message_news_num) > 0){
				$j('#message_news_num').text('未读消息');
				$j('#message_news_num').addClass('xi1');
			}
			if(typeof(data.is_today_singin) != "undefined" && data.is_today_singin){
				var cookie_mobile = ''
				if(typeof getCookie === 'function' && typeof(cookiepre)!=='undefined'){
					cookie_mobile = getCookie(cookiepre + 'mobile');
				}
				var  is_mobile = !navigator.userAgent.match(/pad|gt-p1000/i) && navigator.userAgent.match(/android|webos|ip(hone|od)|opera (mini|mobi|tablet)|iemobile|windows.+phone|mobile|fennec|kindle (Fire)|maemo|blackberry|playbook|bb10\; (touch|kbd)|Symbian(OS)|Ubuntu Touch/i);
				if(is_mobile && cookie_mobile!='no'){
					$j("#nosignin_link").text("已签到");
					$j("#nosignin_link").attr('onclick','javasctipt:void(0)');
				}else{
					$j("#signin_expand").addClass("hassignin_expand");
					$j("#signin_status").text("已签到");
				}
			}else{
				$j("#signin_status").text("签 到");
				if($j("#nosignin_link") && data.formhash){
					$j("#nosignin_link").attr('attribute','/app.php?mod=signin&action=sign&formhash='+ data.formhash);
				}
			}
		}
	});
}
//默认文字
function defaultTxtFun(obj,val){
	$j(obj).attr("value",val);
	$j(obj).bind("focus",function(){
		var curVal = $j(this).attr("value");
		if(curVal == val){
			$j(this).attr("value","");
		}
	})
	$j(obj).bind("blur",function(){
		var curVal = $j(this).attr("value");
		if(curVal == ''){
			$j(this).attr("value",val);
		}
	})
}
//批准好友请求
function deleteQueryNotice(uid, type) {
	var dlObj = $(type + '_' + uid);
	if(dlObj != null) {
		var id = dlObj.getAttribute('notice');
		var x = new Ajax();
		x.get('home.php?mod=misc&ac=ajax&op=delnotice&inajax=1&id='+id, function(s){
			dlObj.parentNode.removeChild(dlObj);
		});
	}
}

function errorhandle_pokeignore(msg, values) {
	deleteQueryNotice(values['uid'], 'pokeQuery');
}



var supportOpFun_lock   = 0;
//支持反对
function supportOpFun(btn){
	//if(successSup == false){return false;}
	var type = btn.split('_');
	var supNum;
	var btnItem = $j("#" + btn);
	var url = btnItem.attr("data-href");
        var time    = new Date().getTime();
        var rand    = Math.ceil( (Math.random()) * 1000 );
        if(supportOpFun_lock==1){
            return ;
        }

        if(url.indexOf('?')>0 ){
            url = url + '&random=' + time + rand;
        }else{
            url = url + '?random=' + time + rand;
        }
        supportOpFun_lock = 1;
	$j.ajax({
		type:"GET",
		url:url,
		dataType:"json",
		success:function(data){
                        supportOpFun_lock = 0;
			if(data.type == 1){
				var classN = "";
				var scoreBox = btnItem.parents(".cbar_postlist").find(".score_post a.xi2");
				if(type[1] == 'add'){
					classN = "hassupport_postlist";
                                        btnItem.attr("data-href",data.url);
				}else if(type[1] == 'subtract'){
					classN = "hasoppose_postlist";
                                        btnItem.attr("data-href",data.url);
				}
				btnItem.addClass(classN);
				scoreBox.addClass(classN);
				scoreBox.text(data.score + "分");


			}
                        if(data.type == 2){
				var classN = "";
				var scoreBox = btnItem.parents(".cbar_postlist").find(".score_post a.xi2");
				if(type[1] == 'add'){
					classN = "hassupport_postlist";
                                        btnItem.attr("data-href",data.url);
                                        //var textnameid = "recommend_add_text_" + type[2];
                                        //$j("#"+textnameid).text('支持');
                                        //$j("#"+textnameid).html('支持');
				}else if(type[1] == 'subtract'){
					classN = "hasoppose_postlist";
                                        btnItem.attr("data-href",data.url);
                                        //var textnameid = "recommend_subtract_text_" + type[2];
                                        //$j("#"+textnameid).text('反对');
                                        //$j("#"+textnameid).html('反对');
				}
				btnItem.addClass(classN);
				scoreBox.addClass(classN);
				scoreBox.text(data.score + "分");
			}
			if(data.message){
				tipPop("#" + btn,data.message);
			}
		}
	})
}
//pop框
function tipPop(btn,msg,closetime){
	var count = null;
	var tipContNum = $j("#tipBox").length;
	if(tipContNum == 0){
		var newNode = document.createElement("div");
		newNode.id = "tipBox";
		document.body.appendChild(newNode);
	}
	var tipCont = $j("#tipBox");
	tipCont.html(msg);
	var tipContH = tipCont.height() + 20;
	var offset = $j(btn).offset();
	var tipTop = offset.top - tipContH;
	var tipLeft = offset.left - tipCont.width() + 20;
	tipCont.css({top:tipTop,left:tipLeft}).show();
	var hideTip = function(){
		tipCont.hide();
	};
	if(!closetime){closetime = 3000}
	count = setTimeout(hideTip,closetime);
}

//click post
function clickPost(postBtn,url,callback){
	$j.ajax({
		type:"POST",
		url:url,
		success:function(){
			window.location.href = callback;
		}
	})
}

function transdate(endTime){
        var date=new Date();
        date.setFullYear(endTime.substring(0,4));
        date.setMonth(endTime.substring(5,7)-1);
        date.setDate(endTime.substring(8,10));
        date.setHours(endTime.substring(11,13));
        date.setMinutes(endTime.substring(14,16));
        date.setSeconds(endTime.substring(17,19));
        return Date.parse(date)/1000;
}

function servicemanage_click(){

            $j('#export').click(function(){
                          if((transdate($j('#enddate').val()) - transdate($j('#begindate').val()))/86400 > 80){
                             alert('超过查询范围');
                          }else{
                            $j('#servicform').attr('action','servicemanage.php?action=export');
                            $j('#servicform').submit();
                          }
            });

            $j('#manage_query').click(function(){
                       if((transdate($j('#enddate').val()) - transdate($j('#begindate').val()))/86400 > 80){
                            alert('超过查询范围');
                        }else{
                            $j('#servicform').attr('action','servicemanage.php');
                            $j('#servicform').submit();
                        }
            });
}

//个人中心 - 动态 空间锁定提示信息 关闭按钮操作
function spaceClosedFun(){
	$j('#closebtn').live('click',function(){
		var boxPa = $j(this).parent().parent();
		if(boxPa.hasClass('flw_replybox')){
			boxPa.hide();
		}
	})
}
//发表按钮点击后置灰，几秒后恢复
function subClickFun(btn,s){
	$j(btn).live('click',function(){
		var btnP = $j(this).parents('.normalbtn');
		if(btnP.hasClass('disabledgraybtn')){
			return false;
		}else{
			subDisableFun(btnP,s)
		}
	})
}
function subDisableFun(btnP,s){
	btnP.removeClass('bluebtn').addClass('disabledgraybtn');
	subDisableFun.prototype = {
		recoverBtn : function(){
			btnP.removeClass('disabledgraybtn').addClass('bluebtn');
		}
	}
	setTimeout('subDisableFun.prototype.recoverBtn()',s*1000);
}
function subOnclickFun(btn,s){
	var btnP = $j("#" + btn).parents('.normalbtn');
	if(btnP.hasClass('disabledgraybtn')){
		return false;
	}else{
		var that = $j("#" + btn);
		btnP.removeClass('bluebtn').addClass('disabledgraybtn');
		that.submit();
		subOnclickFun.prototype = {
			recoverBtn : function(){
				btnP.removeClass('disabledgraybtn').addClass('bluebtn');
			}
		}
		setTimeout('subOnclickFun.prototype.recoverBtn()',s*1000);
	}
}
//点击后隐藏块A，显示块B
function clickShowHidden(divA,divB,paC){
	$j("#" + divA).show();
	$j("#" + divB).hide();
	if(paC){
		$j("#" + divA).parent("." + paC).removeClass(paC);
	}
}
//拓展阅读块 - 可能感兴趣的人 换一组功能
function turnMayLike(btn,box){
	$j(btn).click(function(){
		turnMayLikeFunc(btn,3,"table tr","#mayLikeBox");
	})
}
function turnMayLikeFunc(urlBox,count,turnItem,box){
	var _url = $j(urlBox).attr("data-href");
	var uidItem = $j(box).find(".userhead_expand .avatar");
	var uidGroup = "";
	var uidNum = 0;
	uidItem.each(function(){
		var uid = $j(this).attr("data-uid");
		if(uidNum == 0){
			uidGroup += uid;
		}else{
			uidGroup += "_" + uid;
		}
		uidNum ++;
	})
	$j.ajax({
		type:"GET",
		url:_url + "&count=" + count + "&uidgroup=" + uidGroup,
		dataType:'json',
		success:function(data){
			var num = data.length;
			if(num == 0){return false;}
			var endCont = '';
			for(i=0;i<num;i++){
				var cont = ['<tr>',
							'<th class="userhead_expand"><a href="home.php?mod=space&uid='+data[i].uid+'" class="avatar" data-uid="'+data[i].uid+'">'+data[i].avatar+'<span class="shadowbox_avatar"> </span></a></th>',
							'<td class="userinfo_expand"><a href="home.php?mod=space&uid='+data[i].uid+'">'+data[i].username+'</a><p>'+data[i].reason+'</p></td>',
							'<td class="attention_expand"><a href="javascript:;" data-href="/home.php?mod=spacecp&ac=follow&op=add&hash=775b4d8b&fuid='+data[i].uid+'&infloat=yes&handlekey=followmod&inajax=1&ajaxtarget=fwin_content_followmod" >收听</a></td>',
							'</tr>']
				endCont += cont.join('');
			}
			$j(box).find(turnItem).remove();
			$j(box).find("table").append(endCont);
		}
	});
}
/*点击切换按钮样式*/
/*function turnBtnClass(btn,cName,cont){
	$j(btn).toggle(
	function(){
		$j(this).removeClass(cName);
		$j(cont).css({height:"160px",overflow:"hidden"});
	},
	function(){
		$j(this).addClass(cName);
		$j(cont).css({height:"",overflow:""});
	})
}*/
/*签到插件*/
function signinFunc(btn,tipBox){
	$j(btn).click(function(){
		var _url = $j(this).find("a").attr("attribute");
		var _tipCont = $j(tipBox).find(".tipcont_signin");
		var _btnCont = $j(btn).find(".btncont_signin");
		var _signin = $j(this).hasClass("hassignin_expand")?1:0;
		if(_signin == 1){return false;}//若已签到，跳出方法
		if(_url.match("login") != null){//若为登录链接，给出登录提示
			clearTimeout(counter);
			_tipCont.html("请先<a href='/login.php' target='_blank'>登录</a>");
			$j(tipBox).show();
			var hideTip = function(){$j(tipBox).hide()};
			var counter = setTimeout(hideTip,5000);
		}else{
			$j.ajax({
				url:_url,
				dataType:'json',
				type:"POST",
				success:function(data){
					var code = data.code,
					message = data.message;
					if(code==200 || code==201){
						$j(btn).addClass("hassignin_expand");
						_btnCont.text("已签到");
					}
					if(message){
						clearTimeout(counter);
						_tipCont.html(message);
						$j(tipBox).show();
						var hideTip = function(){$j(tipBox).hide()};
						var counter = setTimeout(hideTip,5000);
					}
				}
			})
		}
	})
}
/* 帖子列表页 - 收听 */
function followmodFunc(btn){
	$j(btn).live('click',function(){
		var that = this;
		var btnItem = $j(that);
		var url = btnItem.attr("data-href");
		var count2;
		$j.ajax({
			type:'GET',
			url:url + '&block=maylike',
			dataType:'json',
			success:function(data){
				if(data.message){
					tipPop(that,data.message);
				}
				if(data.type == 1){
					turnItem = btnItem.parents("tr");
					turnMayLikeFunc(".turnbtn_maylike",1,turnItem,"#mayLikeBox");
				}
			}
		})
	})
}
/* 帖子内容页 - 回复按钮 */
function fastReplyFunc(btn,box){
	$j(btn).live("click",function(){
		var that = this;
		var btnItem = $j(this);
		var listItem = btnItem.parents(".item_postlist");
		var url = $j(this).attr("data-href");
		var offset = $j("#" + box).offset();
		var ifLogin = $j("#tipBoxLogin").length;
		var ifOld = $j("#oldThreadTip").length;
		if(ifLogin != 0){//若为未登录情况下
			tipPop(that,"请先<a target='_blank' href='/login.php'>登录</a>");
		}else{
			if(listItem.hasClass("firstitem_postlist")){//如果是主题，直接跳转到快速回复框
				window.scrollTo(0,offset.top);
				checkFocus();
				return false;
			}
			$j.ajax({
				type:'GET',
				url:url + '&infloat=yes&handlekey=reply&inajax=1&ajaxtarget=fwin_content_reply',
				dataType:'json',
				success:function(data){
					if(data.type == 1){
						window.scrollTo(0,offset.top);
						checkFocus();
						$j("#fastposteditor .area").removeClass("defaulttext_area");
						$j("#fastposthiddenview").html(data.message).css('height','auto').append("<div id='quoteDelBtn'></div>");
						var form = $j("#fastpostform");
						form.find("input:hidden[name=reppost]").val(data.reppost);
						form.find("input:hidden[name=reppid]").val(data.reppid);
						form.find("input:hidden[name=noticeauthormsg]").val(data.noticeauthormsg);
						form.find("input:hidden[name=noticetrimstr]").val(data.noticetrimstr);
						form.find("input:hidden[name=noticeauthor]").val(data.noticeauthor);
					}else{
						tipPop(that,data.message);
					}
				}
			})
		}
	})
}

;(function($j){var isIE11=!!navigator.userAgent.match(/Trident\/7\./);if(isIE11){$j.browser.msie=true;delete $j.browser.mozilla}var ie=$j.browser.msie,iev=$j.browser.version,ie6=ie&&iev<7,ie7=ie&&iev==7,ie8=ie&&iev>7,ie67=ie6||ie7,ie68=ie6||ie8,ff=$j.browser.mozilla,ff2=ff&&(navigator.userAgent.toLowerCase().match(/firefox\/([\d.]+)/)[1].charAt(0)-3<0),safari=$j.browser.safari,isAndroid=/Android/.test(navigator.userAgent),iPad=/iPad/.test(navigator.userAgent),iPhone=/iPhone/.test(navigator.userAgent),ismobile=isAndroid||iPad||iPhone,css3=(!ie6&&!ie7&&!ie8&&!ff2)?true:false;$j.meizu={'ie':ie,'ie6':ie6,'ie7':ie7,'ie8':ie8,'ie67':ie67,'ie68':ie68,'ff':ff,'ff2':ff2,'safari':$j.browser.safari,'ismobile':ismobile,'zindex':10000,'css3':css3};var html1='<span class="radioPic">&nbsp;</span>';var html2='<span class="checkboxPic">&nbsp;</span>';function radio(opt){var d1=(new Date()).getTime();var defaults={chkCls:"radio_chk",unChkCls:"radio_unchk",spanCls:"mzradio",click:null,host:null};var proto=this;this.options=$j.extend(defaults,opt);this.options.host.each(function(){proto.bind($j(this))});var d2=(new Date()).getTime()}radio.prototype={bind:function(radio){var pic=$j(html1),span=radio.hide().parent().prepend(pic),proto=this,opt=proto.options,host=opt.host;if(radio.get(0).checked){pic.addClass(opt.chkCls);host.data("key",pic)}else{pic.addClass(opt.unChkCls)}var _click=function(){var con=$j(this),pic=$j(con.find('span')[0]),radio=$j(con.find('input')[0]);if(!pic.hasClass(opt.chkCls)){proto.chose(radio)}};span.addClass(opt.spanCls).click(_click)},chose:function(radio,triger){var opt=this.options,pic=$j(radio.attr('checked','checked').parent().find('span')[0]),key=opt.host.data('key');!triger&&opt.click&&opt.click.call(radio,{"value":radio.val()});if(key)key.addClass(opt.unChkCls).removeClass(opt.chkCls);pic.addClass(opt.chkCls).removeClass(opt.unChkCls);opt.host.data('key',pic)},val:function(j){if(j)this.setVal(j);else return this.getVal()},setVal:function(val,canClick){var proto=this,host=proto.options.host;host.each(function(){if(val==this.value){proto.chose($j(this),(canClick?false:true));return false}})},getVal:function(){var val;this.options.host.each(function(){if(this.checked){val=this.value;return false}});return val}};function checkbox(opt){var defaults={chkCls:"check_chk",unChkCls:"check_unchk",spanCls:"mzchkbox",click:null,host:null,serverInit:false};this.options=$j.extend(defaults,opt);var proto=this,host=this.options.host,all=host.length;if(!all)return;if(this.options.serverInit){this._fastBind2()}else if(all>15){this._fastBind1()}else{for(var i=0;i<all;i++){this.bind($j(host[i]),false)}}}checkbox.prototype={chose:function(cbox,chose,nochose){var opt=this.options,pic=$j(cbox.parent().find('span')[0]);if(!nochose&&(chose||!pic.hasClass(opt.chkCls))){pic.removeClass(opt.unChkCls).addClass(opt.chkCls);cbox.attr('checked','checked')}else{pic.removeClass(opt.chkCls).addClass(opt.unChkCls);cbox.removeAttr('checked')}},_fastBind1:function(){var _self=this,opt=_self.options,host=opt.host,all=host.length;for(var i=0;i<all;i++){var cbox=$j(host[i]),pic=$j(html2);cbox.hide().parent().prepend(pic);_self._oBind(cbox,pic,opt.chkCls,opt.unChkCls)}setTimeout(function(){for(var j=0;j<all;j++){var cbox=$j(host[j]),span=cbox.parent();_self._eBind(cbox,span,false,opt.spanCls)}},10)},_fastBind2:function(){var _self=this,host=_self.options.host,spanCls=_self.options.spanCls,all=host.length;for(var j=0;j<all;j++){var cbox=$j(host[j]),span=cbox.parent();_self._eBind(cbox,span,false,spanCls)}},_eBind:function(cbox,span,isnew,spanCls){var proto=this;if(isnew)proto.options.host.push(cbox[0]);var _click=function(e){proto.chose(cbox);proto.options.click&&proto.options.click.call(cbox[0],{"value":cbox.val(),"checked":cbox.attr('checked')},e)};span.click(_click).addClass(spanCls)},_oBind:function(cbox,pic,chkCls,unChkCls){if(cbox.get(0).checked){pic.addClass(chkCls)}else{pic.addClass(unChkCls)}},bind:function(cbox,isnew){var pic=$j(html2),span=cbox.hide().parent().prepend(pic),opt=this.options,host=opt.host;this._oBind(cbox,pic,this.options.chkCls,this.options.unChkCls);this._eBind(cbox,span,isnew,opt.spanCls)},val:function(j){if(j&&j.length){this.setVal(j)}else{return this.getVal()}},setVal:function(j){if(!j||!j.length)return;var host=this.options.host;for(var i=0,k=j.length;i<k;i++){for(var ci=0,ck=host.length;ci<ck;ci++){if(host[ci].value==j[i])this.chose($j(host[ci]),true)}}},getVal:function(){var host=this.options.host,ay=[];for(var i=0,j=host.length;i<j;i++){if(host[i].checked)ay.push(host[i].value)}return ay},checkAll:function(){var host=this.options.host;for(var i=0,j=host.length;i<j;i++){this.chose($j(host[i]),true)}},uncheckAll:function(){var host=this.options.host;for(var i=0,j=host.length;i<j;i++){this.chose($j(host[i]),true,true)}},uncheck:function(val){if(!val)return;var host=this.options.host;for(var i=0,j=host.length;i<j;i++){if(host[i].value==val){this.chose($j(host[i]),true,true);return}}},size:function(){return this.options.host.length}};function makeLayOuter(jop){var opt=$j.extend({'start':false,'end':false,'host':null,'position':'cover','fJobj':false,'timeout':500},jop);$j('body').append("<div id='meizuSelectID_"+(makeLayOuter.uuid+=1)+"' class='mzContainer'></div>");var layOuter=$j('#meizuSelectID_'+makeLayOuter.uuid).html('&nbsp;');layOuter.data('isIn',false).data('abled',true);opt.fJobj&&opt.fJobj.bind('click',{'opt':opt,'lay':layOuter},makeLayOuter._fns['_show']);opt.host.bind('click',{'opt':opt,'lay':layOuter,'xlen':opt.xlen,'ylen':opt.ylen},makeLayOuter._fns['_show']);makeLayOuter._hover(layOuter,opt.host,opt.timeout,opt.end);makeLayOuter._hover(layOuter,layOuter,opt.timeout,opt.end);return layOuter}makeLayOuter._fns={'_outFn':function(e){var lay=e.data.lay.data('isIn',false);setTimeout(function(){if(!lay.data('isIn')){lay.hide();e.data.end&&e.data.end()}},e.data.delay)},'_inFn':function(e){e.data.lay.data('isIn',true)},'_show':function(e){var opt=e.data.opt,lay=e.data.lay;opt.start&&opt.start();if(!lay.data('abled'))return;var host=$j(this),pos=host.offset(),sh=(opt.position==='cover'?(pos.top):(pos.top+host.height())),left=pos.left+(opt.xlen?opt.xlen:0),top=sh+(opt.ylen?opt.ylen:0);lay.css({"left":left,"top":top}).show();e.data.opt.curObj=host}};makeLayOuter._close=function(lay,end){lay.data('isIn',false);lay.hide();end&&end()},makeLayOuter._hover=function(lay,target,delay,end){var param={'lay':lay,'delay':delay,'end':end};target.mouseenter(param,makeLayOuter._fns['_inFn']).mouseleave(param,makeLayOuter._fns['_outFn'])};makeLayOuter._unHover=function(j){j.unbind('mouseenter',makeLayOuter._fns['_inFn']).unbind('mouseleave',makeLayOuter._fns['_outFn']).unbind('click',makeLayOuter._fns['_show'])};makeLayOuter.html=function(c){var opt=$j.extend({'jdom':null,'html':null,'maxH':0,'width':0,'hostw':0},c);if(!opt.jdom||!opt.html)return 0;opt.jdom.empty().append(opt.html);var w=opt.jdom.width(),sw=opt.hostw,h=opt.jdom.height();if(opt.hostw&&w<sw)w=sw;if(opt.maxH&&h>=opt.maxH){opt.jdom.css({"height":(opt.maxH+"px"),"overflowY":"scroll"});w+=10}if(opt.width)w=opt.width;return w};makeLayOuter.uuid=0;function select(opt){var defaults={click:'',data:'',maxH:'',itemOver:'mzItemOver',pos:'down',chgHost:false,width:false,disClk:false,start:false,end:false,focus:null,nowidth:true,needTitle:false,itemChk:'mzItemChecked',timeout:500,xlen:0,ylen:0};this.options=$j.extend(defaults,opt);var opt=this.options;opt.host.data('lj',makeLayOuter({'host':opt.host,'start':opt.start,'end':opt.end,'position':opt.pos,'fJobj':opt.focus,'xlen':opt.xlen,'ylen':opt.ylen}));this.options.curObj=this.options.host;this.reload(opt.data,false,true)}select.prototype={addHost:function(j){var opt=this.options,lay=opt.host.data('lj');makeLayOuter._hover(lay,j,opt.timeout,opt.end);j.bind('click',{'opt':opt,'lay':lay},makeLayOuter._fns['_show'])},rmvHost:function(j){makeLayOuter._unHover(j)},close:function(){var opt=this.options;makeLayOuter._close(opt.host.data('lj'),opt.end)},reload:function(j,isHtml,isInit){var proto=this,opt=proto.options,host=opt.host,lj=host.data('lj').css({"height":"auto","overflowY":"","cursor":"pointer"}),ay=[];if(!isHtml){ay.push("<ul>");if(j&&j.length){for(var m=0,n=j.length;m<n;m++){var unit=j[m];ay.push("<li class='mzSelectLi' ivalue='"+unit.value+"'><div class='"+(unit['selected']?opt['itemChk']:'')+(unit.title?' longdot':'')+"'title='"+(unit.title?unit.title:'')+"'>"+unit.text+"</div></li>")}}ay.push("</ul>");opt.jsondatas=j}$j('li',lj).each(function(){$j(this).unbind()});var w=makeLayOuter.html({'jdom':lj,html:(isHtml?j:ay.join('')),'maxH':opt.maxH,'width':opt.width,'hostw':(opt.nowidth?0:host.width())});if(isInit)this._eventBind(opt,host,w)},setVal:function(val){if(this.options.jsondatas){for(var i=0,j=this.options.jsondatas.length;i<j;i++){if(this.options.jsondatas[i].value==val){this.options.jsondatas[i].selected=true}else{this.options.jsondatas[i].selected=false}}this.reload(this.options.jsondatas)}},_eventBind:function(opt,host,w){var proto=this;$j('li',host.data('lj')).each(function(){$j(this).width(w)}).live('click mouseenter mouseleave',function(event){if(event.type=='click'){if(!opt.disClk){host.data('lj').hide()}var jobj=$j(this),val=jobj.attr('ivalue'),text=jobj.text();opt.click&&opt.click.call(proto.options.curObj,{"value":val,"text":text,'jobj':host});proto.setVal(val)}else if(event.type=='mouseenter'){$j($j('div',this)[0]).addClass(opt.itemOver)}else if(event.type=='mouseleave'){$j($j('div',this)[0]).removeClass(opt.itemOver)}})},html:function(j){if(!j)return;return this.reload(j,true)},disable:function(){this.options.host.data('lj').data('abled',false)},enable:function(){this.options.host.data('lj').data('abled',true)},remove:function(){var lj=this.options.host.data('lj');lj.children().each(function(){$j(this).unbind()});lj.empty().remove();this.options.host.removeData('lj');this.options.host=null;this.options=null}};function pager(o){var _self=this.reload(o);var pageClick=function(page){var opt=_self.options;if(opt.callBack){_self.options.pagenumber=page;opt.callBack(page)}else{var gpage=opt.toPage+Number(page);if(opt.toPage.indexOf("$j")!=-1){gpage=opt.toPage.replace("$j",Number(page))}window.location=gpage}};$j('a',_self.options.host).live('click',function(){var J=$j(this);var opt=_self.options;if(J.hasClass('liNoThisClass')){var page=0;page=$j.trim(J.text()+'')-0;if(!page){page=$j.trim(J.attr('rno'))-0}if(page!==(opt.pagenumber)){pageClick.call(null,page)}}else if(J.hasClass('pre')){if(opt.pagenumber!==1){pageClick.call(null,opt.pagenumber-1)}}else if(J.hasClass('next')){if(opt.pagenumber!==opt.pagecount)pageClick.call(null,opt.pagenumber+1)}});return this}pager.prototype={reload:function(o){this.options=$j.extend(this.options?this.options:{'pagenumber':1,'pagecount':1,'maxPage':5,'pageSize':10,'totalCount':1,'callBack':null,toPage:null,noLF:false},o);this.options.pagecount=Math.ceil(this.options.totalCount/this.options.pageSize);this.html((this.options.callBack?true:false),this.options.host,parseInt(this.options.pagenumber),parseInt(this.options.pagecount),this.options.maxPage,this.options.noLF);return this},getCurPage:function(){return this.options.pagenumber},html:function(ajax,host,pno,pc,mp,noLF){var $jpager=$j('<div class="pageDiv"></div>'),buffer=[],bText=ajax?'javascript:void(0)':'#',half=parseInt((mp-1)/2),c=0;start=pno-half,end=pno+half;if(start<1){end+=(1-start);start=1}if(end>pc){c=end-pc;end=pc;if(start>1){if(start>c){start-=c}else{start=1}}}if(!noLF&&pno>1){buffer.push("<a class='pre bRadius2' href='"+bText+"'>"+(window['G_isCht']?'上一頁':'上一页')+"</a>")}if(start>1){buffer.push("<a class='bRadius2 liNoThisClass' href='"+bText+"' rno='1'>"+(noLF?"<":1)+"</a>")}if(!noLF&&start>2){buffer.push("<a class='bRadius0 pomit' href='javascript:void(0)'>...</a>")}if(start!==end){for(var i=start;i<=end;i++)buffer.push("<a class='"+(i==pno?"selected bRadius0":"liNoThisClass bRadius2")+"' href='"+bText+"'>"+i+"</a>")}if(!noLF&&end<pc-1){buffer.push("<a class='bRadius0 pomit' href='javascript:void(0)'>...</a>")}if(end<pc){buffer.push("<a class='bRadius2 liNoThisClass' href='"+bText+"' rno='"+pc+"'>"+(noLF?">":pc)+"</a>")}if(!noLF&&pno<pc){buffer.push("<a class='next bRadius2' href='"+bText+"'>"+(window['G_isCht']?'下一頁':'下一页')+"</a>")}$jpager.append(buffer.join(''));host.empty().append($jpager)}};function panel(c){var defaults={content:'',pos:'down',width:false,openAction:null,model:false,xlen:0,ylen:0};this.options=$j.extend(defaults,c);var opt=this.options;var layerJobj=makeLayOuter({'host':opt.host,'position':opt.pos,'timeout':800,'openAct':opt.openAction,'xlen':opt.xlen,'ylen':opt.ylen});layerJobj.empty().append(opt.content);opt.width&&layerJobj.width(opt.width);opt.host.data('lj',layerJobj)}panel.prototype.close=function(){this.options.host.data('lj').hide()};function dialog(c){var defaults={'host':null,'width':false,'height':false,'nohide':true};this.options=$j.extend(defaults,c)}dialog.uuid=0;dialog.prototype={_createBtns:function(winDiv){var _self=this;if(this.options.closeBtn){winDiv.append($j('<div class="mzClose"></div>').click(function(){_self.close();jQuery.isFunction(_self.options.closeBtn)&&_self.options.closeBtn.call()}))}},open:function(){var _self=this;var opt=this.options;var blockID=opt.blockID;if(!this.options.blockID){blockID=opt.blockID=$j.block.open(opt.nohide)}else{$j.block.reOpen(opt.blockID,opt.nohide)}var block=$j('#'+blockID);var winDiv;if(!opt.winid){$j(document.body).append($j('<div class="mzdialog" id="mzdialog'+(dialog.uuid+=1)+'"></div>').append(this.options.host));this.options.winid='mzdialog'+dialog.uuid;winDiv=$j('#'+this.options.winid);this._createBtns(winDiv);$j.mzAddResize({'winDiv':winDiv,'blockID':blockID},function(data){var block=$j('#'+data.blockID),w=data.winDiv.width(),h=data.winDiv.height();data.winDiv.css({'left':((($j(window).width()-w>0?$j(window).width()-w:1))/2+'px'),'top':((($j(window).height()-h>0?$j(window).height()-h:1))/2+block.data('sTop')+'px')})})}else{winDiv=$j('#'+this.options.winid)}var style={'width':opt.width,'height':opt.height,'zIndex':($j.meizu.zindex+=1),'position':'absolute','left':((($j(window).width()-opt.width>0?$j(window).width()-opt.width:1))/2+'px'),'top':((($j(window).height()-opt.height>0?$j(window).height()-opt.height:1))/2+block.data('sTop')+'px')};winDiv.css(style).show()},resize:function(w,h){var winDiv=$j('#'+this.options.winid),block=$j('#'+this.options.blockID);var style={'width':w,'height':h,'left':((($j(window).width()-w>0?$j(window).width()-w:1))/2+'px'),'top':((($j(window).height()-h>0?$j(window).height()-h:1))/2+block.data('sTop')+'px')};winDiv.css(style).show()},close:function(){$j.block.close(this.options.blockID);$j('#'+this.options.winid).hide()}};$j.fn.extend({'mzRadio':function(c){c=$j.extend({},c,{host:$j(this)});return new radio(c)},'mzCheckBox':function(c){c=$j.extend({},c,{host:$j(this)});return new checkbox(c)},'mzSelect':function(c){c=$j.extend({},c,{host:$j(this)});return new select(c)},'mzPanel':function(c){c=$j.extend({},c,{host:$j(this)});return new panel(c)},'mzDialog':function(c){c=$j.extend({},c,{host:$j(this)});return new dialog(c)},'pager':function(c){c=$j.extend({},c,{host:$j(this)});return new pager(c)}});$j.disTab=function(b){$j(document).data('keyTab',b);window.document.onkeydown=function(e){e=(e)?e:window.event;if(9==e.keyCode){return!$j(document).data('keyTab')}}};$j.block={uuid:0,getWH2:function(){return{'width':$j(window).width(),'height':$j(document).height()}},getWH:function(){var w=0,h=0;if($j.meizu.ie){h=$j(document.documentElement).height();w=$j(document.documentElement).width()}else if(window.innerHeight){h=window.innerHeight;w=window.innerWidth}else if(document.documentElement&&document.documentElement.clientHeight){h=document.documentElement.clientHeight;w=document.documentElement.clientWidth}return{'width':w,'height':h}},open:function(nohide){var block=$j('<div id="mzBlockLayer'+($j.block.uuid+=1)+'" class="mzBlockLayer" style=" z-index: '+($j.meizu.zindex+=1)+'; "> </div>');var htdy=$j($j.meizu.ie?'html':'body');htdy.data('sTop',Math.max($j(document).scrollTop(),$j('body').scrollTop()));!nohide&&htdy.data('overflow',htdy.css('overflow')).css({'overflow':'hidden'});var wh=!nohide?this.getWH():this.getWH2();$j(document.body).append(block);block.css({'height':wh.height,'width':wh.width,'display':'block'}).data('sTop',htdy.data('sTop'));!nohide&&block.css('top',htdy.data('sTop'));$j.disTab(true);$j.mzAddResize({'block':block,'nohide':nohide},function(data){var htdy=$j($j.meizu.ie?'html':'body');var wh=!data.nohide?$j.block.getWH():$j.block.getWH2();data.block.css({'height':wh.height,'width':wh.width})});return"mzBlockLayer"+$j.block.uuid},reOpen:function(id,nohide){var htdy=$j($j.meizu.ie?'html':'body');htdy.data('sTop',Math.max($j(document).scrollTop(),$j('body').scrollTop()));!nohide&&htdy.data('overflow',htdy.css('overflow')).css({'overflow':'hidden'});var wh=!nohide?this.getWH():this.getWH2();var block=$j('#'+id);block.css({'height':wh.height,'width':wh.width,'display':'block'}).data('sTop',htdy.data('sTop'));!nohide&&block.css('top',htdy.data('sTop'));$j.disTab(true)},close:function(id){var htdy=$j($j.meizu.ie?'html':'body');if('hidden'!=htdy.data('overflow'))htdy.removeAttr('style');$j('#'+id).hide();$j.disTab(false)}};$j.blockUI=function(msg){$j.blockUI.cid=$j.block.open();var message=window.resBlockUI&&window.resBlockUI.processing?window.resBlockUI.processing:(window['G_isCht']?'正在處理，請稍候...':'正在处理，请稍候..');message=msg?msg:message;var block=$j('#'+$j.blockUI.cid),zindex=block.css('zIndex')+1,left=(((block.width()-315>0?block.width()-315:1))/2+'px'),top=((block.height()-30>0?block.height()-30:1))/2+block.data('sTop')+'px';$j('body').append('<div style="top:'+top+';left:'+left+';z-index:'+zindex+';" id="blockUICenter">'+message+'</div>')};$j.unblockUI=function(){$j.block.close($j.blockUI.cid);$j('#'+$j.blockUI.cid).remove();$j('#blockUICenter').remove()};$j.mzAddResize=function(p,fn){$j.mzAddResize.param.push(p);$j.mzAddResize.queue.push(fn)};$j.mzAddResize.queue=[];$j.mzAddResize.param=[];$j.BtnEffect={mOverFn:function(e){var j=$j(this);if(j.hasClass('mzBtnDisable'))return;j.addClass(e.data.oCls);var a=j.parent().find('.mzAngle1')[0];if(a)$j(a).removeClass('mzAngle1').addClass('mzAngle')},mOutFn:function(e){var j=$j(this);if(j.hasClass('mzBtnDisable'))return;j.removeClass(e.data.oCls);var a=j.parent().find('.mzAngle')[0];if(a)$j(a).removeClass('mzAngle').addClass('mzAngle1')},hander:function(p1,p2){var j=p1.jquery?p1:$j(p2);var t={'oCls':(j.hasClass('mzBtnGray')?'mzBtnGrayOver':'mzBtnBlueOver')};j.mouseover(t,$j.BtnEffect.mOverFn).mouseout(t,$j.BtnEffect.mOutFn)}};$j.eventBtn=function(opt){for(var i=0,j=opt.length;i<j;i++){$j.BtnEffect.hander($j('#'+opt[i].id))}};$j.floatTip=function(c){var d={'data':[]};$j.extend(d,c);for(var i=0,j=d.data.length;i<j;i++){var t=d.data[i];$j('#'+t.id).focus(t,function(event){var p=event.data,jobj=$j('#mz_Float'),tmp=p.loc,_self=null,sobj=$j('#'+p.id);$j.floatTip.cData=p;while(tmp){sobj=sobj.parent();tmp-=1}_self=sobj;if(!jobj[0]){(function(){$j('<div id="mz_Float" style="position: absolute;z-index:3000"><div style="position: relative;"><div class="mz3AngleL"></div><div class="mzFloatTip bRadius2"></div></div></div>').appendTo('body').hover(function(){$j(this).data('isin',true)},function(){var j=$j(this);if(j.data('isblur')){j.data('isin',false).hide()}}).click(function(){$j(this).data('isin',true).data('isblur',true)})})();jobj=$j('#mz_Float');$j.mzAddResize(jobj,function(j){if(!j[0]||!j.data('isin')||!$j.floatTip.cData){return}var p=$j.floatTip.cData,tmp=p.loc,sobj=$j('#'+p.id);while(tmp){sobj=sobj.parent();tmp-=1}var os=sobj.offset();j.hide().css({'top':(os.top-2),'left':(os.left+sobj.width()+18+(p.diff?p.diff:0))}).data('isin',true).data('isblur',false).show()})}var os=_self.offset();jobj.show().css({'top':(os.top-2),'left':(os.left+_self.width()+18+(p.diff?p.diff:0)),'width':p.width}).data('isin',true).data('isblur',false);$j(jobj.find('.mzFloatTip')[0]).width(p.width-30).html(p.change?p.change():p.text)}).blur(t,function(event){var tmp=event.data.loc,sobj=$j('#'+event.data.id);while(tmp){sobj=sobj.parent();tmp-=1}$j('#mz_Float').data('isin',false);setTimeout(function(){var j=$j('#mz_Float');if(!j.data('isin')){j.hide()}},300)})}};$j.eventInput=function(opt){for(var i=0,j=opt.length;i<j;i++){var t=opt[i];$j('#'+t.id).focus(t,function(e){var d=e.data,p=$j('#'+d.id);if(d.loc){var t=d.loc-0;p=$j('#'+d.id);while(t){p=p.parent();t-=1}}p.addClass('foucsCls')}).blur(t,function(e){var d=e.data,p=$j('#'+d.id);if(d.loc){var t=d.loc-0;p=$j('#'+d.id);while(t){p=p.parent();t-=1}}p.removeClass('foucsCls')})}};String.prototype.trim=function(){return this.replace(/(^\s*)|(\s*$j)/g,"")};window['JAlertGetContent']=function(type){if(!window['JQAlert']){var okT=window['G_isCht']?'確定':'确定';$j(document.body).append('<div id="mzAlertContainer" style="display:none;"/>');var cache=[];cache.push('<div id="mzAlert_alert" class="alert"><div class="part1"><div class="alert_title"/><div class="alert_message"/></div><div class="part2"><input type="button" value="'+okT+'" class="mzBtnBlue mzBtnwh2 btn1"/></div></div>');cache.push('<div id="mzAlert_confirm" class="confirm"><div class="part1"><div class="alert_title"/><div class="alert_message"/></div><div class="part2"><input type="button" value="'+okT+'" class="mzBtnBlue mzBtnwh2 btn1" name="c" style="margin-right:30px;"/><input  name="c" type="button" value="取消" class="mzBtnGray mzBtnwh2 btn2"/></div></div>');cache.push('<div id="mzAlert_prompt" class="prompt"><div class="part1" style="height:130px;"><div class="alert_title"/><input type="text" class="inputDefClass" style="margin-top: 40px;width:470px;height:36px;" name="a"/></div><div class="part2"><input type="button" value="'+okT+'" class="mzBtnBlue mzBtnwh2 btn1" name="c" style="margin-right:30px;"/><input type="button" value="取消" class="mzBtnGray mzBtnwh2 btn2" name="c"/></div></div>');$j('#mzAlertContainer').append(cache.join(''));window['JQAlert']={'alert':null,'confirm':null,'prompt':null};$j.BtnEffect.hander($j($j('#mzAlert_alert').find('input[type=button]')[0]));var cfs=$j('#mzAlert_confirm').find('input[type=button]');$j.BtnEffect.hander($j(cfs[0]));$j.BtnEffect.hander($j(cfs[1]));var pts=$j('#mzAlert_prompt').find('input[type=button]');$j.BtnEffect.hander($j(pts[0]));$j.BtnEffect.hander($j(pts[1]))}return $j('#mzAlert_'+type)};window['jAlert']=function(msg,title,callback){var jQobj=window['JAlertGetContent']('alert');if(!window.JQAlert.alert){window.JQAlert.alert=jQobj.mzDialog({'nohide':true,'width':560,'height':230});$j('.btn1',jQobj).click(function(){window.JQAlert.alert.close();var fn=window.JQAlert.alertFn;fn&&$j.isFunction(fn)&&fn()})}$j('.alert_title',jQobj).html(title);$j('.alert_message',jQobj).html(msg);window.JQAlert.alertFn=callback;window.JQAlert.alert.open()};window['jConfirm']=function(msg,title,callback){var jQobj=window['JAlertGetContent']('confirm');if(!window.JQAlert.confirm){window.JQAlert.confirm=jQobj.mzDialog({'nohide':true,'width':560,'height':230});$j('.btn1,.btn2',jQobj).click(function(){window.JQAlert.confirm.close();var fn=window.JQAlert.confirmFn;fn&&$j.isFunction(fn)&&fn.call(window,$j(this).hasClass('btn1'))})}$j('.alert_title',jQobj).html(title);$j('.alert_message',jQobj).html(msg);window.JQAlert.confirmFn=callback;window.JQAlert.confirm.open()};window['jPrompt']=function(msg,value,title,callback){var jQobj=window['JAlertGetContent']('prompt');if(!window.JQAlert.prompt){window.JQAlert.prompt=jQobj.mzDialog({'nohide':true,'width':560,'height':255});$j('.btn1,.btn2',jQobj).click(function(){window.JQAlert.prompt.close();var fn=window.JQAlert.promptFn;var val=$j('input',jQobj).val();fn&&$j.isFunction(fn)&&fn.call(window,($j(this).hasClass('btn1')?val:null))})}$j('.alert_title',jQobj).html(title);$j('input[name=a]',jQobj).val(value);window.JQAlert.promptFn=callback;window.JQAlert.prompt.open()};$j.easing={easein:function(x,t,b,c,d){return c*(t/=d)*t+b},easeinout:function(x,t,b,c,d){if(t<d/2)return 2*c*t*t/(d*d)+b;var a=t-d/2;return-2*c*a*a/(d*d)+2*c*a/d+c/2+b},easeout:function(x,t,b,c,d){return-c*t*t/(d*d)+2*c*t/d+b},expoin:function(x,t,b,c,d){var a=1;if(c<0){a*=-1;c*=-1}return a*(Math.exp(Math.log(c)/d*t))+b},expoout:function(x,t,b,c,d){var a=1;if(c<0){a*=-1;c*=-1}return a*(-Math.exp(-Math.log(c)/d*(t-d))+c+1)+b},expoinout:function(x,t,b,c,d){var a=1;if(c<0){a*=-1;c*=-1}if(t<d/2)return a*(Math.exp(Math.log(c/2)/(d/2)*t))+b;return a*(-Math.exp(-2*Math.log(c/2)/d*(t-d))+c+1)+b},bouncein:function(x,t,b,c,d){return c-jQuery.easing['bounceout'](x,d-t,0,c,d)+b},bounceout:function(x,t,b,c,d){if((t/=d)<(1/2.75)){return c*(7.5625*t*t)+b}else if(t<(2/2.75)){return c*(7.5625*(t-=(1.5/2.75))*t+.75)+b}else if(t<(2.5/2.75)){return c*(7.5625*(t-=(2.25/2.75))*t+.9375)+b}else{return c*(7.5625*(t-=(2.625/2.75))*t+.984375)+b}},bounceinout:function(x,t,b,c,d){if(t<d/2)return jQuery.easing['bouncein'](x,t*2,0,c,d)*.5+b;return jQuery.easing['bounceout'](x,t*2-d,0,c,d)*.5+c*.5+b},elasin:function(x,t,b,c,d){var s=1.70158;var p=0;var a=c;if(t==0)return b;if((t/=d)==1)return b+c;if(!p)p=d*.3;if(a<Math.abs(c)){a=c;var s=p/4}else var s=p/(2*Math.PI)*Math.asin(c/a);return-(a*Math.pow(2,10*(t-=1))*Math.sin((t*d-s)*(2*Math.PI)/p))+b},elasout:function(x,t,b,c,d){var s=1.70158;var p=0;var a=c;if(t==0)return b;if((t/=d)==1)return b+c;if(!p)p=d*.3;if(a<Math.abs(c)){a=c;var s=p/4}else var s=p/(2*Math.PI)*Math.asin(c/a);return a*Math.pow(2,-10*t)*Math.sin((t*d-s)*(2*Math.PI)/p)+c+b},elasinout:function(x,t,b,c,d){var s=1.70158;var p=0;var a=c;if(t==0)return b;if((t/=d/2)==2)return b+c;if(!p)p=d*(.3*1.5);if(a<Math.abs(c)){a=c;var s=p/4}else var s=p/(2*Math.PI)*Math.asin(c/a);if(t<1)return-.5*(a*Math.pow(2,10*(t-=1))*Math.sin((t*d-s)*(2*Math.PI)/p))+b;return a*Math.pow(2,-10*(t-=1))*Math.sin((t*d-s)*(2*Math.PI)/p)*.5+c+b},backin:function(x,t,b,c,d){var s=1.70158;return c*(t/=d)*t*((s+1)*t-s)+b},backout:function(x,t,b,c,d){var s=1.70158;return c*((t=t/d-1)*t*((s+1)*t+s)+1)+b},backinout:function(x,t,b,c,d){var s=1.70158;if((t/=d/2)<1)return c/2*(t*t*(((s*=(1.525))+1)*t-s))+b;return c/2*((t-=2)*t*(((s*=(1.525))+1)*t+s)+2)+b},linear:function(x,t,b,c,d){return c*t/d+b},swing:function(p,n,firstNum,diff){return((-Math.cos(p*Math.PI)/2)+0.5)*diff+firstNum}}})(jQuery);$j(function(){$j(window).resize(function(){var queue=$j.mzAddResize.queue;var param=$j.mzAddResize.param;for(var i=0,j=queue.length;i<j;i++){queue[i].call(window,param[i])}});(function(){$j('input.mzInput').each(function(){var input=$j(this);var wrap=input.parent();if(!wrap.hasClass('mzWrap')){wrap=$j(this).wrap('<span class="mzWrap"/>').parent()}var tail=input.attr('mztail');if(tail==='mzAngle'){wrap.append($j('<span class="mzAngle1"> </span>'))}});$j('input.mzInput2,textarea.mzInput2').each(function(){var input=$j(this),ttip=input.attr('tailTip'),htip=input.attr('headTip'),wrap=input.parent();!wrap.hasClass('mzWrap')&&(wrap=input.wrap('<span class="mzWrap inputDefClass"/>').parent().css('paddingLeft','0px'))&&input.css('paddingLeft','10px');if(ttip){var itip=$j('<span class="tailTip">'+ttip+'</span>');wrap.append(itip).addClass('');var w=input.width();input.css({'width':(w-itip.width()-10)});wrap.width(w+10)}if(htip){input.val(htip).addClass('headTipCls').focus(function(){if(this.value==htip){this.value='';$j(this).removeClass('headTipCls')}$j($j(this).parent()).addClass('foucsCls')}).blur(function(){if(this.value==''){this.value=htip;$j(this).addClass('headTipCls')}$j($j(this).parent()).removeClass('foucsCls')})}});$j('input.mzBtnGray,input.mzBtnBlue').each($j.BtnEffect.hander)})()});