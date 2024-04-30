---
layout: default
head:
  - <link rel="stylesheet" href="/css/form.css" />
---
{% include menu.html context="homepage" %}
<script src="/js/jquery.min.js"></script>
<style>
 h1{
     font-weight: bold;
     color: var(--super-light);
     text-align: center;
     margin: 130px 0 40px 0;
     text-shadow: 1px 0px 5px rgba(0,0,0,0.1);
 }
 h2{
     color: var(--color);
     font-size: 2.5rem;
     opacity: 0.65;
     margin-top: 150px;
     margin-bottom: 70px;
     letter-spacing: 0.07rem;
 }
 h2.center:after {
     content: ' ';
     display: block;
     width: 100px;
     margin: 10px auto;
     border-top: 4px solid var(--color);
 }
 .jumbotron{
     background: var(--primary);
     position: relative;
 }
 .jumbotron svg{
     margin-top: 50px;
 }
 .jumbotron h3{
     font-size: 1.7rem;
     margin-bottom: 10px;
 }
</style>
<div class="jumbotron">
    <div class="geometric-shape" style="transform: rotate(-5deg);
                top: 7rem;
                background: linear-gradient(76.4deg,rgba(233,230,246,.21) 11.23%,rgba(233,230,246,0) 36.25%,rgba(233,230,246,0) 55.2%,rgba(255,255,255,0.1) 97.53%);
                height: 32rem;"></div>
    <div class="container">
        <h1>The frontend of your storage</h1>
    </div>
    <div class="container">
        <div class="center backend-list">
            <span>S3</span>
            <span>SFTP</span>
            <span>FTP</span>
            <span>FTPS</span>
            <span>Minio</span>
            <span>Backblaze</span>
            <span>GIT</span>
            <span>Github</span>
            <span>Gitlab</span>
            <span>WebDav</span>
            <span>NFS</span>
            <span>Samba</span>
            <span>LDAP</span>
            <span>CalDAV</span>
            <span>CardDAV</span>
            <span>Mysql</span>
            <span>Dropbox</span>
            <span>Google Drive</span>
            <span>Gogs</span>
            <span>Gitea</span>
        </div>
        <style>
         .backend-list span{
             text-shadow: 1px 0px 5px rgba(0,0,0,0.1);
             display: inline-block;
             padding: 0 10px;
             font-size: 1.3rem;
             min-width: 60px;
             font-weight: bold;
             opacity: 0.8;
             color: var(--super-light);
             letter-spacing: 0.05rem;
         }
        </style>
    </div>
</div>
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 200">
    <path opacity="0.6" fill="var(--emphasis-primary)" fill-rule="evenodd" d="M -19.723897,-2.420471 C 21.409785,9.1198839 657.16289,170.02913 744.82802,193.92276 845.92065,166.87569 1378.2969,21.312708 1455.0231,-0.66252715 1318.9319,-5.5985482 -19.723897,-2.420471 -19.723897,-2.420471 Z"></path>
    <path fill="var(--primary)" fill-rule="evenodd" d="M -19.723897,-2.420471 C 21.409783,9.119884 655.89733,129.02002 743.56246,152.91365 844.65509,125.86658 1378.2969,21.312709 1455.0231,-0.66252715 1318.9319,-5.5985481 -19.723897,-2.420471 -19.723897,-2.420471 Z"></path>
</svg>

<h2 class="center"> Pricing </h2>
<div class="container" id="pricing">
    <div class="flex">
        <div class="padding" style="box-sizing:border-box">
            <h3>
                <span>Open Source</span>
                <svg width="30" height="30" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M20 21V19C20 17.9391 19.5786 16.9217 18.8284 16.1716C18.0783 15.4214 17.0609 15 16 15H8C6.93913 15 5.92172 15.4214 5.17157 16.1716C4.42143 16.9217 4 17.9391 4 19V21" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                    <path d="M12 11C14.2091 11 16 9.20914 16 7C16 4.79086 14.2091 3 12 3C9.79086 3 8 4.79086 8 7C8 9.20914 9.79086 11 12 11Z" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                </svg>
            </h3>
            <div class="plan" id="plan-hobby">
                <div class="plan-name">
                    <h4>
                        <span data-related="selfhosted">Selfhosted</span>
                        <span data-related="cloud">&nbsp;</span>
                        <div class="onoffswitch" style="display:none">
                            <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch" tabindex="0">
                            <label class="onoffswitch-label" for="myonoffswitch">
                                <span class="onoffswitch-inner"></span>
                                <span class="onoffswitch-switch"></span>
                            </label>
                        </div>
                    </h4>
                    <div class="price">
                        <div data-related="cloud"> 6$ / month </div>
                        <div data-related="selfhosted">FREE</div>
                    </div>
                </div>
                <ul class="features">
                    <li>AGPL v3</li>
                    <li data-related="cloud">up to 3 users</li>
                </ul>
                <a class="btn" href="/docs/?origin=pricing::selfhosted" data-related="selfhosted">
                    START
                </a>
                <a class="btn" href="https://deploy.filestash.app/?type=personal::cloud" data-related="cloud">
                    START YOUR FREE TRIAL
                </a>
            </div>
        </div>
        <div class="box padding" style="box-sizing:border-box">
            <h3>
                For your company
                <svg width="30" height="30" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M17 21V19C17 17.9391 16.5786 16.9217 15.8284 16.1716C15.0783 15.4214 14.0609 15 13 15H5C3.93913 15 2.92172 15.4214 2.17157 16.1716C1.42143 16.9217 1 17.9391 1 19V21" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                    <path d="M9 11C11.2091 11 13 9.20914 13 7C13 4.79086 11.2091 3 9 3C6.79086 3 5 4.79086 5 7C5 9.20914 6.79086 11 9 11Z" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                    <path d="M23 21V19C22.9993 18.1137 22.7044 17.2528 22.1614 16.5523C21.6184 15.8519 20.8581 15.3516 20 15.13" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                    <path d="M16 3.13C16.8604 3.35031 17.623 3.85071 18.1676 4.55232C18.7122 5.25392 19.0078 6.11683 19.0078 7.005C19.0078 7.89318 18.7122 8.75608 18.1676 9.45769C17.623 10.1593 16.8604 10.6597 16 10.88" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                </svg>
            </h3>
            <div>
                <div class="plan" id="plan-pro">
                    <div class="plan-name">
                        <h4>Pro</h4>
                        <div class="price">
                            From 0.1$ / hour
                        </div>
                    </div>
                    <ul class="features">
                        <li>Commercial License</li>
                        <li>AWS Cloud</li>
                    </ul>
                    <a href="https://www.filestash.app/docs/marketplace/?origin=pricing::pro" class="btn">START</a>
                </div>
                <div class="plan" id="plan-enterprise">
                    <div class="plan-name">
                        <h4>Enterprise <span class="hidden-xs hidden-sm hidden-md" style="font-weight:normal;font-style:italic">Turnkey solutions</span></h4>
                        <div class="price">
                            From 200$ / month
                        </div>
                    </div>
                    <ul class="features">
                        <li>24/7 Support</li>
                        <li>Whitelabeling</li>
                        <li>Single sign-on</li>
                        <li>Audit & Compliance</li>
                        <li>Custom plugin development</li>
                    </ul>
                    <a class="btn action" href="./?origin=local&modal=enterprise">CONTACT US</a>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
 /* OVERRIDES */
 .container{
     width: 99%;
     margin: 0 auto;
     max-width: 1100px;
 }

 /* PRICING */
 .flex{ display: flex; }

 #pricing > .flex > div:first-child{ width: 33%; }
 #pricing > .flex > div:nth-child(2){ width: 67%; }
 #pricing .box{ background: white; box-shadow: 0 30px 60px rgba(0,0,0,0.12); border-radius: 2px; }
 #pricing .padding{ padding: 60px; }

 #pricing .padding > div .plan { width: 50%; }

 #pricing .box > div { display: flex; }

 #pricing h3{
     margin: 0 0 25px 0;
     font-size: 1.8rem;
     line-height: 30px;
 }
 #pricing h3 svg{
     stroke: var(--dark);
     float: right;
 }

 /* PLAN BOX */
 #pricing .plan .plan-name h4{ margin: 0; color: inherit; line-height: 30px;}
 #pricing .plan .plan-name h4 > div{ float:right; }
 #pricing .plan .plan-name {
     background: var(--dark);
     color: white;
     border-radius: 3px;
     padding: 15px;
     margin-bottom: 25px;
 }
 #pricing .plan .price{ font-size: 0.95rem; }
 #pricing .features { height: 145px; padding-left: 20px; }
 #pricing .plan .btn {
     text-transform: uppercase;
     width: 100%;
     padding: 4px 0;
     color: var(--emphasis);
     border: 2px solid var(--secondary);
     border-radius: 3px;
     font-size: 0.95rem;
     font-weight: normal;
     text-align: center;
     padding: 4px 0;
     letter-spacing: initial;
 }

 #plan-pro{padding-right: 10px;}
 #plan-pro.plan .plan-name{ background: var(--emphasis); }
 #plan-enterprise.plan .plan-name{ background: var(--emphasis); }
 #plan-enterprise{padding-left: 10px;}

 @media only screen and (max-width: 1050px) {
     #pricing .padding{ padding: 40px; }
 }
 @media only screen and (max-width: 910px) {
     #pricing .padding{ padding: 30px; }
 }
 @media only screen and (max-width: 850px) {
     #pricing .padding{ padding: 30px 15px 15px 15px; }
 }
 @media only screen and (max-width: 750px) {
     #pricing .padding{ padding: 60px; }
     .flex{ display: block; }
     #pricing > .flex > div:first-child{ width: 100%; }
     #pricing > .flex > div:nth-child(2){ width: 100%; }
 }
 @media only screen and (max-width: 600px) {
     #pricing .padding{ padding: 30px 15px 15px 15px; }
     .container{ padding-left: 5px; padding-right: 5px; }
 }
 @media only screen and (max-width: 550px) {
     #pricing .padding{ padding: 50px 15px 15px 15px; }
     #plan-pro{padding-right: 5px;}
     #plan-enterprise{padding-left: 5px;}
 }
 @media only screen and (max-width: 500px) {
     #pricing .padding{ padding: 25px 15px 15px 15px; }
     #pricing .plan .plan-name{ padding: 10px; }
     #pricing .plan .price{font-size: 0.85rem;}
 }


 /* DECORATION */
 body{ overflow-x: hidden; }
 #pricing{
     position: relative;
     margin-top: 100px;
     margin-bottom: 230px;
 }
 #pricing .box{ z-index: 2;}
 #pricing .flex:before{
     background-image: radial-gradient(rgb(175, 190, 208) 2px, transparent 2px);
     background-size: 1.5rem 1.5rem;
     content: "";
     height: 20rem;
     position: absolute;
     right: -7rem;
     top: -3.5rem;
     width: 20rem;
 }
 #pricing .flex:after{
     background-image: radial-gradient(rgb(175, 190, 208) 2px, transparent 2px);
     background-size: 1.5rem 1.5rem;
     content: "";
     height: 6rem;
     position: absolute;
     left: 13.5rem;
     bottom: -5rem;
     width: 20rem;
 }
 #pricing .btn:hover{
     box-shadow: 0 0 5px rgba(0,0,0,0.2);
     transition: 0.1s ease all;
     color: var(--super-light);
 }

 /* SWITCH: https://proto.io/freebies/onoff/ */
 .onoffswitch {
     position: relative; width: 108px;
     -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
 }
 .onoffswitch-checkbox {
     position: absolute;
     opacity: 0;
     pointer-events: none;
 }
 .onoffswitch-label {
     display: block; overflow: hidden; cursor: pointer;
     border-radius: 20px;
 }
 .onoffswitch-inner {
     display: block; width: 200%; margin-left: -100%;
     transition: margin 0.3s ease-in 0s;
 }
 .onoffswitch-inner:before, .onoffswitch-inner:after {
     display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 30px;
     font-size: 14px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;
     box-sizing: border-box;
 }
 .onoffswitch-inner:before {
     content: "CLOUD";
     padding-left: 10px;
     background-color: var(--primary); color: var(--super-light);
 }
 .onoffswitch-inner:after {
     content: "ON PREM";
     padding-right: 10px;
     background-color: #EEEEEE; color: #999999;
     text-align: right;
 }
 .onoffswitch-switch {
     display: block; width: 18px; margin: 6px;
     background: var(--super-light);
     position: absolute; top: 0; bottom: 0;
     right: 74px;
     border: 2px solid var(--super-light); border-radius: 20px;
     transition: all 0.3s ease-in 0s;
 }
 .onoffswitch-checkbox:checked + .onoffswitch-label .onoffswitch-inner {
     margin-left: 0;
 }
 .onoffswitch-checkbox:checked + .onoffswitch-label .onoffswitch-switch {
     right: 0px;
 }
 form input[type="text"].control {display: none;}
</style>
<script>
 jQuery(document).ready(function() {
     jQuery("[data-related='cloud']").hide();
 });
 jQuery("input[type='checkbox']").on("change", function(){
     // update the compare plans & features
     if(this.checked === true){
         jQuery("[data-related='selfhosted']").hide();
         jQuery("[data-related='cloud']").show();
     } else {
         jQuery("[data-related='selfhosted']").show();
         jQuery("[data-related='cloud']").hide();
     }

     // update the links in the hobby section
     jQuery("#plan-hobby a.btn").attr(
         "href",
         this.checked ? "https://deploy.filestash.app/?type=personal::cloud" : "{% link _docs/index.md %}"
     );
 });
</script>









<div class="container" id="faq">
    <h3 data-target="#choices-of-license">What are the licensing options available?</h3>
    <div class="collapse" id="choices-of-license">
        <ul>
            <li>GNU AGPL v3 Open Source License</li>
            <li>Commercial License</li>
        </ul>
    </div>

    <h3 data-target="#how-to-choose">How do I know if I need the commercial vs Open source version?</h3>
    <div class="collapse" id="how-to-choose">
        As a rule of thumb, you need a commercial license if you use our software in a solution that is not 100% open source.
    </div>

    <h3 data-target="#agplv3">Do I need to worry about GNU AGPLv3 when using a commercially licensed version of Filestash?</h3>
    <div class="collapse" id="agplv3">
        No. The commercial license exempt you from the obligation of the AGPLv3 license.
    </div>

    <h3 data-target="#why-paying">Why should I pay for an open source software?</h3>
    <div class="collapse" id="why-paying">
        Usage of Open Source software comes with rights and obligations. The open Source license is ideal for use cases where you don't need any kind of support, customisations and all obligations under the AGPL license can be met. Otherwise we suggest a commercial license.
    </div>

    <h3 data-target="#after-expiration">Can I continue to use my commercial license after it has expired?</h3>
    <div class="collapse" id="after-expiration">
        No. Once expired, the license would require to open source your solution
    </div>

    <h3 data-target="#cancellation">Can I cancel at any time?</h3>
    <div class="collapse" id="cancellation">
        Yes
    </div>

    <h3 data-target="#more-questions">What if I have more questions?</h3>
    <div class="collapse" id="more-questions">
        Send us an email at support@filestash.app and we’ll help you out.
    </div>

    <h3 data-target="#how-payment-done">How is my payment being processed?</h3>
    <div class="collapse" id="how-payment-done">
        We don't handle your credit card information directly and use Stripe to process your payment.
    </div>

</div>
<script>
 jQuery("#faq .collapse").hide();
 jQuery("#faq h3").on("click", function(){
     jQuery("#faq .collapse").hide(100);
     var $el = jQuery(jQuery(this).attr("data-target"))
     if($el.is(":hidden")) $el.show(100);
 });
</script>
<style>
 #faq{
     padding-left: 15px;
     padding-right: 15px;
     max-width: 900px;
     margin-bottom: 200px;
 }
 #faq h3{
     cursor: pointer;
     border-top: 1px solid rgba(0,0,0,0.1);
     padding-top: 20px;
     margin-top: 20px;
     user-select: none;
 }
 #faq h3:after{
     content: '+';
     float: right;
     font-family: monospace;
 }
 @media only screen and (max-width: 550px) {
     #faq h3:after{ content: ""; }
 }
</style>




<h2 class="center">Compare Plans</h2>
<style>
 .featurelist{
     max-width: 900px;
 }
 .featurelist h2{
     margin-top: 10px;
     text-align: center;
     color: var(--light);
     font-weight: 100;
 }
 table.features{
     width: 100%;
     margin: 0px 0 100px 0;
 }
 table.features th{ font-weight: 300; }
 table.features i{ margin: 0 auto; display: block; width: 24px; height: 24px;}
 table.features i.check{
     background-image: url("data:image/svg+xml,%3C%3Fxml%20version%3D%221.0%22%20encoding%3D%22UTF-8%22%3F%3E%0A%3C!DOCTYPE%20svg%20PUBLIC%20%22-%2F%2FW3C%2F%2FDTD%20SVG%201.1%2F%2FEN%22%20%22http%3A%2F%2Fwww.w3.org%2FGraphics%2FSVG%2F1.1%2FDTD%2Fsvg11.dtd%22%3E%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xmlns%3Axlink%3D%22http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink%22%20version%3D%221.1%22%20%20width%3D%2224%22%20height%3D%2224%22%20viewBox%3D%220%200%2024%2024%22%3E%0A%20%20%20%3Cpath%20fill%3D%22%23FFFFFF%22%20d%3D%22M21%2C7L9%2C19L3.5%2C13.5L4.91%2C12.09L9%2C16.17L19.59%2C5.59L21%2C7Z%22%20%2F%3E%0A%3C%2Fsvg%3E");
     background-repeat: no-repeat;
     background-size: 18px;
     background-position: center center;
     border-radius: 50%;
     background-color: var(--primary);
 }
 table.features i.close {
     -webkit-mask-image: url("data:image/svg+xml,%3C%3Fxml%20version%3D%221.0%22%20encoding%3D%22UTF-8%22%3F%3E%0A%3C!DOCTYPE%20svg%20PUBLIC%20%22-%2F%2FW3C%2F%2FDTD%20SVG%201.1%2F%2FEN%22%20%22http%3A%2F%2Fwww.w3.org%2FGraphics%2FSVG%2F1.1%2FDTD%2Fsvg11.dtd%22%3E%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xmlns%3Axlink%3D%22http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink%22%20version%3D%221.1%22%20%20width%3D%2224%22%20height%3D%2224%22%20viewBox%3D%220%200%2024%2024%22%3E%0A%20%20%20%3Cpath%20fill%3D%22%23000000%22%20d%3D%22M19%2C13H5V11H19V13Z%22%20%2F%3E%0A%3C%2Fsvg%3E");
     -webkit-mask-repeat: no-repeat;
     -webkit-mask-size: 24px;
     -webkit-mask-position: center center;
     mask-image: url("data:image/svg+xml,%3C%3Fxml%20version%3D%221.0%22%20encoding%3D%22UTF-8%22%3F%3E%0A%3C!DOCTYPE%20svg%20PUBLIC%20%22-%2F%2FW3C%2F%2FDTD%20SVG%201.1%2F%2FEN%22%20%22http%3A%2F%2Fwww.w3.org%2FGraphics%2FSVG%2F1.1%2FDTD%2Fsvg11.dtd%22%3E%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xmlns%3Axlink%3D%22http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink%22%20version%3D%221.1%22%20%20width%3D%2224%22%20height%3D%2224%22%20viewBox%3D%220%200%2024%2024%22%3E%0A%20%20%20%3Cpath%20fill%3D%22%23000000%22%20d%3D%22M19%2C13H5V11H19V13Z%22%20%2F%3E%0A%3C%2Fsvg%3E");
     mask-repeat: no-repeat;
     mask-size: 24px;
     mask-position: center center;
     background-color: #CFD8DC;
 }
 table.features h3{
     color: var(--secondary);
     font-size: 1.25rem;
     font-weight: 100;
     margin-bottom: 10px;
     margin-top: 30px;
     border-bottom: 1px solid rgba(0,0,0,0.1);
     padding-bottom: 10px;
 }
 table.features td{
     text-align: center;
     padding: 3px 0;
 }
 table.features td:first-of-type {
     text-align: left;
 }
 table.features td:not(:first-of-type){
     width: 90px;
 }
</style>
<style>
 .tooltip {
     position: relative;
     font-size: 0.9em;
 }
 .tooltip .tooltiptext {
     visibility: hidden;
     width: 120px;
     padding: 5px;
     background: var(--secondary);
     color: var(--bg-color);
     text-align: center;
     border-radius: 4px;
     position: absolute;
     left: -19px;
     z-index: 1;
 }
 .tooltip:hover .tooltiptext {
     visibility: visible;
 }
 .tooltip .tooltiptext::after {
     content: " ";
     position: absolute;
     bottom: 100%;
     left: 50%;
     margin-left: -5px;
     border-width: 5px;
     border-style: solid;
     border-color: transparent transparent var(--secondary) transparent;
 }
 .tooltip .tooltiptext {
     opacity: 0;
     transition: opacity 0.3s;
 }
 .tooltip:hover .tooltiptext {
     opacity: 1;
 }
 tr:not(.header):hover {
     background: rgba(0,0,0,0.07);
 }
 tr:not(.header) td {
     padding-left: 10px;
 }
 tr.header > th{
     font-style: italic;
     font-weight: bold;
 }
</style>
<div class="container featurelist">
    <table class="features">
        <tbody>
            <tr class="header">
                <td>
                </td>
                <th data-related="cloud">Hobby</th>
                <th data-related="selfhosted">Hobby</th>
                <th>Pro</th>
                <th>Enterprise</th>
            </tr>

            <tr class="header">
                <td colspan="5">
                    <h3 style="margin-top:0">Connectors</h3>
                </td>
            </tr>
            <tr>
                <td><a href="{% post_url 2019-11-26-ftp-web-client %}">FTP</a></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td><a href="{% post_url 2019-11-26-ftp-web-client %}">FTPS</a></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td><a href="{% post_url 2020-04-30-sftp-browser %}">SFTP</a></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td><a href="{% post_url 2021-10-18-webdav-client %}">WebDav</a></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td><a href="{% post_url 2024-05-01-smb-web-client %}">SMB</a></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>NFS</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Artifactory</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td><a href="{% post_url 2019-11-21-s3-browser %}">S3</a></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td><a href="{% post_url 2019-11-21-s3-browser %}">Minio</a></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>GIT</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td><a href="{% post_url 2020-01-04-ldap-browser %}">LDAP</a></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Local Filesystem</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Backblaze B2</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Storj</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Dropbox</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Google Drive</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Mysql</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Azure Blob</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Google Cloud Storage</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>

            <tr class="header">
                <td colspan="5">
                    <h3>Features</h3>
                </td>
            </tr>
            <tr>
                <td>API access</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Image transcoding / viewer</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Video transcoding / viewer</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>File editor</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Code editor</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Shared link</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Advanced collaboration permission</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Unmetered upload</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Branding and White Labeling</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>SSO using OIDC</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>SSO using SAML</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>LDAP integration</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>MFA integration</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Enterprise search integration</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Document Signature</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Custom integration</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Priority Feature Requests</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>


            <tr class="header">
                <td colspan="5">
                    <h3>Support & Maintenance</h3>
                </td>
            </tr>
            <tr>
                <td>Dedicated Account Manager</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Compliance Report</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>SLA</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Custom SLA</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Managed Upgrades</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Tailored build</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Priority support</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Email support</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Phone support</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Upgrade & Maintenance</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Automatic SSL</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Enhanced Security</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Early Security patches</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Training</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Professional services</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Security services</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Setup advices</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>


            <tr class="header">
                <td colspan="5">
                    <h3>Administration</h3>
                </td>
            </tr>
            <tr>
                <td>Admin console</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Bring your own DNS</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Audit Engine</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Cluster</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Intrusion detection system</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Customisation</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>

            <tr class="header">
                <td colspan="5">
                    <h3>Software Configuration</h3>
                </td>
            </tr>
            <tr>
                <td>Filesystem</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>ENV Variable</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>AWS S3</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>AWS Secret Manager</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Google Secret Manager</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Google Cloud Storage</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Azure File Storage</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>

            <tr class="header">
                <td colspan="5">
                    <h3>Platforms</h3>
                </td>
            </tr>
            <tr>
                <td>Docker</td>
                <td data-related="cloud"><i>N/A</i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td><i class="check"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Debian installer</td>
                <td data-related="cloud"><i>N/A</i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>RHEL installer</td>
                <td data-related="cloud"><i>N/A</i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Ubuntu installer</td>
                <td data-related="cloud"><i>N/A</i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>
            <tr>
                <td>Custom install</td>
                <td data-related="cloud"><i>N/A</i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td><i class="close"></i></td>
                <td><i class="check"></i></td>
            </tr>


        </tbody>
    </table>
</div>


<script>
 // A simple jQuery modal (http://github.com/kylefox/jquery-modal)
 !function(o){"object"==typeof module&&"object"==typeof module.exports?o(require("jquery"),window,document):o(jQuery,window,document)}(function(o,t,i,e){var s=[],l=function(){return s.length?s[s.length-1]:null},n=function(){var o,t=!1;for(o=s.length-1;o>=0;o--)s[o].$blocker&&(s[o].$blocker.toggleClass("current",!t).toggleClass("behind",t),t=!0)};o.modal=function(t,i){var e,n;if(this.$body=o("body"),this.options=o.extend({},o.modal.defaults,i),this.options.doFade=!isNaN(parseInt(this.options.fadeDuration,10)),this.$blocker=null,this.options.closeExisting)for(;o.modal.isActive();)o.modal.close();if(s.push(this),t.is("a"))if(n=t.attr("href"),this.anchor=t,/^#/.test(n)){if(this.$elm=o(n),1!==this.$elm.length)return null;this.$body.append(this.$elm),this.open()}else this.$elm=o("<div>"),this.$body.append(this.$elm),e=function(o,t){t.elm.remove()},this.showSpinner(),t.trigger(o.modal.AJAX_SEND),o.get(n).done(function(i){if(o.modal.isActive()){t.trigger(o.modal.AJAX_SUCCESS);var s=l();s.$elm.empty().append(i).on(o.modal.CLOSE,e),s.hideSpinner(),s.open(),t.trigger(o.modal.AJAX_COMPLETE)}}).fail(function(){t.trigger(o.modal.AJAX_FAIL);var i=l();i.hideSpinner(),s.pop(),t.trigger(o.modal.AJAX_COMPLETE)});else this.$elm=t,this.anchor=t,this.$body.append(this.$elm),this.open()},o.modal.prototype={constructor:o.modal,open:function(){var t=this;this.block(),this.anchor.blur(),this.options.doFade?setTimeout(function(){t.show()},this.options.fadeDuration*this.options.fadeDelay):this.show(),o(i).off("keydown.modal").on("keydown.modal",function(o){var t=l();27===o.which&&t.options.escapeClose&&t.close()}),this.options.clickClose&&this.$blocker.click(function(t){t.target===this&&o.modal.close()})},close:function(){s.pop(),this.unblock(),this.hide(),o.modal.isActive()||o(i).off("keydown.modal")},block:function(){this.$elm.trigger(o.modal.BEFORE_BLOCK,[this._ctx()]),this.$body.css("overflow","hidden"),this.$blocker=o('<div class="'+this.options.blockerClass+' blocker current"></div>').appendTo(this.$body),n(),this.options.doFade&&this.$blocker.css("opacity",0).animate({opacity:1},this.options.fadeDuration),this.$elm.trigger(o.modal.BLOCK,[this._ctx()])},unblock:function(t){!t&&this.options.doFade?this.$blocker.fadeOut(this.options.fadeDuration,this.unblock.bind(this,!0)):(this.$blocker.children().appendTo(this.$body),this.$blocker.remove(),this.$blocker=null,n(),o.modal.isActive()||this.$body.css("overflow",""))},show:function(){this.$elm.trigger(o.modal.BEFORE_OPEN,[this._ctx()]),this.options.showClose&&(this.closeButton=o('<a href="#close-modal" rel="modal:close" class="close-modal '+this.options.closeClass+'">'+this.options.closeText+"</a>"),this.$elm.append(this.closeButton)),this.$elm.addClass(this.options.modalClass).appendTo(this.$blocker),this.options.doFade?this.$elm.css({opacity:0,display:"inline-block"}).animate({opacity:1},this.options.fadeDuration):this.$elm.css("display","inline-block"),this.$elm.trigger(o.modal.OPEN,[this._ctx()])},hide:function(){this.$elm.trigger(o.modal.BEFORE_CLOSE,[this._ctx()]),this.closeButton&&this.closeButton.remove();var t=this;this.options.doFade?this.$elm.fadeOut(this.options.fadeDuration,function(){t.$elm.trigger(o.modal.AFTER_CLOSE,[t._ctx()])}):this.$elm.hide(0,function(){t.$elm.trigger(o.modal.AFTER_CLOSE,[t._ctx()])}),this.$elm.trigger(o.modal.CLOSE,[this._ctx()])},showSpinner:function(){this.options.showSpinner&&(this.spinner=this.spinner||o('<div class="'+this.options.modalClass+'-spinner"></div>').append(this.options.spinnerHtml),this.$body.append(this.spinner),this.spinner.show())},hideSpinner:function(){this.spinner&&this.spinner.remove()},_ctx:function(){return{elm:this.$elm,$elm:this.$elm,$blocker:this.$blocker,options:this.options}}},o.modal.close=function(t){if(o.modal.isActive()){t&&t.preventDefault();var i=l();return i.close(),i.$elm}},o.modal.isActive=function(){return s.length>0},o.modal.getCurrent=l,o.modal.defaults={closeExisting:!0,escapeClose:!0,clickClose:!0,closeText:"Close",closeClass:"",modalClass:"modal",blockerClass:"jquery-modal",spinnerHtml:'<div class="rect1"></div><div class="rect2"></div><div class="rect3"></div><div class="rect4"></div>',showSpinner:!0,showClose:!0,fadeDuration:null,fadeDelay:1},o.modal.BEFORE_BLOCK="modal:before-block",o.modal.BLOCK="modal:block",o.modal.BEFORE_OPEN="modal:before-open",o.modal.OPEN="modal:open",o.modal.BEFORE_CLOSE="modal:before-close",o.modal.CLOSE="modal:close",o.modal.AFTER_CLOSE="modal:after-close",o.modal.AJAX_SEND="modal:ajax:send",o.modal.AJAX_SUCCESS="modal:ajax:success",o.modal.AJAX_FAIL="modal:ajax:fail",o.modal.AJAX_COMPLETE="modal:ajax:complete",o.fn.modal=function(t){return 1===this.length&&new o.modal(this,t),this},o(i).on("click.modal",'a[rel~="modal:close"]',o.modal.close),o(i).on("click.modal",'a[rel~="modal:open"]',function(t){t.preventDefault(),o(this).modal()})});</script>
<style>.blocker{position:fixed;top:0;right:0;bottom:0;left:0;width:100%;height:100%;overflow:auto;z-index:1;padding:20px;box-sizing:border-box;background-color:#000;background-color:rgba(0,0,0,0.8);text-align:center}.blocker:before{content:"";display:inline-block;height:100%;vertical-align:middle;margin-right:-0.05em}.blocker.behind{background-color:transparent}.modal{display:none;vertical-align:middle;position:relative;z-index:2;max-width:500px;box-sizing:border-box;width:90%;background:#fff;padding:15px 30px;-webkit-border-radius:8px;-moz-border-radius:8px;-o-border-radius:8px;-ms-border-radius:8px;border-radius:8px;-webkit-box-shadow:0 0 10px #000;-moz-box-shadow:0 0 10px #000;-o-box-shadow:0 0 10px #000;-ms-box-shadow:0 0 10px #000;box-shadow:0 0 10px #000;text-align:left}.modal a.close-modal{position:absolute;top:-12.5px;right:-12.5px;display:block;width:30px;height:30px;text-indent:-9999px;background-size:contain;background-repeat:no-repeat;background-position:center center;background-image:url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6/NlyAAAAAXNSR0IArs4c6QAAA3hJREFUaAXlm8+K00Acx7MiCIJH/yw+gA9g25O49SL4AO3Bp1jw5NvktC+wF88qevK4BU97EmzxUBCEolK/n5gp3W6TTJPfpNPNF37MNsl85/vN/DaTmU6PknC4K+pniqeKJ3k8UnkvDxXJzzy+q/yaxxeVHxW/FNHjgRSeKt4rFoplzaAuHHDBGR2eS9G54reirsmienDCTRt7xwsp+KAoEmt9nLaGitZxrBbPFNaGfPloGw2t4JVamSt8xYW6Dg1oCYo3Yv+rCGViV160oMkcd8SYKnYV1Nb1aEOjCe6L5ZOiLfF120EjWhuBu3YIZt1NQmujnk5F4MgOpURzLfAwOBSTmzp3fpDxuI/pabxpqOoz2r2HLAb0GMbZKlNV5/Hg9XJypguryA7lPF5KMdTZQzHjqxNPhWhzIuAruOl1eNqKEx1tSh5rfbxdw7mOxCq4qS68ZTjKS1YVvilu559vWvFHhh4rZrdyZ69Vmpgdj8fJbDZLJpNJ0uv1cnr/gjrUhQMuI+ANjyuwftQ0bbL6Erp0mM/ny8Fg4M3LtdRxgMtKl3jwmIHVxYXChFy94/Rmpa/pTbNUhstKV+4Rr8lLQ9KlUvJKLyG8yvQ2s9SBy1Jb7jV5a0yapfF6apaZLjLLcWtd4sNrmJUMHyM+1xibTjH82Zh01TNlhsrOhdKTe00uAzZQmN6+KW+sDa/JD2PSVQ873m29yf+1Q9VDzfEYlHi1G5LKBBWZbtEsHbFwb1oYDwr1ZiF/2bnCSg1OBE/pfr9/bWx26UxJL3ONPISOLKUvQza0LZUxSKyjpdTGa/vDEr25rddbMM0Q3O6Lx3rqFvU+x6UrRKQY7tyrZecmD9FODy8uLizTmilwNj0kraNcAJhOp5aGVwsAGD5VmJBrWWbJSgWT9zrzWepQF47RaGSiKfeGx6Szi3gzmX/HHbihwBser4B9UJYpFBNX4R6vTn3VQnez0SymnrHQMsRYGTr1dSk34ljRqS/EMd2pLQ8YBp3a1PLfcqCpo8gtHkZFHKkTX6fs3MY0blKnth66rKCnU0VRGu37ONrQaA4eZDFtWAu2fXj9zjFkxTBOo8F7t926gTp/83Kyzzcy2kZD6xiqxTYnHLRFm3vHiRSwNSjkz3hoIzo8lCKWUlg/YtGs7tObunDAZfpDLbfEI15zsEIY3U/x/gHHc/G1zltnAgAAAABJRU5ErkJggg==')}.modal-spinner{display:none;position:fixed;top:50%;left:50%;transform:translateY(-50%) translateX(-50%);padding:12px 16px;border-radius:5px;background-color:#111;height:20px}.modal-spinner>div{border-radius:100px;background-color:#fff;height:20px;width:2px;margin:0 1px;display:inline-block;-webkit-animation:sk-stretchdelay 1.2s infinite ease-in-out;animation:sk-stretchdelay 1.2s infinite ease-in-out}.modal-spinner .rect2{-webkit-animation-delay:-1.1s;animation-delay:-1.1s}.modal-spinner .rect3{-webkit-animation-delay:-1.0s;animation-delay:-1.0s}.modal-spinner .rect4{-webkit-animation-delay:-0.9s;animation-delay:-0.9s}@-webkit-keyframes sk-stretchdelay{0%,40%,100%{-webkit-transform:scaleY(0.5)}20%{-webkit-transform:scaleY(1.0)}}@keyframes sk-stretchdelay{0%,40%,100%{transform:scaleY(0.5);-webkit-transform:scaleY(0.5)}20%{transform:scaleY(1.0);-webkit-transform:scaleY(1.0)}}</style>
<style>
 .jquery-modal{ z-index: 10; }
 .modal{display: none;}
</style>

<script>
 function submitForm(e){
     var $submit = e.target.querySelector("button");
     var n = 0;
     if($submit.textContent.indexOf("LOADING") !== -1){
         e.preventDefault(); // block multiple submit
         return;
     }
     $submit.setAttribute("value", "LOADING ...");
     window.setInterval(function(){
         n += 1;
         if(n === 1){
             $submit.innerHTML = "LOADING .&nbsp&nbsp";
         } else if(n === 2){
             $submit.innerHTML = "LOADING ..&nbsp";
         } else if(n === 3){
             $submit.innerHTML = "LOADING ...";
             n = 0;
         }
     }, 800);
 }
</script>
<div id="enterprise" class="modal">
    <h3>Enterprise</h3>
    <a href="#" rel="modal:close">x</a>
    <form onsubmit="submitForm(event)" action="https://downloads.filestash.app/compute/form.php" method="post">
        <input type="hidden" name="type" value="enterprise" />
        <input type="hidden" name="redirect" value="https://www.filestash.app/ok/" />
        <input type="email" name="email" placeholder="Email Address" />
        <input type="phone" name="phone" placeholder="Phone Number" />
        <input type="text" name="job-title" placeholder="Job Title" />
        <input type="text" name="description" placeholder="Your needs in more details" class="control" />
        <textarea name="message" placeholder="what are you trying to achieve? How can we help you?" rows="4"></textarea>
        <button class="btn">SUBMIT</button>
    </form>
</div>
<div id="support_register" class="modal">
    <h3>Register for support</h3>
    <a href="#" rel="modal:close">x</a>
    <form onsubmit="submitForm(event)" action="https://downloads.filestash.app/compute/form.php" method="post">
        <input type="hidden" name="type" value="support::register" />
        <input type="hidden" name="redirect" value="https://www.filestash.app/ok/" />
        <input type="text" name="company" placeholder="Your company name" />
        <input type="email" name="email" placeholder="Your email address" />
        <input type="phone" name="phone" placeholder="Your phone number" />
        <input type="text" name="description" placeholder="Your needs in more details" class="control" />
        <button class="btn">SUBMIT</button>
    </form>
</div>
<div id="installer" class="modal installer">
    <h3>Install for:</h3>
    <div class="flex shortbox">
        <a href="?modal=installer_cloud">Cloud</a>
        <a href="?modal=installer_selfhosted">Selfhosted</a>
    </div>
</div>
<div id="installer_selfhosted" class="modal">
    <h3>Selfhosted</h3>
    <div class="flex">
        <a href="/redirect.html?origin=pricing::selfhosted&url=https://buy.stripe.com/bIY15scyObhs6be006">Buy a license</a>
        <a href="https://platform.filestash.app/support/book">Talk to an engineer</a>
        <a href="?modal=enterprise&origin=pricing::installer_selfhosted">Schedule a demo</a>
    </div>
</div>
<div id="installer_cloud" class="modal">
    <h3>Cloud</h3>
    <div class="flex">
        <a href="/redirect.html?origin=pricing::cloud&url=https://buy.stripe.com/8wM4hE0Q64T40QU3cd">Purchase</a>
        <a href="https://platform.filestash.app/support/book">Talk to an engineer</a>
        <a href="https://demo.filestash.app">Try the demo instance</a>
    </div>
</div>


<style>
    .modal .flex { display: flex;justify-content: space-between; flex-wrap: wrap; }
    .modal .flex > a {
      padding: 10px 0;
      background: var(--primary);
      border-radius: 5px;
      text-align: center;
      font-size: 1.1rem;
      color: inherit;
      display: block;
      width: 100%;
      margin: 10px 0 0 0;
    }
    .modal .flex.shortbox > a {
      width: 45%;
      padding: 25px 0;
    }
    .modal [rel="modal:close"] {
        position:absolute;
        top:10px;
        right:20px;
        font-family:monospace;
        color:inherit;
    }
</style>

<script>
  (function(){
     const modalSelected = (new URLSearchParams(location.search)).get("modal");

     if(location.hash === "#support") {
         $('#support_register').modal({fadeDuration: 250});
         return;
     } else if(modalSelected === "support") {
         $('#support_register').modal({fadeDuration: 250});
         return;
     }

     if (location.hash === "#enterprise") {
         $('#enterprise').modal({fadeDuration: 250});
         return;
     } else if (modalSelected === "enterprise") {
         $('#enterprise').modal({fadeDuration: 250});
         return;
     }

     if (modalSelected === "installer") {
         $('#installer').modal({fadeDuration: 250});
         return;
     } else if (modalSelected === "installer_selfhosted") {
         $('#installer_selfhosted').modal({fadeDuration: 250});
         return;
     } else if (modalSelected === "installer_cloud") {
         $('#installer_cloud').modal({fadeDuration: 250});
         return;
     }

  })()
</script>


<style>
 .modal{
     padding: 40px 35px 35px 35px;
     border-radius: 4px;
     box-shadow: 1px 1px 10px rgba(255,255,255,0.1);
 }
 .modal a.close-modal{
     top: 10px;
     right: 10px;
     opacity: 0.3;
 }
 .modal h3{
     text-align: center;
     font-weight: 500;
     font-size: 1.4rem;
     margin: -15px -15px 0px -15px;
     padding: 12px 0;
     border-top-left-radius: 4px;
     border-top-right-radius: 4px;
 }
 .modal a.close-modal{ display: none; }
</style>

<style>
 /* Geometric Shape */
 .geometric-shape{
     top: 0;
     right: 0;
     bottom: 0;
     left: 0;
     position: absolute!important;

     width: 115rem;
     background: linear-gradient(76.4deg,rgba(233,230,246,.21) 11.23%,rgba(233,230,246,0) 36.25%,rgba(233,230,246,0) 55.2%,#f2f0f8 97.53%);
     transform: rotate(33deg) translateX(10%) translateY(77%);
 }
</style>

<br/><br/><br/><br/><br/><br/>
{% include footer.html %}
