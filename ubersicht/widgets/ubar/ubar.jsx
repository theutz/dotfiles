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
  padding: 1px 2px;
  border: 2px solid transparent;
`;

const HighlightedItem = styled(Item)`
  border-color: rgba(255, 0, 0, 0.5);
`;

const VR = () => <Separator>|</Separator>;

const range = (count) => Array.from({ length: count }).map((_, i) => i + 1);

export const render = ({ output }) => {
  const { space, display } = parse(output);
  const displayArr = range(display.count);
  const spaceArr = range(space.count);

  return (
    <Container>
      <Section>{/* Display: {display.index}/{display.count} */}</Section>
      <Section>
        Display:{" "}
        {displayArr.map((x) =>
          x === display.index ? (
            <HighlightedItem>{x}</HighlightedItem>
          ) : (
            <Item>{x}</Item>
          )
        )}
      </Section>
      <VR />
      <Section>
        Space:{" "}
        {spaceArr.map((x) =>
          x === space.index ? (
            <HighlightedItem>{x}</HighlightedItem>
          ) : (
            <Item>{x}</Item>
          )
        )}
      </Section>
    </Container>
  );
};
