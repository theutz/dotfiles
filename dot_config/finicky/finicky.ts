import type {
  FinickyConfig,
  BrowserHandler,
  BrowserSpecification,
} from "/Applications/Finicky.app/Contents/Resources/finicky.d.ts";

const ff: BrowserSpecification = (url) => ({
  name: "Firefox",
  args: ["--new", "--args", "-P", "default", url.toString()],
});

const ffWork: BrowserSpecification = (url) => ({
  name: "Firefox",
  args: ["--new", "--args", "-P", "Delegator", url.toString()],
});

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
      browser: ff,
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
          ]
            .reduce(
              (prev, curr) => [...prev, curr, curr.replace(/\..+$/, ".test")],
              [] as string[],
            )
            .some((domain) => url.host.endsWith(domain)),
      ],
      browser: ffWork,
    },
  ],
} satisfies FinickyConfig;
