function parse(data) {
  try {
    const {
      display = { count: null, index: null },
      space = { count: null, index: null },
      window = { split: "", zoom: "", floating: "", sticky: "" },
      skhd = { mode: null },
    } = JSON.parse(data);

    return { space, window, skhd, display };
  } catch (error) {
    return { error };
  }
}

export default parse;
