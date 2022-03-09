function toca_som_pom() {
    document.querySelector('#som_tecla_pom').play();
}

function toca_som_clap() {
    document.querySelector('#som_tecla_clap').play();
}

document.querySelector('.tecla_pom').onclick = toca_som_pom;

document.querySelector('.tecla_clap').onclick = toca_som_clap;