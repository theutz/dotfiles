import type { FinickyConfig } from "/Applications/Finicky.app/Contents/Resources/finicky.d.ts";

export default {
  defaultBrowser: "Firefox",
  options: {
    checkForUpdates: true,
    keepRunning: true,
    hideIcon: true,
    logRequests: false,
  },
  handlers: [
    {
      match: [
        (url) =>
          [
            "youtube.com",
            "fastmail.com",
            "reddit.com",
            "bsky.app",
            "lemmy.world",
            "hachyderm.io",
            "theutz.com",
          ].includes(url.host),
      ],
      browser: "Firefox",
    },
    {
      match: [
        (url) =>
          ["google.com", "zoho.com"].some((domain) =>
            url.host.endsWith(domain),
          ),
        (url) =>
          [
            "delegator.com",
            "lineworker.com",
            "hiwasseepackaging.com",
            "impactelectronics.com",
            "friendzy.co",
            "figma.com",
          ]
            .reduce(
              (prev, curr) => [...prev, curr, curr.replace(/\..+$/, ".test")],
              [] as string[],
            )
            .some((domain) => url.host.endsWith(domain)),
      ],
      browser: "Google Chrome",
    },
  ],
} satisfies FinickyConfig;
