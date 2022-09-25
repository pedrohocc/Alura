export function domInjector(seletor: string){
    return function(target: any, propertyKey: string){
        console.log(`Modificando propertyKey ${propertyKey}`)

        let elemento:HTMLElement;
        
        const getter = function() {
            if(!elemento){
                elemento = <HTMLElement>document.querySelector(seletor);
                console.log(`Buscando elemento do dom ${seletor} para a propriedade ${propertyKey}`)
            }
            return elemento;
        }
        Object.defineProperty(target, propertyKey, {
            get: getter
        });
    }
}