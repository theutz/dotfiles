// ==UserScript==
// @name     Laravel Local Login
// @version  1.0
// @include  http://alldone.test/admin/login
// ==/UserScript==

console.log("Loaded Laravel Local Login from Greasemonkey");

window.addEventListener("load", function () {
  const email = document.getElementById("data.email");
  const password = document.getElementById("data.password");
  const remember = document.getElementById("data.remember");

  email.value = "test@example.com";
  password.value = "password";
  remember.checked = true;

  for (const el of [email, password, remember]) {
    const opts = { bubbles: true, cancelable: false, composed: true };
    el.dispatchEvent(new Event("input", opts));
    el.dispatchEvent(new Event("change", opts));
    el.dispatchEvent(new Event("blur", opts));
  }

  document.querySelector("#form button[type=submit]").click();
});
