<!DOCTYPE html>
<html lang="en">
<head>
  <meta id="bb-bootstrap" data-current-user="{&quot;username&quot;: &quot;j4lley&quot;, &quot;displayName&quot;: &quot;Jose A. Iglesias Guitian&quot;, &quot;uuid&quot;: &quot;{578f460d-c051-45e9-9c7b-7c76d1c82790}&quot;, &quot;firstName&quot;: &quot;Jose A. Iglesias Guitian&quot;, &quot;hasPremium&quot;: false, &quot;lastName&quot;: &quot;&quot;, &quot;avatarUrl&quot;: &quot;https://bitbucket.org/account/j4lley/avatar/32/?ts=1511402412&quot;, &quot;isTeam&quot;: false, &quot;isSshEnabled&quot;: false, &quot;isKbdShortcutsEnabled&quot;: false, &quot;id&quot;: 3373892, &quot;isAuthenticated&quot;: true}"
data-atlassian-id="557058:e8ec7bd5-987b-4b5d-98d0-a63a16fb05d5" />
  
  
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta charset="utf-8">
  <title>
  ignitionrobotics / ign-common 
  / source  / cmake / FindFreeimage.cmake
 &mdash; Bitbucket
</title>
  <script type="text/javascript">window.NREUM||(NREUM={}),__nr_require=function(e,n,t){function r(t){if(!n[t]){var o=n[t]={exports:{}};e[t][0].call(o.exports,function(n){var o=e[t][1][n];return r(o||n)},o,o.exports)}return n[t].exports}if("function"==typeof __nr_require)return __nr_require;for(var o=0;o<t.length;o++)r(t[o]);return r}({1:[function(e,n,t){function r(){}function o(e,n,t){return function(){return i(e,[c.now()].concat(u(arguments)),n?null:this,t),n?void 0:this}}var i=e("handle"),a=e(2),u=e(3),f=e("ee").get("tracer"),c=e("loader"),s=NREUM;"undefined"==typeof window.newrelic&&(newrelic=s);var p=["setPageViewName","setCustomAttribute","setErrorHandler","finished","addToTrace","inlineHit","addRelease"],d="api-",l=d+"ixn-";a(p,function(e,n){s[n]=o(d+n,!0,"api")}),s.addPageAction=o(d+"addPageAction",!0),s.setCurrentRouteName=o(d+"routeName",!0),n.exports=newrelic,s.interaction=function(){return(new r).get()};var m=r.prototype={createTracer:function(e,n){var t={},r=this,o="function"==typeof n;return i(l+"tracer",[c.now(),e,t],r),function(){if(f.emit((o?"":"no-")+"fn-start",[c.now(),r,o],t),o)try{return n.apply(this,arguments)}finally{f.emit("fn-end",[c.now()],t)}}}};a("setName,setAttribute,save,ignore,onEnd,getContext,end,get".split(","),function(e,n){m[n]=o(l+n)}),newrelic.noticeError=function(e){"string"==typeof e&&(e=new Error(e)),i("err",[e,c.now()])}},{}],2:[function(e,n,t){function r(e,n){var t=[],r="",i=0;for(r in e)o.call(e,r)&&(t[i]=n(r,e[r]),i+=1);return t}var o=Object.prototype.hasOwnProperty;n.exports=r},{}],3:[function(e,n,t){function r(e,n,t){n||(n=0),"undefined"==typeof t&&(t=e?e.length:0);for(var r=-1,o=t-n||0,i=Array(o<0?0:o);++r<o;)i[r]=e[n+r];return i}n.exports=r},{}],4:[function(e,n,t){n.exports={exists:"undefined"!=typeof window.performance&&window.performance.timing&&"undefined"!=typeof window.performance.timing.navigationStart}},{}],ee:[function(e,n,t){function r(){}function o(e){function n(e){return e&&e instanceof r?e:e?f(e,u,i):i()}function t(t,r,o,i){if(!d.aborted||i){e&&e(t,r,o);for(var a=n(o),u=m(t),f=u.length,c=0;c<f;c++)u[c].apply(a,r);var p=s[y[t]];return p&&p.push([b,t,r,a]),a}}function l(e,n){v[e]=m(e).concat(n)}function m(e){return v[e]||[]}function w(e){return p[e]=p[e]||o(t)}function g(e,n){c(e,function(e,t){n=n||"feature",y[t]=n,n in s||(s[n]=[])})}var v={},y={},b={on:l,emit:t,get:w,listeners:m,context:n,buffer:g,abort:a,aborted:!1};return b}function i(){return new r}function a(){(s.api||s.feature)&&(d.aborted=!0,s=d.backlog={})}var u="nr@context",f=e("gos"),c=e(2),s={},p={},d=n.exports=o();d.backlog=s},{}],gos:[function(e,n,t){function r(e,n,t){if(o.call(e,n))return e[n];var r=t();if(Object.defineProperty&&Object.keys)try{return Object.defineProperty(e,n,{value:r,writable:!0,enumerable:!1}),r}catch(i){}return e[n]=r,r}var o=Object.prototype.hasOwnProperty;n.exports=r},{}],handle:[function(e,n,t){function r(e,n,t,r){o.buffer([e],r),o.emit(e,n,t)}var o=e("ee").get("handle");n.exports=r,r.ee=o},{}],id:[function(e,n,t){function r(e){var n=typeof e;return!e||"object"!==n&&"function"!==n?-1:e===window?0:a(e,i,function(){return o++})}var o=1,i="nr@id",a=e("gos");n.exports=r},{}],loader:[function(e,n,t){function r(){if(!x++){var e=h.info=NREUM.info,n=d.getElementsByTagName("script")[0];if(setTimeout(s.abort,3e4),!(e&&e.licenseKey&&e.applicationID&&n))return s.abort();c(y,function(n,t){e[n]||(e[n]=t)}),f("mark",["onload",a()+h.offset],null,"api");var t=d.createElement("script");t.src="https://"+e.agent,n.parentNode.insertBefore(t,n)}}function o(){"complete"===d.readyState&&i()}function i(){f("mark",["domContent",a()+h.offset],null,"api")}function a(){return E.exists&&performance.now?Math.round(performance.now()):(u=Math.max((new Date).getTime(),u))-h.offset}var u=(new Date).getTime(),f=e("handle"),c=e(2),s=e("ee"),p=window,d=p.document,l="addEventListener",m="attachEvent",w=p.XMLHttpRequest,g=w&&w.prototype;NREUM.o={ST:setTimeout,SI:p.setImmediate,CT:clearTimeout,XHR:w,REQ:p.Request,EV:p.Event,PR:p.Promise,MO:p.MutationObserver};var v=""+location,y={beacon:"bam.nr-data.net",errorBeacon:"bam.nr-data.net",agent:"js-agent.newrelic.com/nr-1044.min.js"},b=w&&g&&g[l]&&!/CriOS/.test(navigator.userAgent),h=n.exports={offset:u,now:a,origin:v,features:{},xhrWrappable:b};e(1),d[l]?(d[l]("DOMContentLoaded",i,!1),p[l]("load",r,!1)):(d[m]("onreadystatechange",o),p[m]("onload",r)),f("mark",["firstbyte",u],null,"api");var x=0,E=e(4)},{}]},{},["loader"]);</script>
  


<meta id="bb-canon-url" name="bb-canon-url" content="https://bitbucket.org">
<meta name="bb-api-canon-url" content="https://api.bitbucket.org">
<meta name="apitoken" content="{&quot;token&quot;: &quot;SSGMuHE-2bMqB-cKti2Cl-4pKGRBKmEa7lFrGrv6JVytl9Ikr38MAJZMyHs8DOPTpVpKx4LW-EeTfm2b91mwC63Z8iFddaujbDGSTdUJXUvbacw=&quot;, &quot;expiration&quot;: 1511404133.716777}">

<meta name="bb-commit-hash" content="370568ebc84f">
<meta name="bb-app-node" content="app-169">
<meta name="bb-view-name" content="bitbucket.apps.repo2.views.filebrowse">
<meta name="ignore-whitespace" content="False">
<meta name="tab-size" content="None">
<meta name="locale" content="en">

<meta name="application-name" content="Bitbucket">
<meta name="apple-mobile-web-app-title" content="Bitbucket">


<meta name="theme-color" content="#0049B0">
<meta name="msapplication-TileColor" content="#0052CC">
<meta name="msapplication-TileImage" content="https://d301sr5gafysq2.cloudfront.net/370568ebc84f/img/logos/bitbucket/mstile-150x150.png">
<link rel="apple-touch-icon" sizes="180x180" type="image/png" href="https://d301sr5gafysq2.cloudfront.net/370568ebc84f/img/logos/bitbucket/apple-touch-icon.png">
<link rel="icon" sizes="192x192" type="image/png" href="https://d301sr5gafysq2.cloudfront.net/370568ebc84f/img/logos/bitbucket/android-chrome-192x192.png">

<link rel="icon" sizes="16x16 24x24 32x32 64x64" type="image/x-icon" href="/favicon.ico?v=2">
<link rel="mask-icon" href="https://d301sr5gafysq2.cloudfront.net/370568ebc84f/img/logos/bitbucket/safari-pinned-tab.svg" color="#0052CC">

<link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="Bitbucket">

  <meta name="description" content="">
  
  
    
  



  <link rel="stylesheet" href="https://d301sr5gafysq2.cloudfront.net/370568ebc84f/css/entry/vendor.css" />
<link rel="stylesheet" href="https://d301sr5gafysq2.cloudfront.net/370568ebc84f/css/entry/app.css" />



  <link rel="stylesheet" href="https://d301sr5gafysq2.cloudfront.net/370568ebc84f/css/entry/adg3.css">
  
  <script nonce="ufLSGDhNmtxLTZnl">
  window.__sentry__ = {"dsn": "https://ea49358f525d4019945839a3d7a8292a@sentry.io/159509", "release": "370568ebc84f (canary)", "tags": {"project": "bitbucket-core"}, "environment": "canary"};
</script>
<script src="https://d301sr5gafysq2.cloudfront.net/370568ebc84f/dist/webpack/sentry.js" nonce="ufLSGDhNmtxLTZnl"></script>
  <script src="https://d301sr5gafysq2.cloudfront.net/370568ebc84f/dist/webpack/early.js" nonce="ufLSGDhNmtxLTZnl"></script>
  
  
    <link href="/ignitionrobotics/ign-common/rss?token=772ca97fb1cd4d253d1217c271d47099" rel="alternate nofollow" type="application/rss+xml" title="RSS feed for ign-common" />

</head>
<body class="production adg3  "
    data-static-url="https://d301sr5gafysq2.cloudfront.net/370568ebc84f/"
data-base-url="https://bitbucket.org"
data-no-avatar-image="https://d301sr5gafysq2.cloudfront.net/370568ebc84f/img/default_avatar/user_blue.svg"
data-current-user="{&quot;username&quot;: &quot;j4lley&quot;, &quot;displayName&quot;: &quot;Jose A. Iglesias Guitian&quot;, &quot;uuid&quot;: &quot;{578f460d-c051-45e9-9c7b-7c76d1c82790}&quot;, &quot;firstName&quot;: &quot;Jose A. Iglesias Guitian&quot;, &quot;hasPremium&quot;: false, &quot;lastName&quot;: &quot;&quot;, &quot;avatarUrl&quot;: &quot;https://bitbucket.org/account/j4lley/avatar/32/?ts=1511402412&quot;, &quot;isTeam&quot;: false, &quot;isSshEnabled&quot;: false, &quot;isKbdShortcutsEnabled&quot;: false, &quot;id&quot;: 3373892, &quot;isAuthenticated&quot;: true}"
data-atlassian-id="{&quot;loginStatusUrl&quot;: &quot;https://id.atlassian.com/profile/rest/profile&quot;}"
data-settings="{&quot;MENTIONS_MIN_QUERY_LENGTH&quot;: 3}"

data-current-repo="{&quot;scm&quot;: &quot;hg&quot;, &quot;readOnly&quot;: false, &quot;mainbranch&quot;: {&quot;name&quot;: &quot;default&quot;}, &quot;uuid&quot;: &quot;1dfbdd30-34c5-4b09-82ef-9bfe2917877b&quot;, &quot;language&quot;: &quot;c++&quot;, &quot;owner&quot;: {&quot;username&quot;: &quot;ignitionrobotics&quot;, &quot;uuid&quot;: &quot;dd3bee6b-ed2f-496a-9634-d99cf5144fc5&quot;, &quot;isTeam&quot;: true}, &quot;fullslug&quot;: &quot;ignitionrobotics/ign-common&quot;, &quot;slug&quot;: &quot;ign-common&quot;, &quot;id&quot;: 7338534, &quot;pygmentsLanguage&quot;: &quot;c++&quot;}"
data-current-cset="865ce266463065f92fa64430afecc279a875c159"





data-browser-monitoring="true"
data-switch-create-pullrequest-commit-status="true"




>
<div id="page">
  
    <div id="adg3-navigation"
  
  
  >
  <nav class="skeleton-nav">
    <div class="skeleton-nav--left">
      <div class="skeleton-nav--left-top">
        <ul class="skeleton-nav--items">
          <li></li>
          <li></li>
          <li></li>
          <li class="skeleton--icon"></li>
          <li class="skeleton--icon-sub"></li>
          <li class="skeleton--icon-sub"></li>
          <li class="skeleton--icon-sub"></li>
          <li class="skeleton--icon-sub"></li>
          <li class="skeleton--icon-sub"></li>
          <li class="skeleton--icon-sub"></li>
        </ul>
      </div>
      <div class="skeleton-nav--left-bottom">
        <div class="skeleton-nav--left-bottom-wrapper">
          <div class="skeleton-nav--item-help"></div>
          <div class="skeleton-nav--item-profile"></div>
        </div>
      </div>
    </div>
    <div class="skeleton-nav--right">
      <ul class="skeleton-nav--items-wide">
        <li class="skeleton--icon-logo-container">
          <div class="skeleton--icon-container"></div>
          <div class="skeleton--icon-description"></div>
          <div class="skeleton--icon-logo"></div>
        </li>
        <li>
          <div class="skeleton--icon-small"></div>
          <div class="skeleton-nav--item-wide-content"></div>
        </li>
        <li>
          <div class="skeleton--icon-small"></div>
          <div class="skeleton-nav--item-wide-content"></div>
        </li>
        <li>
          <div class="skeleton--icon-small"></div>
          <div class="skeleton-nav--item-wide-content"></div>
        </li>
        <li>
          <div class="skeleton--icon-small"></div>
          <div class="skeleton-nav--item-wide-content"></div>
        </li>
        <li>
          <div class="skeleton--icon-small"></div>
          <div class="skeleton-nav--item-wide-content"></div>
        </li>
        <li>
          <div class="skeleton--icon-small"></div>
          <div class="skeleton-nav--item-wide-content"></div>
        </li>
      </ul>
    </div>
  </nav>
</div>

    <div id="wrapper">
      
  


      
  <div id="nps-survey-container"></div>

 

      
  

<div id="account-warning" data-module="header/account-warning"
  data-unconfirmed-addresses="false"
  data-no-addresses="false"
  
></div>



      
  
<header id="aui-message-bar">
  
</header>


      <div id="content" role="main">

        
          <header class="app-header">
            <div class="app-header--primary">
              
                <div class="app-header--context">
                  <div class="app-header--breadcrumbs">
                    
  <ol class="aui-nav aui-nav-breadcrumbs">
    <li>
  <a href="/ignitionrobotics/">ignitionrobotics</a>
</li>

  <li class="aui-nav-selected">
    <a href="/account/user/ignitionrobotics/projects/IG">Ignition</a>
  </li>

<li>
  <a href="/ignitionrobotics/ign-common">ign-common</a>
</li>
    
  <li>
    <a href="/ignitionrobotics/ign-common/src">
      Source
    </a>
  </li>

  </ol>

                  </div>
                  <h1 class="app-header--heading">
                    <span class="file-path">FindFreeimage.cmake</span>
                  </h1>
                </div>
              
            </div>

            <div class="app-header--secondary">
              
                
              
            </div>
          </header>
        

        
        
  <div class="aui-page-panel ">
    <div class="hidden">
  
  </div>
    <div class="aui-page-panel-inner">

      <div
        id="repo-content"
        class="aui-page-panel-content forks-enabled"
        data-module="repo/index"
        
          data-project-id="808135"
        
      >
        
        
  <div id="source-container" class="maskable" data-module="repo/source/index">
    



<header id="source-path">
  
    <div class="labels labels-csv">
      <div class="aui-buttons">
        <button data-branches-tags-url="/api/1.0/repositories/ignitionrobotics/ign-common/branches-tags"
                data-module="components/branch-dialog"
                
                class="aui-button branch-dialog-trigger" title="default">
          
            
              <span class="aui-icon aui-icon-small aui-iconfont-devtools-branch">Branch</span>
            
            <span class="name">default</span>
          
          <span class="aui-icon-dropdown"></span>
        </button>
        <button class="aui-button" id="checkout-branch-button"
                title="Check out this branch">
          <span class="aui-icon aui-icon-small aui-iconfont-devtools-clone">Check out branch</span>
          <span class="aui-icon-dropdown"></span>
        </button>
      </div>
      
    
    
  
    </div>
  
  
    <div class="secondary-actions">
      <div class="aui-buttons">
        
          <a href="/ignitionrobotics/ign-common/src/865ce2664630/cmake/FindFreeimage.cmake?at=default"
            class="aui-button pjax-trigger source-toggle" aria-pressed="true">
            Source
          </a>
          <a href="/ignitionrobotics/ign-common/diff/cmake/FindFreeimage.cmake?diff2=865ce2664630&at=default"
            class="aui-button pjax-trigger diff-toggle"
            title="Diff to previous change">
            Diff
          </a>
          <a href="/ignitionrobotics/ign-common/history-node/865ce2664630/cmake/FindFreeimage.cmake?at=default"
            class="aui-button pjax-trigger history-toggle">
            History
          </a>
        
      </div>

      
        
        
      

    </div>
  
  <h1>
    
      
        <a href="/ignitionrobotics/ign-common/src/865ce2664630?at=default"
          class="pjax-trigger root" title="ignitionrobotics/ign-common at 865ce2664630">ign-common</a> /
      
      
        
          
            <a href="/ignitionrobotics/ign-common/src/865ce2664630/cmake/?at=default"
              class="pjax-trigger directory-name">cmake</a> /
          
        
      
        
          
            <span class="file-name">FindFreeimage.cmake</span>
          
        
      
    
  </h1>
  
    
    
  
  <div class="clearfix"></div>
</header>


  
    
  

  <div id="editor-container" class="maskable"
       data-module="repo/source/editor"
       data-owner="ignitionrobotics"
       data-slug="ign-common"
       data-is-writer="false"
       data-has-push-access="true"
       data-hash="865ce266463065f92fa64430afecc279a875c159"
       data-branch="default"
       data-path="cmake/FindFreeimage.cmake"
       data-source-url="/api/internal/repositories/ignitionrobotics/ign-common/src/865ce266463065f92fa64430afecc279a875c159/cmake/FindFreeimage.cmake">
    <div id="source-view" class="file-source-container" data-module="repo/source/view-file" data-is-lfs="false">
      <div class="toolbar">
        <div class="primary">
          <div class="aui-buttons">
            
              <button id="file-history-trigger" class="aui-button aui-button-light changeset-info"
                      data-changeset="865ce266463065f92fa64430afecc279a875c159"
                      data-path="cmake/FindFreeimage.cmake"
                      data-current="865ce266463065f92fa64430afecc279a875c159">
                 

  <div class="aui-avatar aui-avatar-xsmall">
    <div class="aui-avatar-inner">
      <img src="https://bitbucket.org/account/mxgrey/avatar/16/?ts=1511382639">
    </div>
  </div>
  <span class="changeset-hash">865ce26</span>
  <time datetime="2017-11-17T02:59:41+00:00" class="timestamp"></time>
  <span class="aui-icon-dropdown"></span>

              </button>
            
          </div>
          
          <a href="/ignitionrobotics/ign-common/full-commit/865ce2664630/cmake/FindFreeimage.cmake" id="full-commit-link"
             title="View full commit 865ce26">Full commit</a>
        </div>
        <div class="secondary">
          
          <div class="aui-buttons">
            
              <a href="/ignitionrobotics/ign-common/annotate/865ce266463065f92fa64430afecc279a875c159/cmake/FindFreeimage.cmake?at=default"
                 class="aui-button aui-button-light pjax-trigger blame-link">Blame</a>
              
                
                <a data-embed-url="https://bitbucket.org/ignitionrobotics/ign-common/src/865ce266463065f92fa64430afecc279a875c159/cmake/FindFreeimage.cmake?embed=t" class="aui-button aui-button-light js-embed-link">
                  Embed
                </a>
              
            
            <a href="/ignitionrobotics/ign-common/raw/865ce266463065f92fa64430afecc279a875c159/cmake/FindFreeimage.cmake" class="aui-button aui-button-light raw-link">Raw</a>
          </div>
          
            

            <div class="aui-buttons">
              
              <button id="file-edit-button" class="edit-button aui-button aui-button-light aui-button-split-main"
                  

                  >
                Edit
                
              </button>
              <button id="file-more-actions-button" class="aui-button aui-button-light aui-dropdown2-trigger aui-button-split-more" aria-owns="split-container-dropdown" aria-haspopup="true"
                  >
                More file actions
              </button>
            </div>
            <div id="split-container-dropdown" class="aui-dropdown2 aui-style-default" data-container="#editor-container">
              <ul class="aui-list-truncate">
                <li><a href="#" data-module="repo/source/rename-file" class="rename-link">Rename</a></li>
                <li><a href="#" data-module="repo/source/delete-file" class="delete-link">Delete</a></li>
              </ul>
            </div>
          
        </div>

        <div id="fileview-dropdown"
            class="aui-dropdown2 aui-style-default"
            data-fileview-container="#fileview-container"
            
            
            data-fileview-button="#fileview-trigger"
            data-module="connect/fileview">
          <div class="aui-dropdown2-section">
            <ul>
              <li>
                <a class="aui-dropdown2-radio aui-dropdown2-checked"
                    data-fileview-id="-1"
                    data-fileview-loaded="true"
                    data-fileview-target="#fileview-original"
                    data-fileview-connection-key=""
                    data-fileview-module-key="file-view-default">
                  Default File Viewer
                </a>
              </li>
              
            </ul>
          </div>
        </div>

        <div class="clearfix"></div>
      </div>
      <div id="fileview-container">
        <div id="fileview-original"
            class="fileview"
            data-module="repo/source/highlight-lines"
            data-fileview-loaded="true">
          


  
    <div class="file-source">
      <table class="codehilite highlighttable"><tr><td class="linenos"><div class="linenodiv"><pre><a href="#FindFreeimage.cmake-1"> 1</a>
<a href="#FindFreeimage.cmake-2"> 2</a>
<a href="#FindFreeimage.cmake-3"> 3</a>
<a href="#FindFreeimage.cmake-4"> 4</a>
<a href="#FindFreeimage.cmake-5"> 5</a>
<a href="#FindFreeimage.cmake-6"> 6</a>
<a href="#FindFreeimage.cmake-7"> 7</a>
<a href="#FindFreeimage.cmake-8"> 8</a>
<a href="#FindFreeimage.cmake-9"> 9</a>
<a href="#FindFreeimage.cmake-10">10</a>
<a href="#FindFreeimage.cmake-11">11</a>
<a href="#FindFreeimage.cmake-12">12</a>
<a href="#FindFreeimage.cmake-13">13</a>
<a href="#FindFreeimage.cmake-14">14</a>
<a href="#FindFreeimage.cmake-15">15</a>
<a href="#FindFreeimage.cmake-16">16</a>
<a href="#FindFreeimage.cmake-17">17</a>
<a href="#FindFreeimage.cmake-18">18</a>
<a href="#FindFreeimage.cmake-19">19</a>
<a href="#FindFreeimage.cmake-20">20</a>
<a href="#FindFreeimage.cmake-21">21</a>
<a href="#FindFreeimage.cmake-22">22</a>
<a href="#FindFreeimage.cmake-23">23</a>
<a href="#FindFreeimage.cmake-24">24</a>
<a href="#FindFreeimage.cmake-25">25</a>
<a href="#FindFreeimage.cmake-26">26</a>
<a href="#FindFreeimage.cmake-27">27</a>
<a href="#FindFreeimage.cmake-28">28</a>
<a href="#FindFreeimage.cmake-29">29</a>
<a href="#FindFreeimage.cmake-30">30</a>
<a href="#FindFreeimage.cmake-31">31</a>
<a href="#FindFreeimage.cmake-32">32</a>
<a href="#FindFreeimage.cmake-33">33</a>
<a href="#FindFreeimage.cmake-34">34</a>
<a href="#FindFreeimage.cmake-35">35</a>
<a href="#FindFreeimage.cmake-36">36</a>
<a href="#FindFreeimage.cmake-37">37</a>
<a href="#FindFreeimage.cmake-38">38</a>
<a href="#FindFreeimage.cmake-39">39</a>
<a href="#FindFreeimage.cmake-40">40</a></pre></div></td><td class="code"><div class="codehilite highlight"><pre><span></span><a name="FindFreeimage.cmake-1"></a><span class="nb">include</span> <span class="p">(</span><span class="s">FindPkgConfig</span><span class="p">)</span>
<a name="FindFreeimage.cmake-2"></a><span class="nb">include</span> <span class="p">(</span><span class="o">${</span><span class="nv">project_cmake_dir</span><span class="o">}</span><span class="s">/Utils.cmake</span><span class="p">)</span>
<a name="FindFreeimage.cmake-3"></a>
<a name="FindFreeimage.cmake-4"></a><span class="c">########################################</span>
<a name="FindFreeimage.cmake-5"></a><span class="c"># Find packages</span>
<a name="FindFreeimage.cmake-6"></a><span class="nb">if</span> <span class="p">(</span><span class="s">PKG_CONFIG_FOUND</span><span class="p">)</span>
<a name="FindFreeimage.cmake-7"></a>  <span class="nb">pkg_check_modules</span><span class="p">(</span><span class="s">freeimage</span> <span class="s">freeimage&gt;=</span><span class="o">${</span><span class="nv">FREEIMAGE_VERSION</span><span class="o">}</span><span class="p">)</span>
<a name="FindFreeimage.cmake-8"></a>  <span class="nb">if</span> <span class="p">(</span><span class="s">NOT</span> <span class="s">freeimage_FOUND</span><span class="p">)</span>
<a name="FindFreeimage.cmake-9"></a>    <span class="nb">message</span> <span class="p">(</span><span class="s">STATUS</span> <span class="s2">&quot;  freeimage.pc not found, trying freeimage_include_dir and freeimage_library_dir flags.&quot;</span><span class="p">)</span>
<a name="FindFreeimage.cmake-10"></a>  <span class="nb">endif</span> <span class="p">(</span><span class="s">NOT</span> <span class="s">freeimage_FOUND</span><span class="p">)</span>
<a name="FindFreeimage.cmake-11"></a><span class="nb">endif</span> <span class="p">(</span><span class="s">PKG_CONFIG_FOUND</span><span class="p">)</span>
<a name="FindFreeimage.cmake-12"></a>
<a name="FindFreeimage.cmake-13"></a><span class="nb">if</span> <span class="p">(</span><span class="s">NOT</span> <span class="s">freeimage_FOUND</span><span class="p">)</span>
<a name="FindFreeimage.cmake-14"></a>  <span class="nb">find_path</span><span class="p">(</span><span class="s">freeimage_INCLUDE_DIRS</span> <span class="s">FreeImage.h</span><span class="p">)</span>
<a name="FindFreeimage.cmake-15"></a>  <span class="nb">if</span> <span class="p">(</span><span class="s">NOT</span> <span class="s">freeimage_INCLUDE_DIRS</span><span class="p">)</span>
<a name="FindFreeimage.cmake-16"></a>    <span class="nb">message</span> <span class="p">(</span><span class="s">STATUS</span> <span class="s2">&quot;  Looking for FreeImage.h - not found&quot;</span><span class="p">)</span>
<a name="FindFreeimage.cmake-17"></a>    <span class="nb">BUILD_ERROR</span><span class="p">(</span><span class="s2">&quot;Missing: Unable to find FreeImage.h&quot;</span><span class="p">)</span>
<a name="FindFreeimage.cmake-18"></a>  <span class="nb">else</span> <span class="p">(</span><span class="s">NOT</span> <span class="s">freeimage_INCLUDE_DIRS</span><span class="p">)</span>
<a name="FindFreeimage.cmake-19"></a>    <span class="c"># Check the FreeImage header for the right version</span>
<a name="FindFreeimage.cmake-20"></a>    <span class="nb">set</span> <span class="p">(</span><span class="s">testFreeImageSource</span> <span class="o">${</span><span class="nv">CMAKE_CURRENT_BINARY_DIR</span><span class="o">}</span><span class="s">/CMakeTmp/test_freeimage.cc</span><span class="p">)</span>
<a name="FindFreeimage.cmake-21"></a>    <span class="nb">file</span> <span class="p">(</span><span class="s">WRITE</span> <span class="o">${</span><span class="nv">testFreeImageSource</span><span class="o">}</span> 
<a name="FindFreeimage.cmake-22"></a>      <span class="s2">&quot;#include &lt;FreeImage.h&gt;\nint main () { if (FREEIMAGE_MAJOR_VERSION &gt;= ${FREEIMAGE_MAJOR_VERSION} &amp;&amp; FREEIMAGE_MINOR_VERSION &gt;= ${FREEIMAGE_MINOR_VERSION}) return 1; else return 0;} \n&quot;</span><span class="p">)</span>
<a name="FindFreeimage.cmake-23"></a>    <span class="nb">try_run</span><span class="p">(</span><span class="s">FREEIMAGE_RUNS</span> <span class="s">FREEIMAGE_COMPILES</span> <span class="o">${</span><span class="nv">CMAKE_CURRENT_BINARY_DIR</span><span class="o">}</span> 
<a name="FindFreeimage.cmake-24"></a>                <span class="o">${</span><span class="nv">testFreeImageSource</span><span class="o">}</span><span class="p">)</span>
<a name="FindFreeimage.cmake-25"></a>    <span class="nb">if</span> <span class="p">(</span><span class="s">NOT</span> <span class="s">FREEIMAGE_RUNS</span><span class="p">)</span>
<a name="FindFreeimage.cmake-26"></a>      <span class="nb">BUILD_ERROR</span><span class="p">(</span><span class="s2">&quot;Invalid FreeImage Version. Requires ${FREEIMAGE_VERSION}&quot;</span><span class="p">)</span>
<a name="FindFreeimage.cmake-27"></a>    <span class="nb">else</span> <span class="p">(</span><span class="s">NOT</span> <span class="s">FREEIMAGE_RUNS</span><span class="p">)</span>
<a name="FindFreeimage.cmake-28"></a>       <span class="nb">message</span> <span class="p">(</span><span class="s">STATUS</span> <span class="s2">&quot;  Looking for FreeImage.h - found&quot;</span><span class="p">)</span>
<a name="FindFreeimage.cmake-29"></a>    <span class="nb">endif</span> <span class="p">(</span><span class="s">NOT</span> <span class="s">FREEIMAGE_RUNS</span><span class="p">)</span>
<a name="FindFreeimage.cmake-30"></a>  <span class="nb">endif</span> <span class="p">(</span><span class="s">NOT</span> <span class="s">freeimage_INCLUDE_DIRS</span><span class="p">)</span>
<a name="FindFreeimage.cmake-31"></a>
<a name="FindFreeimage.cmake-32"></a>  <span class="nb">find_library</span><span class="p">(</span><span class="s">freeimage_LIBRARIES</span> <span class="s">freeimage</span><span class="p">)</span>
<a name="FindFreeimage.cmake-33"></a>  <span class="nb">if</span> <span class="p">(</span><span class="s">NOT</span> <span class="s">freeimage_LIBRARIES</span><span class="p">)</span>
<a name="FindFreeimage.cmake-34"></a>    <span class="nb">message</span> <span class="p">(</span><span class="s">STATUS</span> <span class="s2">&quot;  Looking for libfreeimage - not found&quot;</span><span class="p">)</span>
<a name="FindFreeimage.cmake-35"></a>    <span class="nb">BUILD_ERROR</span><span class="p">(</span><span class="s2">&quot;Missing: Unable to find libfreeimage&quot;</span><span class="p">)</span>
<a name="FindFreeimage.cmake-36"></a>  <span class="nb">else</span> <span class="p">(</span><span class="s">NOT</span> <span class="s">freeimage_LIBRARIES</span><span class="p">)</span>
<a name="FindFreeimage.cmake-37"></a>    <span class="nb">message</span> <span class="p">(</span><span class="s">STATUS</span> <span class="s2">&quot;  Looking for libfreeimage - found&quot;</span><span class="p">)</span>
<a name="FindFreeimage.cmake-38"></a>    <span class="nb">include_directories</span><span class="p">(</span><span class="o">${</span><span class="nv">freeimage_INCLUDE_DIRS</span><span class="o">}</span><span class="p">)</span>
<a name="FindFreeimage.cmake-39"></a>  <span class="nb">endif</span> <span class="p">(</span><span class="s">NOT</span> <span class="s">freeimage_LIBRARIES</span><span class="p">)</span>
<a name="FindFreeimage.cmake-40"></a><span class="nb">endif</span> <span class="p">(</span><span class="s">NOT</span> <span class="s">freeimage_FOUND</span><span class="p">)</span>
</pre></div>
</td></tr></table>
    </div>
  


        </div>
        
      </div>
    </div>
  </div>
  
  <div data-module="source/set-changeset" data-hash="865ce266463065f92fa64430afecc279a875c159"></div>



  
    
    
    
  
  

  </div>

        
        
        
          
    
    
  
        
      </div>
    </div>
    <div id="code-search-cta"></div>
  </div>

      </div>
    </div>
  
</div>

<div id="adg3-dialog"></div>


  

<div data-module="components/mentions/index">
  
    
    
  
  
    
    
  
  
    
    
  
</div>
<div data-module="components/typeahead/emoji/index">
  
    
    
  
</div>

<div data-module="components/repo-typeahead/index">
  
    
    
  
</div>

    
    
  

    
    
  

    
    
  

    
    
  


  


    
    
  

    
    
  


  
    
    
  
  
    
    
  
  
    
    
  
  
    
    
  
  
    
    
  
  
    
    
  
  
    
    
  


  
  
  <aui-inline-dialog
    id="help-menu-dialog"
    data-aui-alignment="bottom right"

    
    data-aui-alignment-static="true"
    data-module="header/help-menu"
    responds-to="toggle"
    aria-hidden="true">

  <div id="help-menu-section">
    <h1 class="help-menu-heading">Help</h1>

    <form id="help-menu-search-form" class="aui" target="_blank" method="get"
        action="https://support.atlassian.com/customer/search">
      <span id="help-menu-search-icon" class="aui-icon aui-icon-large aui-iconfont-search"></span>
      <input id="help-menu-search-form-input" name="q" class="text" type="text" placeholder="Ask a question">
    </form>

    <ul id="help-menu-links">
      <li>
        <a class="support-ga" data-support-gaq-page="DocumentationHome"
            href="https://confluence.atlassian.com/x/bgozDQ" target="_blank">
          Online help
        </a>
      </li>
      <li>
        <a class="support-ga" data-support-gaq-page="GitTutorials"
            href="https://www.atlassian.com/git?utm_source=bitbucket&amp;utm_medium=link&amp;utm_campaign=help_dropdown&amp;utm_content=learn_git"
            target="_blank">
          Learn Git
        </a>
      </li>
      <li>
        <a id="keyboard-shortcuts-link"
           href="#">Keyboard shortcuts</a>
      </li>
      <li>
        <a class="support-ga" data-support-gaq-page="DocumentationTutorials"
            href="https://confluence.atlassian.com/x/Q4sFLQ" target="_blank">
          Bitbucket tutorials
        </a>
      </li>
      <li>
        <a class="support-ga" data-support-gaq-page="SiteStatus"
            href="https://status.bitbucket.org/" target="_blank">
          Site status
        </a>
      </li>
      <li>
        <a class="support-ga" data-support-gaq-page="Home"
            href="https://support.atlassian.com/bitbucket-cloud/" target="_blank">
          Support
        </a>
      </li>
    </ul>
  </div>
</aui-inline-dialog>
  


  <div class="omnibar" data-module="components/omnibar/index">
    <form class="omnibar-form aui"></form>
  </div>
  
    
    
  
  
    
    
  
  
    
    
  
  
    
    
  





  

  <div class="_mustache-templates">
    
      <script id="branch-checkout-template" type="text/html">
        

<div id="checkout-branch-contents">
  <div class="command-line">
    <p>
      Check out this branch on your local machine to begin working on it.
    </p>
    <input type="text" class="checkout-command" readonly="readonly"
        
          value="hg pull && hg update [[branchName]]"
        
        >
  </div>
  
    <div class="sourcetree-callout clone-in-sourcetree"
  data-module="components/clone/clone-in-sourcetree"
  data-https-url="https://j4lley@bitbucket.org/ignitionrobotics/ign-common"
  data-ssh-url="ssh://hg@bitbucket.org/ignitionrobotics/ign-common">

  <div>
    <button class="aui-button aui-button-primary">
      
        Check out in Sourcetree
      
    </button>
  </div>

  <p class="windows-text">
    
      <a href="http://www.sourcetreeapp.com/?utm_source=internal&amp;utm_medium=link&amp;utm_campaign=clone_repo_win" target="_blank">Atlassian Sourcetree</a>
      is a free Git and Mercurial client for Windows.
    
  </p>
  <p class="mac-text">
    
      <a href="http://www.sourcetreeapp.com/?utm_source=internal&amp;utm_medium=link&amp;utm_campaign=clone_repo_mac" target="_blank">Atlassian Sourcetree</a>
      is a free Git and Mercurial client for Mac.
    
  </p>
</div>
  
</div>

      </script>
    
      <script id="branch-dialog-template" type="text/html">
        

<div class="tabbed-filter-widget branch-dialog">
  <div class="tabbed-filter">
    <input placeholder="Filter branches" class="filter-box" autosave="branch-dropdown-7338534" type="text">
    [[^ignoreTags]]
      <div class="aui-tabs horizontal-tabs aui-tabs-disabled filter-tabs">
        <ul class="tabs-menu">
          <li class="menu-item active-tab"><a href="#branches">Branches</a></li>
          <li class="menu-item"><a href="#tags">Tags</a></li>
        </ul>
      </div>
    [[/ignoreTags]]
  </div>
  
    <div class="tab-pane active-pane" id="branches" data-filter-placeholder="Filter branches">
      <ol class="filter-list">
        <li class="empty-msg">No matching branches</li>
        [[#branches]]
          
            [[#hasMultipleHeads]]
              [[#heads]]
                <li class="comprev filter-item">
                  <a class="pjax-trigger filter-item-link" href="/ignitionrobotics/ign-common/src/[[changeset]]/cmake/FindFreeimage.cmake?at=[[safeName]]"
                     title="[[name]]">
                    [[name]] ([[shortChangeset]])
                  </a>
                </li>
              [[/heads]]
            [[/hasMultipleHeads]]
            [[^hasMultipleHeads]]
              <li class="comprev filter-item">
                <a class="pjax-trigger filter-item-link" href="/ignitionrobotics/ign-common/src/[[changeset]]/cmake/FindFreeimage.cmake?at=[[safeName]]" title="[[name]]">
                  [[name]]
                </a>
              </li>
            [[/hasMultipleHeads]]
          
        [[/branches]]
      </ol>
    </div>
    <div class="tab-pane" id="tags" data-filter-placeholder="Filter tags">
      <ol class="filter-list">
        <li class="empty-msg">No matching tags</li>
        [[#tags]]
          <li class="comprev filter-item">
            <a class="pjax-trigger filter-item-link" href="/ignitionrobotics/ign-common/src/[[changeset]]/cmake/FindFreeimage.cmake?at=[[safeName]]" title="[[name]]">
              [[name]]
            </a>
          </li>
        [[/tags]]
      </ol>
    </div>
  
</div>

      </script>
    
      <script id="image-upload-template" type="text/html">
        

<form id="upload-image" method="POST"
    
      action="/xhr/ignitionrobotics/ign-common/image-upload/"
    >
  <input type='hidden' name='csrfmiddlewaretoken' value='n86EPSELmr0ND2LmrmjtHofpX8SN6UVHTnvZt8NeMSMfwRxesuWw1VS5118Eidv1' />

  <div class="drop-target">
    <p class="centered">Drag image here</p>
  </div>

  
  <div>
    <button class="aui-button click-target">Select an image</button>
    <input name="file" type="file" class="hidden file-target"
           accept="image/jpeg, image/gif, image/png" />
    <input type="submit" class="hidden">
  </div>
</form>


      </script>
    
      <script id="mention-result" type="text/html">
        
<span class="mention-result">
  <span class="aui-avatar aui-avatar-small mention-result--avatar">
    <span class="aui-avatar-inner">
      <img src="[[avatar_url]]">
    </span>
  </span>
  [[#display_name]]
    <span class="display-name mention-result--display-name">[[&display_name]]</span> <small class="username mention-result--username">[[&username]]</small>
  [[/display_name]]
  [[^display_name]]
    <span class="username mention-result--username">[[&username]]</span>
  [[/display_name]]
  [[#is_teammate]][[^is_team]]
    <span class="aui-lozenge aui-lozenge-complete aui-lozenge-subtle mention-result--lozenge">teammate</span>
  [[/is_team]][[/is_teammate]]
</span>
      </script>
    
      <script id="mention-call-to-action" type="text/html">
        
[[^query]]
<li class="bb-typeahead-item">Begin typing to search for a user</li>
[[/query]]
[[#query]]
<li class="bb-typeahead-item">Continue typing to search for a user</li>
[[/query]]

      </script>
    
      <script id="mention-no-results" type="text/html">
        
[[^searching]]
<li class="bb-typeahead-item">Found no matching users for <em>[[query]]</em>.</li>
[[/searching]]
[[#searching]]
<li class="bb-typeahead-item bb-typeahead-searching">Searching for <em>[[query]]</em>.</li>
[[/searching]]

      </script>
    
      <script id="emoji-result" type="text/html">
        
<span class="emoji-result">
  <span class="emoji-result--avatar">
    <img class="emoji" src="[[src]]">
  </span>
  <span class="name emoji-result--name">[[&name]]</span>
</span>

      </script>
    
      <script id="repo-typeahead-result" type="text/html">
        <span class="aui-avatar aui-avatar-project aui-avatar-xsmall">
  <span class="aui-avatar-inner">
    <img src="[[avatar]]">
  </span>
</span>
<span class="owner">[[&owner]]</span>/<span class="slug">[[&slug]]</span>

      </script>
    
      <script id="share-form-template" type="text/html">
        

<div class="error aui-message hidden">
  <span class="aui-icon icon-error"></span>
  <div class="message"></div>
</div>
<form class="aui">
  <table class="widget bb-list aui">
    <thead>
    <tr class="assistive">
      <th class="user">User</th>
      <th class="role">Role</th>
      <th class="actions">Actions</th>
    </tr>
    </thead>
    <tbody>
      <tr class="form">
        <td colspan="2">
          <input type="text" class="text bb-user-typeahead user-or-email"
                 placeholder="Username or email address"
                 autocomplete="off"
                 data-bb-typeahead-focus="false"
                 [[#disabled]]disabled[[/disabled]]>
        </td>
        <td class="actions">
          <button type="submit" class="aui-button aui-button-light" disabled>Add</button>
        </td>
      </tr>
    </tbody>
  </table>
</form>

      </script>
    
      <script id="share-detail-template" type="text/html">
        

[[#username]]
<td class="user
    [[#hasCustomGroups]]custom-groups[[/hasCustomGroups]]"
    [[#error]]data-error="[[error]]"[[/error]]>
  <div title="[[displayName]]">
    <a href="/[[username]]/" class="user">
      <span class="aui-avatar aui-avatar-xsmall">
        <span class="aui-avatar-inner">
          <img src="[[avatar]]">
        </span>
      </span>
      <span>[[displayName]]</span>
    </a>
  </div>
</td>
[[/username]]
[[^username]]
<td class="email
    [[#hasCustomGroups]]custom-groups[[/hasCustomGroups]]"
    [[#error]]data-error="[[error]]"[[/error]]>
  <div title="[[email]]">
    <span class="aui-icon aui-icon-small aui-iconfont-email"></span>
    [[email]]
  </div>
</td>
[[/username]]
<td class="role
    [[#hasCustomGroups]]custom-groups[[/hasCustomGroups]]">
  <div>
    [[#group]]
      [[#hasCustomGroups]]
        <select class="group [[#noGroupChoices]]hidden[[/noGroupChoices]]">
          [[#groups]]
            <option value="[[slug]]"
                [[#isSelected]]selected[[/isSelected]]>
              [[name]]
            </option>
          [[/groups]]
        </select>
      [[/hasCustomGroups]]
      [[^hasCustomGroups]]
      <label>
        <input type="checkbox" class="admin"
            [[#isAdmin]]checked[[/isAdmin]]>
        Administrator
      </label>
      [[/hasCustomGroups]]
    [[/group]]
    [[^group]]
      <ul>
        <li class="permission aui-lozenge aui-lozenge-complete
            [[^read]]aui-lozenge-subtle[[/read]]"
            data-permission="read">
          read
        </li>
        <li class="permission aui-lozenge aui-lozenge-complete
            [[^write]]aui-lozenge-subtle[[/write]]"
            data-permission="write">
          write
        </li>
        <li class="permission aui-lozenge aui-lozenge-complete
            [[^admin]]aui-lozenge-subtle[[/admin]]"
            data-permission="admin">
          admin
        </li>
      </ul>
    [[/group]]
  </div>
</td>
<td class="actions
    [[#hasCustomGroups]]custom-groups[[/hasCustomGroups]]">
  <div>
    <a href="#" class="delete">
      <span class="aui-icon aui-icon-small aui-iconfont-remove">Delete</span>
    </a>
  </div>
</td>

      </script>
    
      <script id="share-team-template" type="text/html">
        

<div class="clearfix">
  <span class="team-avatar-container">
    <span class="aui-avatar aui-avatar-medium">
      <span class="aui-avatar-inner">
        <img src="[[avatar]]">
      </span>
    </span>
  </span>
  <span class="team-name-container">
    [[display_name]]
  </span>
</div>
<p class="helptext">
  
    Existing users are granted access to this team immediately.
    New users will be sent an invitation.
  
</p>
<div class="share-form"></div>

      </script>
    
      <script id="scope-list-template" type="text/html">
        <ul class="scope-list">
  [[#scopes]]
    <li class="scope-list--item">
      <span class="scope-list--icon aui-icon aui-icon-small [[icon]]"></span>
      <span class="scope-list--description">[[description]]</span>
    </li>
  [[/scopes]]
</ul>

      </script>
    
      <script id="source-changeset" type="text/html">
        

<a href="/ignitionrobotics/ign-common/src/[[raw_node]]/[[path]]?at=default"
    class="[[#selected]]highlight[[/selected]]"
    data-hash="[[node]]">
  [[#author.username]]
    <span class="aui-avatar aui-avatar-xsmall">
      <span class="aui-avatar-inner">
        <img src="[[author.avatar]]">
      </span>
    </span>
    <span class="author" title="[[raw_author]]">[[author.display_name]]</span>
  [[/author.username]]
  [[^author.username]]
    <span class="aui-avatar aui-avatar-xsmall">
      <span class="aui-avatar-inner">
        <img src="https://d301sr5gafysq2.cloudfront.net/370568ebc84f/img/default_avatar/user_blue.svg">
      </span>
    </span>
    <span class="author unmapped" title="[[raw_author]]">[[author]]</span>
  [[/author.username]]
  <time datetime="[[utctimestamp]]" data-title="true">[[utctimestamp]]</time>
  <span class="message">[[message]]</span>
</a>

      </script>
    
      <script id="embed-template" type="text/html">
        

<form class="aui inline-dialog-embed-dialog">
  <label for="embed-code-[[dialogId]]">Embed this source in another page:</label>
  <input type="text" readonly="true" value="&lt;script src=&quot;[[url]]&quot;&gt;&lt;/script&gt;" id="embed-code-[[dialogId]]" class="embed-code">
</form>

      </script>
    
      <script id="edit-form-template" type="text/html">
        


<form class="bb-content-container online-edit-form aui"
      data-repository="[[owner]]/[[slug]]"
      data-destination-repository="[[destinationOwner]]/[[destinationSlug]]"
      data-local-id="[[localID]]"
      [[#isWriter]]data-is-writer="true"[[/isWriter]]
      [[#hasPushAccess]]data-has-push-access="true"[[/hasPushAccess]]
      [[#isPullRequest]]data-is-pull-request="true"[[/isPullRequest]]
      [[#hideCreatePullRequest]]data-hide-create-pull-request="true"[[/hideCreatePullRequest]]
      data-hash="[[hash]]"
      data-branch="[[branch]]"
      data-path="[[path]]"
      data-is-create="[[isCreate]]"
      data-preview-url="/xhr/[[owner]]/[[slug]]/preview/[[hash]]/[[encodedPath]]"
      data-preview-error="We had trouble generating your preview."
      data-unsaved-changes-error="Your changes will be lost. Are you sure you want to leave?">
  <div class="bb-content-container-header">
    <div class="bb-content-container-header-primary">
      <span class="bb-content-container-heading">
        [[#isCreate]]
          [[#branch]]
            
              Creating <span class="edit-path">[[path]]</span> on branch: <strong>[[branch]]</strong>
            
          [[/branch]]
          [[^branch]]
            [[#path]]
              
                Creating <span class="edit-path">[[path]]</span>
              
            [[/path]]
            [[^path]]
              
                Creating <span class="edit-path">unnamed file</span>
              
            [[/path]]
          [[/branch]]
        [[/isCreate]]
        [[^isCreate]]
          
            Editing <span class="edit-path">[[path]]</span> on branch: <strong>[[branch]]</strong>
          
        [[/isCreate]]
      </span>
    </div>
    <div class="bb-content-container-header-secondary">
      <div class="hunk-nav aui-buttons">
        <button class="prev-hunk-button aui-button aui-button-light"
            disabled="disabled" aria-disabled="true"
            title="Previous change">
          <span class="aui-icon aui-icon-small aui-iconfont-up">Previous change</span>
        </button>
        <button class="next-hunk-button aui-button aui-button-light"
            disabled="disabled" aria-disabled="true"
            title="Next change">
          <span class="aui-icon aui-icon-small aui-iconfont-down">Next change</span>
        </button>
      </div>
    </div>
  </div>
  <div class="bb-content-container-body has-header has-footer file-editor">
    <textarea id="id_source"></textarea>
  </div>
  <div class="preview-pane"></div>
  <div class="bb-content-container-footer">
    <div class="bb-content-container-footer-primary">
      <div id="syntax-mode" class="bb-content-container-item field">
        <label for="id_syntax-mode" class="online-edit-form--label">Syntax mode:</label>
        <select id="id_syntax-mode">
          [[#syntaxes]]
            <option value="[[#mime]][[mime]][[/mime]][[^mime]][[mode]][[/mime]]">[[name]]</option>
          [[/syntaxes]]
        </select>
      </div>
      <div id="indent-mode" class="bb-content-container-item field">
        <label for="id_indent-mode" class="online-edit-form--label">Indent mode:</label>
        <select id="id_indent-mode">
          <option value="tabs">Tabs</option>
          <option value="spaces">Spaces</option>
        </select>
      </div>
      <div id="indent-size" class="bb-content-container-item field">
        <label for="id_indent-size" class="online-edit-form--label">Indent size:</label>
        <select id="id_indent-size">
          <option value="2">2</option>
          <option value="4">4</option>
          <option value="8">8</option>
        </select>
      </div>
      <div id="wrap-mode" class="bb-content-container-item field">
        <label for="id_wrap-mode" class="online-edit-form--label">Line wrap:</label>
        <select id="id_wrap-mode">
          <option value="">Off</option>
          <option value="soft">On</option>
        </select>
      </div>
    </div>
    <div class="bb-content-container-footer-secondary">
      [[^isCreate]]
        <button class="preview-button aui-button aui-button-light"
                disabled="disabled" aria-disabled="true"
                data-preview-label="View diff"
                data-edit-label="Edit file">View diff</button>
      [[/isCreate]]
      <button class="save-button aui-button aui-button-primary"
              disabled="disabled" aria-disabled="true">Commit</button>
      [[^isCreate]]
        <a class="aui-button aui-button-link cancel-link" href="#">Cancel</a>
      [[/isCreate]]
    </div>
  </div>
</form>

      </script>
    
      <script id="commit-form-template" type="text/html">
        

<form class="aui commit-form"
      data-title="Commit changes"
      [[#isDelete]]
        data-default-message="[[filename]] deleted online with Bitbucket"
      [[/isDelete]]
      [[#isCreate]]
        data-default-message="[[filename]] created online with Bitbucket"
      [[/isCreate]]
      [[^isDelete]]
        [[^isCreate]]
          data-default-message="[[filename]] edited online with Bitbucket"
        [[/isCreate]]
      [[/isDelete]]
      data-fork-error="We had trouble creating your fork."
      data-commit-error="We had trouble committing your changes."
      data-pull-request-error="We had trouble creating your pull request."
      data-update-error="We had trouble updating your pull request."
      data-branch-conflict-error="A branch with that name already exists."
      data-forking-message="Forking repository"
      data-committing-message="Committing changes"
      data-merging-message="Branching and merging changes"
      data-creating-pr-message="Creating pull request"
      data-updating-pr-message="Updating pull request"
      data-cta-label="Commit"
      data-cancel-label="Cancel">
  [[#isDelete]]
    <div class="aui-message info">
      <span class="aui-icon icon-info"></span>
      <span class="message">
        
          Committing this change will delete [[filename]] from your repository.
        
      </span>
    </div>
  [[/isDelete]]
  <div class="aui-message error hidden">
    <span class="aui-icon icon-error"></span>
    <span class="message"></span>
  </div>
  [[^isWriter]]
    <div class="aui-message info">
      <span class="aui-icon icon-info"></span>
      <p class="title">
        
          You don't have write access to this repository.
        
      </p>
      <span class="message">
        
          We'll create a fork for your changes and submit a
          pull request back to this repository.
        
      </span>
    </div>
  [[/isWriter]]
  [[#isRename]]
    <div class="field-group">
      <label for="id_path">New path</label>
      <input type="text" id="id_path" class="text" value="[[path]]"/>
    </div>
  [[/isRename]]
  <div class="field-group">
    <label for="id_message">Commit message</label>
    <textarea id="id_message" class="long-field textarea"></textarea>
  </div>
  [[^isPullRequest]]
    [[#isWriter]]
      <fieldset class="group">
        <div class="checkbox">
          [[#hasPushAccess]]
            [[^hideCreatePullRequest]]
              <input id="id_create-pullrequest" class="checkbox" type="checkbox">
              <label for="id_create-pullrequest">Create a pull request for this change</label>
            [[/hideCreatePullRequest]]
          [[/hasPushAccess]]
          [[^hasPushAccess]]
            <input id="id_create-pullrequest" class="checkbox" type="checkbox" checked="checked" aria-disabled="true" disabled="true">
            <label for="id_create-pullrequest" title="Branch restrictions do not allow you to update this branch.">Create a pull request for this change</label>
          [[/hasPushAccess]]
        </div>
      </fieldset>
      <div id="pr-fields">
        <div id="branch-name-group" class="field-group">
          <label for="id_branch-name">Branch name</label>
          <input type="text" id="id_branch-name" class="text long-field">
        </div>
        

<div class="field-group" id="id_reviewers_group">
  <label for="reviewers">Reviewers</label>

  
  <input id="reviewers" name="reviewers" type="hidden"
          value=""
          data-mention-url="/xhr/mentions/repositories/:dest_username/:dest_slug"
          data-reviewers="[]"
          data-suggested="[]"
          data-locked="[]">

  <div class="error"></div>
  <div class="suggested-reviewers"></div>

</div>

      </div>
    [[/isWriter]]
  [[/isPullRequest]]
  <button type="submit" id="id_submit">Commit</button>
</form>

      </script>
    
      <script id="merge-message-template" type="text/html">
        Merged [[hash]] into [[branch]]

[[message]]

      </script>
    
      <script id="commit-merge-error-template" type="text/html">
        



  We had trouble merging your changes. We stored them on the <strong>[[branch]]</strong> branch, so feel free to
  <a href="/[[owner]]/[[slug]]/full-commit/[[hash]]/[[path]]?at=[[encodedBranch]]">view them</a> or
  <a href="#" class="create-pull-request-link">create a pull request</a>.


      </script>
    
      <script id="selected-reviewer-template" type="text/html">
        <div class="aui-avatar aui-avatar-xsmall">
  <div class="aui-avatar-inner">
    <img src="[[avatar_url]]">
  </div>
</div>
[[display_name]]

      </script>
    
      <script id="suggested-reviewer-template" type="text/html">
        <button class="aui-button aui-button-link" type="button" tabindex="-1">[[display_name]]</button>

      </script>
    
      <script id="suggested-reviewers-template" type="text/html">
        

<span class="suggested-reviewer-list-label">Recent:</span>
<ul class="suggested-reviewer-list unstyled-list"></ul>

      </script>
    
      <script id="omnibar-form-template" type="text/html">
        <div class="omnibar-input-container">
  <input class="omnibar-input" type="text" [[#placeholder]]placeholder="[[placeholder]]"[[/placeholder]]>
</div>
<ul class="omnibar-result-group-list"></ul>

      </script>
    
      <script id="omnibar-blank-slate-template" type="text/html">
        

<div class="omnibar-blank-slate">No results found</div>

      </script>
    
      <script id="omnibar-result-group-list-item-template" type="text/html">
        <div class="omnibar-result-group-header clearfix">
  <h2 class="omnibar-result-group-label" title="[[label]]">[[label]]</h2>
  <span class="omnibar-result-group-context" title="[[context]]">[[context]]</span>
</div>
<ul class="omnibar-result-list unstyled-list"></ul>

      </script>
    
      <script id="omnibar-result-list-item-template" type="text/html">
        [[#url]]
  <a href="[[&url]]" class="omnibar-result-label">[[&label]]</a>
[[/url]]
[[^url]]
  <span class="omnibar-result-label">[[&label]]</span>
[[/url]]
[[#context]]
  <span class="omnibar-result-context">[[context]]</span>
[[/context]]

      </script>
    
  </div>




  
  


<script nonce="ufLSGDhNmtxLTZnl">
  window.__initial_state__ = {"global": {"features": {"pr-merge-sign-off": true, "create-initial-readme": true, "clone-mirrors": true, "show-guidance-message": true, "use-moneybucket": true, "adg3": true, "new-signup-flow": true, "fe_word_diff": true, "clonebundles": true, "source_webitem": true, "downgrade-survey": true, "diff-renames-public": true, "app-passwords": true, "evolution": false, "trello-boards": true, "atlassian-editor": false, "code-search-cta": true, "simple-team-creation": true, "diff-renames-internal": true, "search-syntax-highlighting": true, "code-search-cta-launch": true, "lfs_post_beta": true}, "locale": "en", "geoip_country": "ES", "targetFeatures": {"pr-merge-sign-off": true, "create-initial-readme": true, "clone-mirrors": true, "show-guidance-message": true, "use-moneybucket": true, "adg3": true, "new-signup-flow": true, "fe_word_diff": true, "clonebundles": true, "source_webitem": true, "downgrade-survey": true, "diff-renames-public": true, "app-passwords": true, "evolution": false, "trello-boards": true, "atlassian-editor": false, "code-search-cta": true, "simple-team-creation": true, "diff-renames-internal": true, "search-syntax-highlighting": true, "code-search-cta-launch": true, "lfs_post_beta": true}, "isFocusedTask": false, "teams": [], "bitbucketActions": [{"analytics_label": null, "icon_class": "", "badge_label": null, "weight": 100, "url": "/repo/create?owner=ignitionrobotics", "tab_name": null, "can_display": true, "label": "<strong>Repository<\/strong>", "anchor": true, "analytics_payload": {}, "target": "_self", "type": "menu_item", "id": "repository-create-drawer-item", "icon": ""}, {"analytics_label": null, "icon_class": "", "badge_label": null, "weight": 110, "url": "/account/create-team/", "tab_name": null, "can_display": true, "label": "<strong>Team<\/strong>", "anchor": true, "analytics_payload": {}, "target": "_self", "type": "menu_item", "id": "team-create-drawer-item", "icon": ""}, {"analytics_label": null, "icon_class": "", "badge_label": null, "weight": 120, "url": "/account/projects/create?owner=ignitionrobotics", "tab_name": null, "can_display": true, "label": "<strong>Project<\/strong>", "anchor": true, "analytics_payload": {}, "target": "_self", "type": "menu_item", "id": "project-create-drawer-item", "icon": ""}, {"analytics_label": null, "icon_class": "", "badge_label": null, "weight": 130, "url": "/snippets/new?owner=ignitionrobotics", "tab_name": null, "can_display": true, "label": "<strong>Snippet<\/strong>", "anchor": true, "analytics_payload": {}, "target": "_self", "type": "menu_item", "id": "snippet-create-drawer-item", "icon": ""}], "targetUser": {"username": "ignitionrobotics", "website": null, "display_name": "ignitionrobotics", "uuid": "{dd3bee6b-ed2f-496a-9634-d99cf5144fc5}", "links": {"self": {"href": "https://bitbucket.org/!api/2.0/teams/ignitionrobotics"}, "html": {"href": "https://bitbucket.org/ignitionrobotics/"}, "avatar": {"href": "https://bitbucket.org/account/ignitionrobotics/avatar/32/"}}, "extra": {"has_atlassian_account": false}, "created_on": "2014-04-02T17:08:45.227613+00:00", "location": null, "type": "team"}, "isNavigationOpen": true, "path": "/ignitionrobotics/ign-common/src/865ce266463065f92fa64430afecc279a875c159/cmake/FindFreeimage.cmake", "focusedTaskBackButtonUrl": "https://bitbucket.org/ignitionrobotics/ign-common/src/865ce266463065f92fa64430afecc279a875c159/cmake/?at=default", "currentUser": {"username": "j4lley", "website": "http://www.j4lley.com/", "display_name": "Jose A. Iglesias Guitian", "account_id": "557058:e8ec7bd5-987b-4b5d-98d0-a63a16fb05d5", "links": {"self": {"href": "https://bitbucket.org/!api/2.0/users/j4lley"}, "html": {"href": "https://bitbucket.org/j4lley/"}, "avatar": {"href": "https://bitbucket.org/account/j4lley/avatar/32/"}}, "extra": {"has_atlassian_account": true}, "created_on": "2014-10-14T16:04:48.299567+00:00", "is_staff": false, "location": null, "type": "user", "uuid": "{578f460d-c051-45e9-9c7b-7c76d1c82790}"}}, "connect": {}, "repository": {"section": {"connectActions": [], "cloneProtocol": "https", "currentRepository": {"scm": "hg", "website": "", "name": "ign-common", "links": {"clone": [{"href": "https://j4lley@bitbucket.org/ignitionrobotics/ign-common", "name": "https"}, {"href": "ssh://hg@bitbucket.org/ignitionrobotics/ign-common", "name": "ssh"}], "self": {"href": "https://bitbucket.org/!api/2.0/repositories/ignitionrobotics/ign-common"}, "html": {"href": "https://bitbucket.org/ignitionrobotics/ign-common"}, "avatar": {"href": "https://bitbucket.org/ignitionrobotics/ign-common/avatar/32/"}}, "project": {"uuid": "{c8cf0b7d-0e21-4e27-8a3c-cde0e4f4fda8}", "links": {"self": {"href": "https://bitbucket.org/!api/2.0/teams/ignitionrobotics/projects/IG"}, "html": {"href": "https://bitbucket.org/account/user/ignitionrobotics/projects/IG"}, "avatar": {"href": "https://bitbucket.org/account/user/ignitionrobotics/projects/IG/avatar/32"}}, "name": "Ignition", "created_on": "2016-02-10T15:33:24.614394+00:00", "key": "IG", "owner": {"username": "ignitionrobotics", "type": "team", "display_name": "ignitionrobotics", "uuid": "{dd3bee6b-ed2f-496a-9634-d99cf5144fc5}", "links": {"self": {"href": "https://bitbucket.org/!api/2.0/teams/ignitionrobotics"}, "html": {"href": "https://bitbucket.org/ignitionrobotics/"}, "avatar": {"href": "https://bitbucket.org/account/ignitionrobotics/avatar/32/"}}}, "updated_on": "2016-02-10T15:33:24.614480+00:00", "type": "project", "is_private": false, "description": "Simple libraries for robot applications"}, "language": "c++", "full_name": "ignitionrobotics/ign-common", "owner": {"username": "ignitionrobotics", "website": null, "display_name": "ignitionrobotics", "uuid": "{dd3bee6b-ed2f-496a-9634-d99cf5144fc5}", "links": {"self": {"href": "https://bitbucket.org/!api/2.0/teams/ignitionrobotics"}, "html": {"href": "https://bitbucket.org/ignitionrobotics/"}, "avatar": {"href": "https://bitbucket.org/account/ignitionrobotics/avatar/32/"}}, "created_on": "2014-04-02T17:08:45.227613+00:00", "location": null, "type": "team"}, "type": "repository", "slug": "ign-common", "is_private": false, "uuid": "{1dfbdd30-34c5-4b09-82ef-9bfe2917877b}"}, "menuItems": [{"analytics_label": "repository.overview", "icon_class": "icon-overview", "badge_label": null, "weight": 100, "url": "/ignitionrobotics/ign-common/overview", "tab_name": "overview", "can_display": true, "label": "Overview", "anchor": true, "analytics_payload": {}, "target": "_self", "type": "menu_item", "id": "repo-overview-link", "icon": "icon-overview"}, {"analytics_label": "repository.source", "icon_class": "icon-source", "badge_label": null, "weight": 200, "url": "/ignitionrobotics/ign-common/src", "tab_name": "source", "can_display": true, "label": "Source", "anchor": true, "analytics_payload": {}, "target": "_self", "type": "menu_item", "id": "repo-source-link", "icon": "icon-source"}, {"analytics_label": "repository.commits", "icon_class": "icon-commits", "badge_label": null, "weight": 300, "url": "/ignitionrobotics/ign-common/commits/", "tab_name": "commits", "can_display": true, "label": "Commits", "anchor": true, "analytics_payload": {}, "target": "_self", "type": "menu_item", "id": "repo-commits-link", "icon": "icon-commits"}, {"analytics_label": "repository.branches", "icon_class": "icon-branches", "badge_label": null, "weight": 400, "url": "/ignitionrobotics/ign-common/branches/", "tab_name": "branches", "can_display": true, "label": "Branches", "anchor": true, "analytics_payload": {}, "target": "_self", "type": "menu_item", "id": "repo-branches-link", "icon": "icon-branches"}, {"analytics_label": "repository.pullrequests", "icon_class": "icon-pull-requests", "badge_label": "5 open pull requests", "weight": 500, "url": "/ignitionrobotics/ign-common/pull-requests/", "tab_name": "pullrequests", "can_display": true, "label": "Pull requests", "anchor": true, "analytics_payload": {}, "target": "_self", "type": "menu_item", "id": "repo-pullrequests-link", "icon": "icon-pull-requests"}, {"analytics_label": "user.addon", "icon_class": "aui-iconfont-build", "badge_label": null, "weight": 550, "url": "/ignitionrobotics/ign-common/addon/pipelines/home", "tab_name": "repopage-6e6kyz-add-on-link", "can_display": true, "label": "Pipelines", "anchor": true, "analytics_payload": {}, "icon_url": null, "type": "connect_menu_item", "id": "repopage-6e6kyz-add-on-link", "target": "_self"}, {"analytics_label": "issues", "icon_class": "icon-issues", "badge_label": "14 active issues", "weight": 600, "url": "/ignitionrobotics/ign-common/issues?status=new&status=open", "tab_name": "issues", "can_display": true, "label": "Issues", "anchor": true, "analytics_payload": {}, "target": "_self", "type": "menu_item", "id": "repo-issues-link", "icon": "icon-issues"}, {"analytics_label": "repository.wiki", "icon_class": "icon-wiki", "badge_label": null, "weight": 700, "url": "/ignitionrobotics/ign-common/wiki/", "tab_name": "wiki", "can_display": true, "label": "Wiki", "anchor": true, "analytics_payload": {}, "target": "_self", "type": "menu_item", "id": "repo-wiki-link", "icon": "icon-wiki"}, {"analytics_label": "repository.downloads", "icon_class": "icon-downloads", "badge_label": null, "weight": 800, "url": "/ignitionrobotics/ign-common/downloads/", "tab_name": "downloads", "can_display": true, "label": "Downloads", "anchor": true, "analytics_payload": {}, "target": "_self", "type": "menu_item", "id": "repo-downloads-link", "icon": "icon-downloads"}, {"analytics_label": "user.addon", "icon_class": "aui-iconfont-unfocus", "badge_label": null, "weight": 100, "url": "/ignitionrobotics/ign-common/addon/bitbucket-trello-addon/trello-board", "tab_name": "repopage-AdLGyd-add-on-link", "can_display": true, "label": "Boards", "anchor": false, "analytics_payload": {}, "icon_url": "https://bitbucket-assetroot.s3.amazonaws.com/add-on/icons/35ceae0c-17b1-443c-a6e8-d9de1d7cccdb.svg?Signature=q1bDI7pXEs8iImy1bqTN4yHTRpE%3D&Expires=1511405634&AWSAccessKeyId=AKIAIQWXW6WLXMB5QZAQ&versionId=3oqdrZZjT.HijZ3kHTPsXE6IcSjhCG.P", "type": "connect_menu_item", "id": "repopage-AdLGyd-add-on-link", "target": "_self"}], "bitbucketActions": [{"analytics_label": "repository.clone", "icon_class": "icon-clone", "badge_label": null, "weight": 100, "url": "#clone", "tab_name": "clone", "can_display": true, "label": "<strong>Clone<\/strong> this repository", "anchor": true, "analytics_payload": {}, "target": "_self", "type": "menu_item", "id": "repo-clone-button", "icon": "icon-clone"}, {"analytics_label": "repository.compare", "icon_class": "aui-icon-small aui-iconfont-devtools-compare", "badge_label": null, "weight": 400, "url": "/ignitionrobotics/ign-common/branches/compare", "tab_name": "compare", "can_display": true, "label": "<strong>Compare<\/strong> branches or tags", "anchor": true, "analytics_payload": {}, "target": "_self", "type": "menu_item", "id": "repo-compare-link", "icon": "aui-icon-small aui-iconfont-devtools-compare"}, {"analytics_label": "repository.fork", "icon_class": "icon-fork", "badge_label": null, "weight": 500, "url": "/ignitionrobotics/ign-common/fork", "tab_name": "fork", "can_display": true, "label": "<strong>Fork<\/strong> this repository", "anchor": true, "analytics_payload": {}, "target": "_self", "type": "menu_item", "id": "repo-fork-link", "icon": "icon-fork"}], "activeMenuItem": "source"}}};
  window.__settings__ = {"SOCIAL_AUTH_ATLASSIANID_LOGOUT_URL": "https://id.atlassian.com/logout", "CANON_URL": "https://bitbucket.org", "API_CANON_URL": "https://api.bitbucket.org"};
</script>

<script src="https://d301sr5gafysq2.cloudfront.net/370568ebc84f/jsi18n/en/djangojs.js" nonce="ufLSGDhNmtxLTZnl"></script>

  <script src="https://d301sr5gafysq2.cloudfront.net/370568ebc84f/dist/webpack/locales/en.js"></script>

<script src="https://d301sr5gafysq2.cloudfront.net/370568ebc84f/dist/webpack/vendor.js" nonce="ufLSGDhNmtxLTZnl"></script>
<script src="https://d301sr5gafysq2.cloudfront.net/370568ebc84f/dist/webpack/app.js" nonce="ufLSGDhNmtxLTZnl"></script>


<script async src="https://www.google-analytics.com/analytics.js" nonce="ufLSGDhNmtxLTZnl"></script>

<script type="text/javascript">window.NREUM||(NREUM={});NREUM.info={"beacon":"bam.nr-data.net","queueTime":0,"licenseKey":"a2cef8c3d3","agent":"","transactionName":"Z11RZxdWW0cEVkYLDV4XdUYLVEFdClsdAAtEWkZQDlJBGgRFQhFMQl1DXFcZQ10AQkFYBFlUVlEXWEJHAA==","applicationID":"1841284","errorBeacon":"bam.nr-data.net","applicationTime":1390}</script>
</body>
</html>