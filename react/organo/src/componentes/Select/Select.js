import "./Select.css";
export const Select = (props) => {
  const listaItens = props.itens;
  const listaOptions = listaItens.map((value) => (
    <option key={value} value={value}>{value}</option>
  ));

  return (
    <div className="select">
      <label>{props.label}</label>
      <select defaultValue={""} onChange={value => props.funcao(value.target.value)} required={props.isRequired}>
        <option value={""}>Selecione</option>
        {listaOptions}
      </select>
    </div>
  );
};
