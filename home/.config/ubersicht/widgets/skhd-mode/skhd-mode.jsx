import { css } from "uebersicht";

export const command = "tail -n 1 /usr/local/var/log/skhd/skhd.out.log";

export const refreshFrequency = false;

export const initialState = {
  output: "default"
};

const heading = css`
  color: white;
  font-family: "Haskplex Nerd";
  text-transform: uppercase;
  line-height: 0;
  font-size: 12px;
`;

export const render = ({ output }) => {
  const mode = output.trim();
  console.log(mode)

  if (mode === 'default') return;

  const color = ["focus"].includes(mode)
        ? "#3FEEE6"
        : ["swap"].includes(mode)
        ? "#55BCC9"
        : ["command"].includes(mode)
        ? "#97CAEF"
        : ["delete", "insert"].includes(mode)
        ? "#FC4445"
        : "#CAFAFE";

  const boundary = css`
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    position: fixed;
    border: 5px solid ${color};
    display: flex;
    align-items: flex-start;
    justify-content: center;
  `;

  return (
    <div className={boundary}>
      <h1 className={heading} key={mode}>
        {mode}
      </h1>
    </div>
  );
};
