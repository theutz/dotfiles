import parse from "./lib/parse.jsx";
import { styled, React } from "uebersicht";

export const refreshFrequency = 500;
export const command = "./ubar/scripts/status.zsh";

export const className = `
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  color: #ccc;
  font-family: "SF Mono", monospace;
  font-size: 14px;
`;

const Grid = styled("div")`
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  height: 30px;
  background-color: #000000;
  opacity: 0.9;
  padding: 0 1em;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
`;

const Area = styled("div")`
  height: 100%;
  width: 100%;
  display: flex;
  flex-flow: row wrap;
  justify-content: ${(props) => {
    return (() => {
      switch (props.side) {
        case "left":
          return "flex-start";
        case "right":
          return "flex-end";
        default:
          return "center";
      }
    })();
  }};
  align-items: center;
`;

const Section = styled("div")`
  padding: 0;

  &:not(:last-child) {
    margin-right: 2em;
  }
`;

const Label = styled("span")`
  padding-right: 1em;
  color: #888;
`;

const Item = styled("span")`
  padding: 2px ${(props) => (props.compact ? "2px" : "6px")};
  background-color: ${(props) => (props.highlight ? "#fff" : "transparent")};
  border-radius: ${(props) => (props.circle ? "50%" : "0")};
  color: ${(props) => (props.highlight ? "#000" : "inherit")};
`;

const UnstyledError = ({ children, className }) => (
  <div className={className}>
    📛 ERROR: {children && children.message ? children.message : children}
  </div>
);
const Error = styled(UnstyledError)`
  position: absolute;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #000;
`;

const range = (count) => Array.from({ length: count }).map((_, i) => i + 1);

const Mode = ({ mode }) => {
  if (!mode) return null;

  const isDefault = mode === "Default";

  return (
    <Section>
      {<Item highlight={!isDefault}>{isDefault ? "🤓" : mode}</Item>}
    </Section>
  );
};

const Display = ({ display: { count, index } }) => {
  const displayArr = range(count);

  if (!count) return null;

  return (
    <Section>
      <Label>🖥</Label>
      {displayArr.map((x) => (
        <Item key={x} highlight={x === index} circle>
          {x}
        </Item>
      ))}
    </Section>
  );
};

const Space = ({ space: { index, count } }) => {
  const spaceArr = range(count);

  if (!count) return null;

  return (
    <Section>
      <Label>🪐</Label>
      {spaceArr.map((x) => (
        <Item key={x} highlight={x === index} circle>
          {x}
        </Item>
      ))}
    </Section>
  );
};

const Window = ({ window }) => {
  if (!window) return null;

  const { split, zoom, floating, sticky } = window;

  const splitIcon = split === "horizontal" ? "↔️" : "↕️";
  const zoomIcon = (() => {
    switch (zoom) {
      case "none":
        return "🌘";
      case "zoom-parent":
        return "🌗";
      case "zoom-fullscreen":
        return "🌖";
      default:
        return "🌑";
    }
  })();
  const floatIcon = Boolean(floating) ? "⛵" : "⚓";
  const stickyIcon = Boolean(sticky) ? "🧞" : "🪔";

  return (
    <Section>
      <Item>{splitIcon}</Item>
      <Item>{zoomIcon}</Item>
      <Item>{floatIcon}</Item>
      <Item>{stickyIcon}</Item>
    </Section>
  );
};

export const render = ({ output, error }) => {
  const data = parse(output);

  if (typeof data === "undefined") {
    return (
      <Grid>
        <Area side="left">⏳</Area>
        <Area>Loading...</Area>
      </Grid>
    );
  }

  if (Boolean(error)) {
    let message;

    if (Boolean(error.message)) {
      ({ message } = error);
    } else if (typeof error === "string") {
      message = error;
    } else {
      message = "An unknown error occurred, bro.";
    }

    console.error(message);
    return <Error>{message}</Error>;
  }

  const { space, display, skhd, window } = data;

  return (
    <Grid>
      <Area side="left">
        <Mode mode={skhd.mode} />
      </Area>
      <Area>
        <Display display={display} />
        <Space space={space} />
      </Area>
      <Area side="right">
        <Window window={window} />
      </Area>
    </Grid>
  );
};
