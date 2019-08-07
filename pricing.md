---
layout: default
---

{% include menu.html context="homepage" %}
<style>
 h1{
     color: var(--bg-color);
     font-weight: 500;
     text-align: center;
     margin: 50px 0;
 }
</style>
<div style="background:var(--primary)">
    <div class="container center">
        <h1>Choose the plan that's right for you</h1>
        <style>
         .plans{
             text-align: center;
             display: inline-block;
             box-shadow: 5px 2px 20px var(--emphasis-primary);
         }
         .plans a{
             cursor: pointer;
             display: inline-block;
             border: 4px solid var(--secondary);
             padding: 5px 15px;
             font-size: 1.2em;
             margin: 0 -4px;
         }
         .plans a:not(.active):hover{
             background: var(--emphasis-primary);
         }
         .plans a.active{
             background: var(--secondary);
             color: var(--super-light);
         }
         .definition{
             margin-bottom: 200px;
             display: block;
             color: var(--secondary);
             font-size: 1.3em;
             margin-top: 10px;
             margin-bottom: -10px;
         }
         .clear_space{
             margin-bottom: 200px;
         }
        </style>
        <script>
         function selectPlan(type){
             // category switch
             let $els = document.querySelectorAll(".plans a");
             for (let i=0; i< $els.length; i++){
                 if($els[i].innerText.toLowerCase() === type) {
                     $els[i].classList.add("active");
                 } else {
                     $els[i].classList.remove("active");
                 }
             }

             // definition highlight
             $els = document.querySelectorAll(".definition");
             for (i=0; i< $els.length; i++){
                 if($els[i].getAttribute("data-related") === type){
                     $els[i].style.display = "block";
                 }else{
                     $els[i].style.display = "none";
                 }
             }


             // pricing grid
             $els = document.querySelectorAll(".pricing");
             for (i=0; i< $els.length; i++){
                 if($els[i].getAttribute("data-related") === type){
                     $els[i].style.display = "flex";
                 }else{
                     $els[i].style.display = "none";
                 }
             }

             // feature comparison
             $els = document.querySelectorAll("h2 span[data-related]");
             for (i=0; i< $els.length; i++){
                 if($els[i].getAttribute("data-related") === type){
                     $els[i].style.display = "inline";
                 }else{
                     $els[i].style.display = "none";
                 }
             }

             $els = document.querySelectorAll("table [data-related]");
             for (i=0; i< $els.length; i++){
                 if($els[i].getAttribute("data-related") === type){
                     $els[i].style.display = "table-cell";
                 }else{
                     $els[i].style.display = "none";
                 }
             }
         }
        </script>
        <div class="plans">
            <a class="radius-top-left radius-bottom-left" onClick='selectPlan("cloud")'>Cloud</a>
            <a class="radius-top-right radius-bottom-right" onClick='selectPlan("selfhosted")'>Selfhosted</a>
        </div>
        <div class="definition" data-related="cloud"> In the cloud plan, we manage the servers</div>
        <div class="definition" data-related="selfhosted"> Selfhosted plan are for those who owns a server</div>
        <div class="clear_space"></div>
    </div>
</div>

<style>
 .pricing-container { min-height: 160px; margin-bottom: 30px; }
 .pricing{
     display: flex;
     justify-content: space-between;
     margin-top: -130px;
 }
 .package{
     position: relative;
     padding: 10px 15px;
     flex: 1;
     background: var(--bg-color);
     margin: 0 7px;
     box-shadow: 2px 2px 2px rgba(0,0,0,0.2);
     border-radius: 2px;
     text-align: center;
 }
 .package h2{
     margin: 0 0 5px 0;
 }
 .package a.action{
     position: absolute;
     left: 10px; right: 10px; bottom: 10px;

     display: inline-block;
     background: var(--primary);
     padding: 5px 0;
     text-align: center;
     color: var(--bg-color)!important;
     border-radius: 2px;
 }
 .package ul{
     margin: 0 0 0px 0;
     padding: 0;
     font-size: 0.95em;
     list-style-type: none;
 }
 .package li{
     margin: 12px 0 12px 0;
     line-height: 15px;
 }
 .package .amount{
     margin-bottom: 50px;
     margin-top: 30px;
     color: var(--dark);
     font-weight: 500;
 }
 .package .amount span {
     font-weight: 100;
     color: var(--color);
 }
 .package.special {
     box-shadow: 0px 0px 50px var(--secondary);
 }
 .package.special .promo{
     position: absolute;
     top: -40px;
     background: var(--secondary);
     left: -10px;
     right: -10px;
     color: var(--bg-color);
     border-radius: 2px;
     box-shadow: 2px 2px 2px rgba(0,0,0,0.5);
     padding: 10px 5px;
     line-height: 15px;
 }
 .package.special a{ color: inherit; font-weight: 500; }
</style>
<div class="container pricing-container">
    <div class="pricing" data-related="cloud">
        <div class="package">
            <h2>Free</h2>
            <ul>
                <li>2MB upload limit</li>
                <li>Shared links are reset every week</li>
                <li>No customisation</li>
            </ul>
            <div class="amount"> $0/month</div>
            <a class="action" href="https://demo.filestash.app">USE NOW</a>
        </div>
        <div class="package">
            <h2>Personal</h2>
            <ul>
                <li>No upload limit</li>
                <li>Full access to the admin console</li>
                <li>Link it to your domain</li>
            </ul>
            <div class="amount">
                <s>$9/month</s><br>
                <span>early bird: </span> $5/month
            </div>
            <a class="action" href="#cloud_personal" rel="modal:open">ORDER NOW</a>
        </div>
        <div class="package">
            <h2>Enterprise</h2>
            <ul>
                <li>Enterprise support 24/7 by phone and email</li>
                <li>Custom installation</li>
            </ul>
            <div class="amount"></div>
            <a class="action" href="#cloud_enterprise" rel="modal:open">ORDER NOW</a>
        </div>
    </div>

    <div class="pricing" data-related="selfhosted">
        <div class="package">
            <h2>Free</h2>
            <ul>
                <li>You perform the installation & maintenance</li>
                <li>No automatic upgrade</li>
            </ul>
            <div class="amount">$0</div>
            <a class="action" href="/docs">START NOW</a>
        </div>
        <div class="package">
            <h2>Personal</h2>
            <ul>
                <li>We perform the install on your behalf</li>
                <li>Automatic upgrade</li>
            </ul>
            <div class="amount">
                $9/month
            </div>
            <a class="action" href="#selfhosted_personal" rel="modal:open">ORDER NOW</a>
        </div>
        <div class="package">
            <h2>Enterprise</h2>
            <ul>
                <li>Enterprise support</li>
                <li>Custom installation</li>
            </ul>
            <a class="action" href="#selfhosted_enterprise" rel="modal:open">ORDER NOW</a>
        </div>
    </div>
</div>

<style>
 .featurelist h2{
     margin-top: 0px;
     text-align: center;
     color: var(--light);
     font-weight: 100;
 }
 table.features{
     width: 100%;
     margin: 0px 0 100px 0;
 }
 table.features th{ font-weight: 300; }
 table.features i.check{
     display: inline-block;
     width: 24px;
     height: 24px;
     background-image: url("data:image/svg+xml,%3C%3Fxml%20version%3D%221.0%22%20encoding%3D%22UTF-8%22%3F%3E%0A%3C!DOCTYPE%20svg%20PUBLIC%20%22-%2F%2FW3C%2F%2FDTD%20SVG%201.1%2F%2FEN%22%20%22http%3A%2F%2Fwww.w3.org%2FGraphics%2FSVG%2F1.1%2FDTD%2Fsvg11.dtd%22%3E%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xmlns%3Axlink%3D%22http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink%22%20version%3D%221.1%22%20%20width%3D%2224%22%20height%3D%2224%22%20viewBox%3D%220%200%2024%2024%22%3E%0A%20%20%20%3Cpath%20fill%3D%22%23FFFFFF%22%20d%3D%22M21%2C7L9%2C19L3.5%2C13.5L4.91%2C12.09L9%2C16.17L19.59%2C5.59L21%2C7Z%22%20%2F%3E%0A%3C%2Fsvg%3E");
     background-repeat: no-repeat;
     background-size: 18px;
     background-position: center center;
     border-radius: 50%;
     background-color: var(--primary);
 }
 table.features i.close {
     display: inline-block;
     width: 24px;
     height: 24px;
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
     font-weight: 100;
     margin-bottom: 5px;
 }
 table.features td{
     text-align: center;
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
     display: inline-block;
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
     left: -48px;
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
</style>

<div class="container featurelist">
    <h2> Feature comparison ( <span data-related="selfhosted">Selfhosted</span> <span data-related="cloud">Cloud</span> )</h2>
    <table class="features">
        <tbody>
            <tr class="header">
                <td>
                </td>
                <th data-related="cloud">Free</th>
                <th data-related="cloud">Personal</th>
                <th data-related="cloud">Enterprise</th>
                <th data-related="selfhosted">Free</th>
                <th data-related="selfhosted">Personal</th>
                <th data-related="selfhosted">Enterprise</th>
            </tr>

            <tr class="header">
                <td>
                    <h3>Backend connector</h3>
                </td>
            </tr>
            <tr>
                <td>FTP</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>SFTP</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Webdav</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>S3</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Minio</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Dropbox</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Google Drive</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Mysql</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Postgres</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Sqlite</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>MS SQL</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Oracle</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Unlimited upload</td>
                <td data-related="cloud">
                    <div class="tooltip">
                        <i class="close"></i>
                        <span class="tooltiptext">2MB file upload limit</span>
                    </div>
                </td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>

            <tr class="header">
                <td colspan="5">
                    <h3>Features</h3>
                </td>
            </tr>
            <tr>
                <td>Image viewer</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Image transcoding</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Video viewer</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>File editor</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Shared link</td>
                <td data-related="cloud">
                    <div class="tooltip">
                        <i class="close"></i>
                        <span class="tooltiptext">links are reset every week</span>
                    </div>
                </td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Advanced collaboration permission</td>
                <td data-related="cloud">
                    <div class="tooltip">
                        <i class="close"></i>
                        <span class="tooltiptext">links are reset every week</span>
                    </div>
                </td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>

            <tr class="header">
                <td colspan="5">
                    <h3>Org Mode</h3>
                </td>
            </tr>
            <tr>
                <td>WYSIWYG editor</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Agenda</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Todos</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Org note as wikis</td>
                <td data-related="cloud">
                    <div class="tooltip">
                        <i class="close"></i>
                        <span class="tooltiptext">your URLs won't be persistent</span>
                    </div>
                </td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Export note to PDF</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Export note to HTML</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Export note to ODT</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Export note to TXT</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Export note to iCal</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Export note to Beamer</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Export note to Latex</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>


            <tr class="header">
                <td colspan="5">
                    <h3>Administration</h3>
                </td>
            </tr>
            <tr>
                <td>Access to admin console</td>
                <td data-related="cloud">
                    <div class="tooltip">
                        <i class="close"></i>
                        <span class="tooltiptext">imagine the mess if everyone would be an admin!</span>
                    </div>
                </td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Security tools</td>
                <td data-related="cloud">
                    <div class="tooltip">
                        <i class="close"></i>
                        <span class="tooltiptext">imagine the mess if everyone would be an admin!</span>
                    </div>
                </td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Customisation</td>
                <td data-related="cloud">
                    <div class="tooltip">
                        <i class="close"></i>
                        <span class="tooltiptext">imagine the mess if everyone would be an admin!</span>
                    </div>
                </td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Usage logs</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>BYOD: bring your own DNS</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>

            <tr class="header">
                <td colspan="5">
                    <h3>Support & maintenance</h3>
                </td>
            </tr>
            <tr>
                <td>Setup call with our specialists</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Community support on <a href="https://kiwiirc.com/nextclient/#irc://irc.freenode.net/#filestash?nick=guest??">freenode</a></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Email support</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Phone support</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Automatic upgrade</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>System maintenance</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Automatic SSL</td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Safe before security annoucement</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Training</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Consulting</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>

            <tr class="header">
                <td colspan="5">
                    <h3>Platforms</h3>
                </td>
            </tr>
            <tr>
                <td>Docker</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Custom install</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Debian installer</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>RHEL installer</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Ubuntu installer</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
            <tr>
                <td>Windows installer</td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="cloud"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="close"></i></td>
                <td data-related="selfhosted"><i class="check"></i></td>
            </tr>
        </tbody>
    </table>
</div>

{% include footer.html %}

<style>.modal{display: none;}</style>
<script>
 // A simple jQuery modal (http://github.com/kylefox/jquery-modal)
 !function(o){"object"==typeof module&&"object"==typeof module.exports?o(require("jquery"),window,document):o(jQuery,window,document)}(function(o,t,i,e){var s=[],l=function(){return s.length?s[s.length-1]:null},n=function(){var o,t=!1;for(o=s.length-1;o>=0;o--)s[o].$blocker&&(s[o].$blocker.toggleClass("current",!t).toggleClass("behind",t),t=!0)};o.modal=function(t,i){var e,n;if(this.$body=o("body"),this.options=o.extend({},o.modal.defaults,i),this.options.doFade=!isNaN(parseInt(this.options.fadeDuration,10)),this.$blocker=null,this.options.closeExisting)for(;o.modal.isActive();)o.modal.close();if(s.push(this),t.is("a"))if(n=t.attr("href"),this.anchor=t,/^#/.test(n)){if(this.$elm=o(n),1!==this.$elm.length)return null;this.$body.append(this.$elm),this.open()}else this.$elm=o("<div>"),this.$body.append(this.$elm),e=function(o,t){t.elm.remove()},this.showSpinner(),t.trigger(o.modal.AJAX_SEND),o.get(n).done(function(i){if(o.modal.isActive()){t.trigger(o.modal.AJAX_SUCCESS);var s=l();s.$elm.empty().append(i).on(o.modal.CLOSE,e),s.hideSpinner(),s.open(),t.trigger(o.modal.AJAX_COMPLETE)}}).fail(function(){t.trigger(o.modal.AJAX_FAIL);var i=l();i.hideSpinner(),s.pop(),t.trigger(o.modal.AJAX_COMPLETE)});else this.$elm=t,this.anchor=t,this.$body.append(this.$elm),this.open()},o.modal.prototype={constructor:o.modal,open:function(){var t=this;this.block(),this.anchor.blur(),this.options.doFade?setTimeout(function(){t.show()},this.options.fadeDuration*this.options.fadeDelay):this.show(),o(i).off("keydown.modal").on("keydown.modal",function(o){var t=l();27===o.which&&t.options.escapeClose&&t.close()}),this.options.clickClose&&this.$blocker.click(function(t){t.target===this&&o.modal.close()})},close:function(){s.pop(),this.unblock(),this.hide(),o.modal.isActive()||o(i).off("keydown.modal")},block:function(){this.$elm.trigger(o.modal.BEFORE_BLOCK,[this._ctx()]),this.$body.css("overflow","hidden"),this.$blocker=o('<div class="'+this.options.blockerClass+' blocker current"></div>').appendTo(this.$body),n(),this.options.doFade&&this.$blocker.css("opacity",0).animate({opacity:1},this.options.fadeDuration),this.$elm.trigger(o.modal.BLOCK,[this._ctx()])},unblock:function(t){!t&&this.options.doFade?this.$blocker.fadeOut(this.options.fadeDuration,this.unblock.bind(this,!0)):(this.$blocker.children().appendTo(this.$body),this.$blocker.remove(),this.$blocker=null,n(),o.modal.isActive()||this.$body.css("overflow",""))},show:function(){this.$elm.trigger(o.modal.BEFORE_OPEN,[this._ctx()]),this.options.showClose&&(this.closeButton=o('<a href="#close-modal" rel="modal:close" class="close-modal '+this.options.closeClass+'">'+this.options.closeText+"</a>"),this.$elm.append(this.closeButton)),this.$elm.addClass(this.options.modalClass).appendTo(this.$blocker),this.options.doFade?this.$elm.css({opacity:0,display:"inline-block"}).animate({opacity:1},this.options.fadeDuration):this.$elm.css("display","inline-block"),this.$elm.trigger(o.modal.OPEN,[this._ctx()])},hide:function(){this.$elm.trigger(o.modal.BEFORE_CLOSE,[this._ctx()]),this.closeButton&&this.closeButton.remove();var t=this;this.options.doFade?this.$elm.fadeOut(this.options.fadeDuration,function(){t.$elm.trigger(o.modal.AFTER_CLOSE,[t._ctx()])}):this.$elm.hide(0,function(){t.$elm.trigger(o.modal.AFTER_CLOSE,[t._ctx()])}),this.$elm.trigger(o.modal.CLOSE,[this._ctx()])},showSpinner:function(){this.options.showSpinner&&(this.spinner=this.spinner||o('<div class="'+this.options.modalClass+'-spinner"></div>').append(this.options.spinnerHtml),this.$body.append(this.spinner),this.spinner.show())},hideSpinner:function(){this.spinner&&this.spinner.remove()},_ctx:function(){return{elm:this.$elm,$elm:this.$elm,$blocker:this.$blocker,options:this.options}}},o.modal.close=function(t){if(o.modal.isActive()){t&&t.preventDefault();var i=l();return i.close(),i.$elm}},o.modal.isActive=function(){return s.length>0},o.modal.getCurrent=l,o.modal.defaults={closeExisting:!0,escapeClose:!0,clickClose:!0,closeText:"Close",closeClass:"",modalClass:"modal",blockerClass:"jquery-modal",spinnerHtml:'<div class="rect1"></div><div class="rect2"></div><div class="rect3"></div><div class="rect4"></div>',showSpinner:!0,showClose:!0,fadeDuration:null,fadeDelay:1},o.modal.BEFORE_BLOCK="modal:before-block",o.modal.BLOCK="modal:block",o.modal.BEFORE_OPEN="modal:before-open",o.modal.OPEN="modal:open",o.modal.BEFORE_CLOSE="modal:before-close",o.modal.CLOSE="modal:close",o.modal.AFTER_CLOSE="modal:after-close",o.modal.AJAX_SEND="modal:ajax:send",o.modal.AJAX_SUCCESS="modal:ajax:success",o.modal.AJAX_FAIL="modal:ajax:fail",o.modal.AJAX_COMPLETE="modal:ajax:complete",o.fn.modal=function(t){return 1===this.length&&new o.modal(this,t),this},o(i).on("click.modal",'a[rel~="modal:close"]',o.modal.close),o(i).on("click.modal",'a[rel~="modal:open"]',function(t){t.preventDefault(),o(this).modal()})});</script>
<style> .blocker{position:fixed;top:0;right:0;bottom:0;left:0;width:100%;height:100%;overflow:auto;z-index:1;padding:20px;box-sizing:border-box;background-color:#000;background-color:rgba(0,0,0,0.8);text-align:center}.blocker:before{content:"";display:inline-block;height:100%;vertical-align:middle;margin-right:-0.05em}.blocker.behind{background-color:transparent}.modal{display:none;vertical-align:middle;position:relative;z-index:2;max-width:500px;box-sizing:border-box;width:90%;background:#fff;padding:15px 30px;-webkit-border-radius:8px;-moz-border-radius:8px;-o-border-radius:8px;-ms-border-radius:8px;border-radius:8px;-webkit-box-shadow:0 0 10px #000;-moz-box-shadow:0 0 10px #000;-o-box-shadow:0 0 10px #000;-ms-box-shadow:0 0 10px #000;box-shadow:0 0 10px #000;text-align:left}.modal a.close-modal{position:absolute;top:-12.5px;right:-12.5px;display:block;width:30px;height:30px;text-indent:-9999px;background-size:contain;background-repeat:no-repeat;background-position:center center;background-image:url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6/NlyAAAAAXNSR0IArs4c6QAAA3hJREFUaAXlm8+K00Acx7MiCIJH/yw+gA9g25O49SL4AO3Bp1jw5NvktC+wF88qevK4BU97EmzxUBCEolK/n5gp3W6TTJPfpNPNF37MNsl85/vN/DaTmU6PknC4K+pniqeKJ3k8UnkvDxXJzzy+q/yaxxeVHxW/FNHjgRSeKt4rFoplzaAuHHDBGR2eS9G54reirsmienDCTRt7xwsp+KAoEmt9nLaGitZxrBbPFNaGfPloGw2t4JVamSt8xYW6Dg1oCYo3Yv+rCGViV160oMkcd8SYKnYV1Nb1aEOjCe6L5ZOiLfF120EjWhuBu3YIZt1NQmujnk5F4MgOpURzLfAwOBSTmzp3fpDxuI/pabxpqOoz2r2HLAb0GMbZKlNV5/Hg9XJypguryA7lPF5KMdTZQzHjqxNPhWhzIuAruOl1eNqKEx1tSh5rfbxdw7mOxCq4qS68ZTjKS1YVvilu559vWvFHhh4rZrdyZ69Vmpgdj8fJbDZLJpNJ0uv1cnr/gjrUhQMuI+ANjyuwftQ0bbL6Erp0mM/ny8Fg4M3LtdRxgMtKl3jwmIHVxYXChFy94/Rmpa/pTbNUhstKV+4Rr8lLQ9KlUvJKLyG8yvQ2s9SBy1Jb7jV5a0yapfF6apaZLjLLcWtd4sNrmJUMHyM+1xibTjH82Zh01TNlhsrOhdKTe00uAzZQmN6+KW+sDa/JD2PSVQ873m29yf+1Q9VDzfEYlHi1G5LKBBWZbtEsHbFwb1oYDwr1ZiF/2bnCSg1OBE/pfr9/bWx26UxJL3ONPISOLKUvQza0LZUxSKyjpdTGa/vDEr25rddbMM0Q3O6Lx3rqFvU+x6UrRKQY7tyrZecmD9FODy8uLizTmilwNj0kraNcAJhOp5aGVwsAGD5VmJBrWWbJSgWT9zrzWepQF47RaGSiKfeGx6Szi3gzmX/HHbihwBser4B9UJYpFBNX4R6vTn3VQnez0SymnrHQMsRYGTr1dSk34ljRqS/EMd2pLQ8YBp3a1PLfcqCpo8gtHkZFHKkTX6fs3MY0blKnth66rKCnU0VRGu37ONrQaA4eZDFtWAu2fXj9zjFkxTBOo8F7t926gTp/83Kyzzcy2kZD6xiqxTYnHLRFm3vHiRSwNSjkz3hoIzo8lCKWUlg/YtGs7tObunDAZfpDLbfEI15zsEIY3U/x/gHHc/G1zltnAgAAAABJRU5ErkJggg==')}.modal-spinner{display:none;position:fixed;top:50%;left:50%;transform:translateY(-50%) translateX(-50%);padding:12px 16px;border-radius:5px;background-color:#111;height:20px}.modal-spinner>div{border-radius:100px;background-color:#fff;height:20px;width:2px;margin:0 1px;display:inline-block;-webkit-animation:sk-stretchdelay 1.2s infinite ease-in-out;animation:sk-stretchdelay 1.2s infinite ease-in-out}.modal-spinner .rect2{-webkit-animation-delay:-1.1s;animation-delay:-1.1s}.modal-spinner .rect3{-webkit-animation-delay:-1.0s;animation-delay:-1.0s}.modal-spinner .rect4{-webkit-animation-delay:-0.9s;animation-delay:-0.9s}@-webkit-keyframes sk-stretchdelay{0%,40%,100%{-webkit-transform:scaleY(0.5)}20%{-webkit-transform:scaleY(1.0)}}@keyframes sk-stretchdelay{0%,40%,100%{transform:scaleY(0.5);-webkit-transform:scaleY(0.5)}20%{transform:scaleY(1.0);-webkit-transform:scaleY(1.0)}}</style>
<script>
 $(".pricing a.action").modal({fadeDuration: 300});
</script>

<div id="cloud_personal" class="modal">
    <h3>Personal cloud</h3>
    <form action="https://downloads.filestash.app/compute/form.php" method="post">
        <input type="hidden" name="type" value="cloud::personal" />
        <input type="hidden" name="redirect" value="https://www.filestash.app/ok" />
        <input type="email" name="email" placeholder="Your email address" />
        <input type="phone" name="phone" placeholder="Your phone number" />
        <textarea name="message" placeholder="what are you trying to achieve?"></textarea>
        <button>SUBMIT</button>
    </form>
</div>
<div id="cloud_enterprise" class="modal">
    <h3>Enterprise cloud</h3>
    <form action="https://downloads.filestash.app/compute/form.php" method="post">
        <input type="hidden" name="type" value="cloud::enterprise" />
        <input type="hidden" name="redirect" value="https://www.filestash.app/ok" />
        <input type="text" name="company" placeholder="Your company name" />
        <input type="email" name="email" placeholder="Your email address" />
        <input type="phone" name="phone" placeholder="Your phone number" />
        <textarea name="message" placeholder="what are you trying to achieve?"></textarea>
        <button>SUBMIT</button>
    </form>
</div>

<div id="selfhosted_personal" class="modal">
    <h3>Personal selfhosted</h3>
    <form action="https://downloads.filestash.app/compute/form.php" method="post">
        <input type="hidden" name="type" value="selfhosted::personal" />
        <input type="hidden" name="redirect" value="https://www.filestash.app/ok" />
        <input type="email" name="email" placeholder="Your email address" />
        <input type="phone" name="phone" placeholder="Your phone number" />
        <textarea name="message" placeholder="what are you trying to achieve?"></textarea>
        <button>SUBMIT</button>
    </form>
</div>
<div id="selfhosted_enterprise" class="modal">
    <h3>Enterprise selfhosted</h3>
    <form action="https://downloads.filestash.app/compute/form.php" method="post">
        <input type="hidden" name="type" value="selfhosted::enterprise" />
        <input type="hidden" name="redirect" value="https://www.filestash.app/ok" />
        <input type="text" name="company" placeholder="Your company name" />
        <input type="email" name="email" placeholder="Your email address" />
        <input type="phone" name="phone" placeholder="Your phone number" />
        <textarea name="message" placeholder="what are you trying to achieve?"></textarea>
        <button>SUBMIT</button>
    </form>
</div>
<div id="support_register" class="modal">
    <h3>Register for support</h3>
    <form action="https://downloads.filestash.app/compute/form.php" method="post">
        <input type="hidden" name="type" value="support::register" />
        <input type="hidden" name="redirect" value="https://www.filestash.app/ok" />
        <input type="text" name="company" placeholder="Your company name" />
        <input type="email" name="email" placeholder="Your email address" />
        <input type="phone" name="phone" placeholder="Your phone number" />
        <textarea name="message" placeholder="what are you trying to achieve?"></textarea>
        <button>SUBMIT</button>
    </form>
</div>

<script>
 (function(){
     var promo = window.localStorage.getItem("promo");
     if(promo === "emacs"){
         createPromo(
             document.querySelector(".pricing[data-related='cloud'] .package:nth-of-type(2)"),
             '25% will go to the <a target="_blank" href="https://www.fsf.org/">free software foundation</a>'
         );
     }

     function createPromo($pack, promoHTML){
         if(!$pack) return;
         $pack.classList.add("special");
         var $node = document.createElement("div");
         $node.classList.add("promo");
         $node.innerHTML = promoHTML;
         $pack.appendChild($node);
     }

     if(location.hash === "#support") {
         $('#support_register').modal({fadeDuration: 250});
     }
     location.hash === "#selfhosted" ? selectPlan("selfhosted") : selectPlan("cloud");
 })()
</script>



<style>
 .modal{
     padding: 15px 15px 15px 15px;
     border-radius: 4px;
 }
 .modal a.close-modal{
     top: 10px;
     right: 10px;
     opacity: 0.3;
 }
 .modal h3{
     text-align: center;
     font-weight: 500;
     border-bottom: 2px solid;
     background: var(--secondary);
     margin: -15px -15px 20px -15px;
     color: white;
     padding: 12px 0;
     border-top-left-radius: 4px;
     border-top-right-radius: 4px;
 }
 form input, form textarea {
     display: block;
     margin: 7px 0;
     background: var(--bg-color);
     border: none;
     outline: none;
     padding: 5px 10px;
     min-width: 100%;
     max-width: 100%;
     max-height: 80px;
 }
 form button{
     border: none;
     outline: none;
     padding: 5px 10px;
     width: 100%;
     background: var(--primary);
     color: var(--emphasis);
     font-size: 1em;
     margin-top: 5px;
     border-radius: 3px;
 }
</style>
