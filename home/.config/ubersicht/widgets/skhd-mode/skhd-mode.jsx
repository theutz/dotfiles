import { css, keyframes } from "uebersicht";

export const command = "cat $HOME/.skhd_mode";

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

export const render = ({ output, error }) => {
  const mode = output.trim()

  if (mode === 'default') return

  const color = ['normal'].includes(mode)
              ? '#3FEEE6'
              : ['prev', 'next'].includes(mode)
              ? '#55BCC9'
              : ['space'].includes(mode)
              ? '#97CAEF'
	      : ['delete', 'insert'].includes(mode)
	      ? '#FC4445'
	      : '#CAFAFE'

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
      <h1 className={heading} key={mode}>{mode}</h1>
    </div>
  );
};
