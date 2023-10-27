import "./CampoTexto.css";
export const CampoTexo = (props) => {

  return (
    <div className="campo-texto">
      <label>{props.label}</label>
      <input placeholder={props.place} onChange={value => props.funcao(value.target.value)} required={props.isRequired}></input>
    </div>
  );
};
