<%@page import="com.DTO.t_team_memberDTO"%>
<%@page import="com.DTO.t_scheduleDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DTO.memberDTO"%>
<%@page import="com.DTO.t_teamDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />

<title>Insert title here</title>
<!-- plugins:css -->
 <link rel="stylesheet" href="vendors/feather/feather.css"> 
 <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
   <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
 <link rel="stylesheet"
   href="vendors/datatables.net-bs4/dataTables.bootstrap4.css"> 
 <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css"> 
 <link rel="stylesheet" type="text/css"
   href="js/select.dataTables.min.css"> 
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="images/favicon.png" />

<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
<meta name="viewport"
   content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->

<script
   src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script
   src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<style>
@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body,button,a{
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
}
  


.fc-icon,.fc-unselectable{-moz-user-select:none;-ms-user-select:none}
.fc .fc-button,.fc-icon{text-transform:none;font-weight:400}
.fc-not-allowed,.fc-not-allowed .fc-event{cursor:not-allowed}
.fc .fc-button:not(:disabled),
.fc a[data-navlink],.fc-event.fc-event-draggable,.fc-event[href]{cursor:pointer}
.fc-unselectable{-webkit-user-select:none;user-select:none;-webkit-touch-callout:none;-webkit-tap-highlight-color:transparent}
.fc{display:flex;flex-direction:column;font-size:1em}
.fc .fc-button,.fc-icon{display:inline-block;text-align:center}
.fc,.fc *,.fc :after,.fc :before{box-sizing:border-box}
.fc table{border-collapse:collapse;border-spacing:0;font-size:1em}
.fc th{text-align:center}
.fc td,.fc th{vertical-align:top;padding:0}
.fc .fc-button,.fc .fc-button .fc-icon,.fc .fc-button-group,.fc .fc-timegrid-slot-label{vertical-align:middle}
.fc a[data-navlink]:hover{text-decoration:underline}
.fc .fc-button:hover,.fc .fc-list-event-title a,a.fc-event,a.fc-event:hover{text-decoration:none}
.fc-direction-ltr{direction:ltr;text-align:left}.fc-direction-rtl{direction:rtl;text-align:right}
.fc-theme-standard td,.fc-theme-standard th{border:1px solid #ddd;border:1px solid var(--fc-border-color,#ddd)}
.fc-liquid-hack td,.fc-liquid-hack th{position:relative}
@font-face{font-family:fcicons;src:url("data:application/x-font-ttf;charset=utf-8;base64,AAEAAAALAIAAAwAwT1MvMg8SBfAAAAC8AAAAYGNtYXAXVtKNAAABHAAAAFRnYXNwAAAAEAAAAXAAAAAIZ2x5ZgYydxIAAAF4AAAFNGhlYWQUJ7cIAAAGrAAAADZoaGVhB20DzAAABuQAAAAkaG10eCIABhQAAAcIAAAALGxvY2ED4AU6AAAHNAAAABhtYXhwAA8AjAAAB0wAAAAgbmFtZXsr690AAAdsAAABhnBvc3QAAwAAAAAI9AAAACAAAwPAAZAABQAAApkCzAAAAI8CmQLMAAAB6wAzAQkAAAAAAAAAAAAAAAAAAAABEAAAAAAAAAAAAAAAAAAAAABAAADpBgPA/8AAQAPAAEAAAAABAAAAAAAAAAAAAAAgAAAAAAADAAAAAwAAABwAAQADAAAAHAADAAEAAAAcAAQAOAAAAAoACAACAAIAAQAg6Qb//f//AAAAAAAg6QD//f//AAH/4xcEAAMAAQAAAAAAAAAAAAAAAQAB//8ADwABAAAAAAAAAAAAAgAANzkBAAAAAAEAAAAAAAAAAAACAAA3OQEAAAAAAQAAAAAAAAAAAAIAADc5AQAAAAABAWIAjQKeAskAEwAAJSc3NjQnJiIHAQYUFwEWMjc2NCcCnuLiDQ0MJAz/AA0NAQAMJAwNDcni4gwjDQwM/wANIwz/AA0NDCMNAAAAAQFiAI0CngLJABMAACUBNjQnASYiBwYUHwEHBhQXFjI3AZ4BAA0N/wAMJAwNDeLiDQ0MJAyNAQAMIw0BAAwMDSMM4uINIwwNDQAAAAIA4gC3Ax4CngATACcAACUnNzY0JyYiDwEGFB8BFjI3NjQnISc3NjQnJiIPAQYUHwEWMjc2NCcB87e3DQ0MIw3VDQ3VDSMMDQ0BK7e3DQ0MJAzVDQ3VDCQMDQ3zuLcMJAwNDdUNIwzWDAwNIwy4twwkDA0N1Q0jDNYMDA0jDAAAAgDiALcDHgKeABMAJwAAJTc2NC8BJiIHBhQfAQcGFBcWMjchNzY0LwEmIgcGFB8BBwYUFxYyNwJJ1Q0N1Q0jDA0Nt7cNDQwjDf7V1Q0N1QwkDA0Nt7cNDQwkDLfWDCMN1Q0NDCQMt7gMIw0MDNYMIw3VDQ0MJAy3uAwjDQwMAAADAFUAAAOrA1UAMwBoAHcAABMiBgcOAQcOAQcOARURFBYXHgEXHgEXHgEzITI2Nz4BNz4BNz4BNRE0JicuAScuAScuASMFITIWFx4BFx4BFx4BFREUBgcOAQcOAQcOASMhIiYnLgEnLgEnLgE1ETQ2Nz4BNz4BNz4BMxMhMjY1NCYjISIGFRQWM9UNGAwLFQkJDgUFBQUFBQ4JCRULDBgNAlYNGAwLFQkJDgUFBQUFBQ4JCRULDBgN/aoCVgQIBAQHAwMFAQIBAQIBBQMDBwQECAT9qgQIBAQHAwMFAQIBAQIBBQMDBwQECASAAVYRGRkR/qoRGRkRA1UFBAUOCQkVDAsZDf2rDRkLDBUJCA4FBQUFBQUOCQgVDAsZDQJVDRkLDBUJCQ4FBAVVAgECBQMCBwQECAX9qwQJAwQHAwMFAQICAgIBBQMDBwQDCQQCVQUIBAQHAgMFAgEC/oAZEhEZGRESGQAAAAADAFUAAAOrA1UAMwBoAIkAABMiBgcOAQcOAQcOARURFBYXHgEXHgEXHgEzITI2Nz4BNz4BNz4BNRE0JicuAScuAScuASMFITIWFx4BFx4BFx4BFREUBgcOAQcOAQcOASMhIiYnLgEnLgEnLgE1ETQ2Nz4BNz4BNz4BMxMzFRQWMzI2PQEzMjY1NCYrATU0JiMiBh0BIyIGFRQWM9UNGAwLFQkJDgUFBQUFBQ4JCRULDBgNAlYNGAwLFQkJDgUFBQUFBQ4JCRULDBgN/aoCVgQIBAQHAwMFAQIBAQIBBQMDBwQECAT9qgQIBAQHAwMFAQIBAQIBBQMDBwQECASAgBkSEhmAERkZEYAZEhIZgBEZGREDVQUEBQ4JCRUMCxkN/asNGQsMFQkIDgUFBQUFBQ4JCBUMCxkNAlUNGQsMFQkJDgUEBVUCAQIFAwIHBAQIBf2rBAkDBAcDAwUBAgICAgEFAwMHBAMJBAJVBQgEBAcCAwUCAQL+gIASGRkSgBkSERmAEhkZEoAZERIZAAABAOIAjQMeAskAIAAAExcHBhQXFjI/ARcWMjc2NC8BNzY0JyYiDwEnJiIHBhQX4uLiDQ0MJAzi4gwkDA0N4uINDQwkDOLiDCQMDQ0CjeLiDSMMDQ3h4Q0NDCMN4uIMIw0MDOLiDAwNIwwAAAABAAAAAQAAa5n0y18PPPUACwQAAAAAANivOVsAAAAA2K85WwAAAAADqwNVAAAACAACAAAAAAAAAAEAAAPA/8AAAAQAAAAAAAOrAAEAAAAAAAAAAAAAAAAAAAALBAAAAAAAAAAAAAAAAgAAAAQAAWIEAAFiBAAA4gQAAOIEAABVBAAAVQQAAOIAAAAAAAoAFAAeAEQAagCqAOoBngJkApoAAQAAAAsAigADAAAAAAACAAAAAAAAAAAAAAAAAAAAAAAAAA4ArgABAAAAAAABAAcAAAABAAAAAAACAAcAYAABAAAAAAADAAcANgABAAAAAAAEAAcAdQABAAAAAAAFAAsAFQABAAAAAAAGAAcASwABAAAAAAAKABoAigADAAEECQABAA4ABwADAAEECQACAA4AZwADAAEECQADAA4APQADAAEECQAEAA4AfAADAAEECQAFABYAIAADAAEECQAGAA4AUgADAAEECQAKADQApGZjaWNvbnMAZgBjAGkAYwBvAG4Ac1ZlcnNpb24gMS4wAFYAZQByAHMAaQBvAG4AIAAxAC4AMGZjaWNvbnMAZgBjAGkAYwBvAG4Ac2ZjaWNvbnMAZgBjAGkAYwBvAG4Ac1JlZ3VsYXIAUgBlAGcAdQBsAGEAcmZjaWNvbnMAZgBjAGkAYwBvAG4Ac0ZvbnQgZ2VuZXJhdGVkIGJ5IEljb01vb24uAEYAbwBuAHQAIABnAGUAbgBlAHIAYQB0AGUAZAAgAGIAeQAgAEkAYwBvAE0AbwBvAG4ALgAAAAMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=") format('truetype');font-weight:400;font-style:normal}
.fc-icon{width:1em;height:1em;-webkit-user-select:none;user-select:none;font-family:fcicons!important;speak:none;font-style:normal;font-variant:normal;line-height:1;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale}
.fc-icon-chevron-left:before{content:"\e900"}
.fc-icon-chevron-right:before{content:"\e901"}
.fc-icon-chevrons-left:before{content:"\e902"}
.fc-icon-chevrons-right:before{content:"\e903"}
.fc-icon-minus-square:before{content:"\e904"}
.fc-icon-plus-square:before{content:"\e905"}
.fc-icon-x:before{content:"\e906"}
.fc .fc-button{overflow:visible;text-transform:none;margin:0;font-family:inherit}
.fc .fc-button::-moz-focus-inner{padding:0;border-style:none}
.fc .fc-button{-webkit-appearance:button;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;background-color:transparent;border:1px solid transparent;padding:.4em .65em;font-size:1em;line-height:1.5;border-radius:.25em}
.fc .fc-button:focus{outline:0;box-shadow:0 0 0 .2rem rgba(44,62,80,.25)}
.fc .fc-button-primary:focus,.fc .fc-button-primary:not(:disabled).fc-button-active:focus,.fc .fc-button-primary:not(:disabled):active:focus{box-shadow:0 0 0 .2rem rgba(76,91,106,.5)}
.fc .fc-button:disabled{opacity:.65}
.fc .fc-button-primary{color:#fff;color:var(--fc-button-text-color,#2C3E50);background-color:#2C3E50;background-color:var(--fc-button-bg-color,#fff);border-color:#2C3E50;border-color:var(--fc-button-border-color,#2C3E50)}
.fc .fc-button-primary:hover{color:#fff;color:var(--fc-button-text-color,#fff);background-color:#1e2b37;background-color:var(--fc-button-hover-bg-color,#1e2b37);border-color:#1a252f;border-color:var(--fc-button-hover-border-color,#1a252f)}
.fc .fc-button-primary:disabled{color:#fff;color:var(--fc-button-text-color,#fff);background-color:#2C3E50;background-color:var(--fc-button-bg-color,#2C3E50);border-color:#2C3E50;border-color:var(--fc-button-border-color,#2C3E50)}
.fc .fc-button-primary:not(:disabled).fc-button-active,.fc .fc-button-primary:not(:disabled):active{color:#fff;color:var(--fc-button-text-color,#fff);background-color:#1a252f;background-color:var(--fc-button-active-bg-color,#1a252f);border-color:#151e27;border-color:var(--fc-button-active-border-color,#151e27)}
.fc .fc-button .fc-icon{font-size:1.5em}
.fc .fc-button-group{position:relative;display:inline-flex}
.fc .fc-button-group>.fc-button{position:relative;flex:1 1 auto}
.fc .fc-button-group>.fc-button.fc-button-active,.fc .fc-button-group>.fc-button:active,.fc .fc-button-group>.fc-button:focus,.fc .fc-button-group>.fc-button:hover{z-index:1}
.fc-direction-ltr .fc-button-group>.fc-button:not(:first-child){margin-left:-1px;border-top-left-radius:0;border-bottom-left-radius:0}
.fc-direction-ltr .fc-button-group>.fc-button:not(:last-child){border-top-right-radius:0;border-bottom-right-radius:0}
.fc-direction-rtl .fc-button-group>.fc-button:not(:first-child){margin-right:-1px;border-top-right-radius:0;border-bottom-right-radius:0}
.fc-direction-rtl .fc-button-group>.fc-button:not(:last-child){border-top-left-radius:0;border-bottom-left-radius:0}
.fc .fc-toolbar{display:flex;justify-content:space-between;align-items:center}
.fc .fc-toolbar.fc--toolbar{margin-bottom:1.5em}
.fc .fc-toolbar.fc-footer-toolbar{margin-top:1.5em}
.fc .fc-toolbar-title{font-size:1.75em;margin-top:10px;}.fc-direction-ltr .fc-toolbar>*>:not(:first-child){margin-left:.75em}
.fc-direction-rtl .fc-toolbar>*>:not(:first-child){margin-right:.75em}
.fc-direction-rtl .fc-toolbar-ltr{flex-direction:row-reverse}
.fc .fc-scroller{-webkit-overflow-scrolling:touch;position:relative}
.fc .fc-scroller-liquid{height:100%}
.fc .fc-scroller-liquid-absolute{position:absolute;top:0;right:0;left:0;bottom:0}
.fc .fc-scroller-harness{position:relative;overflow:hidden;direction:ltr}
.fc .fc-scroller-harness-liquid{height:100%}
.fc-direction-rtl .fc-scroller-harness>.fc-scroller{direction:rtl}
.fc-theme-standard .fc-scrollgrid{border:1px solid #ddd;border:1px solid var(--fc-border-color,#ddd)}
.fc .fc-scrollgrid,.fc .fc-scrollgrid-section-footer>*,.fc .fc-scrollgrid-section-header>*{border-bottom-width:0}
.fc .fc-scrollgrid,.fc .fc-scrollgrid table{width:100%;table-layout:fixed}
.fc .fc-scrollgrid table{border-top-style:hidden;border-left-style:hidden;border-right-style:hidden}
.fc .fc-scrollgrid{border-collapse:separate;border-right-width:0}.fc .fc-scrollgrid-liquid{height:100%}

.fc-daygrid-day-frame.fc-scrollgrid-sync-inner {}.fc .fc-scrollgrid-liquid{height:100%}
.fc .fc-scrollgrid-section,.fc .fc-scrollgrid-section table,.fc .fc-scrollgrid-section>td{height:1px}
.fc .fc-scrollgrid-section-liquid>td{height:100%}
.fc .fc-scrollgrid-section>*{border-top-width:0;border-left-width:0}
.fc .fc-scrollgrid-section-body table,.fc .fc-scrollgrid-section-footer table{border-bottom-style:hidden}
.fc .fc-scrollgrid-section-sticky>*{background:var(--fc-page-bg-color,#fff);position:sticky;z-index:3}
.fc .fc-scrollgrid-section-header.fc-scrollgrid-section-sticky>*{top:0}
.fc .fc-scrollgrid-section-footer.fc-scrollgrid-section-sticky>*{bottom:0}
.fc .fc-scrollgrid-sticky-shim{height:1px;margin-bottom:-1px}
.fc-sticky{position:sticky}
.fc .fc-view-harness{flex-grow:1;position:relative}
.fc .fc-bg-event,.fc .fc-highlight,.fc .fc-non-business,.fc .fc-view-harness-active>.fc-view{position:absolute;top:0;left:0;right:0;bottom:0}
.fc .fc-col-header-cell-cushion{display:inline-block;padding:2px 4px;}.fc .fc-non-business{background:rgba(215,215,215,.3);background:var(--fc-non-business-color,rgba(215,215,215,.3))}
.fc .fc-bg-event{background:var(--fc-bg-event-color,#8fdf82);opacity:.3;opacity:var(--fc-bg-event-opacity,.3)}
.fc .fc-bg-event .fc-event-title{margin:.5em;font-size:.85em;font-size:var(--fc-small-font-size,.85em);font-style:italic}
.fc .fc-highlight{background:rgba(188,232,241,.3);background:var(--fc-highlight-color,rgba(188,232,241,.3))}
.fc .fc-cell-shaded,.fc .fc-day-disabled{background:rgba(208,208,208,.3);background:var(--fc-neutral-bg-color,rgba(208,208,208,.3))}
.fc-event .fc-event-main{position:relative;z-index:2}
.fc-event-dragging:not(.fc-event-selected){opacity:.75}
.fc-event-dragging.fc-event-selected{box-shadow:0 2px 7px rgba(0,0,0,.3)}
.fc-event .fc-event-resizer{display:none;position:absolute;z-index:4}
.fc-event-selected .fc-event-resizer,.fc-event:hover .fc-event-resizer,.fc-h-event{display:block}
.fc-event-selected .fc-event-resizer{border-radius:4px;border-radius:calc(var(--fc-event-resizer-dot-total-width,8px)/ 2);border-width:1px;border-width:var(--fc-event-resizer-dot-border-width,1px);width:8px;width:var(--fc-event-resizer-dot-total-width,8px);height:8px;height:var(--fc-event-resizer-dot-total-width,8px);border-style:solid;border-color:inherit;background:var(--fc-page-bg-color,#fff)}
.fc-event-selected .fc-event-resizer:before{content:'';position:absolute;top:-20px;left:-20px;right:-20px;bottom:-20px}
.fc-event-selected{box-shadow:0 2px 5px rgba(0,0,0,.2)}
.fc-event-selected:before{content:"";position:absolute;z-index:3;top:0;left:0;right:0;bottom:0}
.fc-event-selected:after{content:"";background:rgba(0,0,0,.25);background:var(--fc-event-selected-overlay-color,rgba(0,0,0,.25));position:absolute;z-index:1;top:-1px;left:-1px;right:-1px;bottom:-1px}
.fc-h-event{border:1px solid #ffb800;border:1px solid var(--fc-event-border-color,#ffb800);background-color:#ffb800;background-color:var(--fc-event-bg-color,#ffb800)}
.fc-h-event .fc-event-main{color:#fff;color:var(--fc-event-text-color,#fff)}
.fc-h-event .fc-event-main-frame{display:flex}
.fc-h-event .fc-event-time{max-width:100%;overflow:hidden}
.fc-h-event .fc-event-title-container{flex-grow:1;flex-shrink:1;min-width:0}
.fc-h-event .fc-event-title{display:inline-block;vertical-align:top;left:0;right:0;max-width:100%;overflow:hidden}
.fc-h-event.fc-event-selected:before{top:-10px;bottom:-10px}
.fc-direction-ltr .fc-daygrid-block-event:not(.fc-event-start),.fc-direction-rtl .fc-daygrid-block-event:not(.fc-event-end){border-top-left-radius:0;border-bottom-left-radius:0;border-left-width:0}
.fc-direction-ltr .fc-daygrid-block-event:not(.fc-event-end),.fc-direction-rtl .fc-daygrid-block-event:not(.fc-event-start){border-top-right-radius:0;border-bottom-right-radius:0;border-right-width:0}
.fc-h-event:not(.fc-event-selected) .fc-event-resizer{top:0;bottom:0;width:8px;width:var(--fc-event-resizer-thickness,8px)}
.fc-direction-ltr .fc-h-event:not(.fc-event-selected) .fc-event-resizer-start,.fc-direction-rtl .fc-h-event:not(.fc-event-selected) .fc-event-resizer-end{cursor:w-resize;left:-4px;left:calc(var(--fc-event-resizer-thickness,8px)/ -2)}
.fc-direction-ltr .fc-h-event:not(.fc-event-selected) .fc-event-resizer-end,.fc-direction-rtl .fc-h-event:not(.fc-event-selected) .fc-event-resizer-start{cursor:e-resize;right:-4px;right:calc(var(--fc-event-resizer-thickness,8px)/ -2)}
.fc-h-event.fc-event-selected .fc-event-resizer{top:50%;margin-top:-4px;margin-top:calc(var(--fc-event-resizer-dot-total-width,8px)/ -2)}
.fc-direction-ltr .fc-h-event.fc-event-selected .fc-event-resizer-start,.fc-direction-rtl .fc-h-event.fc-event-selected .fc-event-resizer-end{left:-4px;left:calc(var(--fc-event-resizer-dot-total-width,8px)/ -2)}
.fc-direction-ltr .fc-h-event.fc-event-selected .fc-event-resizer-end,.fc-direction-rtl .fc-h-event.fc-event-selected .fc-event-resizer-start{right:-4px;right:calc(var(--fc-event-resizer-dot-total-width,8px)/ -2)}
.fc .fc-popover{position:absolute;z-index:9999;box-shadow:0 2px 6px rgba(0,0,0,.15)}
.fc .fc-popover-header{display:flex;flex-direction:row;justify-content:space-between;align-items:center;padding:3px 4px}
.fc .fc-popover-title{margin:0 2px}.fc .fc-popover-close{cursor:pointer;opacity:.65;font-size:1.1em}
.fc-theme-standard .fc-popover{border:1px solid #ddd;border:1px solid var(--fc-border-color,#ddd);background:var(--fc-page-bg-color,#fff)}
.fc-theme-standard .fc-popover-header{background:rgba(208,208,208,.3);background:var(--fc-neutral-bg-color,rgba(208,208,208,.3))}:root{--fc-daygrid-event-dot-width:8px;--fc-list-event-dot-width:10px;--fc-list-event-hover-bg-color:#f5f5f5}
.fc-daygrid-day-events:after,.fc-daygrid-day-events:before,.fc-daygrid-day-frame:after,.fc-daygrid-day-frame:before,.fc-daygrid-event-harness:after,.fc-daygrid-event-harness:before{content:"";clear:both;display:table}
.fc .fc-daygrid-body{position:relative;z-index:1}
.fc .fc-daygrid-day.fc-day-today{background-color:rgba(255,220,40,.15);background-color:var(--fc-today-bg-color,rgba(255,220,40,.15))}
.fc .fc-daygrid-day-frame{position:relative;min-height:100%}
.fc .fc-daygrid-day-top{display:flex;flex-direction:row-reverse}
.fc .fc-day-other .fc-daygrid-day-top{opacity:.3}
.fc .fc-daygrid-day-number{position:relative;z-index:4;padding:12px}
.fc .fc-daygrid-day-events{   margin-top:1px}
.fc .fc-daygrid-body-balanced .fc-daygrid-day-events{position:absolute;left:0;right:0}
.fc .fc-daygrid-body-unbalanced .fc-daygrid-day-events{position:relative;min-height:2em}
.fc .fc-daygrid-body-natural .fc-daygrid-day-events{margin-bottom:1em}
.fc .fc-daygrid-event-harness{position:relative}
.fc .fc-daygrid-event-harness-abs{position:absolute;top:0;left:0;right:0}
.fc .fc-daygrid-bg-harness{position:absolute;top:0;bottom:0}
.fc .fc-daygrid-day-bg .fc-non-business{z-index:1}
.fc .fc-daygrid-day-bg .fc-bg-event{z-index:2}
.fc .fc-daygrid-day-bg .fc-highlight{z-index:3}
.fc .fc-daygrid-event{z-index:6;margin-top:1px}
.fc .fc-daygrid-event.fc-event-mirror{z-index:7}
.fc .fc-daygrid-day-bottom{font-size:.85em;padding:2px 3px 0}
.fc .fc-daygrid-day-bottom:before{content:"";clear:both;display:table}
.fc .fc-daygrid-more-link{position:relative;z-index:4;cursor:pointer}
.fc .fc-daygrid-week-number{position:absolute;z-index:5;top:0;padding:2px;min-width:1.5em;text-align:center;background-color:rgba(208,208,208,.3);background-color:var(--fc-neutral-bg-color,rgba(208,208,208,.3));color:grey;color:var(--fc-neutral-text-color,grey)}
.fc .fc-more-popover .fc-popover-body{min-width:220px;padding:10px}
.fc-direction-ltr .fc-daygrid-event.fc-event-start,.fc-direction-rtl .fc-daygrid-event.fc-event-end{margin-left:2px}
.fc-direction-ltr .fc-daygrid-event.fc-event-end,.fc-direction-rtl .fc-daygrid-event.fc-event-start{margin-right:2px}
.fc-direction-ltr .fc-daygrid-week-number{left:0;border-radius:0 0 3px}
.fc-direction-rtl .fc-daygrid-week-number{right:0;border-radius:0 0 0 3px}
.fc-liquid-hack .fc-daygrid-day-frame{position:static}
.fc-daygrid-event{position:relative;white-space:nowrap;border-radius:3px;font-size:.85em;font-size:var(--fc-small-font-size,.85em)}
.fc-daygrid-block-event .fc-event-time{font-weight:700}
.fc-daygrid-block-event .fc-event-time,.fc-daygrid-block-event .fc-event-title{padding:1px}
.fc-daygrid-dot-event{display:flex;align-items:center;padding:2px 0}
.fc-daygrid-dot-event .fc-event-title{flex-grow:1;flex-shrink:1;min-width:0;overflow:hidden;font-weight:700}
.fc-daygrid-dot-event.fc-event-mirror,.fc-daygrid-dot-event:hover{background:rgba(0,0,0,.1)}
.fc-daygrid-dot-event.fc-event-selected:before{top:-10px;bottom:-10px}
.fc-daygrid-event-dot{margin:0 4px;box-sizing:content-box;width:0;height:0;border:4px solid #3788d8;border:calc(var(--fc-daygrid-event-dot-width,8px)/ 2) solid var(--fc-event-border-color,#3788d8);border-radius:4px;border-radius:calc(var(--fc-daygrid-event-dot-width,8px)/ 2)}
.fc-direction-ltr .fc-daygrid-event .fc-event-time{margin-right:3px}
.fc-direction-rtl .fc-daygrid-event .fc-event-time{margin-left:3px}
.fc-v-event{display:block;border:1px solid #3788d8;border:1px solid var(--fc-event-border-color,#3788d8);background-color:#3788d8;background-color:var(--fc-event-bg-color,#3788d8)}
.fc-v-event .fc-event-main{color:#fff;color:var(--fc-event-text-color,#fff);height:100%}
.fc-v-event .fc-event-main-frame{height:100%;display:flex;flex-direction:column}
.fc-v-event .fc-event-time{flex-grow:0;flex-shrink:0;max-height:100%;overflow:hidden}
.fc-v-event .fc-event-title-container{flex-grow:1;flex-shrink:1;min-height:0}
.fc-v-event .fc-event-title{top:0;bottom:0;max-height:100%;overflow:hidden}
.fc-v-event:not(.fc-event-start){border-top-width:0;border-top-left-radius:0;border-top-right-radius:0}
.fc-v-event:not(.fc-event-end){border-bottom-width:0;border-bottom-left-radius:0;border-bottom-right-radius:0}
.fc-v-event.fc-event-selected:before{left:-10px;right:-10px}
.fc-v-event .fc-event-resizer-start{cursor:n-resize}
.fc-v-event .fc-event-resizer-end{cursor:s-resize}
.fc-v-event:not(.fc-event-selected) .fc-event-resizer{height:8px;height:var(--fc-event-resizer-thickness,8px);left:0;right:0}
.fc-v-event:not(.fc-event-selected) .fc-event-resizer-start{top:-4px;top:calc(var(--fc-event-resizer-thickness,8px)/ -2)}
.fc-v-event:not(.fc-event-selected) .fc-event-resizer-end{bottom:-4px;bottom:calc(var(--fc-event-resizer-thickness,8px)/ -2)}
.fc-v-event.fc-event-selected .fc-event-resizer{left:50%;margin-left:-4px;margin-left:calc(var(--fc-event-resizer-dot-total-width,8px)/ -2)}
.fc-v-event.fc-event-selected .fc-event-resizer-start{top:-4px;top:calc(var(--fc-event-resizer-dot-total-width,8px)/ -2)}
.fc-v-event.fc-event-selected .fc-event-resizer-end{bottom:-4px;bottom:calc(var(--fc-event-resizer-dot-total-width,8px)/ -2)}
.fc .fc-timegrid .fc-daygrid-body{z-index:2}
.fc .fc-timegrid-axis-chunk>table,.fc .fc-timegrid-body,.fc .fc-timegrid-slots{position:relative;z-index:1}
.fc .fc-timegrid-divider{padding:0 0 2px}
.fc .fc-timegrid-body{min-height:100%}
.fc .fc-timegrid-axis-chunk{position:relative}
.fc .fc-timegrid-slot{height:1.5em;border-bottom:0}
.fc .fc-timegrid-slot:empty:before{content:'\00a0'}
.fc .fc-timegrid-slot-minor{border-top-style:dotted}
.fc .fc-timegrid-slot-label-cushion{display:inline-block;white-space:nowrap}
.fc .fc-timegrid-axis-cushion,.fc .fc-timegrid-slot-label-cushion{padding:0 4px}
.fc .fc-timegrid-axis-frame-liquid{height:100%}
.fc .fc-timegrid-axis-frame{overflow:hidden;display:flex;align-items:center;justify-content:flex-end}
.fc .fc-timegrid-axis-cushion{max-width:60px;flex-shrink:0}
.fc-direction-ltr .fc-timegrid-slot-label-frame{text-align:right}
.fc-direction-rtl .fc-timegrid-slot-label-frame{text-align:left}
.fc-liquid-hack .fc-timegrid-axis-frame-liquid{height:auto;position:absolute;top:0;right:0;bottom:0;left:0}
.fc .fc-timegrid-col.fc-day-today{background-color:rgba(255,220,40,.15);background-color:var(--fc-today-bg-color,rgba(255,220,40,.15))}
.fc .fc-timegrid-col-frame{min-height:100%;position:relative}
.fc-liquid-hack .fc-timegrid-col-frame{height:auto;position:absolute;top:0;right:0;bottom:0;left:0}
.fc-media-screen .fc-timegrid-cols{position:absolute;top:0;left:0;right:0;bottom:0}
.fc-media-screen .fc-timegrid-cols>table{height:100%}
.fc-media-screen .fc-timegrid-col-bg,.fc-media-screen .fc-timegrid-col-events,.fc-media-screen .fc-timegrid-now-indicator-container{position:absolute;top:0;left:0;right:0}
.fc .fc-timegrid-col-bg{z-index:2}
.fc .fc-timegrid-col-bg .fc-non-business{z-index:1}
.fc .fc-timegrid-col-bg .fc-bg-event{z-index:2}
.fc .fc-timegrid-col-bg .fc-highlight,.fc .fc-timegrid-col-events{z-index:3}
.fc .fc-timegrid-bg-harness{position:absolute;left:0;right:0}
.fc .fc-timegrid-now-indicator-container{bottom:0;overflow:hidden}
.fc-direction-ltr .fc-timegrid-col-events{margin:0 2.5% 0 2px}
.fc-direction-rtl .fc-timegrid-col-events{margin:0 2px 0 2.5%}
.fc-timegrid-event-harness{position:absolute}
.fc-timegrid-event-harness>.fc-timegrid-event{position:absolute;top:0;bottom:0;left:0;right:0}
.fc-timegrid-event-harness-inset .fc-timegrid-event,.fc-timegrid-event.fc-event-mirror,.fc-timegrid-more-link{box-shadow:0 0 0 1px #fff;box-shadow:0 0 0 1px var(--fc-page-bg-color,#fff)}
.fc-timegrid-event,.fc-timegrid-more-link{font-size:.85em;font-size:var(--fc-small-font-size,.85em);border-radius:3px}
.fc-timegrid-event{margin-bottom:1px}.fc-timegrid-event .fc-event-main{padding:1px 1px 0}
.fc-timegrid-event .fc-event-time{white-space:nowrap;font-size:.85em;font-size:var(--fc-small-font-size,.85em);margin-bottom:1px}
.fc-timegrid-event-short .fc-event-main-frame{flex-direction:row;overflow:hidden}
.fc-timegrid-event-short .fc-event-time:after{content:'\00a0-\00a0'}
.fc-timegrid-event-short .fc-event-title{font-size:.85em;font-size:var(--fc-small-font-size,.85em)}
.fc-timegrid-more-link{position:absolute;z-index:9999;color:inherit;color:var(--fc-more-link-text-color,inherit);background:var(--fc-more-link-bg-color,#d0d0d0);cursor:pointer;margin-bottom:1px}
.fc-timegrid-more-link-inner{padding:3px 2px;top:0}
.fc-direction-ltr .fc-timegrid-more-link{right:0}
.fc-direction-rtl .fc-timegrid-more-link{left:0}
.fc .fc-timegrid-now-indicator-line{position:absolute;z-index:4;left:0;right:0;border-style:solid;border-color:red;border-color:var(--fc-now-indicator-color,red);border-width:1px 0 0}
.fc .fc-timegrid-now-indicator-arrow{position:absolute;z-index:4;margin-top:-5px;border-style:solid;border-color:red;border-color:var(--fc-now-indicator-color,red)}
.fc-direction-ltr .fc-timegrid-now-indicator-arrow{left:0;border-width:5px 0 5px 6px;border-top-color:transparent;border-bottom-color:transparent}
.fc-direction-rtl .fc-timegrid-now-indicator-arrow{right:0;border-width:5px 6px 5px 0;border-top-color:transparent;border-bottom-color:transparent}
.fc-theme-standard .fc-list{border:1px solid #ddd;border:1px solid var(--fc-border-color,#ddd)}
.fc .fc-list-empty{background-color:rgba(208,208,208,.3);background-color:var(--fc-neutral-bg-color,rgba(208,208,208,.3));height:100%;display:flex;justify-content:center;align-items:center}
.fc .fc-list-empty-cushion{margin:5em 0}
.fc .fc-list-table{width:100%;border-style:hidden}
.fc .fc-list-table tr>*{border-left:0;border-right:0}
.fc .fc-list-sticky .fc-list-day>*{position:sticky;top:0;background:var(--fc-page-bg-color,#fff)}
.fc .fc-list-table th{padding:0}
.fc .fc-list-day-cushion,.fc .fc-list-table td{padding:8px 14px}
.fc .fc-list-day-cushion:after{content:"";clear:both;display:table}
.fc-theme-standard .fc-list-day-cushion{background-color:rgba(208,208,208,.3);background-color:var(--fc-neutral-bg-color,rgba(208,208,208,.3))}
.fc-direction-ltr .fc-list-day-text,.fc-direction-rtl .fc-list-day-side-text{float:left}
.fc-direction-ltr .fc-list-day-side-text,.fc-direction-rtl .fc-list-day-text{float:right}
.fc-direction-ltr .fc-list-table .fc-list-event-graphic{padding-right:0}
.fc-direction-rtl .fc-list-table .fc-list-event-graphic{padding-left:0}
.fc .fc-list-event.fc-event-forced-url{cursor:pointer}
.fc .fc-list-event:hover td{background-color:#f5f5f5;background-color:var(--fc-list-event-hover-bg-color,#f5f5f5)}
.fc .fc-list-event-graphic,.fc .fc-list-event-time{white-space:nowrap;width:1px}
.fc .fc-list-event-dot{display:inline-block;box-sizing:content-box;width:0;height:0;border:5px solid #3788d8;border:calc(var(--fc-list-event-dot-width,10px)/ 2) solid var(--fc-event-border-color,#3788d8);border-radius:5px;border-radius:calc(var(--fc-list-event-dot-width,10px)/ 2)}
.fc .fc-list-event-title a{color:inherit}
.fc .fc-list-event.fc-event-forced-url:hover a{text-decoration:underline}
.fc-theme-bootstrap a:not([href]){color:inherit}
.fc-event-time{display: none;}
/* body 스타일 */

 @font-face {
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}


html, body, button, a {
   overflow: hidden;
   font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
   
}


/* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
.fc-header-toolbar {
   padding-top: 1em;
   padding-left: 1em;
   padding-right: 1em;
}
.fc-day-sun.fc-daygrid-day{
  background-color : #fff8f8;
   color:red;
}
.fc-day.fc-day-sun{
color:red;
}
.fc-col-header-cell.fc-day.fc-day-sun{
color:red;
}
/* .fc-day-sun{
   background-color : #fff8f8;
   color:red;
} */
.fc-day-sat.fc-daygrid-day{
   background-color : #f6faff;
   color:blue;   

/* .fc-day-sat{
   background-color : #f6faff;
   color:blue;    */
}
.fc-day.fc-day-sat{
color:blue;
}
.fc-toolbar-chunk>div{
display: flex;
margin-bottom: 10px;
}
button.fc-prev-button.fc-button{
margin-right: 10px; 
}
button.fc-next-button.fc-button{
margin-left: 10px; 
}
.fc-listWeek-button .fc-button .fc-button-primary{

}
/* .fc-day-today.fc-day-other{
background-color : red;
color:red;
} */

    /* background: #f8f7ff;
    border-color: #6449fc;
     */

/* .fc-event-main-frame{
background-color : #ffb800;
color:white;

}  */

/* 팝업 */
.post-card-wrapper.side {
    width: 550px;
    height: 100%;
    min-height: auto;
    max-height: 100%;
    position: absolute;
    top: 0;
    bottom: 0;
    right: 0;
    z-index: 2;
    overflow: hidden;
    background: #f9f9f9;
    -webkit-border-radius: 0;
    border-radius: 0;
    border-left: 1px solid #ccc;
    -webkit-box-shadow: -10px 10px 15px rgb(0 0 0 / 4%);
    box-shadow: -10px 10px 15px rgb(0 0 0 / 4%);
}
.post-popup-button {
    display: none;
    position: absolute;
    top: 50%;
    -webkit-transform: translateY(-50%);
    transform: translateY(-50%);
    width: 70px;
    height: 70px;
}

.card-popup-header {
    overflow: hidden;
    padding: 14px 20px;
    height: 45px;
    background: #fff;
    border-bottom: 1px solid #eee;
}

.post-popup-button.left {
    left: -110px;
    background: url(/flow-renewal/assets/images/icons/post_left.png) no-repeat;
}

.card-popup-title {
    float: left;
    width: 100%;
    font-size: 12px;
    color: #999;
    font-weight: 400;
}

.card-popup-header .project-color {
    display: inline-block;
    width: 14px;
    height: 14px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    margin: 0 4px 0 0;
    vertical-align: middle;
}

.card-popup-title .js-project-title-button {
    overflow: hidden;
    display: inline-block;
    max-width: 300px;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.card-popup-header .subtask-title {
    max-width: 290px;
    font-size: 12px;
    color: #555;
    font-weight: 400;
    vertical-align: middle;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
.card-popup-header .btn-close {
    top: 11px;
    right: 20px;
}
.card-popup-close {
    float: right;
    margin-top: 1px;
}

.btn-close {
    position: absolute;
    top: 0;
    right: -10px;
}


#modal {
   display: none;
   width: 100%;
   height: 100%;
   z-index: 1;
   position: fixed;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%);
}

#modal h2 {
   margin: 0;
   font-size: 25px;
   color: black;
   background-color: white;
   font-weight: bold;
}

#modal button {
   display: inline-block;
   margin-left: calc(100% - 100px - 10px);
}

#modal1 .modal_content {
    position: absolute;  top:500px; left:500px; botton:50px;
    top: 15%;
    width: 558px;
    height: 352px;
    margin: 0px auto;
    padding: 52px;
    padding-right: 24px;
    background: #fff;
    border-radius: 58px;
}
#modal .modal_layer {
   position: fixed;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   background: rgba(0, 0, 0, 0.8);
   z-index: -1;
}

#modal_close_btn {
   position: relative;
   border: none;
   background-color: white;
   width: 25px;
   height: 25px;
   cursor: pointer;
   right: -10%;
   top: -10%;
}

button#submit {
   position: absolute;
   width: 200px;
   heigth: 50px;
   font-size: 20px;
   right: 15%;
   top: 80%;
   transform: translate(-50%, -50%);
   border: none;
   border-radius: 5px;
}

input#title {
   position: absolute;
   top: 25%;
   margin: 0px;
   background: transparent;
   width: 400px;
   height: 40px;
   align-content: center;
   border: none;
}

input#title::placeholder {
   font-weight: bold;
   font-size: 20px;
}

input#content {
   display: inline;
   position: relative;
   top: 40%;
   border: solid 1px;
   border-color: grey;
   margin-top: 10px;
   margin-left: 0px;
   margin-right: 0px;
   margin-bottom: 10px;
   width: 400px;
   height: 100px;
   border-radius: 10px;
}

div.team_icon {
   width: 40px;
   height: 40px;
   border-radius: 10px;
   border: none;
   background-color: #e2d6ff;
   display: inline-block;
}

h3.team_name{
	font-size: 35px;
   font-weight: bold;
   position: absolute;
   top: 25px;
   left: 70px;
}

h6.team_attri{
	font-size: 18px;
   display:inline-block;
   top: 10px;
}

ul#menutap {
   display: flex;
   flex-flow: row nowrap;
   align-content: space-between;
}

ul#menutap>li {
   display: inline-block;
   margin: 0 10px;
   align-content: flex-end;
}

ul#menutap>li>a {
   text-decoration: none;
   color: black;
}

div.row1 {
   position: relative;
   background: #fff;
   border-bottom: 1px solid #ddd;
   padding-top: 20px;
   padding-left: 20px;
   padding-right: 20px;
   height: 170px;
}

div.row {
   margin-top: 20px;
}

div.row>div{
	width: 850px;
	padding-top:20px;
	padding-left:20px;
}

div.content {
   padding-left: 40px;
   padding-top: 0px;
   padding-bottom: 30px;
}

div.newContentsBox {
   background-color: white;
   border-radius: 10px;
   border: 1px solid grey;
   width: 800px;
   height: 200px;
   padding-left: 10px;
}

ul.newContentsBox {
   display: flex;
   flex-flow: row nowrap;
   place-content: space-evenly;
}

li.newContentsBox {
   display: inline-block;
   margin: auto;
   padding: 10px;
   font-weight: bold;
   font-size: 15px;
}

li.newContentsBox>button {
   background-color: white;
   border: none;
}

div.title {
   background-color: #FFFFFF;
}


#modal1 {
   display: none;
   width: 100%;
   height: 100%;
   z-index: 1;
   position: fixed;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%);
}

#modal1 h2 {
   margin: 0;
   font-size: 25px;
   color: black;
   background-color: white;
   font-weight: bold;
}

#modal1 button {
   display: inline-block;
   margin-left: calc(100% - 100px - 10px);
}

#modal1 .modal_content {
   position: relative;
   top: 250px;
   width: 728px;
   height: 487px;
   margin: 20px auto;
   padding: 40px;
   background: #fff;
   border-radius: 10px;
   left: -80px;
   
}

#modal1 .modal_layer {
   position: fixed;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   background: rgba(0, 0, 0, 0.2);
   z-index: -1;
}

#yongdal_close1 {
   position: relative;
   border: none;
   background-color: white;
   width: 25px;
   height: 25px;
   cursor: pointer;
   right: -4%;
   top: -10%;
}

h3.team_name{
	font-size: 35px;
   font-weight: bold;
   display:inline-block;
   position: absolute;
   top: 6px;
   left: 70px;
}

h6.team_attri{
	font-size: 18px;
   display:inline-block;
   top: 10px;
}

/* 글 작성 버튼 */
/* 글 작성 버튼 */

div#seulgib{
	position: absolute;
	top: 20px;
	right: -250px;

}

button#Seulgi{
	border-radius: 10px;
	background-color: white;
	border: 1px solid #dedede;
	
}


/* 새프로젝트 버튼 */
/* 새프로젝트 버튼 */
button#modal_open_btn{
	border: none;
	border-radius: 10px;
	color: white;
	background-color: #4B49AC;
	
}

button#modal_open_btn:hover{
	border: none;
	border-radius: 10px;
	color: white;
	background-color: #9492D1;
	
}

/* 참여자 */
/* 참여자 */
div.attendee{
	border: 1px solid #dedede;
	border-radius: 10px;
	background-color: white;
	width: 300px;
	padding: 20px;
	position: absolute ;
	right: 250px;
	top: 200px;
}

img.img{
	width: 50px; 
	height: 50px;
	float: left;
	margin-right: 10px;
}

/* 글작성 버튼 */
/* 글작성 버튼 */
div.content-wrapper {
	min-height: 100%;
	overflow: auto;
	height: auto;
	margin-bottom: 30%;
}

ul.nav {
	width: 200px;
	height: 100
}


button {
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: block;
	margin: 0px auto;
	max-width: 180px;
	text-decoration: none;
	border-radius: 4px;
	padding: 10px 50px;
}

a.button {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}

a.button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
}

a.button2 {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}

a.button2:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 80px 0px 2px inset;
}


div.card-body>a{
	align-text: center;
   display: block;
}
div.card.card-tale{
	text-align: center;
	
}
a:hover{
	text-decoration: none;
}


/*   캘린더       */

div#calendar-container{
	position: absolute;
	top: 150px;
	left: 50px;
	background-color: white;
	border-radius: 25px;
	padding: 25px;
	margin-bottom: 50px;
}

/* footer */

footer{
   padding-top: 95px;
   padding-bottom: 15px;
   flex-direction:column;
   align-items:center;
   width:768px;
   margin: 0px;	
   position:absolute;
   left:50%;
   margin-left:-384px;
}
.copyright-wrap{
   display: flex;
   flex-direction: column;
   align-items: center;
   height: 15px;
}
footer .copyright-wrap span img{
   width: 59px;
   height: 11px;
}
footer .copyright-wrap span{
   font-size: 13px;
   line-height: 15px;
}


</style>
</head>
<body >
<%
memberDTO dto = (memberDTO)session.getAttribute("dto");
String userId = dto.getMemId(); 
t_teamDTO t_DTO = (t_teamDTO)session.getAttribute("teamName");
t_team_memberDTO ttmem = (t_team_memberDTO)session.getAttribute("admin");
ArrayList<t_team_memberDTO> memberdto = (ArrayList<t_team_memberDTO>)session.getAttribute("teamSeq3");
%> 
 


   <div class="container-scroller">
      <!-- partial:partials/_navbar.html -->
      <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
           <div
            class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
            <a class="navbar-brand brand-logo mr-5" href="main.do"><img
               src="https://flow.team/flow-renewal/view/homepage/assets/images/common/logo.svg"
               class="mr-2" alt="logo" /></a> <a class="navbar-brand brand-logo-mini"
               href="index.html"><img
               src="https://flow.team/flow-renewal/view/homepage/assets/images/common/logo.svg"
               alt="logo" /></a>
         </div>
         <div
            class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
            <ul class="navbar-nav navbar-nav-right">
               <li class="nav-item nav-profile dropdown"><a
                  class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
                  id="profileDropdown"> <img src="./사용자.JPG"
                     alt="profile" />
               </a>
                  <div class="dropdown-menu dropdown-menu-right navbar-dropdown"
                     aria-labelledby="profileDropdown">
                      <a class="dropdown-item"> <i
                        class="ti-settings text-primary"></i> 내프로필
                     </a> <a href = 'LogoutCon.do'>
               <button class="dropdown-item">
                <i class="ti-power-off text-primary"></i>
                로그아웃</button>
              </a>
                  </div></li>
            </ul>
            <button
               class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
               type="button" data-toggle="offcanvas">
               <span class="icon-menu"></span>
            </button>
         </div>

      </nav>
      
      <!-- partial -->
      <div class="container-fluid page-body-wrapper" >
      			<nav class="sidebar sidebar-offcanvas" id="sidebar">

        <ul class="nav">
          <li class="nav-item">
              <button type="button" id="modal_open_btn">
              <i class="icon-grid menu-icon"></i>
              <div id="root">
              <span class="menu-title">새 프로젝트</span>
              </div>
              </button>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="projectMain.jsp"> 
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">내프로젝트</span>
              <i class="menu-arrow"></i>
            </a>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="projectPage.jsp"> 
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">게시글</span>
              <i class="menu-arrow"></i>
            </a>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="projectPageWork.jsp"> 
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">업무</span>
              <i class="menu-arrow"></i>
            </a>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="projectPageTodo.jsp"> 
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">할 일</span>
              <i class="menu-arrow"></i>
            </a>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
              <i class="icon-columns menu-icon"></i>
              <span class="menu-title">전체업무</span>
              <i class="menu-arrow"></i>
            </a>
          </li>
          
          <li class="nav-item">
            <%out.print("<a class='nav-link' href='GetDate.do?connect_team=" + t_DTO.getTeamSeq() + "'</a>"); %>
              <i class="icon-grid-2 menu-icon"></i>
              <span class="menu-title">캘린더</span>
              <i class="menu-arrow"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="sadf.jsp" aria-expanded="false" aria-controls="icons">
              <i class="icon-contract menu-icon"></i>
              <span class="menu-title">나를언급</span>
              <i class="menu-arrow"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="sadf.jsp" aria-expanded="false" aria-controls="auth">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">내 게시물</span>
              <i class="menu-arrow"></i>
            </a>
            </li> 
         <% if(ttmem.getAdminYN().equals("1")){ %> 
          <li class="nav-item">
            <a class="nav-link" href="projectInvite.jsp" aria-controls="auth"> 
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">팀원초대</span>
              <i class="menu-arrow"></i>
            </a>
          </li>
        <%} %> 
        <%-- <H1>어드민어ㅕ부<%=ttmem.getAdminYN() %></H1> --%>
        
        </ul>
      </nav>
			</nav>
         <!-- partial -->
          <div class="main-panel">
        <div class="content-wrapper" style="padding: 0px;">
          <div class="row1" style="">
          <div class="col-md-12 grid-margin">
              <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                <div class="team_icon"></div>
                  <!-- <h1><a href="sadf.jsp">이동동</a></h1> -->
                  <%-- <%=memberdto.get(0).getTeamSeq() %> --%>
                  <h3 class="team_name"><%= t_DTO.getTeamName()%></h3> <br>
                  <h6 class="team_attri"><%=t_DTO.getTeamContent() %></h6> <br>
                  <div id="seulgib">
                  	<button id="Seulgi" type="button">글 작성</button>
                  	<%if(ttmem.getTmMemo().equals("프로젝트관리자")) {%>
	                  	<form action="deleteTeam.do">
	                  	<button id="Seulgi" type="button">팀 삭제</button>
	                  	</form>
                  	<%} %>
                  </div>
                </div>
                <div class="content">
              
              <div class="content_2">
              <div class="attendee">
              	<div class="attendeeTitle">
              		<h4>참여자</h4>
              	</div>
              	<div class="attendeebox">
              		<%for(int i = 0; i < memberdto.size(); i++) { %>
              		<hr>
              		<ul type="none">
              		<img class="img" src="사용자.JPG">
              			<li><b><%=memberdto.get(i).getMemId() %></b></li>
              			<li><%=memberdto.get(i).getTmMemo() %></li>
              		</ul>
              		<%} %>
              	</div>
              	
              </div>
         <!-------------------- calendar 태그 ------------------------------->
         <!-------------------- calendar 태그 ------------------------------->
   <div id='calendar-container' style='display:inline-block'>
      
      <div id="calendar" class="fc fc-media-screen fc-direction-ltr fc-theme-standard" style="height: 700px; width: 1000px;">
      <div class="fc-header-toolbar fc-toolbar fc-toolbar-ltr">
      <div class="fc-toolbar-chunk">
      <div class="fc-button-group">
         <button class="fc-prev-button fc-button fc-button-primary" type="button" aria-label="prev">
            <span class="fc-icon fc-icon-chevron-left"></span>
         </button>
      
         <button class="fc-next-button fc-button fc-button-primary" type="button" aria-label="next">
            <span class="fc-icon fc-icon-chevron-right"></span>
         </button>
      </div>
      <button class="fc-today-button fc-button fc-button-primary fc-btn-sell" type="button">오늘</button>
      </div>
      <div class="fc-toolbar-chunk">
         <h2 class="fc-toolbar-title">2022년 1월</h2>
      </div>
      <div class="fc-toolbar-chunk">
      <div class="fc-button-group">
         <button class="fc-dayGridMonth-button fc-button fc-button-primary fc-button-active" type="button">월</button>
         <button class="fc-timeGridWeek-button fc-button fc-button-primary" type="button">주</button>
         <button class="fc-timeGridDay-button fc-button fc-button-primary" type="button">일</button>
         
      </div>
      </div>
      </div>
      <div class="fc-view-harness fc-view-harness-active">
      <div class="fc-daygrid fc-dayGridMonth-view fc-view">
         <table class="fc-scrollgrid  fc-scrollgrid-liquid">
            <thead>
            <tr class="fc-scrollgrid-section fc-scrollgrid-section-header">
               <td>
                  <div class="fc-scroller-harness">
                  <div class="fc-scroller" style="overflow: hidden;">
         <table class="fc-col-header " style="width: 604px;">
         <colgroup></colgroup>
            <tbody>
               <tr>
               <th class="fc-col-header-cell fc-day fc-day-sun">
                  <div class="fc-scrollgrid-sync-inner">
                     <a class="fc-col-header-cell-cushion" style='color:red !important'>일</a>
                  </div>
               </th>
               <th class="fc-col-header-cell fc-day fc-day-mon">
                  <div class="fc-scrollgrid-sync-inner">
                     <a class="fc-col-header-cell-cushion">월</a>
                  </div>
               </th>
               <th class="fc-col-header-cell fc-day fc-day-tue">
                  <div class="fc-scrollgrid-sync-inner">
                     <a class="fc-col-header-cell-cushion ">화</a>
                  </div>
               </th>
               <th class="fc-col-header-cell fc-day fc-day-wed">
                  <div class="fc-scrollgrid-sync-inner">
                     <a class="fc-col-header-cell-cushion ">수</a>
                  </div>
               </th>
               <th class="fc-col-header-cell fc-day fc-day-thu">
                  <div class="fc-scrollgrid-sync-inner">
                     <a class="fc-col-header-cell-cushion ">목</a>
                  </div>
               </th>
            <th class="fc-col-header-cell fc-day fc-day-fri">
               <div class="fc-scrollgrid-sync-inner">
                  <a class="fc-col-header-cell-cushion ">금</a>
               </div>
               </th>
               <th class="fc-col-header-cell fc-day fc-day-sat">
               <div class="fc-scrollgrid-sync-inner">
                  <a class="fc-col-header-cell-cushion ">토</a>
               </div>
            </th>
                  </tr>
               </tbody>
            </table>
                  </div>
                  </div>
               </td>
            </tr>
            </thead>
            <tbody>
            <tr class="fc-scrollgrid-section fc-scrollgrid-section-body  fc-scrollgrid-section-liquid">
               <td>
                  <div class="fc-scroller-harness fc-scroller-harness-liquid">
                  <div class="fc-scroller fc-scroller-liquid-absolute" style="overflow: hidden auto;">
                  <div class="fc-daygrid-body fc-daygrid-body-balanced " style="width: 604px;">
                     <table class="fc-scrollgrid-sync-table" style="width: 604px; height: 604px;">
                     <colgroup></colgroup>
                        <tbody>
                           <tr>
                           
                           <td class="fc-daygrid-day fc-day fc-day-sun fc-day-past fc-day-other" data-date="2021-12-26;" >
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2021-12-26&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0" style="background:red;">26일</a>
                              </div>

                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                              
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-mon fc-day-today  fc-day-other" data-date="2021-12-27">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2021-12-27&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">27일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-tue fc-day-future fc-day-other" data-date="2021-12-28">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2021-12-28&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">28일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-wed fc-day-future fc-day-other" data-date="2021-12-29">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2021-12-29&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">29일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-thu fc-day-future fc-day-other" data-date="2021-12-30">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2021-12-30&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">30일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;">
                              </div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-fri fc-day-future fc-day-other" data-date="2021-12-31">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2021-12-31&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">31일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-sat fc-day-future" data-date="2022-01-01">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-01&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">1일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           </tr>
                           <tr>
                           <td class="fc-daygrid-day fc-day fc-day-sun fc-day-future" data-date="2022-01-02">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-02&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">2일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-mon fc-day-future" data-date="2022-01-03">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-03&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">3일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg">
                              </div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-tue fc-day-future" data-date="2022-01-04">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-04&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">4일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-wed fc-day-future" data-date="2022-01-05">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-05&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">5일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-thu fc-day-future" data-date="2022-01-06">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-06&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">6일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-fri fc-day-future" data-date="2022-01-07">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-07&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">7일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-sat fc-day-future" data-date="2022-01-08">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-08&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">8일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           </tr>
                           <tr>
                           <td class="fc-daygrid-day fc-day fc-day-sun fc-day-future" data-date="2022-01-09">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-09&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">9일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-mon fc-day-future" data-date="2022-01-10">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-10&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">10일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-tue fc-day-future" data-date="2022-01-11">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-11&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">11일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-wed fc-day-future" data-date="2022-01-12">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-12&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">12일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-thu fc-day-future" data-date="2022-01-13">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-13&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">13일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-fri fc-day-future" data-date="2022-01-14">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-14&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">14일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-sat fc-day-future" data-date="2022-01-15">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-15&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">15일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg">
                              </div>
                              </div>
                           </td>
                           </tr>
                           <tr>
                           <td class="fc-daygrid-day fc-day fc-day-sun fc-day-future" data-date="2022-01-16">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-16&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">16일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-mon fc-day-future" data-date="2022-01-17">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-17&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">17일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-tue fc-day-future" data-date="2022-01-18">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-18&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">18일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-wed fc-day-future" data-date="2022-01-19">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-19&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">19일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-thu fc-day-future" data-date="2022-01-20">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-20&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">20일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-fri fc-day-future" data-date="2022-01-21">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-21&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">21일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div></div></td><td class="fc-daygrid-day fc-day fc-day-sat fc-day-future" data-date="2022-01-22">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-22&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">22일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           </tr>
                           <tr>
                           <td class="fc-daygrid-day fc-day fc-day-sun fc-day-future" data-date="2022-01-23">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-23&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">23일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-mon fc-day-future" data-date="2022-01-24">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-24&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">24일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-tue fc-day-future" data-date="2022-01-25">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-25&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">25일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-wed fc-day-future" data-date="2022-01-26">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-26&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">26일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-thu fc-day-future" data-date="2022-01-27">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-27&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">27일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-fri fc-day-future" data-date="2022-01-28">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-28&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">28일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-sat fc-day-future" data-date="2022-01-29">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner"><div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-29&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">29일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           </tr>
                           <tr>
                           <td class="fc-daygrid-day fc-day fc-day-sun fc-day-future" data-date="2022-01-30">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-30&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">30일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-mon fc-day-future" data-date="2022-01-31">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-01-31&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">31일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-tue fc-day-future fc-day-other" data-date="2022-02-01">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-02-01&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">1일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-wed fc-day-future fc-day-other" data-date="2022-02-02">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-02-02&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">2일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-thu fc-day-future fc-day-other" data-date="2022-02-03">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top"><a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-02-03&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">3일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-fri fc-day-future fc-day-other" data-date="2022-02-04">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-02-04&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">4일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              </div>
                           </td>
                           <td class="fc-daygrid-day fc-day fc-day-sat fc-day-future fc-day-other" data-date="2022-02-05">
                              <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                              <div class="fc-daygrid-day-top">
                                 <a class="fc-daygrid-day-number" data-navlink="{&quot;date&quot;:&quot;2022-02-05&quot;,&quot;type&quot;:&quot;day&quot;}" tabindex="0">5일</a>
                              </div>
                              <div class="fc-daygrid-day-events">
                              <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                              </div>
                              <div class="fc-daygrid-day-bg"></div>
                              <%-- <div id="aa" style="display:none"><%= dto.getTeamSeq()%> --%>
                              </div>
                            
                           </td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
                  </div>
                  </div>
               </td>
            </tr>
         </tbody>
      </table>
         </div>
         </div>
         </div>
            </div>
 </div>           
 </div>
 <!---------------------- 캘린더 끝 -->
 <!---------------------- 캘린더 끝 -->
 </div>
 </div>
 </div>
 </div>
 </div>
          <!-- 캘린더 모달 -->
            <div style="display: inline">
            <div id="modal1" class="modal_content">
               <div class="modal_content">
                  <div>
                  <button type="button" id="yongdal_close1">X</button>
                  <form action="comWrite.do">
                  <div class="scheContent">
                     	<span><img src="사용자.JPG" style="width: 50px; height: 50px;" vspace=15 hspace=10><p class="id" style="display: inline;">작성자</p></span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<span style="display: inline;"><p class="regdate" style="display: inline;">작성시간</p></span>
                     </div>   
                     <div class="title">
                     	<h2>제목</h2>
                     </div>
                     <br>
                     <div class="date">
                     	<h5>기간</h5>
                     </div>
                     <hr>
                     <br>
                     <div class="content">
                     	<h4>내용</h4>
                     </div>
                     <div class="attendant">
                     	<p style="display: inline; font-size: 15px;">참석자</p>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<b style="display: inline;">참석자</b>
                     </div>
                     </div>
                  </form>
               <div class="modal_layer"></div>
               </div>
            </div>
         </div>
           <!-- modal scipt -->
               <script src="js/jquery-3.6.0.min.js"></script>

        <script>
         $("#yongdal_open1").click(function() {
            $("#modal1").attr("style", "display:block");
         });

         $("#yongdal_close1").click(function() {
            $("#modal1").attr("style", "display:none");
         });
      </script>


   <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
      <% String json = (String) request.getAttribute("schedul");
      System.out.println(json);%>
       let loadCal = function(calendar){
            let data = JSON.parse('<%=json%>');
            
            console.log(data);
              
            for(let i = 0; i < data.length; i++){
               
               calendar.addEvent(data[i]);
            }
      
      }                         
   </script>
   <script>
         (function() {
            $(function() {
            // calendar element 취득
               var calendarEl = $('#calendar')[0];
               // full-calendar 생성하기
              var calendar = new FullCalendar.Calendar(calendarEl, {
                                          height : '700px', 
                                          width : '1000px',// calendar 높이 설정
                     expandRows : true, // 화면에 맞게 높이 재설정
                     slotMinTime : '08:00', // Day 캘린더에서 시작 시간
                     slotMaxTime : '20:00', // Day 캘린더에서 종료 시간
                     // 해더에 표시할 툴바
                     headerToolbar: {
                        left : 'prev,title,next',                       
                        right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                     },
                     initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
                     initialDate : '2021-12-21', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
                     navLinks : true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
                     editable : true, // 수정 가능?
                     /* selectable : true, */ // 달력 일자 드래그 설정가능
                     nowIndicator : true, // 현재 시간 마크
                     dayMaxEvents : true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
                     locale : 'ko', // 한국어 설정
                     eventAdd : function(obj) { // 이벤트가 추가되면 발생하는 이벤트
                        console.log(obj);
                     },
                     eventChange : function(obj) { // 이벤트가 수정되면 발생하는 이벤트
                        console.log(obj);
                     },
                     eventRemove : function(obj) { // 이벤트가 삭제되면 발생하는 이벤트
                        console.log(obj);
                     },
                     eventClick : function(obj){
                        console.log('클릭한 노란바의 타이틀>>',obj.event._def.title);
                        console.log('클릭한 노란바의 내용>>',obj.event._def.extendedProps.scheContnet);
	
                        regD = obj.event._def.extendedProps.regDate.split(" ");
                        start = obj.event._instance.range.start + "";
                        end = obj.event._instance.range.end + "";
                        
                        console.log(start.split(" "));
                        console.log((start.split(" ")[3]) + "-" + engNumber(start.split(" ")[1])+ "-" +(start.split(" ")[2]));
                        console.log((end.split(" ")[3]) + "-" + engNumber(end.split(" ")[1])+ "-" +(end.split(" ")[2]));
                        
                        $('p.id').text(obj.event._def.extendedProps.memId);
                        $('p.regdate').text(regD[2] + "년 " + regD[0] + " " + regD[1].split(",")[0]+"일");
                        $('div.title>h2').text(obj.event._def.title);
                        $('div.date>h5').text((start.split(" ")[3]) + "-" + engNumber(start.split(" ")[1])+ "-" +(start.split(" ")[2])  + ' ~ ' + (end.split(" ")[3]) + "-" + engNumber(end.split(" ")[1])+ "-" +(end.split(" ")[2]));
                        $('div.content>h4').text(obj.event._def.extendedProps.scheContnet);
                        $('div.attendant>b').text(obj.event._def.extendedProps.scheAttendance);
                    
                       document.getElementById("modal1").style.display = "block";
                      
                     },
                     /* select : function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
                        // 이벤트 생성 코드
                        var title = prompt('Event Title:');
                        if (title) {
                           calendar.addEvent({
                              title : title,
                              start : arg.start,
                              end : arg.end,
                              allDay : arg.allDay
                           })
                           // 여기서 Ajax이용해서 json을 보내주면 된다.
                        }
                        calendar.unselect()
                     },//////// */
                     
                     // 이벤트
                     events : []
                     
                  });
               
            loadCal(calendar);//캘린더 로드
            // 캘린더 랜더링
            calendar.render();
         });
      })();
   </script>
   <script type="text/javascript">
         $(".fc-event-time").hide();    
       
         function engNumber(a){
        	 if(a == 'Dec'){
        		 return '12'
        	 }else if(a == 'Nov'){
        		 return '11'
        	 }else if(a =='Jan'){
        		 return '1'	         	 
        	}else if(a =='Feb'){
        		 return '2'	         	 
        	}
         }
   </script>
<!-- <footer>
		<div class="copyright-wrap">
			<span> <img
				src="https://flow.team/flow-renewal/view/homepage/assets/images/common/logo.svg">
				Copyright © HAMSTERS Corp. All Rights Reserved.
			</span>
		</div>
	</footer> -->
</body>
</html> 
                        
 
    
    