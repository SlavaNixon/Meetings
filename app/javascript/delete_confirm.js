import Swal from 'sweetalert2/dist/sweetalert2'
import 'sweetalert2/dist/sweetalert2.css'

var elements = document.getElementsByClassName('delete-confirm');
var i = elements.length;
while (i--)
  elements[i].addEventListener("click", deleteConfirm);

function deleteConfirm(event) {
  event.preventDefault();
  messageConfirm(event)
}

function messageConfirm(event) {
  Swal.fire({
    title: 'Вы уверены?',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#28a745',
    cancelButtonColor: '#dc3545',
    confirmButtonText: 'Удалить',
    cancelButtonText: 'Назад',
  }).then((result) => {
    if (result.isConfirmed){
      event.target.form.submit()
    }
  })
}
