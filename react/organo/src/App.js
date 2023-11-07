import { useState } from 'react';
import './App.css'
import Banner from "./componentes/Banner/Index.js";
import Formulario from "./componentes/Formulario/Index.js";
import Time from './componentes/Time/index.js';

function App() {
  const [colaboradores, setColaboradores] = useState([])

  const atualizarColaboladores = (colaborador) => {
    setColaboradores([...colaboradores, colaborador])
  }

  return (
    <div className="App">
      <Banner />
      <Formulario funcao={novoColaborador => atualizarColaboladores(novoColaborador)} />
      <Time nome="Programação"></Time>
      <Time nome="Front-End"></Time>
    </div>
  );
}

export default App;
