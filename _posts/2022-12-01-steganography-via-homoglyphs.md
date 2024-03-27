---
title: Online Steganography Tool
description: An online steganography tool that works in plain text without images to encode and decode messages in plain sight
layout: post
tags: tool
permalink: /online-steganography.html
language: en
---

<script>
 class Homoglyph {
     static alphabetHomoglyph = {
         "a":"а","b":"𝖻","c":"ⅽ","d":"ԁ","e":"е","f":"ꬵ","g":"ց",
         "h":"һ","i":"ⅰ","j":"ϳ","k":"𝗄","l":"ⅼ","n":"ո",
         "o":"ο","p":"𝗉","q":"ԛ","r":"𝗋","s":"ѕ","t":"𝗍","u":"ս",
         "v":"ⅴ","w":"ᴡ","x":"ⅹ","y":"у","z":"ᴢ",
     }

     static encode(text, msg) {
         const existingMsg = this.decode(text);
         if (existingMsg !== "") {
             msg += existingMsg;
             text = this.clean(text);
         }

         let textArray = text.split(/(?!$)/u);
         let msgN = 0;
         const encodedMsg = this.encodeMsg(msg);
         for (let i=0; i<textArray.length; i++) {
             if (msgN >= encodedMsg.length) {
                 return textArray.join("");
             }
             const newCharIdx = Object.keys(this.alphabetHomoglyph)
                                      .indexOf(textArray[i]);
             if (newCharIdx === -1) {
                 continue;
             }
             if (encodedMsg[msgN] === "1") {
                 textArray[i] = this.alphabetHomoglyph[textArray[i]];
             }
             msgN += 1;
         }
         return textArray.join("");
     }

     static decode(text) {
         const textArray = text.split(/(?!$)/u);
         let code = "";
         for (let i=0; i<textArray.length; i++) {
             const char = Object.keys(this.alphabetHomoglyph).indexOf(textArray[i]);
             const charH = Object.values(this.alphabetHomoglyph).indexOf(textArray[i]);
             if (char === -1 && charH === -1) {
                 continue;
             } else if ( char !== -1 ) {
                 code += "0";
             } else if ( charH !== -1 ) {
                 code += "1";
             } else {
                 throw new Error("shouldn't happen");
             }
         }
         code = code.replace(/^0+/, "")
         return this.decodeMsg(code);
     }

     static clean(text) {
         const textArray = text.split(/(?!$)/u);
         for (let i=0; i<textArray.length; i++) {
             const charH = Object.values(this.alphabetHomoglyph).indexOf(textArray[i]);
             if (charH === -1) continue;
             textArray[i] = Object.keys(this.alphabetHomoglyph)[charH];
         }
         return textArray.join("");
     }

     static compress(text) { // TODO: not working outside chrome?
         return new Response(
             new Blob([text], { type: "text/plain" })
                 .stream()
                 .pipeThrough(new CompressionStream("gzip"))
         ).blob().then((r) => r.text());
     }

     static decompress(buffer) {
     }

     static encodeMsg(text) {
         return text.split("").map(char => {
             const t = char.charCodeAt(0).toString(2);
             if(t.length === 7) {
                 return t;
             }
             return t.slice(0,7).padStart(7, "0")
         }).join("");
     }

     static decodeMsg(binaryCode) {
         let msg = "";
         for (let i=0; i<binaryCode.length; i+= 7) {
             const slice = binaryCode.slice(i, i+7);
             if (slice.length < 7) break;
             else if (slice === "0000000") continue;
             const char = parseInt(slice, 2);
             msg += String.fromCharCode(char)
         }
         return msg;
     }
 }
</script>

<script>
 function updateDecoder(e) {
     let msg = Homoglyph.decode(e.value);
     e.parentElement
      .parentElement
      .parentElement
      .querySelector(".decoded-content > div")
      .innerText = (msg === "" ? "nothing was found" : msg);
 }
 function updateEncoder(e) {
     let msg, content;
     switch(e.tagName) {
         case "INPUT":
             msg = e.value;
             content = e.parentElement.parentElement.querySelector("textarea").value;
             break
         case "TEXTAREA":
             content = e.value;
             msg = e.parentElement.parentElement.querySelector("input").value;
             break;
     }
     e.parentElement
      .parentElement
      .parentElement
      .querySelector(".encoded-content > div")
      .innerText = Homoglyph.encode(content, msg);
 }
</script>

<p id="stega-example" style="text-align:left">
    "Steganography is the practice of representing information within another message or physical object, in such a manner that the presence of the information is not evident to human inspection." This piece of text you are reading conceals your public IP address alongside today's date. To decipher it, you would need to run it in this decoder:
</p>
<script>
 (function main() {
     const abortController = new AbortController();
     const timer = setTimeout(() => abortController.abort(), 1500);
     const updateContent = (ip) => {
         let $p = document.getElementById("stega-example");
         let msg = "[date:" + new Date().toISOString().substring(0,10).replaceAll("-", "") + "]";
         msg += "[ip:" + (ip || "unknown")+ "]";
         const contentWithHiddenStuff = Homoglyph.encode($p.innerText, msg)

         let $decoder = document.querySelectorAll(".tool")[0];
         let $encoder = document.querySelectorAll(".tool")[1];
         $encoder.querySelector("input").value = msg;
         $encoder.querySelector("textarea").value = $p.innerText.trim();
         $decoder.querySelector("textarea").value = contentWithHiddenStuff;
         $p.innerText = contentWithHiddenStuff;
         updateEncoder($encoder.querySelector("input"));
         updateDecoder($decoder.querySelector("textarea"));
     };
     fetch("https://ipapi.co/json/", {
         signal: abortController.signal,
     }).then((r) => r.json()).then((r) => {
         clearTimeout(timer);
         updateContent(r["ip"]);
     }).catch((err) => updateContent());
 })();
</script>

<div class="tool" style="margin-bottom:10px;">
    <h2>Decoder Tool</h2>
    <fieldset>
        <legend>INPUT</legend>
        <textarea onkeyup="updateDecoder(this)" rows="6" placeholder="Paste content that was encoded with our online tool"></textarea>
    </fieldset>
    <fieldset class="decoded-content">
        <legend>OUTPUT</legend>
        <div class="output"></div>
    </fieldset>
</div>

<div class="tool">
    <h2>Encoder Tool</h2>
    <fieldset>
        <legend>INPUT</legend>
        <label>
            message:
            <input type="text" value="" onkeyup="updateEncoder(this)" style="border-radius: 3px; border: 2px solid rgba(0,0,0,0.1);"/>
        </label><br/>
        <label>
            base content:
            <textarea rows="6" onkeyup="updateEncoder(this)">
            </textarea>
        </label>
    </fieldset>
    <fieldset class="encoded-content">
        <legend>OUTPUT</legend>
        <div class="output">
        </div>
    </fieldset>
</div>

<style>
 .tool {
    background: var(--dark);
    padding: 25px;
    border-radius: 5px;
    color: var(--bg-color);
    box-shadow: 0px 0px 50px rgb(0 0 0 / 50%);
 }
 .tool fieldset {
    color: var(--color);
    border: 2px dashed var(--color);
 }
 .tool fieldset > div, .tool fieldset > label {
    color: white;
 }
 .tool textarea {
    width: 100%;
    box-sizing: border-box;
    display: block;
    border-radius: 3px;
    border: 2px solid rgba(0, 0, 0, 0.1);
    padding: 8px 10px;
    min-width: 100%;
    max-width: 100%;
 }
 #main .tool h2{
     color: white;
     margin: 0 0 10px 0;
     padding: 0;
 }
 .tool .output {
    background: var(--color);
    padding: 5px;
    border-radius: 3px;
 }
</style>

There’s a wide range of techniques that can be used to do steganography. Most available online tools available at this time focus on image-based steganography but you can hide information in virtually anything anywhere, not just images.

There's almost an infinite amount of possible encoder and decoder you could build to do steganography on plain text, this page is just one of such example. The technique that's used here is based on [Homoglyphs](https://en.wikipedia.org/wiki/Homoglyph) which according to [this source](https://news.ycombinator.com/item?id=33625024) was used by Google to protect their internal communication but some other technques could be found in the literature like whitespace watermarking leveraging either the [zero-width space]((https://en.wikipedia.org/wiki/Zero-width_space)) or the various [whitespace characters]((https://en.wikipedia.org/wiki/Whitespace_character)) available from [Unicode](https://en.wikipedia.org/wiki/Unicode).

If you're considering one of the other, each technique got pro/cons depending on what you're trying to do. One of the cool things with Homoglyphs which is used here is its resistance to copy and paste from and to any medium but also that it enables the addition of new metadata for each copy without destroying the existing metadata.

If you're interested in Steganography to protect your company information, we have made some tools to protect your sensitive and confidential data sitting on servers using FTP, SFTP, S3, NFS, WebDAV, Samba and more, [contact us](/pricing/?modal=enterprise) and we will look at your exact needs in more details.
