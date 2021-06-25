import { styled, React } from "uebersicht";

export const command = "yabai-skhd.widget/data.sh";

export const refreshFrequency = 100;

export const className = `
  font-family: "Meslo LG S for Powerline", monospace;
  font-size: 14px;
  bottom: 10px;
  right: 10px;
  left: 10px;
  color: #898EA4;
  display: grid;
  padding: 5px;
  grid-template-columns: repeat(5, 1fr);
  background-color: #202746;
  border-radius: 8px;
`;

const Item = styled("div")`
  padding: 2px 10px;
  justify-self: center;
`;

const Error = styled(Item)`
  font-size: 10px;
  background-color: #fff;
  color: #202746;
`;

const Mode = styled(Item)`
  ${({ children }) =>
    !String(children).match(/[Dd]efault/)
      ? `
    background-color: #898EA4;
    color: #202746dd ;
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
    displayCount = "0",
    lastCmd = "";

  try {
    ({ mode, win, space, display, spaceCount, displayCount, lastCmd } =
      JSON.parse(output));
  } catch (e) {
    return <div>{String(e?.message ?? e)}</div>;
  }

  return (
    <>
      <Mode>mode: {mode.toLowerCase()}</Mode>
      <Item>cmd: {lastCmd.toLowerCase()}</Item>
      <Item>
        space: {space}/{spaceCount}
      </Item>
      <Item>
        display: {display}/{displayCount}
      </Item>
      <Item>window: {win.toLowerCase()}</Item>
    </>
  );
};
