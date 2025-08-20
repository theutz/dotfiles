// ==UserScript==
// @name     HubSpot Cache Buster
// @version  1.0
// @include  https://poligon.delegator.com/*
// @include  https://*.hs-sites.com/*
// @include  https://*.poligon.com/*
// ==/UserScript==

console.log("Loaded HubSpot Cache Buster from Greasemonkey");

function bustHubspotCache() {
  const url = new URL(window.location);
  const randomNumber = Math.floor(Math.random() * 10e5);
  url.searchParams.set("hsCacheBuster", randomNumber);
  url.searchParams.set("developerMode", true);
  url.searchParams.set("hsDebug", true);
  window.location.href = url;
}

function handleKeypress(event) {
  if (event.metaKey && event.shiftKey && event.key == "1") {
    event.preventDefault();
    bustHubspotCache();
  }
}

document.addEventListener("keydown", handleKeypress);
