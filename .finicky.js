module.exports = {
  defaultBrowser: "Safari",
  rewrite: [
    {
      // Redirect all urls to use https://
      match: ({ url }) => url.protocol === "http",
      url: { protocol: "https" },
    },
    {
      match(all) {
        finicky.log(JSON.stringify(all, null, 2));
        return false;
      },
      url: ({ url }) => url,
    },
  ],
  handlers: [
    {
      match: [
        "smartly.io",
        finicky.matchDomains(/.*\.smartly.io/),
        finicky.matchDomains(/.*\.devbox.fi/),
        finicky.matchDomains(/(docs|meet)\.google.com/),
        ({ url }) =>
          url.host === "github.com" && url.pathname.includes("smartlyio"),
      ],
      browser: "Google Chrome",
    },
  ],
};
