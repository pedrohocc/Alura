import { inspect } from '../decorators/inspect.js';
import { tempoExecucao } from '../decorators/logar-tempo.js';

export abstract class View<T> {

    protected elemento: HTMLElement;

    constructor(seletor: string) {
        const elemento = document.querySelector(seletor);
        if (elemento) {
            this.elemento = elemento as HTMLElement;
        }else {
            throw Error ("seletor invalido")
            
        }
    }

    @tempoExecucao()
    @inspect
    public update(model: T): void {
        let template = this.template(model);
        this.elemento.innerHTML = template;
    }

    protected abstract template(model: T): string;
}