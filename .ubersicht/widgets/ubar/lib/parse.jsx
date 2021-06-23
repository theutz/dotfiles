function parse(data) {
  try {
    const {
      display = {},
      space = {},
      window = {},
      skhd = {},
      spaces = [],
    } = Boolean(data) ? JSON.parse(data) : {};

    return {
      space: { count: 0, index: 0, ...space },
      spaces,
      window: { split: "", zoom: "", floating: "", sticky: "", ...window },
      skhd: { mode: "Default", ...skhd },
      display: { count: 0, index: 0, ...display }
    };
  } catch (error) {
    console.warn(error, data);
    return undefined;
  }
}

export default parse;
