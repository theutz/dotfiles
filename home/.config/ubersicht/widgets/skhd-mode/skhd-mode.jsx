import { css } from "uebersicht";

export const command = "cat $HOME/.skhd_mode";

export const refreshFrequency = 100;

const boundary = css`
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  opacity: 0.8;
  position: fixed;
  border: 2px solid red;
  display: flex;
  align-items: flex-start;
  justify-content: center;
`;

const heading = css`
  color: red;
  font-family: "Haskplex Nerd";
  text-transform: uppercase;
  line-height: 0;
  font-size: 12px;
`;

const initialState = {
  output: "default"
};

export const render = ({ output, error }) => {
  if (output.trim() === "default") {
    return <div>Hes</div>;
  }

  return (
    <div className={boundary}>
      <h1 className={heading}>{output}</h1>
    </div>
  );
};
