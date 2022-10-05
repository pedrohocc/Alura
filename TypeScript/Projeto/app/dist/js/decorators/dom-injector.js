export function domInjector(seletor) {
    return function (target, propertyKey) {
        console.log(`Modificando propertyKey ${propertyKey}`);
        let elemento;
        const getter = function () {
            if (!elemento) {
                elemento = document.querySelector(seletor);
                console.log(`Buscando elemento do dom ${seletor} para a propriedade ${propertyKey}`);
            }
            return elemento;
        };
        Object.defineProperty(target, propertyKey, {
            get: getter
        });
    };
}
