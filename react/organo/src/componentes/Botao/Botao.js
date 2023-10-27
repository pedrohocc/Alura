import './Botao.css'
export const Botao = (props) => {
    return(
        <div className="Botao">
            <button className="botao">{props.children}</button>
        </div>
    )
}