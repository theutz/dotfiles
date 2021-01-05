import parse from "./lib/parse.jsx";
import { styled, React } from "uebersicht";

export const refreshFrequency = 500;
export const command = "./ubar/scripts/status.zsh";

export const className = `
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    height: 30px;
    background-color: #000000;
    color: #ccc;
    font-family: "SF Mono", monospace;
    font-size: 14px;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    opacity: 0.9;
`;

const Container = styled("div")`
  height: 100%;
  width: 100%;
  display: flex;
  flex-flow: row wrap;
  justify-content: center;
  align-items: center;
`;

const RightContainer = styled(Container)`
  justify-content: flex-start;
`;

const Section = styled("div")`
  border-color: #888;
  border-width: 2px;
  padding: 0 0.5em;

  &:not(:last-child) {
    border-right-style: solid;
    margin-right: 0.5em;
    padding-right: 0.5em;
  }
`;

const Label = styled("span")`
  padding-right: 0.5em;
  color: #888;
`;

const Item = styled("span")`
  padding: 1px ${(props) => (props.compact ? "2px" : "6px")};
  border-style: solid;
  border-color: ${(props) => (props.highlight ? "#ff0000" : "transparent")};
  border-width: ${(props) => (props.compact ? "0" : "1px")};
  background-color: ${(props) => (props.highlight ? "#660000" : "transparent")};
`;

const Error = ({ children }) => <Container>ERROR: {children}</Container>;

const range = (count) => Array.from({ length: count }).map((_, i) => i + 1);

const Mode = ({ mode }) => {
  if (!mode || mode === "Default") return null;

  return <Section>{<Item highlight>{mode}</Item>}</Section>;
};

const Space = ({ space: { index, count } }) => {
  const spaceArr = range(count);

  if (!count) return null;

  return (
    <Section>
      <Label>Space</Label>
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
      <Label>Display</Label>
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

  const { split, zoom, floating, sticky } = window;

  const splitIcon = split === "horizontal" ? "↔️" : "↕️";
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
  const floatIcon = Boolean(floating) ? "⛵" : "⚓";
  const stickyIcon = Boolean(sticky) ? "🧞" : "🪔";

  return (
    <>
      <Section>
        <Label>Window</Label>
        <Item compact>{splitIcon}</Item>
        <Item compact>{zoomIcon}</Item>
        <Item compact>{floatIcon}</Item>
        <Item compact>{stickyIcon}</Item>
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
    <>
      <RightContainer>
        <Mode mode={skhd.mode} />
      </RightContainer>
      <Container>
        <Display display={display} />
        <Space space={space} />
        <Window window={window} />
      </Container>
    </>
  );
};
