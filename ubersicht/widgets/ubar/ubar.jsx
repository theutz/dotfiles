import parse from "./lib/parse.jsx";
import { styled } from "uebersicht";

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

const Section = styled("div")``;

const Separator = styled("div")`
  margin: 0 0.5em;
`;

const Item = styled("span")`
  padding: 1px 6px;
  border: 2px solid transparent;
`;

const HighlightedItem = styled(Item)`
  border-color: rgba(255, 0, 0, 0.5);
`;

const Error = ({ children }) => <Container>ERROR: {children}</Container>;

const VR = () => <Separator>|</Separator>;

const Waiting = () => <Item>...</Item>;

const range = (count) => Array.from({ length: count }).map((_, i) => i + 1);

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

  const { space = {}, display = {}, skhd = {} } = data;
  const displayArr = range(display.count);
  const spaceArr = range(space.count);

  return (
    <Container>
      <Section>
        Mode:{" "}
        {skhd.mode === "Default" ? (
          <Item>{skhd.mode}</Item>
        ) : typeof skhd.mode === "undefined" ? (
          <Waiting />
        ) : (
          <HighlightedItem>{skhd.mode}</HighlightedItem>
        )}
      </Section>
      <VR />
      <Section>
        Display:{" "}
        {display.index ? (
          displayArr.map((x) =>
            x === display.index ? (
              <HighlightedItem key={x}>{x}</HighlightedItem>
            ) : (
              <Item key={x}>{x}</Item>
            )
          )
        ) : (
          <Waiting />
        )}
      </Section>
      <VR />
      <Section>
        Space:{" "}
        {space.index ? (
          spaceArr.map((x) =>
            x === space.index ? (
              <HighlightedItem key={x}>{x}</HighlightedItem>
            ) : (
              <Item key={x}>{x}</Item>
            )
          )
        ) : (
          <Waiting />
        )}
      </Section>
    </Container>
  );
};
