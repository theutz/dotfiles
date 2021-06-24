import { styled, React } from "uebersicht";

export const command = "yabai-skhd.widget/data.sh";
export const refreshFrequency = 200;

export const className = `
  font-family: "Meslo LG S for Powerline", monospace;
  bottom: 0;
  right: 0;
  left: 0;
  color: #898EA4;
  opacity: 0.8;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-gap: 20px;

  & > * {
    background-color: #202746;
    padding: 10px 20px;
  }
`;

const Left = styled("div")`
  border-radius: 0 10px 0 0;
  justify-self: left;
`;

const Center = styled("div")`
  border-radius: 10px 10px 0 0;
  justify-self: center;
`;

const Right = styled("div")`
  border-radius: 10px 0 0 0;
  justify-self: right;
`;

export const render = ({ output, error }) => {
  if (Boolean(error)) return <div>{String(error)}</div>;
  if (!Boolean(output)) return <div>No output received...</div>;

  let mode, win, space, display;

  try {
    ({ mode, win, space, display } = JSON.parse(output));
  } catch (e) {
    return <div>{String(e?.message ?? e)}</div>;
  }

  return (
    <>
      <Left>Michael Utz</Left>
      <Center>
        Window: {win}, Space: {space}, Display: {display}
      </Center>
      <Right>{mode}</Right>
    </>
  );
};
