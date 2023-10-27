import { useState } from 'react';
import './App.css'
import Banner from "./componentes/Banner/Index.js";
import Formulario from "./componentes/Formulario/Index.js";

function App() {
  const [colaboradores, setColaboradores] = useState([])

  const atualizarColaboladores = (colaborador) => {
    setColaboradores([...colaboradores, colaborador])
  }

  return (
    <div className="App">
      <Banner />
      <Formulario funcao={novoColaborador => atualizarColaboladores(novoColaborador)} />
    </div>
  );
}

export default App;
