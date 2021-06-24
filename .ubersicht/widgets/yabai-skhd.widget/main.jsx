import { styled, React } from "uebersicht";

export const command = "yabai-skhd.widget/data.sh";

export const refreshFrequency = 100;

export const className = `
  font-family: "Meslo LG S for Powerline", monospace;
  bottom: 0;
  right: 0;
  left: 0;
  color: #898EA4;
  display: grid;
  grid-template-columns: repeat(8, 1fr);
  grid-gap: 10px;
  padding: 0 10px 10px; 
  box-sizing: border-box;
`;

const Item = styled("div")`
  background-color: #202746cc;
  padding: 3px 16px;
  border-radius: 5px;
  justify-self: center;
  box-shadow: 1px 1px 1px 2px #20274655;
  border: 1px solid #202746;
`;

const First = styled(Item)`
  grid-column-start: 5;
`;

const Error = styled(Item)`
  grid-column: 1 / span 8;
  font-size: 10px;
  background-color: #fff;
  color: #202746;
`;

const Mode = styled(First)`
  ${({ children }) =>
    children !== "Default Mode"
      ? `
    background-color: #fff;
    color: #202746;
  `
      : null}
`;

export const render = ({ output, error }) => {
  if (Boolean(error)) return <Error>{String(error)}</Error>;
  if (!Boolean(output)) return <Error>No output received...</Error>;

  let mode,
    win = "____",
    space = "0",
    display = "0",
    spaceCount = "0",
    displayCount = "0";

  try {
    ({ mode, win, space, display, spaceCount, displayCount } =
      JSON.parse(output));
  } catch (e) {
    return <div>{String(e?.message ?? e)}</div>;
  }

  return (
    <>
      <Mode>{mode}</Mode>
      <Item>{win}</Item>
      <Item>
        Space: {space}/{spaceCount}
      </Item>
      <Item>
        Display: {display}/{displayCount}
      </Item>
    </>
  );
};
