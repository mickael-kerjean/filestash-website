---
title: Online Steganography Tool
description: text based steganography tool to hide messages in plain sight
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
        <legend>Input</legend>
        <textarea onkeyup="updateDecoder(this)" rows="4" placeholder="Paste content that was encoded with our online tool"></textarea>
    </fieldset>
    <fieldset class="decoded-content">
        <legend>Output</legend>
        <div></div>
    </fieldset>
</div>

<div class="tool">
    <h2>Encoder Tool</h2>
    <fieldset>
        <legend>Input</legend>
        <label>
            message:
            <input type="text" value="" onkeyup="updateEncoder(this)" />
        </label><br/>
        <label>
            base content:
            <textarea rows="4" onkeyup="updateEncoder(this)">
            </textarea>
        </label>
    </fieldset>
    <fieldset class="encoded-content">
        <legend>Output</legend>
        <div>
        </div>
    </fieldset>
</div>

<style>
 .tool {
     background: var(--emphasis-primary);
     border-radius: 5px;
     border: 9px solid var(--secondary);
     padding: 10px;
 }
 .tool textarea {
     width: 100%;
     box-sizing: border-box;
     display: block;
 }
 #main .tool h2{
     margin: 0 0 10px 0;
     padding: 0;
 }
</style>

There’s a wide range of techniques that can be used to do steganography but most available online tools available at this time only focus on image-based steganography. You can hide information not only in images but also in plain text using a range of techniques like whitespace watermarking leveraging either the [zero-width space]((https://en.wikipedia.org/wiki/Zero-width_space)) or the various [whitespace characters]((https://en.wikipedia.org/wiki/Whitespace_character)) available from [Unicode](https://en.wikipedia.org/wiki/Unicode).

The technique we use here is a variation of that approach that is based on [Homoglyphs](https://en.wikipedia.org/wiki/Homoglyph) which according to [this source](https://news.ycombinator.com/item?id=33625024) was used by Google to protect their internal communication. The main advantage of this technique is its resistance to copy and paste from and to any medium but also that it enables each new version to add its own metadata without destroying the existing one.

If you're interested in Steganography to protect your company information, we have made some tools to protect your sensitive and confidential data sitting on servers using FTP, SFTP, S3, WebDAV, Samba and more, [contact us](/pricing/?modal=enterprise) and we will look at your exact needs and see what we can do for you.
