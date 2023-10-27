import './Formulario.css'
import CampoTexo from '../CampoTexto/Index.js';
import Select from '../Select/Index.js'
import Botao from '../Botao/Index.js';
import { useState } from 'react';

export const Formulario = (props) => {
  const itens = ["Programação", "Front End", "Data Science", "Devops", "Ux e Desing", "Mobile", "Inovação e Gestão"]

  const submit = (evento) => {
    evento.preventDefault()
    props.funcao({
      valorNome,
      valorCargo,
      valorImagem,
      valorTime
    })
  }

  const [valorNome, setValorNome] = useState('')
  const [valorCargo, setValorCargo] = useState('')
  const [valorImagem, setValorImagem] = useState('')
  const [valorTime, setTime] = useState('')

  return (
    <section className="section-formulario">
      <form onSubmit={submit}>
        <h2>Preencha os dados para criar o card do colaborador</h2>
        <CampoTexo label="Nome" place="Informe seu nome" funcao={setValorNome} isRequired={true}/>
        <CampoTexo label="Cargo" place="Informe seu cargo" funcao={setValorCargo} isRequired={true}/>
        <CampoTexo label="Imagem" place="Informe o link da imagem" funcao={setValorImagem} isRequired={true}/>
        <Select label="Time" itens={itens} funcao={setTime} isRequired={true}/>
        <Botao>
          Criar Card
        </Botao>
      </form>
    </section>
  );
};
