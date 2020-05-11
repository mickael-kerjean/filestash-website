---
layout: documentation
title: Point de départ
order: 1
language: fr
permalink: /fr/docs
---

<style>.banner{ display: none; }</style>

Pour utiliser Filestash, vous pouvez soit:
1. Faire fonctionner votre propre instance dans le cloud en moins de 60 secondes. Vous pouvez ainsi avoir un essai gratuit en cliquant [ici](https://deploy.filestash.app/?type=personal::cloud){:target="_blank"}
2. Hébergez l'application sur votre propre serveur et gérez tout vous-même. Tous est documenté dans la [documentation](/docs/install-and-upgrade/) (écrit en Anglais)
3. Jouez avec l'instance publique que nous utilisons comme démo:

<iframe style="width: 100%;height: 500px;border: 9px solid #0000001a;border-radius: 5px;" id="appframe" frameborder="0" src="https://demo.filestash.app/login" allow="fullscreen;speaker"></iframe>

<div class="related">
    <div class="title">
        Pages associées <br>
        <img src="https://mickael.kerjean.me/assets/img/arrow_bottom.png"/>
    </div>
    <div class="related_content">
        <a href="{% post_url 2019-11-26-ftp-web-client-fr %}"><h3 class="no-anchor">Client FTP</h3></a><a href="{% post_url 2019-11-21-s3-browser %}"><h3 class="no-anchor">Client S3</h3></a><a href="{% post_url 2020-01-04-ldap-browser %}"><h3 class="no-anchor">Client LDAP</h3></a>
    </div>
</div>

<style>
.related{ text-align:center;margin-top:50px;}
.related .title{
    font-size: 1.5em;
    margin-top: 30px;
}
.related .title img{
    animation: bounce 1s infinite alternate;
    width: 16px;
    height: 17px;
}
.related .related_content { margin-top:5px; }
.related .related_content h3 {
    background: var(--bg-color);
    padding: 50px 0;
    border-radius: 5px;
    margin: 0!important;
}
.related .related_content a{
    display: inline-block;
    width: 33%;
    padding: 5px;
    text-decoration: none!important;
}
.related .related_content a:hover{
    transform: scale(1.1);
    transition: ease 0.3s transform;
}
.related .related_content a:hover h3{
    background: var(--emphasis-primary);
    transition: ease 0.3s background;
}

@media only screen and (max-width: 550px) {
    .related .related_content a{ width: 100%; }
}
@keyframes bounce {
    from {
        transform: translate3d(0,0,0);
    }
    to {
        transform: translate3d(0,-8px,0);
    }
}
</style>
