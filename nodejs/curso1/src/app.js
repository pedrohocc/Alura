import express from "express";
import conectarBanco from "./config/dbConnect.js";
import livro from "./models/Livro.js";

const conexao = await conectarBanco()

conexao.on("error", (err) => {
    console.error("erro", err)
})

conexao.once("open", () => {
    console.log("Conectado no banco")
})


const app = express();
app.use(express.json());

app.get("/", (req, res) => {
    res.status(200).send("Hello by express")
});

app.get("/livros", async (req, res) => {
    const listaLivros = await livro.find({});
    res.status(200).json(listaLivros);
});

app.get("/livros/:id", (req, res) => {
    const livroIndex = req.params.id;
    const encontrado = livro.findById(livroIndex)
    res.status(200).json(livro);
});

app.post("/livros", (req, res) => {
    const dados = req.body;
    livros.push(dados);
    res.status(201).send('Livro Criado!')
});

app.put("/livros/:id", (req,res) => {
    const livroIndex = buscarLivroId(req.params.id)
    if(livroIndex != -1) {
        const livro = livros[livroIndex]
        livro.titulo = req.body.titulo
        res.status(200).json(livros)
    } else {
        res.status(200).send('Livro inexistente')
    }
});

app.delete("/livros/:id", (req, res) => {
    const livroIndex = buscarLivroId(req.params.id)
    if(livroIndex != -1) {
        livros.splice(livroIndex, 1)
        res.status(200).json(livros)
    } else {
        res.status(200).send('Livro inexistente')
    }
})

export default app;