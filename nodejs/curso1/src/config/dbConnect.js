import mongoose from "mongoose";

const _url = process.env.CONNECTION_STRING;

async function conectarBanco() {
    try {
        mongoose.connect(_url);
        return mongoose.connection;

    } catch (error) {
        console.log('!erro:', error);
    }
    
}

export default conectarBanco;
