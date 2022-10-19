import { Component, OnInit } from '@angular/core';
import { SwalComponent } from '@sweetalert2/ngx-sweetalert2';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-criar-pensamento',
  templateUrl: './criar-pensamento.component.html',
  styleUrls: ['./criar-pensamento.component.css']
})
export class CriarPensamentoComponent implements OnInit {

  public pensamento = {
    id: 1,
    conteudo: 'apresentando conteudo',
    autoria: 'eu',
    modelo: 'modelo1'
  }


  constructor() { }


  ngOnInit(): void {

  }

  public criarPensamento(): void {
    alert('oi')
  }

  public cancelar(): void {
    alert('oi2')
  }

}
