function parse(data) {
  try {
    const { display = {}, space = {}, window = {}, skhd = {} } = Boolean(data)
      ? JSON.parse(data)
      : {};

    return {
      space: { count: 0, index: 0, ...space },
      window: { split: "", zoom: "", floating: "", sticky: "", ...window },
      skhd: { mode: "Default", ...skhd },
      display: { count: 0, index: 0, ...display },
    };
  } catch (error) {
    console.error(error, data);
    return undefined;
  }
}

export default parse;
