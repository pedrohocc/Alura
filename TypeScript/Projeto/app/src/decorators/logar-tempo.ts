export function tempoExecucao(EmSegundos: boolean = false) {
    return function(
        target: any,
        propertyKey: string,
        descriptor: PropertyDescriptor
    ) {
        const metodoOriginal = descriptor.value;
        descriptor.value = function(...args: any[]) {
            let divisior = 1;
            let unidade = "milisegundos";
            if (EmSegundos) { 
                divisior = 1000;
                unidade = "segundos";
            }
            const t1 = performance.now();
            const retorno = metodoOriginal.apply(this, args);
            const t2 = performance.now();
            console.log(`O método ${propertyKey} teve o tempo de execução de ${(t2 - t1) / divisior}} ${unidade}}`);
            retorno
        };
        return descriptor;
    }
}