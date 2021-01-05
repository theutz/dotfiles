import parse from "./lib/parse.jsx";
import { styled, React } from "uebersicht";

export const refreshFrequency = 500;
export const command = "./ubar/scripts/status.zsh";

export const className = `
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    background-color: rgba(0,0,0,0.8);
    color: rgba(255,255,255,0.8);
    font-family: "SF Mono", monospace;
`;

const Container = styled("div")`
  display: flex;
  flex-flow: row wrap;
  justify-content: center;
  align-items: center;
  padding: 5px;
`;

const Section = styled("div")`
  border-color: #ffffff88;
  border-width: 2px;
  padding: 0 0.5em;

  &:not(:last-child) {
    border-right-style: solid;
    margin-right: 0.5em;
    padding-right: 0.5em;
  }
`;

const Item = styled("span")`
  padding: 1px ${(props) => (props.compact ? "0" : "6px")};
  border-style: solid;
  border-color: ${(props) => (props.highlight ? "#FF000088" : "transparent")};
  border-width: ${(props) => (props.compact ? "0" : "1px")};
  background-color: ${(props) =>
    props.highlight ? "#FF000088" : "transparent"};
  text-shadow: 1px 1px 3px #000000ff;
`;

const Error = ({ children }) => <Container>ERROR: {children}</Container>;

const range = (count) => Array.from({ length: count }).map((_, i) => i + 1);

const Mode = ({ mode }) => {
  if (!mode) return null;

  return (
    <Section>
      Mode: {<Item highlight={mode !== "Default"}>{mode}</Item>}
    </Section>
  );
};

const Space = ({ space: { index, count } }) => {
  const spaceArr = range(count);

  if (!count) return null;

  return (
    <Section>
      Space:{" "}
      {spaceArr.map((x) => (
        <Item key={x} highlight={x === index}>
          {x}
        </Item>
      ))}
    </Section>
  );
};

const Display = ({ display: { count, index } }) => {
  const displayArr = range(count);

  if (!count) return null;

  return (
    <Section>
      Display:{" "}
      {displayArr.map((x) => (
        <Item key={x} highlight={x === index}>
          {x}
        </Item>
      ))}
    </Section>
  );
};

const Window = ({ window }) => {
  if (!window) return null;
  const { split, zoom } = window;

  const splitIcon = split === "horizontal" ? "↔" : "↕";
  const zoomIcon = (() => {
    switch (zoom) {
      case "none":
        return "🌘";
      case "parent":
        return "🌗";
      case "fullscreen":
        return "🌖";
      default:
        return "🌑";
    }
  })();

  return (
    <>
      <Section>
        Window: <Item compact>{splitIcon}</Item> <Item compact>{zoomIcon}</Item>
      </Section>
    </>
  );
};

export const render = ({ output, error }) => {
  const data = parse(output);

  if (typeof data === "undefined") {
    return <Error>`data` is undefined</Error>;
  }

  if (typeof data.error !== "undefined") {
    return <Error>{data.error}</Error>;
  }

  if (typeof error !== "undefined") {
    return <Error>{error}</Error>;
  }

  const { space = {}, display = {}, skhd = {}, window } = data;

  return (
    <Container>
      <Mode mode={skhd.mode} />
      <Display display={display} />
      <Space space={space} />
      <Window window={window} />
    </Container>
  );
};
