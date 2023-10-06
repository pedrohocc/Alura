import express from "express";

const app = express();
app.use(express.json());

const livros = [
    {
        id: 1,
        titulo: "O senhor dos anéis"
    },
    {
        id: 2,
        titulo: "Uma musa que se chama alma"
    },
];

app.get("/", (req, res) => {
    res.status(200).send("Hello by express")
});

app.get("/livros", (req, res) => {
    res.status(200).json(livros)
});

app.get("/livros/:id", (req, res) => {
    const livroIndex = buscarLivroId(req.params.id) 

    if(livroIndex != -1) {
        res.status(200).json(livros[livroIndex])
    } else {
        res.status(200).send("Livro inexistente")
    }
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

function buscarLivroId(id) {
    return livros.findIndex(livro => {
        return livro.id === Number(id)
    })
}

export default app;